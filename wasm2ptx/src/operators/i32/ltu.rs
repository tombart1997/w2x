use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::PTXEntryPoint;
use crate::stack::Stack;
use crate::utils::convert_register;

pub fn handle_i32_ltu(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) {  
    let (right, right_type) = stack.pop().expect("Stack underflow during I32LtU");
    let (formatted_right, new_type_right) = if right_type != RegisterType::U32 {
        convert_register(entry_point, memory_manager, right, right_type, RegisterType::U32)
    } else {
        (right, right_type)
    };

    let (left, left_type) = stack.pop().expect("Stack underflow during I32LtU");
    let (formatted_left, new_type_left) = if left_type != RegisterType::U32 {
        convert_register(entry_point, memory_manager, left, left_type, RegisterType::U32)
    } else {
        (left, left_type)
    };
}
