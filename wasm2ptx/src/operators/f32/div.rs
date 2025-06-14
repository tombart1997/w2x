use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;

pub fn handle_f32_div(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) { 
    let (right, right_type) = stack.pop().expect("Stack underflow during F32Div");
    let (left, left_type) = stack.pop().expect("Stack underflow during F32Div");

    let use_f64 = right_type == RegisterType::F64 || left_type == RegisterType::F64;

    let (right, _right_type) = if use_f64 && right_type != RegisterType::F64 {
        convert_register(entry_point, memory_manager, right, right_type, RegisterType::F64)
    } else if !use_f64 && right_type != RegisterType::F32 {
        convert_register(entry_point, memory_manager, right, right_type, RegisterType::F32)
    } else {
        (right, right_type)
    };

    let (left, _left_type) = if use_f64 && left_type != RegisterType::F64 {
        convert_register(entry_point, memory_manager, left, left_type, RegisterType::F64)
    } else if !use_f64 && left_type != RegisterType::F32 {
        convert_register(entry_point, memory_manager, left, left_type, RegisterType::F32)
    } else {
        (left, left_type)
    };

    let result_type = if use_f64 { RegisterType::F64 } else { RegisterType::F32 };
    let (result_reg, reg_type) = memory_manager
        .new_register(result_type)
        .expect("Failed to allocate register for F32Div result");
    let formatted_result = memory_manager.format_register(result_reg, reg_type);

    entry_point.add_instruction(PTXInstruction::Div {
        data_type: if use_f64 { ".f64".to_string() } else { ".f32".to_string() },
        modifier: ".rn".to_string(),  // Add rounding modifier (round to nearest even)
        destination: formatted_result.clone(),
        operand1: memory_manager.format_register(left, reg_type),
        operand2: memory_manager.format_register(right, reg_type),
    });
    stack.push(result_reg, reg_type);
}