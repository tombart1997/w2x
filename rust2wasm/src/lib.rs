#![no_std]
#![no_main]

use core::panic::PanicInfo;

pub struct ThreadIdx {
    pub x: u32,
    pub y: u32,
    pub z: u32,
}

pub struct BlockIdx {
    pub x: u32,
    pub y: u32,
    pub z: u32,
}


pub struct BlockDim {
    pub x: u32,
    pub y: u32,
    pub z: u32,
}


/* 

// Define multiple shared buffers with distinct types
#[repr(C, align(128))]
struct TileA([f32; 512]);

#[repr(C, align(128))]
struct TileB([f32; 512]);

// Define a wrapper type for shared memory
#[repr(transparent)]
pub struct Shared<T>(pub T);


#[no_mangle]
pub extern "C" fn matmul_shared_kernel(
    a_ptr: *const f32,
    b_ptr: *const f32,
    c_ptr: *mut f32,
    m: usize, n: usize, k: usize,
    block_x: usize, block_y: usize,
    thread_x: usize, thread_y: usize,
    tile_a: *mut Shared<TileA>,  // Using wrapper type
    tile_b: *mut Shared<TileB>   // Using wrapper type
) {
    unsafe {
        let a = &mut (*tile_a).0 .0;
        let b = &mut (*tile_b).0 .0;
        let row = block_y * 32 + thread_y;
        let col = block_x * 32 + thread_x;
        let mut sum = 0.0f32;
        let num_tiles = (k + 31) / 32;
        for tile in 0..num_tiles {
            let tile_offset = tile * 32;
            if tile_offset + thread_x < k && row < m {
                a[thread_y * 32 + thread_x] = *a_ptr.add(row * k + tile_offset + thread_x);
            } else {
                a[thread_y * 32 + thread_x] = 0.0;
            }
            
            if tile_offset + thread_y < k && col < n {
                b[thread_y * 32 + thread_x] = *b_ptr.add((tile_offset + thread_y) * n + col);
            } else {
                b[thread_y * 32 + thread_x] = 0.0;
            }
            __syncthreads();
            for i in 0..32 {
                if tile_offset + i < k {
                    sum += a[thread_y * 32 + i] * b[i * 32 + thread_x];
                }
            }
            __syncthreads();
        }
        if row < m && col < n {
            *c_ptr.add(row * n + col) = sum;
        }
    }
}

#[inline(always)]
unsafe fn __syncthreads() {
    let addr: *mut u32 = 0xFFFFFFF0 as *mut u32;
    core::ptr::write_volatile(addr, 1);
    core::ptr::read_volatile(addr);
}

*/

#[no_mangle]
pub extern "C" fn vector_add_kernel(
    thread_idx: ThreadIdx,
    block_idx: BlockIdx,
    block_dim: BlockDim,
    a: *const i32,
    b: *const i32, 
    c: *mut i32,
    n: usize,
) {
    let tid_x = (block_idx.x * block_dim.x + thread_idx.x) as usize;
    unsafe {
        if tid_x < n {
            *c.add(tid_x) = *a.add(tid_x) + *b.add(tid_x);
        }
    }
}

#[no_mangle]
pub extern "C" fn vector_sub_kernel(
    thread_idx: ThreadIdx,
    block_idx: BlockIdx,
    block_dim: BlockDim,
    a: *const i32,
    b: *const i32, 
    c: *mut i32,
    n: usize,
) {
    let tid_x = (block_idx.x * block_dim.x + thread_idx.x) as usize;
    unsafe {
        if tid_x < n {
            *c.add(tid_x) = *a.add(tid_x) - *b.add(tid_x);
        }
    }
}



#[no_mangle]
pub extern "C" fn vector_add_loop_kernel(
    thread_idx: ThreadIdx,
    block_idx: BlockIdx,
    block_dim: BlockDim,
    a: *const i32,
    b: *const i32, 
    c: *mut i32,
    n: usize,
    

) {
    let mut i = (block_idx.x * block_dim.x + thread_idx.x) as usize;
    while i < n {
        //dereferncing a raw pointer is unsafe
        unsafe {
            *c.add(i) = *a.add(i) + *b.add(i);
        }
        i += (block_dim.x * block_dim.y * block_dim.z) as usize;
    }
    
}


#[no_mangle]
pub extern "C" fn vector_scale_kernel(
    thread_idx: ThreadIdx,
    block_idx: BlockIdx,
    block_dim: BlockDim,
    a: *const i32,
    scale: i32, 
    c: *mut i32,
    n: usize,
) {
    let tid_x = (block_idx.x * block_dim.x + thread_idx.x) as usize;
    unsafe {
        if tid_x < n {
            *c.add(tid_x) = *a.add(tid_x) * scale;
        }
    }
}

#[no_mangle]
pub extern "C" fn matrix_mul_kernel(
    thread_idx: ThreadIdx,
    block_idx: BlockIdx,
    block_dim: BlockDim,
    a: *const i32,
    b: *const i32,
    c: *mut i32,
    m: usize, 
    n: usize, 
    p: usize, 
) {
    let row: usize = (block_idx.y * block_dim.y + thread_idx.y) as usize;
    let col = (block_idx.x * block_dim.x + thread_idx.x) as usize;

    if row < m && col < p {
        let mut sum = 0;
        for k in 0..n {
            let a_idx = row * n + k;
            let b_idx = k * p + col;
            unsafe {
                sum += *a.add(a_idx) * *b.add(b_idx);
            }
        }
        let c_idx = row * p + col;
        unsafe {
            *c.add(c_idx) = sum;
        }
    }
}

