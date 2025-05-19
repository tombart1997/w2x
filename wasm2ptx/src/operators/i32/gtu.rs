use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;

/// Handles the WebAssembly I32GtU (unsigned greater-than) operator.
/// Pops two values from the stack, compares them as unsigned 32-bit integers,
/// and pushes the result as a predicate register.
pub fn handle_i32_gtu(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) {  
    let (right, right_type) = stack.pop().expect("Stack underflow during I32GtU");
    let (left, left_type) = stack.pop().expect("Stack underflow during I32GtU");
    let use_u64 = right_type.is_64() || left_type.is_64();
    
    let (right, _right_type) = if use_u64 && right_type.is_64() == false {
        convert_register(entry_point, memory_manager, right, right_type, right_type.get_64_equivalent())
    } else if !use_u64 && right_type.is_32() == false {
        convert_register(entry_point, memory_manager, right, right_type, right_type.get_32_equivalent())
    } else {
        (right, right_type)
    };
    
    let (left, _left_type) = if use_u64 && left_type.is_64() == false  {
        convert_register(entry_point, memory_manager, left, left_type, left_type.get_64_equivalent())
    } else if !use_u64 && left_type.is_32() == false {
        convert_register(entry_point, memory_manager, left, left_type, left_type.get_32_equivalent())
    } else {
        (left, left_type)
    };
    let data_type = left_type.to_ptx_type();
    let comparison = ".gt".to_string();
    
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
        panic!("Failed to allocate predicate register for I32Gtu");
    }
}