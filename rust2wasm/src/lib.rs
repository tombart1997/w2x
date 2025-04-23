#![no_std]
#![no_main]

use core::panic::PanicInfo;

#[repr(C)]
pub struct ThreadIdx {
    pub x: u32, // PTX: tid.x
    pub y: u32, // PTX: tid.y
    pub z: u32, // PTX: tid.z
}

#[repr(C)]
pub struct BlockIdx {
    pub x: u32, // PTX: ctaid.x
    pub y: u32, // PTX: ctaid.y
    pub z: u32, // PTX: ctaid.z
}

#[repr(C)]
pub struct BlockDim {
    pub x: u32, // PTX: ntid.x
    pub y: u32, // PTX: ntid.y
    pub z: u32, // PTX: ntid.z
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
    unsafe {
        let mut i = (block_idx.x * block_dim.x + thread_idx.x) as usize;
        while i < n {
            unsafe {
                *c.add(i) = *a.add(i) + *b.add(i);
            }
            i += (block_dim.x * block_dim.y * block_dim.z) as usize;
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



#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}