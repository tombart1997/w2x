#include <cuda.h>
#include <cuda_runtime.h>
#include <iostream>
#include <vector>
#include <cstdlib>
#include <ctime>
#include <cmath>
#include <iomanip>  

// Dummy PTX string placeholder
const char* ptx_code = R"ptx(
.version 8.0
.target sm_80
.visible .entry max_pooling_2d_kernel(
	.param .u64 param9,
	.param .u64 param10,
	.param .u64 param11,
	.param .u64 param12,
	.param .u64 param13,
	.param .u64 param14
) {
	.reg .u32 %r1, %r3, %r16, %r17, %r18, %r19, %r20, %r21, %r22, %r25, %r30, %r31, %r32, %r33, %r34, %r35, %r36, %r40, %r42, %r43, %r49, %r54, %r57, %r63, %r67, %r70, %r71, %r72, %r75, %r76, %r80;
	.reg .u64 %rd4, %rd5, %rd6, %rd8, %rd9, %rd10, %rd11, %rd12, %rd13, %rd14, %rd15, %rd23, %rd24, %rd26, %rd27, %rd28, %rd38, %rd39, %rd41, %rd44, %rd45, %rd46, %rd47, %rd48, %rd50, %rd51, %rd55, %rd64, %rd65, %rd66, %rd68, %rd69, %rd73, %rd74, %rd77, %rd78, %rd79, %rd81, %rd82;
	.reg .f32 %f52, %f53, %f59, %f60, %f62;
	.reg .pred %p0, %p2, %p7, %p29, %p37, %p56, %p58, %p61;
max_pooling_2d_kernel_start:
	ld.param.u64 %rd9, [param9];
	ld.param.u64 %rd10, [param10];
	ld.param.u64 %rd11, [param11];
	ld.param.u64 %rd12, [param12];
	ld.param.u64 %rd13, [param13];
	ld.param.u64 %rd14, [param14];
block_16_start:
	setp.lt.u64 %p0, %rd12, %rd13;
	@%p0 bra block_16_end;
	cvt.u32.u64 %r1, %rd14;
	setp.eq.u32 %p2, %r1, 0;
	@%p2 bra block_16_end;
	mov.s32 %r3, -1;
	cvt.s64.s32 %rd4, %r3;
	add.s64 %rd5, %rd13, %rd4;
	cvt.u64.s64 %rd6, %rd5;
	setp.ge.u64 %p7, %rd6, %rd11;
	@%p7 bra block_16_end;
	sub.u64 %rd8, %rd12, %rd13;
	div.u64 %rd15, %rd8, %rd14;
	cvt.u32.u64 %r17, %rd15;
	mov.u32 %r16, %r17;
	mov.u32 %r18, %ntid.y;
	mov.u32 %r19, %ctaid.y;
	mul.lo.s32 %r20, %r18, %r19;
	mov.u32 %r21, %tid.y;
	add.u32 %r22, %r20, %r21;
	mov.u32 %r21, %r22;
	sub.u64 %rd23, %rd11, %rd13;
	div.u64 %rd24, %rd23, %rd14;
	mov.u32 %r25, 1;
	cvt.u64.u32 %rd26, %r25;
	add.u64 %rd27, %rd24, %rd26;
	cvt.u64.u32 %rd28, %r22;
	setp.ge.u64 %p29, %rd28, %rd27;
	@%p29 bra block_16_end;
	mov.u32 %r30, %ntid.x;
	mov.u32 %r31, %ctaid.x;
	mul.lo.s32 %r32, %r30, %r31;
	mov.u32 %r33, %tid.x;
	add.u32 %r34, %r32, %r33;
	mov.u32 %r30, %r34;
	mov.u32 %r35, 1;
	add.u32 %r36, %r16, %r35;
	mov.u32 %r31, %r36;
	setp.ge.u32 %p37, %r34, %r36;
	@%p37 bra block_16_end;
	cvt.u64.u32 %rd38, %r21;
	mul.lo.s64 %rd39, %rd12, %rd38;
	mov.u32 %r40, 2;
	shl.b64 %rd41, %rd39, %r40;
	mov.u32 %r42, 2;
	shl.b32 %r43, %r30, %r42;
	cvt.u64.u32 %rd44, %r43;
	add.u64 %rd45, %rd41, %rd44;
	mul.lo.s64 %rd46, %rd14, %rd45;
	add.u64 %rd47, %rd9, %rd46;
	mov.u64 %rd48, %rd47;
	mov.u32 %r49, 2;
	shl.b64 %rd50, %rd12, %r49;
	mov.u64 %rd51, %rd50;
	mov.f32 %f52, 0fFF800000;
	mov.f32 %f53, %f52;
	mov.u32 %r54, 0;
	cvt.u64.u32 %rd55, %r54;
	mov.u64 %rd11, %rd55;
loop_0_68_start:
block_17_start:
block_18_start:
	setp.eq.u64 %p56, %rd11, %rd13;
	@%p56 bra block_18_end;
	mov.u64 %rd12, %rd13;
	mov.u64 %rd14, %rd48;
loop_0_8_start:
	cvt.u32.u64 %r57, %rd12;
	setp.eq.u32 %p58, %r57, 0;
	@%p58 bra block_17_end;
	ld.global.f32 %f59, [%rd14];
	mov.f32 %f60, %f59;
	setp.gt.f32 %p61, %f60, %f53;
	selp.f32 %f62, %f59, %f53, %p61;
	mov.f32 %f53, %f62;
	mov.s32 %r63, -1;
	cvt.s64.s32 %rd64, %r63;
	add.s64 %rd65, %rd12, %rd64;
	cvt.u64.s64 %rd66, %rd65;
	mov.u64 %rd12, %rd66;
	mov.u32 %r67, 4;
	cvt.u64.u32 %rd68, %r67;
	add.u64 %rd69, %rd14, %rd68;
	mov.u64 %rd14, %rd69;
	bra loop_0_8_start;
loop_0_8_end:
block_18_end:
	mul.lo.s32 %r70, %r31, %r21;
	mov.u32 %r71, 2;
	shl.b32 %r72, %r70, %r71;
	cvt.u64.u32 %rd73, %r72;
	add.u64 %rd74, %rd10, %rd73;
	mov.u32 %r75, 2;
	shl.b32 %r76, %r30, %r75;
	cvt.u64.u32 %rd77, %r76;
	add.u64 %rd78, %rd74, %rd77;
	st.global.f32 [%rd78], %f53;
	bra block_16_end;
block_17_end:
	add.u64 %rd79, %rd48, %rd51;
	mov.u64 %rd48, %rd79;
	mov.u32 %r80, 1;
	cvt.u64.u32 %rd81, %r80;
	add.u64 %rd82, %rd11, %rd81;
	mov.u64 %rd11, %rd82;
	bra loop_0_68_start;
loop_0_68_end:
block_16_end:
max_pooling_2d_kernel_end:
}
)ptx";