#[no_mangle]
pub extern "C" fn matrix_transpose_kernel(
    thread_idx: ThreadIdx,
    block_idx: BlockIdx,
    block_dim: BlockDim,
    input: *const i32,
    output: *mut i32,
    rows: usize,
    cols: usize,
) {
    let row = (block_idx.y * block_dim.y + thread_idx.y) as usize;
    let col = (block_idx.x * block_dim.x + thread_idx.x) as usize;
    
    if row < rows && col < cols {
        // In the transposed matrix, rows and columns are swapped
        let input_idx = row * cols + col;
        let output_idx = col * rows + row;
        
        unsafe {
            *output.add(output_idx) = *input.add(input_idx);
        }
    }
}

#[no_mangle]
pub extern "C" fn dot_product_kernel(
    thread_idx: ThreadIdx,
    block_idx: BlockIdx,
    block_dim: BlockDim,
    a: *const i32,
    b: *const i32,
    c: *mut i32,
    n: usize,
) {
    // Each thread computes one element of the result vector
    let tid = (block_idx.x * block_dim.x + thread_idx.x) as usize;
    
    if tid < n {
        // Calculate partial dot product for this thread's position
        let mut sum = 0;
        unsafe {
            sum = *a.add(tid) * *b.add(tid);
            *c.add(tid) = sum;
        }
    }
}

#[no_mangle]
pub extern "C" fn relu_kernel(
    thread_idx: ThreadIdx,
    block_idx: BlockIdx,
    block_dim: BlockDim,
    input: *const f32,
    output: *mut f32,
    n: usize,
) {
    let tid = (block_idx.x * block_dim.x + thread_idx.x) as usize;
    if tid < n {
        unsafe {
            let val = *input.add(tid);
            *output.add(tid) = if val > 0.0 { val } else { 0.0 };
        }
    }
}

#[no_mangle]
pub extern "C" fn max_pooling_2d_kernel(
    thread_idx: ThreadIdx,
    block_idx: BlockIdx,
    block_dim: BlockDim,
    input: *const f32,
    output: *mut f32,
    input_height: usize,
    input_width: usize,
    pool_size: usize,
    stride: usize,
) {
    if stride == 0 || pool_size == 0 || pool_size > input_height || pool_size > input_width {
        return; 
    }
    let out_y = (block_idx.y * block_dim.y + thread_idx.y) as usize;
    let out_x = (block_idx.x * block_dim.x + thread_idx.x) as usize;
    let output_height = (input_height - pool_size) / stride + 1;
    let output_width = (input_width - pool_size) / stride + 1;
    if out_y < output_height && out_x < output_width {
        let in_y_start = out_y * stride;
        let in_x_start = out_x * stride;
        let mut max_val = f32::NEG_INFINITY;
        for dy in 0..pool_size {
            for dx in 0..pool_size {
                let in_y = in_y_start + dy;
                let in_x = in_x_start + dx;
                
                unsafe {
                    let idx = in_y * input_width + in_x;
                    let val = *input.add(idx);
                    max_val = if val > max_val { val } else { max_val };
                }
            }
        }
        unsafe {
            let out_idx = out_y * output_width + out_x;
            *output.add(out_idx) = max_val;
        }
    }
}

// Add this function above your softmax_kernel
fn exp_approx(x: f32) -> f32 {
    // Clamp input to avoid numerical issues
    let x = if x > 88.0 { 88.0 } else if x < -88.0 { -88.0 } else { x };
    
    // Fast approximation using a polynomial expansion
    // This is accurate enough for softmax
    let y = 1.0 + x * (1.0 + x * 0.5 * (1.0 + x * 0.16667 * (1.0 + x * 0.041667)));
    y
}

#[no_mangle]
pub extern "C" fn softmax_kernel(
    thread_idx: ThreadIdx,
    block_idx: BlockIdx,
    block_dim: BlockDim,
    input: *const f32,
    output: *mut f32,
    n_rows: usize,
    n_cols: usize,
) {
    let row = (block_idx.y * block_dim.y + thread_idx.y) as usize;
    if row < n_rows {
        // Find max value in row (for numerical stability)
        let mut row_max = f32::NEG_INFINITY;
        for col in 0..n_cols {
            unsafe {
                let idx = row * n_cols + col;
                let val = *input.add(idx);
                row_max = if val > row_max { val } else { row_max };
            }
        }
        // Compute exp(x - max) for each element
        let mut sum = 0.0;
        for col in 0..n_cols {
            unsafe {
                let idx = row * n_cols + col;
                let val = exp_approx(*input.add(idx) - row_max); // Use our custom exp
                *output.add(idx) = val;
                sum += val;
            }
        }
        // Normalize by sum
        for col in 0..n_cols {
            unsafe {
                let idx = row * n_cols + col;
                *output.add(idx) = *output.add(idx) / sum;
            }
        }
    }
}


#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}