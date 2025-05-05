#include <cuda.h>
#include <iostream>
#include <vector>


const char* ptx_code = R"ptx(
.version 8.0
.target sm_80
.visible .entry vector_add_kernel(
    .param .u64 param9,
    .param .u64 param10,
    .param .u64 param11,
    .param .u64 param12
) {
    .reg .u32 %r2, %r3, %r8, %r0, %r17, %r21, %r1, %r20, %r4, %r7;
    .reg .u64 %rd14, %rd15, %rd11, %rd12, %rd16, %rd19, %rd13, %rd9, %rd18, %rd10, %rd5;
    .reg .pred %p6;
    vector_add_kernel_start:
    ld.param.u64 %rd9, [param9];
    ld.param.u64 %rd10, [param10];
    ld.param.u64 %rd11, [param11];
    ld.param.u64 %rd12, [param12];
    block_1_start:
    mov.u32 %r0, %ntid.x;
    mov.u32 %r1, %ctaid.x;
    mul.lo.s32 %r2, %r0, %r1;
    mov.u32 %r3, %tid.x;
    add.u32 %r4, %r2, %r3;
    mov.u32 %r1, %r4;
    cvt.u64.u32 %rd5, %r4;
    setp.ge.u64 %p6, %rd5, %rd12;
    @%p6 bra block_1_end;
    mov.u32 %r7, 2;
    shl.b32 %r8, %r1, %r7;
    mov.u32 %r1, %r8;
    cvt.u64.u32 %rd13, %r8;
    add.u64 %rd14, %rd11, %rd13;
    cvt.u64.u32 %rd15, %r1;
    add.u64 %rd16, %rd10, %rd15;
    ld.global.u32 %r17, [%rd16];
    cvt.u64.u32 %rd18, %r1;
    add.u64 %rd19, %rd9, %rd18;
    ld.global.u32 %r20, [%rd19];
    add.u32 %r21, %r17, %r20;
    st.global.u32 [%rd14], %r21;
    block_1_end:
    vector_add_kernel_end:
}