// Add this native CUDA kernel implementation
__global__ void native_max_pooling_2d_kernel(float* input, float* output, 
                                            int input_height, int input_width,
                                            int pool_size, int stride) {
    int ox = blockIdx.x * blockDim.x + threadIdx.x;
    int oy = blockIdx.y * blockDim.y + threadIdx.y;
    
    int output_width = (input_width - pool_size) / stride + 1;
    int output_height = (input_height - pool_size) / stride + 1;
    
    if (ox < output_width && oy < output_height) {
        float max_val = -INFINITY;
        
        for (int dy = 0; dy < pool_size; ++dy) {
            for (int dx = 0; dx < pool_size; ++dx) {
                int iy = oy * stride + dy;
                int ix = ox * stride + dx;
                
                float val = input[iy * input_width + ix];
                max_val = fmaxf(max_val, val);
            }
        }
        
        output[oy * output_width + ox] = max_val;
    }
}


const char* getCudaErrorString(CUresult error) {
    const char* str;
    cuGetErrorString(error, &str);
    return str;
}

float benchmark_pooling(CUcontext context, int input_height, int input_width, int pool_size, int stride) {
    cuCtxSetCurrent(context);
    
    // Calculate output dimensions
    int output_height = (input_height - pool_size) / stride + 1;
    int output_width = (input_width - pool_size) / stride + 1;
    
    // Create host data
    std::vector<float> h_input(input_height * input_width);
    std::vector<float> h_output_gpu(output_height * output_width);
    std::vector<float> h_output_cpu(output_height * output_width);
    
    // Initialize input data with random values
    srand(42);  // Fixed seed for reproducibility
    for (auto& val : h_input) {
        val = static_cast<float>(rand()) / RAND_MAX;
    }
    
    // Prepare PTX module
    CUmodule module;
    CUresult res = cuModuleLoadData(&module, ptx_code);
    if (res != CUDA_SUCCESS) {
        std::cerr << "Failed to load PTX module: " << getCudaErrorString(res) << std::endl;
        return 0.0f;
    }
    
    // Get kernel function
    CUfunction kernel;
    res = cuModuleGetFunction(&kernel, module, "max_pooling_2d_kernel");
    if (res != CUDA_SUCCESS) {
        std::cerr << "Failed to get kernel function: " << getCudaErrorString(res) << std::endl;
        cuModuleUnload(module);
        return 0.0f;
    }
    
    // Allocate device memory
    CUdeviceptr d_input, d_output;
    res = cuMemAlloc(&d_input, h_input.size() * sizeof(float));
    if (res != CUDA_SUCCESS) {
        std::cerr << "Failed to allocate device input memory: " << getCudaErrorString(res) << std::endl;
        cuModuleUnload(module);
        return 0.0f;
    }
    
    res = cuMemAlloc(&d_output, h_output_gpu.size() * sizeof(float));
    if (res != CUDA_SUCCESS) {
        std::cerr << "Failed to allocate device output memory: " << getCudaErrorString(res) << std::endl;
        cuMemFree(d_input);
        cuModuleUnload(module);
        return 0.0f;
    }
    
    // Copy input data to device
    res = cuMemcpyHtoD(d_input, h_input.data(), h_input.size() * sizeof(float));
    if (res != CUDA_SUCCESS) {
        std::cerr << "Failed to copy input data to device: " << getCudaErrorString(res) << std::endl;
        cuMemFree(d_output);
        cuMemFree(d_input);
        cuModuleUnload(module);
        return 0.0f;
    }
    
    // Set up kernel parameters
    // Convert 32-bit integers to 64-bit
    uint64_t input_height_64 = static_cast<uint64_t>(input_height);
    uint64_t input_width_64 = static_cast<uint64_t>(input_width);
    uint64_t pool_size_64 = static_cast<uint64_t>(pool_size);
    uint64_t stride_64 = static_cast<uint64_t>(stride);

    // Use the 64-bit versions in the argument list
    void* args[] = {
        &d_input, &d_output,
        &input_height_64, &input_width_64,
        &pool_size_64, &stride_64
    };
    
    // Set up grid and block dimensions
    int block_size = 16;
    int grid_x = (output_width + block_size - 1) / block_size;
    int grid_y = (output_height + block_size - 1) / block_size;
    
    // Create CUDA events for timing
    CUevent start, stop;
    cuEventCreate(&start, 0);
    cuEventCreate(&stop, 0);
    
    // Record start time
    cuEventRecord(start, 0);
    
    // Launch kernel
    res = cuLaunchKernel(kernel,
                         grid_x, grid_y, 1,  // grid dimensions
                         block_size, block_size, 1,  // block dimensions
                         0, NULL,  // shared memory and stream
                         args, NULL);  // arguments and extra
                         
    if (res != CUDA_SUCCESS) {
        std::cerr << "Failed to launch kernel: " << getCudaErrorString(res) << std::endl;
        cuEventDestroy(start);
        cuEventDestroy(stop);
        cuMemFree(d_output);
        cuMemFree(d_input);
        cuModuleUnload(module);
        return 0.0f;
    }
    
    // Record stop time
    cuEventRecord(stop, 0);
    cuEventSynchronize(stop);
    
    // Calculate elapsed time
    float elapsed_ms = 0.0f;
    cuEventElapsedTime(&elapsed_ms, start, stop);
    
    // Copy result back to host
    res = cuMemcpyDtoH(h_output_gpu.data(), d_output, h_output_gpu.size() * sizeof(float));
    if (res != CUDA_SUCCESS) {
        std::cerr << "Failed to copy output data from device: " << getCudaErrorString(res) << std::endl;
    }
    
    // Compute reference output on CPU
    for (int oy = 0; oy < output_height; ++oy) {
        for (int ox = 0; ox < output_width; ++ox) {
            float max_val = -INFINITY;
            
            for (int dy = 0; dy < pool_size; ++dy) {
                for (int dx = 0; dx < pool_size; ++dx) {
                    int iy = oy * stride + dy;
                    int ix = ox * stride + dx;
                    
                    float val = h_input[iy * input_width + ix];
                    max_val = fmaxf(max_val, val);
                }
            }
            
            h_output_cpu[oy * output_width + ox] = max_val;
        }
    }
    
    // Validate results
    bool correct = true;
    int mismatch_index = -1;
    float cpu_val = 0.0f, gpu_val = 0.0f;
    
    for (size_t i = 0; i < h_output_gpu.size(); ++i) {
        if (fabsf(h_output_gpu[i] - h_output_cpu[i]) > 1e-5) {
            correct = false;
            mismatch_index = i;
            cpu_val = h_output_cpu[i];
            gpu_val = h_output_gpu[i];
            break;
        }
    }
    
    if (!correct) {
        std::cout << "Mismatch at " << mismatch_index << ": CPU = " 
                  << cpu_val << ", GPU = " << gpu_val << std::endl;
    }
    
    // Clean up
    cuEventDestroy(start);
    cuEventDestroy(stop);
    cuMemFree(d_output);
    cuMemFree(d_input);
    cuModuleUnload(module);
    
    /*
    // Output results
    std::cout << "Input: " << input_height << "x" << input_width 
              << " | Pool: " << pool_size << " | Stride: " << stride
              << " | Time: " << elapsed_ms << " ms"
              << " | Correct: " << (correct ? "Yes" : "No") << std::endl;
    */
    return elapsed_ms;
}

