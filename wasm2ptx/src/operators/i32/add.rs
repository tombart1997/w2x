use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;

pub fn handle_i32_add(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) { 
    let (right, right_type) = stack.pop().expect("Stack underflow during I32Add");
    let (left, left_type) = stack.pop().expect("Stack underflow during I32Add");
    let requires_u64 = right_type == RegisterType::U64 || left_type == RegisterType::U64;
    let formatted_right = if requires_u64 {
        if right_type != RegisterType::U64 {
            convert_register(entry_point, memory_manager, right, right_type, RegisterType::U64)
        } else {
            (right, right_type)
        }
    } else {
        (right, right_type)
    };            
    let formatted_left = if requires_u64 {
        if left_type != RegisterType::U64 {
            convert_register(entry_point, memory_manager, left, left_type, RegisterType::U64)
        } else {
            (left, left_type)
        }
    } else {
        (left, left_type)
    };
    let (result_reg, reg_type) = memory_manager
        .new_register(if requires_u64 { RegisterType::U64 } else { RegisterType::U32 })
        .expect("Failed to allocate register for I32Add result");
    let (formatted_register, formatted_type) = if requires_u64 {
        if reg_type != RegisterType::U64 {
            convert_register(entry_point, memory_manager, result_reg, reg_type, RegisterType::U64)
        } else {
            (result_reg, reg_type)
        }
    } else {
        (result_reg, reg_type)
    };
    entry_point.add_instruction(PTXInstruction::Add {
        data_type: if requires_u64 { ".s64".to_string() } else { ".s32".to_string() },
        destination: memory_manager.format_register(formatted_register, formatted_type),
        operand1: memory_manager.format_register(formatted_left.0, formatted_left.1),
        operand2: memory_manager.format_register(formatted_right.0, formatted_right.1),
    });
    stack.push(formatted_register, formatted_type);
}
