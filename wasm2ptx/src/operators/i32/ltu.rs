use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;

/// Handles the WebAssembly I32LtU (unsigned less-than) operator.
/// Pops two values from the stack, compares them as unsigned 32-bit integers,
/// and pushes the result as a predicate register.
pub fn handle_i32_ltu(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) {  
    let (right, right_type) = stack.pop().expect("Stack underflow during I32LtU");
    let (left, left_type) = stack.pop().expect("Stack underflow during I32LtU");
    
    let use_u64 = right_type == RegisterType::U64 || left_type == RegisterType::U64;
    
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
    
    let data_type = if use_u64 { ".u64" } else { ".u32" };
    let comparison = ".lt".to_string();
    
    if let Some((pred_reg, reg_type)) = memory_manager.new_predicate_register() {
        let formatted_pred_reg = memory_manager.format_register(pred_reg, reg_type);
        entry_point.add_instruction(PTXInstruction::Setp {
            predicate: formatted_pred_reg.clone(),
            data_type: data_type.to_string(),
            operand1: memory_manager.format_register(left, if use_u64 { RegisterType::U64 } else { RegisterType::U32 }),
            operand2: memory_manager.format_register(right, if use_u64 { RegisterType::U64 } else { RegisterType::U32 }),
            comparison,
        });
        stack.push(pred_reg, RegisterType::Predicate);
    } else {
        panic!("Failed to allocate predicate register for I32Ltu");
    }
}