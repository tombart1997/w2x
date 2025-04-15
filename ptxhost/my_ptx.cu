#include <cuda.h>
#include <iostream>
#include <vector>

// PTX code as a string
const char* ptx_code = R"ptx(
.version 8.0
.target sm_80
.visible .entry vector_add_kernel(
    .param .u64 param9,
    .param .u64 param10,
    .param .u64 param11,
    .param .u64 param12
) {
    .reg .u32 %r7, %r8, %r17, %r21, %r6, %r26, %r36, %r32, %r9, %r24, %r23, %r4, %r35, %r20, %r27, %r12, %r11, %r22, %r5;
    .reg .u64 %rd2, %rd0, %rd16, %rd19, %rd29, %rd28, %rd34, %rd31, %rd33, %rd14, %rd18, %rd13, %rd30, %rd3, %rd15, %rd1;
    .reg .pred %p10, %p25;
    vector_add_kernel_start:
    ld.param.u64 %rd0, [param9];
    ld.param.u64 %rd1, [param10];
    ld.param.u64 %rd2, [param11];
    ld.param.u64 %rd3, [param12];
    block_1_start:
    mov.u32 %r4, %ntid.x;
    mov.u32 %r5, %ctaid.x;
    mul.lo.s32 %r6, %r4, %r5;
    mov.u32 %r7, %tid.x;
    add.s32 %r8, %r6, %r7;
    mov.u32 %r5, %r8;
    cvt.u32.u64 %r9, %rd3;
    setp.ge.u32 %p10, %r8, %r9;
    @%p10 bra block_1_end;
    mov.u32 %r11, 2;
    shl.b32 %r12, %r5, %r11;
    mov.u32 %r5, %r12;
    cvt.u64.u32 %rd13, %r12;
    add.s64 %rd14, %rd2, %rd13;
    cvt.u64.u32 %rd15, %r5;
    add.s64 %rd16, %rd1, %rd15;
    ld.global.u32 %r17, [%rd16];
    cvt.u64.u32 %rd18, %r5;
    add.s64 %rd19, %rd0, %rd18;
    ld.global.u32 %r20, [%rd19];
    add.s32 %r21, %r17, %r20;
    st.global.u32 [%rd14], %r21;
    block_1_end:
    mul.lo.s32 %r22, %r4, %r5;
    add.s32 %r23, %r22, %r7;
    mov.u32 %r5, %r23;
    cvt.u32.u64 %r24, %rd3;
    setp.ge.u32 %p25, %r23, %r24;
    @%p25 bra vector_add_kernel_end;
    mov.u32 %r26, 2;
    shl.b32 %r27, %r5, %r26;
    mov.u32 %r5, %r27;
    cvt.u64.u32 %rd28, %r27;
    add.s64 %rd29, %rd2, %rd28;
    cvt.u64.u32 %rd30, %r5;
    add.s64 %rd31, %rd1, %rd30;
    ld.global.u32 %r32, [%rd31];
    cvt.u64.u32 %rd33, %r5;
    add.s64 %rd34, %rd0, %rd33;
    ld.global.u32 %r35, [%rd34];
    add.s32 %r36, %r32, %r35;
    st.global.u32 [%rd29], %r36;
    vector_add_kernel_end:
}