float benchmark_cuda_pooling(CUcontext context, int input_height, int input_width, int pool_size, int stride) {
    cuCtxSetCurrent(context);
    
    // Calculate output dimensions
    int output_height = (input_height - pool_size) / stride + 1;
    int output_width = (input_width - pool_size) / stride + 1;
    
    // Create host data
    std::vector<float> h_input(input_height * input_width);
    std::vector<float> h_output(output_height * output_width);
    
    // Initialize input data with random values - use same seed as PTX benchmark
    srand(42);  // Fixed seed for reproducibility
    for (auto& val : h_input) {
        val = static_cast<float>(rand()) / RAND_MAX;
    }
    
    // Allocate device memory
    float *d_input, *d_output;
    cudaError_t err = cudaMalloc(&d_input, h_input.size() * sizeof(float));
    if (err != cudaSuccess) {
        std::cerr << "Failed to allocate device input memory: " << cudaGetErrorString(err) << std::endl;
        return 0.0f;
    }
    
    err = cudaMalloc(&d_output, h_output.size() * sizeof(float));
    if (err != cudaSuccess) {
        std::cerr << "Failed to allocate device output memory: " << cudaGetErrorString(err) << std::endl;
        cudaFree(d_input);
        return 0.0f;
    }
    
    // Copy input data to device
    err = cudaMemcpy(d_input, h_input.data(), h_input.size() * sizeof(float), cudaMemcpyHostToDevice);
    if (err != cudaSuccess) {
        std::cerr << "Failed to copy input data to device: " << cudaGetErrorString(err) << std::endl;
        cudaFree(d_output);
        cudaFree(d_input);
        return 0.0f;
    }
    
    // Set up grid and block dimensions
    dim3 blockDim(16, 16);
    dim3 gridDim((output_width + blockDim.x - 1) / blockDim.x, 
                 (output_height + blockDim.y - 1) / blockDim.y);
    
    // Create CUDA events for timing
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    
    // Record start time
    cudaEventRecord(start);
    
    // Launch kernel
    native_max_pooling_2d_kernel<<<gridDim, blockDim>>>(
        d_input, d_output, input_height, input_width, pool_size, stride
    );
    
    // Check for kernel launch errors
    err = cudaGetLastError();
    if (err != cudaSuccess) {
        std::cerr << "Kernel launch failed: " << cudaGetErrorString(err) << std::endl;
        cudaEventDestroy(start);
        cudaEventDestroy(stop);
        cudaFree(d_output);
        cudaFree(d_input);
        return 0.0f;
    }
    
    // Record stop time
    cudaEventRecord(stop);
    cudaEventSynchronize(stop);
    
    // Calculate elapsed time
    float elapsed_ms = 0.0f;
    cudaEventElapsedTime(&elapsed_ms, start, stop);
    
    // Copy result back to host
    err = cudaMemcpy(h_output.data(), d_output, h_output.size() * sizeof(float), cudaMemcpyDeviceToHost);
    if (err != cudaSuccess) {
        std::cerr << "Failed to copy output data from device: " << cudaGetErrorString(err) << std::endl;
    }
    
    // Clean up
    cudaEventDestroy(start);
    cudaEventDestroy(stop);
    cudaFree(d_output);
    cudaFree(d_input);
    
    /*
    // Output results
    std::cout << "Native CUDA: " << input_height << "x" << input_width 
              << " | Pool: " << pool_size << " | Stride: " << stride
              << " | Time: " << elapsed_ms << " ms" << std::endl;
    
    */
    return elapsed_ms;
}


