use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;

pub fn handle_f32_add(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) { 
    let (right, right_type) = stack.pop().expect("Stack underflow during F32Add");
    let (left, left_type) = stack.pop().expect("Stack underflow during F32Add");

    // Determine if we need to use 64-bit floats
    let use_f64 = right_type == RegisterType::F64 || left_type == RegisterType::F64;

    // Convert operands to appropriate floating-point type if needed
    let (right, right_type) = if use_f64 && right_type != RegisterType::F64 {
        convert_register(entry_point, memory_manager, right, right_type, RegisterType::F64)
    } else if !use_f64 && right_type != RegisterType::F32 {
        convert_register(entry_point, memory_manager, right, right_type, RegisterType::F32)
    } else {
        (right, right_type)
    };
    
    let (left, left_type) = if use_f64 && left_type != RegisterType::F64 {
        convert_register(entry_point, memory_manager, left, left_type, RegisterType::F64)
    } else if !use_f64 && left_type != RegisterType::F32 {
        convert_register(entry_point, memory_manager, left, left_type, RegisterType::F32)
    } else {
        (left, left_type)
    };

    // Set appropriate result type
    let result_type = if use_f64 { RegisterType::F64 } else { RegisterType::F32 };
    let data_type = if use_f64 { ".f64" } else { ".f32" };

    // Allocate result register
    let (result_reg, reg_type) = memory_manager
        .new_register(result_type)
        .expect("Failed to allocate register for F32Add result");

    // Add floating-point addition instruction
    entry_point.add_instruction(PTXInstruction::Add {
        data_type: data_type.to_string(),
        destination: memory_manager.format_register(result_reg, reg_type),
        operand1: memory_manager.format_register(left, left_type),
        operand2: memory_manager.format_register(right, right_type),
    });
    
    stack.push(result_reg, reg_type);
}