use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;


pub fn handle_f32_sub(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) {
    let (right, right_type) = stack.pop().expect("Stack underflow during F32Sub");
    let (left, left_type) = stack.pop().expect("Stack underflow during F32Sub");
    
    // Ensure both operands are F32
    let (right, right_type) = if right_type != RegisterType::F32 {
        convert_register(entry_point, memory_manager, right, right_type, RegisterType::F32)
    } else {
        (right, right_type)
    };
    
    let (left, left_type) = if left_type != RegisterType::F32 {
        convert_register(entry_point, memory_manager, left, left_type, RegisterType::F32)
    } else {
        (left, left_type)
    };

    // The result type will be F32
    let result_type = RegisterType::F32;
    
    // For F32, we always use .f32 data type
    let data_type = ".f32";
    
    if let Some((result_reg, reg_type)) = memory_manager.new_register(result_type) {
        entry_point.add_instruction(PTXInstruction::Other(format!(
            "sub.f32 {}, {}, {};",
            memory_manager.format_register(result_reg, reg_type),
            memory_manager.format_register(left, left_type),
            memory_manager.format_register(right, right_type)
        )));
        stack.push(result_reg, reg_type);
    } else {
        panic!("Failed to allocate register for F32Sub operation");
    }
}