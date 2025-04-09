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
    .reg .u32 %r13, %r4, %r18, %r21, %r5, %r9, %r6, %r7, %r22, %r8, %r12;
    .reg .u64 %rd1, %rd16, %rd2, %rd17, %rd20, %rd15, %rd14, %rd19, %rd3, %rd0;
    .reg .pred %p10, %p11;
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
    not.pred %p11, %p10;
    @%p11 bra br_if_label_0;
    br_if_label_0:
    mov.u32 %r12, 2;
    shl.b32 %r13, %r5, %r12;
    mov.u32 %r5, %r13;
    cvt.u64.u32 %rd14, %r13;
    add.s64 %rd15, %rd2, %rd14;
    cvt.u64.u32 %rd16, %r5;
    add.s64 %rd17, %rd1, %rd16;
    ld.global.u32 %r18, [%rd17];
    cvt.u64.u32 %rd19, %r5;
    add.s64 %rd20, %rd0, %rd19;
    ld.global.u32 %r21, [%rd20];
    add.s32 %r22, %r18, %r21;
    st.global.u32 [%rd15], %r22;
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


    std::vector<int> h_A_check(N, 0);
    std::vector<int> h_B_check(N, 0);
    std::vector<int> h_C_check(N, 0);

    cuMemcpyDtoH(h_A_check.data(), d_A, size);
    cuMemcpyDtoH(h_B_check.data(), d_B, size);
    cuMemcpyDtoH(h_C_check.data(), d_C, size);

    std::cout << "Device vector A (copied back):" << std::endl;
    for (int i = 0; i < N; ++i) {
        std::cout << h_A_check[i] << " ";
        if ((i + 1) % 16 == 0) {
            std::cout << std::endl;
        }
    }

    std::cout << "Device vector B (copied back):" << std::endl;
    for (int i = 0; i < N; ++i) {
        std::cout << h_B_check[i] << " ";
        if ((i + 1) % 16 == 0) {
            std::cout << std::endl;
        }
    }

    std::cout << "Device vector C (copied back):" << std::endl;
    for (int i = 0; i < N; ++i) {
        std::cout << h_C_check[i] << " ";
        if ((i + 1) % 16 == 0) {
            std::cout << std::endl;
        }
    }

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