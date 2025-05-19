use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;

pub fn handle_i32_mul(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) { 
    let (right, right_type) = stack.pop().expect("Stack underflow during I32Mul");
    let (left, left_type) = stack.pop().expect("Stack underflow during I32Mul");

    let use_u64 = right_type == RegisterType::U64 || left_type == RegisterType::U64;

    let (right, _right_type) = if use_u64 && right_type != RegisterType::U64 {
        convert_register(entry_point, memory_manager, right, right_type, RegisterType::U64)
    } else if !use_u64 && right_type != RegisterType::U32 {
        convert_register(entry_point, memory_manager, right, right_type, RegisterType::U32)
    } else {
        (right, right_type)
    };

    let (left, _left_type) = if use_u64 && left_type != RegisterType::U64 {
        convert_register(entry_point, memory_manager, left, left_type, RegisterType::U64)
    } else if !use_u64 && left_type != RegisterType::U32 {
        convert_register(entry_point, memory_manager, left, left_type, RegisterType::U32)
    } else {
        (left, left_type)
    };

    let result_type = if use_u64 { RegisterType::U64 } else { RegisterType::U32 };
    let (result_reg, reg_type) = memory_manager
        .new_register(result_type)
        .expect("Failed to allocate register for I32Mul result");
    let formatted_result = memory_manager.format_register(result_reg, reg_type);

    entry_point.add_instruction(PTXInstruction::Mul {
        data_type: if use_u64 { ".lo.s64".to_string() } else { ".lo.s32".to_string() },
        destination: formatted_result.clone(),
        operand1: memory_manager.format_register(left, reg_type),
        operand2: memory_manager.format_register(right, reg_type),
    });
    stack.push(result_reg, reg_type);
}