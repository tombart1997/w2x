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
	.reg .u32 %r0, %r1, %r2, %r3, %r4, %r5, %r8, %r15, %r16, %r17, %r18, %r21, %r23, %r24, %r30, %r34, %r38, %r41, %r42, %r45, %r49, %r50, %r51, %r52, %r53;
	.reg .u64 %rd6, %rd9, %rd10, %rd11, %rd12, %rd13, %rd14, %rd19, %rd22, %rd25, %rd26, %rd27, %rd28, %rd29, %rd31, %rd32, %rd33, %rd36, %rd37, %rd39, %rd40, %rd43, %rd44, %rd46, %rd47, %rd48, %rd54, %rd55, %rd56;
	.reg .pred %p7, %p20, %p35;
matrix_mul_kernel_start:
	ld.param.u64 %rd9, [param9];
	ld.param.u64 %rd10, [param10];
	ld.param.u64 %rd11, [param11];
	ld.param.u64 %rd12, [param12];
	ld.param.u64 %rd13, [param13];
	ld.param.u64 %rd14, [param14];
block_11_start:
	mov.u32 %r0, %ntid.y;
	mov.u32 %r1, %ctaid.y;
	mul.lo.s32 %r2, %r0, %r1;
	mov.u32 %r3, %tid.y;
	add.u32 %r4, %r2, %r3;
	mov.u32 %r5, %r4;
	cvt.u64.u32 %rd6, %r4;
	setp.ge.u64 %p7, %rd6, %rd12;
	@%p7 bra block_11_end;
	mov.u32 %r8, %ntid.x;
	mov.u32 %r15, %ctaid.x;
	mul.lo.s32 %r16, %r8, %r15;
	mov.u32 %r17, %tid.x;
	add.u32 %r18, %r16, %r17;
	mov.u32 %r15, %r18;
	cvt.u64.u32 %rd19, %r18;
	setp.ge.u64 %p20, %rd19, %rd14;
	@%p20 bra block_11_end;
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
loop_0_38_start:
block_12_start:
	setp.ne.u64 %p35, %rd13, 0;
	@%p35 bra block_12_end;
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
	bra block_11_end;
block_12_end:
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
	bra loop_0_38_start;
loop_0_38_end:
block_11_end:
matrix_mul_kernel_end:
}

)ptx";

#include <cuda.h>
#include <cuda_runtime.h>
#include <iostream>
#include <vector>
#include <cstdlib>
#include <ctime>

__global__ void cuda_matrix_mul_global(const int* A, const int* B, int* C, int M, int N, int P) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < M && col < P) {
        int sum = 0;
        for (int k = 0; k < N; ++k) {
            sum += A[row * N + k] * B[k * P + col];
        }
        C[row * P + col] = sum;
    }
}

