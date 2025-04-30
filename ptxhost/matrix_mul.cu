#include <cuda.h>
#include <iostream>
#include <vector>

// PTX code as a string (replace with your actual matrix_mul_kernel PTX)
const char* ptx_code = R"ptx(
.version 8.0
.target sm_80
.visible .entry matrix_mul_kernel(
    .param .u64 param9,
    .param .u64 param10,
    .param .u64 param11,
    .param .u64 param12,
    .param .u64 param13,
    .param .u64 param14
) {
    .reg .u32 %r1, %r45, %r38, %r34, %r49, %r52, %r24, %r3, %r51, %r16, %r30, %r53, %r42, %r23, %r8, %r2, %r50, %r4, %r18, %r41, %r21, %r17, %r15, %r0, %r5;
    .reg .u64 %rd46, %rd55, %rd6, %rd29, %rd9, %rd22, %rd36, %rd12, %rd39, %rd32, %rd13, %rd19, %rd25, %rd10, %rd40, %rd54, %rd33, %rd28, %rd37, %rd48, %rd44, %rd56, %rd27, %rd43, %rd47, %rd14, %rd31, %rd11, %rd26;
    .reg .pred %p20, %p7, %p35;
    matrix_mul_kernel_start:
    ld.param.u64 %rd9, [param9];
    ld.param.u64 %rd10, [param10];
    ld.param.u64 %rd11, [param11];
    ld.param.u64 %rd12, [param12];
    ld.param.u64 %rd13, [param13];
    ld.param.u64 %rd14, [param14];
    block_3_start:
    mov.u32 %r0, %ntid.y;
    mov.u32 %r1, %ctaid.y;
    mul.lo.s32 %r2, %r0, %r1;
    mov.u32 %r3, %tid.y;
    add.u32 %r4, %r2, %r3;
    mov.u32 %r5, %r4;
    cvt.u64.u32 %rd6, %r4;
    setp.ge.u64 %p7, %rd6, %rd12;
    @%p7 bra block_3_end;
    mov.u32 %r8, %ntid.x;
    mov.u32 %r15, %ctaid.x;
    mul.lo.s32 %r16, %r8, %r15;
    mov.u32 %r17, %tid.x;
    add.u32 %r18, %r16, %r17;
    mov.u32 %r15, %r18;
    cvt.u64.u32 %rd19, %r18;
    setp.ge.u64 %p20, %rd19, %rd14;
    @%p20 bra block_3_end;
    mov.u32 %r21, 2;
    shl.b64 %rd22, %rd14, %r21;
    mov.u64 %rd12, %rd22;
    mov.u32 %r23, 2;
    shl.b32 %r24, %r15, %r23;
    cvt.u64.u32 %rd25, %r24;
    add.u64 %rd26, %rd10, %rd25;
    mov.u64 %rd27, %rd26;
    cvt.u64.u32 %rd28, %r5;
    mul.lo.s64 %rd29, %rd28, %rd13;
    mov.u32 %r30, 2;
    shl.b64 %rd31, %rd29, %r30;
    add.u64 %rd32, %rd9, %rd31;
    mov.u64 %rd33, %rd32;
    mov.u32 %r34, 0;
    mov.u32 %r3, %r34;
    loop_0_start:
    block_4_start:
    setp.ne.u64 %p35, %rd13, 0;
    @%p35 bra block_4_end;
    cvt.u64.u32 %rd36, %r5;
    mul.lo.s64 %rd37, %rd36, %rd14;
    mov.u32 %r38, 2;
    shl.b64 %rd39, %rd37, %r38;
    add.u64 %rd40, %rd11, %rd39;
    mov.u32 %r41, 2;
    shl.b32 %r42, %r15, %r41;
    cvt.u64.u32 %rd43, %r42;
    add.u64 %rd44, %rd40, %rd43;
    st.global.u32 [%rd44], %r3;
    bra block_3_end;
    block_4_end:
    mov.s32 %r45, -1;
    cvt.s64.s32 %rd46, %r45;
    add.s64 %rd47, %rd13, %rd46;
    cvt.u64.s64 %rd48, %rd47;
    mov.u64 %rd13, %rd48;
    ld.global.u32 %r49, [%rd27];
    ld.global.u32 %r50, [%rd33];
    mul.lo.s32 %r51, %r49, %r50;
    add.u32 %r52, %r51, %r3;
    mov.u32 %r3, %r52;
    mov.u32 %r53, 4;
    cvt.u64.u32 %rd54, %r53;
    add.u64 %rd55, %rd33, %rd54;
    mov.u64 %rd33, %rd55;
    add.u64 %rd56, %rd27, %rd12;
    mov.u64 %rd27, %rd56;
    bra loop_0_start;
    loop_0_end:
    block_3_end:
    matrix_mul_kernel_end:
}


)ptx";

CUresult checkCudaError(CUresult result, const char* message) {
    if (result != CUDA_SUCCESS) {
        const char* errorString;
        cuGetErrorString(result, &errorString);
        std::cerr << message << ": " << errorString << std::endl;
    }
    return result;
}

