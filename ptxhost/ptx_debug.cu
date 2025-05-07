#include <cuda.h>
#include <iostream>
#include <vector>

// PTX code as a string
const char* ptx_code = R"ptx(
.version 8.0
.target sm_80
.visible .entry vector_add_loop_kernel(
    .param .u64 param9,
    .param .u64 param10,
    .param .u64 param11,
    .param .u64 param12
) {
    .reg .u32 %r0, %r1, %r2, %r8, %r30, %r7, %r17, %r24, %r28, %r13, %r5, %r14, %r15, %r3, %r16, %r29, %r27, %r4, %r6;
    .reg .u64 %rd25, %rd9, %rd12, %rd11, %rd23, %rd10, %rd21, %rd18, %rd26, %rd22, %rd20;
    .reg .pred %p19;
    vector_add_loop_kernel_start:
    ld.param.u64 %rd9, [param9];
    ld.param.u64 %rd10, [param10];
    ld.param.u64 %rd11, [param11];
    ld.param.u64 %rd12, [param12];
    mov.u32 %r0, %ntid.x;
    mov.u32 %r1, %ntid.z;
    mul.lo.s32 %r2, %r0, %r1;
    mov.u32 %r3, %ntid.y;
    mul.lo.s32 %r4, %r2, %r3;
    mov.u32 %r3, %r4;
    mov.u32 %r5, 2;
    shl.b32 %r6, %r4, %r5;
    mov.u32 %r7, %r6;
    mov.u32 %r8, %ctaid.x;
    mul.lo.s32 %r13, %r0, %r8;
    mov.u32 %r14, %tid.x;
    add.u32 %r15, %r13, %r14;
    mov.u32 %r1, %r15;
    mov.u32 %r16, 2;
    shl.b32 %r17, %r15, %r16;
    mov.u32 %r0, %r17;
    loop_0_start:
    block_2_start:
    cvt.u64.u32 %rd18, %r1;
    setp.lt.u64 %p19, %rd18, %rd12;
    @%p19 bra block_2_end;
    ret;
    block_2_end:
    cvt.u64.u32 %rd20, %r0;
    add.u64 %rd21, %rd11, %rd20;
    cvt.u64.u32 %rd22, %r0;
    add.u64 %rd23, %rd10, %rd22;
    ld.global.u32 %r24, [%rd23];
    cvt.u64.u32 %rd25, %r0;
    add.u64 %rd26, %rd9, %rd25;
    ld.global.u32 %r27, [%rd26];
    add.u32 %r28, %r24, %r27;
    st.global.u32 [%rd21], %r28;
    add.u32 %r29, %r0, %r7;
    mov.u32 %r0, %r29;
    add.u32 %r30, %r1, %r3;
    mov.u32 %r1, %r30;
    bra loop_0_start;
    loop_0_end:
    vector_add_loop_kernel_end:
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
    // Initialize CUDA
    CUdevice cuDevice;
    CUcontext cuContext;
    CUmodule cuModule;
    CUfunction cuFunction;

    cuInit(0);
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


    // Get the kernel function
    res = cuModuleGetFunction(&cuFunction, cuModule, "vector_add_loop_kernel");
    if (res != CUDA_SUCCESS) {
        std::cerr << "Error getting kernel function." << std::endl;
        return -1;
    }

    // Vector size
    int N = 1024;
    const int size = N * sizeof(int);

    // Allocate host memory
    std::vector<int> h_A(N, 1); // Vector A initialized to 1
    std::vector<int> h_B(N, 2); // Vector B initialized to 2
    std::vector<int> h_C(N, 0); // Result vector C

    // Allocate device memory
    CUdeviceptr d_A, d_B, d_C;
    cuMemAlloc(&d_A, size);
    cuMemAlloc(&d_B, size);
    cuMemAlloc(&d_C, size);

    // Copy data to device
    cuMemcpyHtoD(d_A, h_A.data(), size);
    cuMemcpyHtoD(d_B, h_B.data(), size);
    checkCudaError(cuMemcpyHtoD(d_A, h_A.data(), size), "Error copying h_A to device");
    checkCudaError(cuMemcpyHtoD(d_B, h_B.data(), size), "Error copying h_B to device");

    // Prepare kernel parameters: must match param0..param3 in PTX
    void* args[] = {
        &d_A,       // param0
        &d_B,       // param1
        &d_C,       // param2
        &N,          // param3
    };


    // Print input vector A
    std::cout << "Input vector A:" << std::endl;
    for (int i = 0; i < N; ++i) {
        std::cout << h_A[i] << " ";
        if ((i + 1) % 16 == 0) {
            std::cout << std::endl;
        }
    }

    // Print input vector B
    std::cout << "Input vector B:" << std::endl;
    for (int i = 0; i < N; ++i) {
        std::cout << h_B[i] << " ";
        if ((i + 1) % 16 == 0) {
            std::cout << std::endl;
        }
    }

    // Launch the kernel
    int threadsPerBlock = 1;
    int blocksPerGrid = 1;

    CUresult launchResult = cuLaunchKernel(
        cuFunction,
        blocksPerGrid, 1, 1,       // Grid dimensions (X, Y, Z)
        threadsPerBlock, 1, 1,     // Block dimensions (X, Y, Z)
        0, nullptr,                // Shared memory and stream
        args, nullptr              // Kernel arguments
    );

    std::cout << "Kernel parameters:" << std::endl;
    std::cout << "d_A: " << d_A << std::endl;
    std::cout << "d_B: " << d_B << std::endl;
    std::cout << "d_C: " << d_C << std::endl;
    std::cout << "N: " << N << std::endl;

    if (launchResult != CUDA_SUCCESS) {
        std::cerr << "Kernel launch failed with error code: " << launchResult << std::endl;
    } else {
        std::cout << "Kernel launched successfully." << std::endl;
    }

    // Copy the result back to the host
    cuMemcpyDtoH(h_C.data(), d_C, size);

    // Print the result
    std::cout << "Result vector C:" << std::endl;
    for (int i = 0; i < N; ++i) {
        std::cout << h_C[i] << " ";
        if ((i + 1) % 16 == 0) { // Print 16 values per line for readability
            std::cout << std::endl;
        }
    }

    // Clean up
    cuMemFree(d_A);
    cuMemFree(d_B);
    cuMemFree(d_C);
    cuModuleUnload(cuModule);
    cuCtxDestroy(cuContext);

    return 0;
}