void benchmark(int N) {
    std::vector<int> h_A(N * N), h_B(N * N), h_C_ptx(N * N), h_C_cuda(N * N);
    for (int& val : h_A) val = rand() % 10;
    for (int& val : h_B) val = rand() % 10;

    int *d_A_cuda, *d_B_cuda, *d_C_cuda;
    cudaMalloc(&d_A_cuda, N * N * sizeof(int));
    cudaMalloc(&d_B_cuda, N * N * sizeof(int));
    cudaMalloc(&d_C_cuda, N * N * sizeof(int));
    cudaMemcpy(d_A_cuda, h_A.data(), N * N * sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(d_B_cuda, h_B.data(), N * N * sizeof(int), cudaMemcpyHostToDevice);

    dim3 threads(16, 16);
    dim3 blocks((N + threads.x - 1) / threads.x, (N + threads.y - 1) / threads.y);

    // Warm-up CUDA kernel
    cuda_matrix_mul_global<<<blocks, threads>>>(d_A_cuda, d_B_cuda, d_C_cuda, N, N, N);
    cudaDeviceSynchronize();

    // Timed CUDA kernel run
    cudaEvent_t start_cuda, stop_cuda;
    cudaEventCreate(&start_cuda);
    cudaEventCreate(&stop_cuda);
    cudaEventRecord(start_cuda);
    cuda_matrix_mul_global<<<blocks, threads>>>(d_A_cuda, d_B_cuda, d_C_cuda, N, N, N);
    cudaEventRecord(stop_cuda);
    cudaEventSynchronize(stop_cuda);

    float time_cuda = 0;
    cudaEventElapsedTime(&time_cuda, start_cuda, stop_cuda);
    cudaMemcpy(h_C_cuda.data(), d_C_cuda, N * N * sizeof(int), cudaMemcpyDeviceToHost);

    cudaFree(d_A_cuda);
    cudaFree(d_B_cuda);
    cudaFree(d_C_cuda);
    cudaEventDestroy(start_cuda);
    cudaEventDestroy(stop_cuda);

    // PTX setup
    CUdevice cuDevice;
    CUcontext cuContext;
    CUmodule cuModule;
    CUfunction cuFunction;
    cuInit(0);
    cuDeviceGet(&cuDevice, 0);
    cuCtxCreate(&cuContext, 0, cuDevice);

    char error_log[8192];
    char info_log[8192];
    CUjit_option options[] = {
        CU_JIT_ERROR_LOG_BUFFER, CU_JIT_ERROR_LOG_BUFFER_SIZE_BYTES,
        CU_JIT_INFO_LOG_BUFFER, CU_JIT_INFO_LOG_BUFFER_SIZE_BYTES,
        CU_JIT_LOG_VERBOSE
    };
    void* optionValues[] = {
        (void*)error_log, (void*)(uintptr_t)sizeof(error_log),
        (void*)info_log,  (void*)(uintptr_t)sizeof(info_log),
        (void*)1
    };

    CUresult res = cuModuleLoadDataEx(&cuModule, ptx_code, 5, options, optionValues);
    if (res != CUDA_SUCCESS) {
        std::cerr << "Failed to load PTX module.\nError log:\n" << error_log << "\n";
        return;
    }

    res = cuModuleGetFunction(&cuFunction, cuModule, "matrix_mul_kernel");
    if (res != CUDA_SUCCESS) {
        std::cerr << "Failed to get PTX function.\n";
        return;
    }

    CUdeviceptr d_A, d_B, d_C;
    cuMemAlloc(&d_A, N * N * sizeof(int));
    cuMemAlloc(&d_B, N * N * sizeof(int));
    cuMemAlloc(&d_C, N * N * sizeof(int));
    cuMemcpyHtoD(d_A, h_A.data(), N * N * sizeof(int));
    cuMemcpyHtoD(d_B, h_B.data(), N * N * sizeof(int));

    uint64_t m64 = N, n64 = N, p64 = N;
    void* args[] = { &d_A, &d_B, &d_C, &m64, &n64, &p64 };

    // Warm-up PTX kernel
    cuLaunchKernel(cuFunction,
                   (N + 15) / 16, (N + 15) / 16, 1,
                   16, 16, 1,
                   0, 0, args, 0);
    cuCtxSynchronize();

    // Timed PTX kernel run
    CUevent start_ptx, stop_ptx;
    cuEventCreate(&start_ptx, CU_EVENT_DEFAULT);
    cuEventCreate(&stop_ptx, CU_EVENT_DEFAULT);
    cuEventRecord(start_ptx, 0);
    cuLaunchKernel(cuFunction,
                   (N + 15) / 16, (N + 15) / 16, 1,
                   16, 16, 1,
                   0, 0, args, 0);
    cuEventRecord(stop_ptx, 0);
    cuEventSynchronize(stop_ptx);

    float time_ptx = 0;
    cuEventElapsedTime(&time_ptx, start_ptx, stop_ptx);

    cuMemcpyDtoH(h_C_ptx.data(), d_C, N * N * sizeof(int));
    cuMemFree(d_A);
    cuMemFree(d_B);
    cuMemFree(d_C);
    cuModuleUnload(cuModule);
    cuCtxDestroy(cuContext);

    
    // After getting both CUDA and PTX results, add validation:
    
    // Check if results are all zeros (common error case)
    bool ptx_all_zeros = true;
    bool cuda_all_zeros = true;
    
    // Check first few elements (for efficiency)
    int check_limit = std::min(100, N * N);
    for (int i = 0; i < check_limit; i++) {
        if (h_C_ptx[i] != 0) ptx_all_zeros = false;
        if (h_C_cuda[i] != 0) cuda_all_zeros = false;
        if (!ptx_all_zeros && !cuda_all_zeros) break;
    }
    
    // Validate results - use CUDA as reference implementation
    bool ptx_matches_cuda = true;
    int mismatch_i = -1, mismatch_j = -1;
    int ptx_val = 0, cuda_val = 0;
    
    // Sample the matrix (stride increases with size for better performance)
    int stride = N > 1000 ? N / 100 : 1;
    for (int i = 0; i < N && ptx_matches_cuda; i += stride) {
        for (int j = 0; j < N && ptx_matches_cuda; j += stride) {
            int idx = i * N + j;
            if (h_C_ptx[idx] != h_C_cuda[idx]) {
                ptx_matches_cuda = false;
                mismatch_i = i;
                mismatch_j = j;
                ptx_val = h_C_ptx[idx];
                cuda_val = h_C_cuda[idx];
            }
        }
    }
    
    // Output results with validation information
    std::cout << "N = " << N 
              << " | PTX: " << time_ptx << " ms"
              << " | CUDA: " << time_cuda << " ms"
              << " | Validation: ";
    
    if (cuda_all_zeros) {
        std::cout << "CUDA produced all zeros (likely incorrect)";
    } else if (ptx_all_zeros) {
        std::cout << "PTX produced all zeros (likely incorrect)";
    } else if (ptx_matches_cuda) {
        std::cout << "PASS (PTX matches CUDA)";
    } else {
        std::cout << "FAIL - mismatch at [" << mismatch_i << "][" << mismatch_j 
                  << "]: CUDA=" << cuda_val << ", PTX=" << ptx_val;
                  
        // For small matrices, print full comparison when there's a mismatch
        if (N <= 8) {
            std::cout << "\nFull comparison for small matrix:" << std::endl;
            for (int i = 0; i < N; i++) {
                for (int j = 0; j < N; j++) {
                    int idx = i * N + j;
                    std::cout << "(" << h_C_cuda[idx] << "," << h_C_ptx[idx] << ") ";
                }
                std::cout << std::endl;
            }
        }
    }
    std::cout << std::endl;
}


int main() {
    srand(time(0));
    for (int N = 4; N <= 40000; N *= 2)
        benchmark(N);
    return 0;
}