.visible .entry vector_add_loop_kernel(
    .param .u64 param9,
    .param .u64 param10,
    .param .u64 param11,
    .param .u64 param12
) {
    .reg .u32 %r7, %r43, %r46, %r6, %r40, %r34, %r44, %r47, %r28, %r31, %r45, %r24, %r9, %r4, %r32, %r15, %r27, %r13, %r8, %r18, %r17, %r14, %r29, %r16, %r5, %r12, %r10, %r30;
    .reg .u64 %rd39, %rd42, %rd0, %rd26, %rd25, %rd20, %rd2, %rd3, %rd22, %rd1, %rd21, %rd41, %rd36, %rd37, %rd23, %rd38;
    .reg .pred %p19, %p35, %p33;
    vector_add_loop_kernel_start:
    ld.param.u64 %rd0, [param9];
    ld.param.u64 %rd1, [param10];
    ld.param.u64 %rd2, [param11];
    ld.param.u64 %rd3, [param12];
    mov.u32 %r4, %ntid.x;
    mov.u32 %r5, %ntid.z;
    mul.lo.s32 %r6, %r4, %r5;
    mov.u32 %r7, %ntid.y;
    mul.lo.s32 %r8, %r6, %r7;
    mov.u32 %r7, %r8;
    mov.u32 %r9, 2;
    shl.b32 %r10, %r8, %r9;
    mov.u32 %r11, %r10;
    mov.u32 %r12, %ctaid.x;
    mul.lo.s32 %r13, %r4, %r12;
    mov.u32 %r14, %tid.x;
    add.s32 %r15, %r13, %r14;
    mov.u32 %r5, %r15;
    mov.u32 %r16, 2;
    shl.b32 %r17, %r15, %r16;
    mov.u32 %r4, %r17;
    loop_0_start:
    cvt.u32.u64 %r18, %rd3;
    setp.ltu.u32 %p19, %r5, %r18;
    @%p19 bra loop_0_start;
    mov.u64 return_value_3, %rd3;
    mov.u64 return_value_2, %rd2;
    mov.u64 return_value_1, %rd1;
    mov.u64 return_value_0, %rd0;
    ret;
    cvt.u64.u32 %rd20, %r4;
    add.s64 %rd21, %rd2, %rd20;
    cvt.u64.u32 %rd22, %r4;
    add.s64 %rd23, %rd1, %rd22;
    ld.global.u32 %r24, [%rd23];
    cvt.u64.u32 %rd25, %r4;
    add.s64 %rd26, %rd0, %rd25;
    ld.global.u32 %r27, [%rd26];
    add.s32 %r28, %r24, %r27;
    st.global.u32 [%rd21], %r28;
    add.s32 %r30, %r4, %r29;
    mov.u32 %r4, %r30;
    add.s32 %r31, %r5, %r7;
    mov.u32 %r5, %r31;
    bra loop_0_start;
    loop_0_end:
    block_2_start:
    cvt.u32.u64 %r32, %rd3;
    setp.ltu.u32 %p33, %r5, %r32;
    @%p33 bra block_2_end;
    ret;
    block_2_end:
    cvt.u32.u64 %r34, %rd3;
    setp.ltu.u32 %p35, %r5, %r34;
    @%p35 bra vector_add_loop_kernel_end;
    ret;
    cvt.u64.u32 %rd36, %r4;
    add.s64 %rd37, %rd2, %rd36;
    cvt.u64.u32 %rd38, %r4;
    add.s64 %rd39, %rd1, %rd38;
    ld.global.u32 %r40, [%rd39];
    cvt.u64.u32 %rd41, %r4;
    add.s64 %rd42, %rd0, %rd41;
    ld.global.u32 %r43, [%rd42];
    add.s32 %r44, %r40, %r43;
    st.global.u32 [%rd37], %r44;
    add.s32 %r46, %r4, %r45;
    mov.u32 %r4, %r46;
    add.s32 %r47, %r5, %r7;
    mov.u32 %r5, %r47;
    bra vector_add_loop_kernel_end;
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

    // Load the PTX code as a module
    CUresult res = cuModuleLoadData(&cuModule, ptx_code);
    if (res != CUDA_SUCCESS) {
        std::cerr << "Error loading PTX code." << std::endl;
        return -1;
    }

    // Get the kernel function
    res = cuModuleGetFunction(&cuFunction, cuModule, "vector_add_kernel");
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
        &N          // param3
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
    int threadsPerBlock = 256;
    int blocksPerGrid = (N + threadsPerBlock - 1) / threadsPerBlock;

    CUresult launchResult = cuLaunchKernel(
        cuFunction,
        blocksPerGrid, 1, 1,       // Grid dimensions
        threadsPerBlock, 1, 1,     // Block dimensions
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