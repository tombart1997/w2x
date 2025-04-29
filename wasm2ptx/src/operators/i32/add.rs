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

    // Determine if we need 64-bit and what the result type should be
    let requires_u64 = right_type.is_64() || left_type.is_64();
    let is_signed = right_type.is_signed() || left_type.is_signed();

    // Upcast operands as needed, preserving signedness
    let (right, right_type) = if requires_u64 && !right_type.is_64() {
        let target_type = if right_type.is_signed() { RegisterType::S64 } else { RegisterType::U64 };
        println!("Converting right operand from {:?} to {:?}", right_type, target_type);
        convert_register(entry_point, memory_manager, right, right_type, target_type)
    } else {
        (right, right_type)
    };
    let (left, left_type) = if requires_u64 && !left_type.is_64() {
        let target_type = if left_type.is_signed() { RegisterType::S64 } else { RegisterType::U64 };
        println!("Converting left operand from {:?} to {:?}", left_type, target_type);
        convert_register(entry_point, memory_manager, left, left_type, target_type)
    } else {
        (left, left_type)
    };

    // Choose result type and PTX add type
    let result_type = if requires_u64 {
        if is_signed { RegisterType::S64 } else { RegisterType::U64 }
    } else {
        if is_signed { RegisterType::S32 } else { RegisterType::U32 }
    };
    let data_type = match result_type {
        RegisterType::S64 => ".s64",
        RegisterType::U64 => ".u64",
        RegisterType::S32 => ".s32",
        RegisterType::U32 => ".u32",
        _ => panic!("Unsupported type for add"),
    };

    let (result_reg, reg_type) = memory_manager
        .new_register(result_type)
        .expect("Failed to allocate register for I32Add result");

    entry_point.add_instruction(PTXInstruction::Add {
        data_type: data_type.to_string(),
        destination: memory_manager.format_register(result_reg, reg_type),
        operand1: memory_manager.format_register(left, left_type),
        operand2: memory_manager.format_register(right, right_type),
    });
    stack.push(result_reg, reg_type);
}