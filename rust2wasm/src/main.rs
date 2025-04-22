extern "C" {
    fn break_down_matrix_mul() -> *const KernelTask;
}

#[repr(C)]
#[derive(Debug, Copy, Clone)]  // Fix: Add Copy and Clone traits
struct KernelTask {
    row: u8,
    col: u8,
}

fn main() {
    unsafe {
        let ptr = break_down_matrix_mul();
        for i in 0..9 {
            let task = *ptr.add(i);  // Now this works fine
        }
    }
}