int main() {
    // Initialize CUDA
    CUdevice cuDevice;
    CUcontext cuContext;
    
    CUresult res = cuInit(0);
    if (res != CUDA_SUCCESS) {
        std::cerr << "Failed to initialize CUDA: " << getCudaErrorString(res) << std::endl;
        return 1;
    }
    
    res = cuDeviceGet(&cuDevice, 0);
    if (res != CUDA_SUCCESS) {
        std::cerr << "Failed to get CUDA device: " << getCudaErrorString(res) << std::endl;
        return 1;
    }
    
    res = cuCtxCreate(&cuContext, 0, cuDevice);
    if (res != CUDA_SUCCESS) {
        std::cerr << "Failed to create CUDA context: " << getCudaErrorString(res) << std::endl;
        return 1;
    }

    // Do a warm-up run to initialize CUDA
    std::cout << "Performing warm-up runs..." << std::endl;
    benchmark_pooling(cuContext, 128, 128, 2, 2);
    benchmark_cuda_pooling(cuContext, 128, 128, 2, 2);
    std::cout << "Warm-up complete." << std::endl << std::endl;
    
    // Define test configurations
    struct TestConfig {
        int height, width, pool, stride;
        std::string name;
    };
    
    // Define a range of test configurations with larger dimensions
    TestConfig configs[] = {
        {4096, 4096, 2, 2, "4K image, basic pooling"},
        {8192, 8192, 2, 2, "8K image, basic pooling"},
        {16384, 16384, 2, 2, "16K image, basic pooling"},  // Very large!
        {6144, 6144, 3, 2, "6K image, larger pool"},
        {4096, 8192, 4, 4, "4K×8K image, large pool/stride"},
        {7680, 4320, 3, 1, "8K UHD (7680×4320), stride 1"},
        {2048, 2048, 16, 16, "2K image, extreme pool=stride"}
    };
    
    // Print header with nicer formatting
    std::cout << "╔═══════════════════════════════════════════════════════════════════╗" << std::endl;
    std::cout << "║           PERFORMANCE COMPARISON: PTX vs Native CUDA              ║" << std::endl;
    std::cout << "╠═════════════════════╦═══════════════╦═══════════════╦════════════╣" << std::endl;
    std::cout << "║ Configuration        ║ PTX Time (ms) ║ CUDA Time (ms)║  Speedup   ║" << std::endl;
    std::cout << "╠═════════════════════╬═══════════════╬═══════════════╬════════════╣" << std::endl;

    // Run benchmarks 
    for (const auto& config : configs) {
        // Run each benchmark 3 times and take the best time
        float ptx_time = 1000.0f; // Start with a high value
        float cuda_time = 1000.0f;
        
        for (int i = 0; i < 3; i++) {
            // Run PTX benchmark
            float run_time = benchmark_pooling(cuContext, 
                                          config.height, config.width, 
                                          config.pool, config.stride);
            ptx_time = std::min(ptx_time, run_time);
            
            // Run native CUDA benchmark
            run_time = benchmark_cuda_pooling(cuContext,
                                           config.height, config.width, 
                                           config.pool, config.stride);
            cuda_time = std::min(cuda_time, run_time);
        }
        
        // Calculate speedup ratio
        float speedup = 0.0f;
        if (cuda_time > 0.0001f) {
            speedup = ptx_time / cuda_time;
        }
        
        // Prepare the configuration string
        std::string config_str = std::to_string(config.height) + "×" + 
                                 std::to_string(config.width) + " P" + 
                                 std::to_string(config.pool) + " S" + 
                                 std::to_string(config.stride);
        
        // Print results with aligned columns
        std::cout << "║ " << std::left << std::setw(19) << config_str 
                  << " ║ " << std::right << std::setw(13) << std::fixed << std::setprecision(3) << ptx_time
                  << " ║ " << std::right << std::setw(13) << std::fixed << std::setprecision(3) << cuda_time
                  << " ║ " << std::right << std::setw(10) << std::fixed << std::setprecision(2);
                  
        if (speedup > 0.0f) {
            std::cout << speedup << "× ";
        } else {
            std::cout << "N/A  ";
        }
        std::cout << "║" << std::endl;
    }
    
    std::cout << "╚═════════════════════╩═══════════════╩═══════════════╩════════════╝" << std::endl;
    
    // Clean up
    cuCtxDestroy(cuContext);
    
    return 0;
}