int main() {
    // Matrix dimensions
    int m = 4, n = 4, p = 4;
    const int sizeA = m * n;
    const int sizeB = n * p;
    const int sizeC = m * p;

	
	int h_A[4][4] = {
    {1, 2, 3, 4},
    {5, 6, 7, 8},
    {9, 10, 11, 12},
    {13, 14, 15, 16}
	};

	int h_B[4][4] = {
		{16, 15, 14, 13},
		{12, 11, 10, 9},
		{8, 7, 6, 5},
		{4, 3, 2, 1}
	};

	int h_C[4][4] = {0}; // Initialize result matrix with zeros


    // Device pointers
    CUdeviceptr d_A, d_B, d_C;
    cuInit(0);
    CUdevice cuDevice;
    CUcontext cuContext;
    CUmodule cuModule;
    CUfunction cuFunction;
    cuDeviceGet(&cuDevice, 0);
    cuCtxCreate(&cuContext, 0, cuDevice);

    const unsigned int logSize = 8192;
    char error_log[logSize];
    char info_log[logSize];

    CUjit_option options[] = { CU_JIT_ERROR_LOG_BUFFER, CU_JIT_ERROR_LOG_BUFFER_SIZE_BYTES,
                           CU_JIT_INFO_LOG_BUFFER, CU_JIT_INFO_LOG_BUFFER_SIZE_BYTES,
                           CU_JIT_LOG_VERBOSE };
    void* optionValues[] = { (void*)error_log, (void*)(long)logSize,
                         (void*)info_log, (void*)(long)logSize,
                         (void*)1 };

    CUresult res = cuModuleLoadDataEx(&cuModule, ptx_code,
                                  sizeof(options)/sizeof(CUjit_option),
                                  options, optionValues);

    if (res != CUDA_SUCCESS) {
        const char* errStr;
        cuGetErrorString(res, &errStr);
        std::cerr << "Error loading PTX code: " << errStr << "\n";
        std::cerr << "PTX JIT Compilation error log:\n" << error_log << "\n";
        std::cerr << "PTX JIT Compilation info log:\n" << info_log << "\n";
        return -1;
    }

	
	// Flatten h_A and h_B for device transfer
	int flat_A[16];
	int flat_B[16];
	for (int i = 0; i < 4; ++i) {
		for (int j = 0; j < 4; ++j) {
			flat_A[i * 4 + j] = h_A[i][j];
			flat_B[i * 4 + j] = h_B[i][j];
		}
	}

		
	
	// Allocate device memory
	cuMemAlloc(&d_A, 16 * sizeof(int));
	cuMemAlloc(&d_B, 16 * sizeof(int));
	cuMemAlloc(&d_C, 16 * sizeof(int));

	// Copy data to device
	cuMemcpyHtoD(d_A, flat_A, 16 * sizeof(int));
	cuMemcpyHtoD(d_B, flat_B, 16 * sizeof(int));

    // Load PTX and get kernel
    res = cuModuleLoadData(&cuModule, ptx_code);
    if (res != CUDA_SUCCESS) {
        std::cerr << "Error loading PTX code." << std::endl;
        return -1;
    }
    res = cuModuleGetFunction(&cuFunction, cuModule, "matrix_mul_kernel");
    if (res != CUDA_SUCCESS) {
        std::cerr << "Error getting kernel function." << std::endl;
        return -1;
    }

    // Prepare kernel parameters
    uint64_t m64 = m, n64 = n, p64 = p;
    void* args[] = { &d_A, &d_B, &d_C, &m64, &n64, &p64 };

    // Launch configuration
    int threadsPerBlockX = 16, threadsPerBlockY = 16;
    int blocksPerGridX = (p + threadsPerBlockX - 1) / threadsPerBlockX;
    int blocksPerGridY = (m + threadsPerBlockY - 1) / threadsPerBlockY;

    CUresult launchResult = cuLaunchKernel(
        cuFunction,
        blocksPerGridX, blocksPerGridY, 1,
        threadsPerBlockX, threadsPerBlockY, 1,
        0, nullptr,
        args, nullptr
    );

    if (launchResult != CUDA_SUCCESS) {
        std::cerr << "Kernel launch failed with error code: " << launchResult << std::endl;
    } else {
        std::cout << "Kernel launched successfully." << std::endl;
    }

    // Copy result back
    //cuMemcpyDtoH(h_C.data(), d_C, sizeC * sizeof(int));


	int flat_C[16];
	cuMemcpyDtoH(flat_C, d_C, 16 * sizeof(int));

	
	// Reconstruct h_C from flat_C
	for (int i = 0; i < 4; ++i) {
		for (int j = 0; j < 4; ++j) {
			h_C[i][j] = flat_C[i * 4 + j];
		}
	}

	std::cout << "Result matrix C:" << std::endl;
	for (int i = 0; i < 4; ++i) {
		for (int j = 0; j < 4; ++j) {
			std::cout << h_C[i][j] << " ";
		}
		std::cout << std::endl;
	}


    // Clean up
    cuMemFree(d_A);
    cuMemFree(d_B);
    cuMemFree(d_C);
    cuModuleUnload(cuModule);
    cuCtxDestroy(cuContext);

    return 0;
}