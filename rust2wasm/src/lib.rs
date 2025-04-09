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


#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}