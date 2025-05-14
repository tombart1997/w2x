use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;


pub fn handle_i32_add(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) { 
    let (right, mut right_type) = stack.pop().expect("Stack underflow during I32Add");
    let (left, mut left_type) = stack.pop().expect("Stack underflow during I32Add");

    let use_u64 = right_type == RegisterType::U64 || left_type == RegisterType::U64;
    let use_signed = right_type.is_signed() || left_type.is_signed();

    // If operand is a special register, move it to a general-purpose register first
    let (right, right_type) = if right_type.is_special() {
        let (tmp_reg, tmp_type) = memory_manager.new_register(RegisterType::U32)
            .expect("Failed to allocate temp register for special right operand");
        let formatted_tmp = memory_manager.format_register(tmp_reg, tmp_type);
        let formatted_special = memory_manager.format_register(right, right_type);
        entry_point.add_instruction(PTXInstruction::Mov {
            data_type: ".u32".to_string(),
            destination: formatted_tmp.clone(),
            source: formatted_special,
        });
        (tmp_reg, RegisterType::U32)
    } else {
        (right, right_type)
    };

    let (left, left_type) = if left_type.is_special() {
        let (tmp_reg, tmp_type) = memory_manager.new_register(RegisterType::U32)
            .expect("Failed to allocate temp register for special left operand");
        let formatted_tmp = memory_manager.format_register(tmp_reg, tmp_type);
        let formatted_special = memory_manager.format_register(left, left_type);
        entry_point.add_instruction(PTXInstruction::Mov {
            data_type: ".u32".to_string(),
            destination: formatted_tmp.clone(),
            source: formatted_special,
        });
        (tmp_reg, RegisterType::U32)
    } else {
        (left, left_type)
    };

    // Handle upcasting if needed
    let (right, right_type) = if use_u64 && right_type != RegisterType::U64 {
        convert_register(entry_point, memory_manager, right, right_type, RegisterType::U64)
    } else if !use_u64 && right_type != RegisterType::U32 {
        convert_register(entry_point, memory_manager, right, right_type, RegisterType::U32)
    } else {
        (right, right_type)
    };

    let (left, left_type) = if use_u64 && left_type != RegisterType::U64 {
        convert_register(entry_point, memory_manager, left, left_type, RegisterType::U64)
    } else if !use_u64 && left_type != RegisterType::U32 {
        convert_register(entry_point, memory_manager, left, left_type, RegisterType::U32)
    } else {
        (left, left_type)
    };

    let result_type = if use_u64 { RegisterType::U64 } else { RegisterType::U32 };
    let (result_reg, reg_type) = memory_manager
        .new_register(result_type)
        .expect("Failed to allocate register for I32Add result");
    let formatted_result = memory_manager.format_register(result_reg, reg_type);

    let data_type = if use_signed {
        if use_u64 { ".s64" } else { ".s32" }
    } else {
        if use_u64 { ".u64" } else { ".u32" }
    };

    entry_point.add_instruction(PTXInstruction::Add {
        data_type: data_type.to_string(),
        destination: formatted_result.clone(),
        operand1: memory_manager.format_register(left, reg_type),
        operand2: memory_manager.format_register(right, reg_type),
    });
    stack.push(result_reg, reg_type);
}