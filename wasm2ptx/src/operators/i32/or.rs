use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;

pub fn handle_i32_or(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) { 
    let (right, right_type) = stack.pop().expect("Stack underflow during I32Or");
    let (left, left_type) = stack.pop().expect("Stack underflow during I32Or");

    let requires_u64 = right_type.is_64() || left_type.is_64();
    let is_signed = right_type.is_signed() || left_type.is_signed();

    // Convert to appropriate type if needed
    let (right, right_type) = if requires_u64 && !right_type.is_64() {
        let target_type = if right_type.is_signed() { RegisterType::S64 } else { RegisterType::U64 };
        convert_register(entry_point, memory_manager, right, right_type, target_type)
    } else {
        (right, right_type)
    };
    
    let (left, left_type) = if requires_u64 && !left_type.is_64() {
        let target_type = if left_type.is_signed() { RegisterType::S64 } else { RegisterType::U64 };
        convert_register(entry_point, memory_manager, left, left_type, target_type)
    } else {
        (left, left_type)
    };

    let result_type = if requires_u64 {
        if is_signed { RegisterType::S64 } else { RegisterType::U64 }
    } else {
        if is_signed { RegisterType::S32 } else { RegisterType::U32 }
    };
    
    // Determine data type string for PTX instruction
    let data_type = match result_type {
        RegisterType::S64 => ".b64",  // Use .b64 for bitwise operations
        RegisterType::U64 => ".b64",
        RegisterType::S32 => ".b32",  // Use .b32 for bitwise operations
        RegisterType::U32 => ".b32",
        _ => panic!("Unsupported type for bitwise OR"),
    };

    // Allocate result register
    let (result_reg, reg_type) = memory_manager
        .new_register(result_type)
        .expect("Failed to allocate register for I32Or result");

    // Add the bitwise OR instruction
    entry_point.add_instruction(PTXInstruction::Other(format!(
        "or{} {}, {}, {};",
        data_type,
        memory_manager.format_register(result_reg, reg_type),
        memory_manager.format_register(left, left_type),
        memory_manager.format_register(right, right_type)
    )));
    
    // Push result onto stack
    stack.push(result_reg, reg_type);
}