.visible .entry vector_add_loop_kernel(
    .param .u64 param9,
    .param .u64 param10,
    .param .u64 param11,
    .param .u64 param12
) {
    .reg .u32 %r3, %r1, %r6, %r28, %r7, %r8, %r4, %r18, %r24, %r15, %r13, %r16, %r14, %r2, %r0, %r17, %r27, %r5, %r29, %r30;
    .reg .u64 %rd22, %rd20, %rd9, %rd10, %rd11, %rd25, %rd12, %rd21, %rd23, %rd26;
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
    cvt.u32.u64 %r18, %rd12;
    setp.lt.u32 %p19, %r1, %r18;
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




int main() {

    //Initialize CUDA Driver API
    CUdevice cuDevice;
    CUcontext cuContext;
    CUmodule cuModule;
    cuInit(0);
    cuDeviceGet(&cuDevice, 0);
    cuCtxCreate(&cuContext, 0, cuDevice);



    // Initalize Matrix for Matrix Mul Kernel
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

    int h_C[4][4] = {0};

    // Flatten h_A and h_B for device transfer
	int flat_A[16];
	int flat_B[16];
	for (int i = 0; i < 4; ++i) {
		for (int j = 0; j < 4; ++j) {
			flat_A[i * 4 + j] = h_A[i][j];
			flat_B[i * 4 + j] = h_B[i][j];
		}
	}

    // Initialize Vectors for Vector Add Kernels
    int N = 1024;
    const int size = N * sizeof(int);
    std::vector<int> h_v_A(N, 1); // Vector A initialized to 1
    std::vector<int> h_v_B(N, 2); // Vector B initialized to 2
    std::vector<int> h_v_C(N, 0); // Result vector C
    std::vector<int> h_v_C_l(N, 0); // Result vector C


    // Allocate device memory
    // for Vectors
    CUdeviceptr d_A, d_B, d_C, d_A_l, d_B_l, d_C_l, d_D, d_E, d_F;


    
    cuMemAlloc(&d_A, size);
    cuMemAlloc(&d_B, size);
    cuMemAlloc(&d_C, size);
    cuMemAlloc(&d_A_l, size);
    cuMemAlloc(&d_B_l, size);
    cuMemAlloc(&d_C_l, size);
    // for Matrices
	cuMemAlloc(&d_D, 16 * sizeof(int));
	cuMemAlloc(&d_E, 16 * sizeof(int));
	cuMemAlloc(&d_F, 16 * sizeof(int));


    // Copy data to device
    cuMemcpyHtoD(d_A, h_v_A.data(), size);
    cuMemcpyHtoD(d_B, h_v_B.data(), size);
    cuMemcpyHtoD(d_A_l, h_v_A.data(), size);
    cuMemcpyHtoD(d_B_l, h_v_B.data(), size);
	cuMemcpyHtoD(d_D, flat_A, 16 * sizeof(int));
	cuMemcpyHtoD(d_E, flat_B, 16 * sizeof(int));

    // Load PTX and get kernels one by one
    CUresult res = cuModuleLoadData(&cuModule, ptx_code);
    CUfunction v_add_cu, v_add_loop_cu, m_mul_cu;

    if (res != CUDA_SUCCESS) {
        std::cerr << "Error loading PTX code: " << res << std::endl;
        const char* errStr;
        cuGetErrorString(res, &errStr);
        std::cerr << "CUDA Error: " << (errStr ? errStr : "Unknown") << std::endl;
        return -1;
    }
    res = cuModuleGetFunction(&v_add_cu, cuModule, "vector_add_kernel");
    if (res != CUDA_SUCCESS) {
        std::cerr << "Error getting vector_add_kernel function." << std::endl;
        return -1;
    }
    res = cuModuleGetFunction(&v_add_loop_cu, cuModule, "vector_add_loop_kernel");
    if (res != CUDA_SUCCESS) {
        std::cerr << "Error getting vector_add_loop_kernel function." << std::endl;
        return -1;
    }
    res = cuModuleGetFunction(&m_mul_cu, cuModule, "matrix_mul_kernel");
    if (res != CUDA_SUCCESS) {
        std::cerr << "Error getting matrix_mul_kernel function." << std::endl;
        return -1;
    }

    // Prepare kernel parameters
    int m = 4, n = 4, p = 4;
    uint64_t m64 = m, n64 = n, p64 = p;
    void* args_v[] = { &d_A, &d_B, &d_C, &N};
    void* args_v_l[] = { &d_A_l, &d_B_l, &d_C_l, &N};
    void* args_m[] = { &d_D, &d_E, &d_F, &m64, &n64, &p64 };
    // Launch configuration for for vectors
	int threadsPerBlock = 1;
	int blocksPerGrid =  1;
    //  matrix multiplication
    int threadsPerBlockX = 16, threadsPerBlockY = 16;
    int blocksPerGridX = (p + threadsPerBlockX - 1) / threadsPerBlockX;
    int blocksPerGridY = (m + threadsPerBlockY - 1) / threadsPerBlockY;


    CUresult v_add_launch_res = cuLaunchKernel(
        v_add_cu,
        blocksPerGrid, 1, 1,       
        threadsPerBlock, 1, 1,    
        0, nullptr,                
        args_v, nullptr              
    );

    cuCtxSynchronize();

    CUresult v_add_loop_launch_res = cuLaunchKernel(
        v_add_loop_cu,
        blocksPerGrid, 1, 1,       
        threadsPerBlock, 1, 1,    
        0, nullptr,                
        args_v_l, nullptr              
    );

    cuCtxSynchronize();

    CUresult m__mul_launch_res = cuLaunchKernel(
        m_mul_cu,
        blocksPerGridX, blocksPerGridY, 1,
        threadsPerBlockX, threadsPerBlockY, 1,
        0, nullptr,
        args_m, nullptr
    );

    cuCtxSynchronize();


    if (v_add_launch_res != CUDA_SUCCESS) {
        std::cerr << "Vector Add launch failed with error code: " << v_add_launch_res << std::endl;
    } else {
        std::cout << "Vector Add launched successfully." << std::endl;
    }

    if (v_add_loop_launch_res != CUDA_SUCCESS) {
        std::cerr << "Vector Loop Add launch failed with error code: " << v_add_loop_launch_res << std::endl;
    } else {
        std::cout << "Vector Loop Add launched successfully." << std::endl;
    }

    if (m__mul_launch_res != CUDA_SUCCESS) {
        std::cerr << "Matrix Multiplication launch failed with error code: " << m__mul_launch_res << std::endl;
    } else {
        std::cout << "Matrix Multiplication launched successfully." << std::endl;
    }

    // Copy the result back to the host
    int flat_C[16];
	cuCtxSynchronize();
    cuMemcpyDtoH(h_v_C.data(), d_C, size);
    cuMemcpyDtoH(h_v_C_l.data(), d_C_l, size);
    cuMemcpyDtoH(flat_C, d_F, 16 * sizeof(int));

    //Print the result of Vector Add Kernel
    std::cout << "Result of Vector Add Kernel:" << std::endl;   
    for (int i = 0; i < N; ++i) {
        std::cout << h_v_C[i] << " ";
    }
    std::cout << std::endl;

    //Print the result of Vector Add Loop Kernel
    std::cout << "Result of Vector Add Loop Kernel:" << std::endl;
    for (int i = 0; i < N; ++i) {
        std::cout << h_v_C_l[i] << " ";
    }
    std::cout << std::endl;

    // Reconstruct h_C from flat_C
	for (int i = 0; i < 4; ++i) {
		for (int j = 0; j < 4; ++j) {
			h_C[i][j] = flat_C[i * 4 + j];
		}
	}
    //Print the result of Matrix Multiplication Kernel
    for (int i = 0; i < 4; ++i) {
        for (int j = 0; j < 4; ++j) {
            std::cout << h_C[i][j] << " ";
        }
        std::cout << std::endl;
    }

    //Clean up
    cuMemFree(d_A);
    cuMemFree(d_B);
    cuMemFree(d_C);
    cuMemFree(d_A_l);
    cuMemFree(d_B_l);
    cuMemFree(d_C_l);
    cuMemFree(d_D);
    cuMemFree(d_E);
    cuMemFree(d_F);
    cuModuleUnload(cuModule);
    cuCtxDestroy(cuContext);
    return 0;
}