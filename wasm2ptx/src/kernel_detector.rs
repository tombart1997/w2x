

use wasmparser::ValType;
#[derive(Debug, Clone)]

pub struct KernelInfo {
    pub is_kernel: bool,
    pub name: String,
    pub first_data_param: usize,
}
impl KernelInfo {
    pub fn new_non_kernel() -> Self {
        Self {
            is_kernel: false,
            name: String::new(),
            first_data_param: 0,  
        }
    }
}

pub fn detect_kernel(name: &str) -> KernelInfo {
    if !name.ends_with("_kernel") {
        return KernelInfo::new_non_kernel();
    }
    KernelInfo {
        is_kernel: true,
        name: name.to_string(),
        first_data_param: 9,
    }
}
