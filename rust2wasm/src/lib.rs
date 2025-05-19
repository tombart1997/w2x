#![no_std]
#![no_main]

use core::panic::PanicInfo;

#[repr(C)]
pub struct ThreadIdx {
    pub x: u32,
    pub y: u32,
    pub z: u32,
}

#[repr(C)]
pub struct BlockIdx {
    pub x: u32,
    pub y: u32,
    pub z: u32,
}

#[repr(C)]
pub struct BlockDim {
    pub x: u32,
    pub y: u32,
    pub z: u32,
}


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

// You'll need these for the memory fence simulation
use core::sync::atomic::{fence, Ordering};

// Export with special name for translator recognition
#[no_mangle]
pub extern "C" fn vector_add_shared_kernel(
    thread_idx: ThreadIdx,
    block_idx: BlockIdx,
    block_dim: BlockDim,
    a: *const i32,
    b: *const i32, 
    c: *mut i32,
    n: usize,
) {
    // Use a special naming pattern your translator can recognize
    #[link_section = ".shared_memory"]
    static mut SHARED_A: [i32; 256] = [0; 256]; 
    
    #[link_section = ".shared_memory"]
    static mut SHARED_B: [i32; 256] = [0; 256];
    
    let tid = thread_idx.x as usize;
    let i = ((block_idx.x * block_dim.x) + thread_idx.x) as usize;
    
    unsafe {
        // Only load if within bounds
        if i < n && tid < 256 {
            // Load from global to shared memory
            SHARED_A[tid] = *a.add(i);
            SHARED_B[tid] = *b.add(i);
            
            // Force memory operations to complete
            fence(Ordering::SeqCst);
            
            // Special empty function that your translator will convert to __syncthreads()
            sync_threads();
            
            // Use shared memory for computation
            let result = SHARED_A[tid] + SHARED_B[tid];
            
            // Store result back to global memory
            *c.add(i) = result;
        }
    }
}

// Special function your translator will recognize as a barrier
#[export_name = "__barrier_sync"]
pub fn sync_threads() {
    // Empty function that will be recognized by your translator
    // and converted to PTX bar.sync instruction
    fence(Ordering::SeqCst);
}


#[export_name = "__shared_mem_metadata"]
pub fn shared_memory_metadata() -> *const u8 {
    static METADATA: &str = r#"{
      "kernels": [
        {
          "name": "vector_add_shared_kernel",
          "shared_memory": [
            {"name":"SHARED_A","size":256,"offset":1048700},
            {"name":"SHARED_B","size":256,"offset":1049724}
          ]
        }
      ]
    }"#;
    
    METADATA.as_ptr()
}

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}