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
    let (right, right_type) = stack.pop().expect("Stack underflow during I32LtU (right)");
    let (left, left_type) = stack.pop().expect("Stack underflow during I32LtU (left)");
    let (right_f, _) = convert_register(entry_point, memory_manager, right, right_type, RegisterType::U32);
    let (left_f, _) = convert_register(entry_point, memory_manager, left, left_type, RegisterType::U32);
    let (pred_reg, pred_type) = memory_manager
        .new_predicate_register()
        .expect("Failed to allocate predicate register for I32LtU");
    let formatted_pred = memory_manager.format_register(pred_reg, pred_type);
    let formatted_left = memory_manager.format_register(left_f, RegisterType::U32);
    let formatted_right = memory_manager.format_register(right_f, RegisterType::U32);
    entry_point.add_instruction(PTXInstruction::Setp {
        predicate: formatted_pred.clone(),
        data_type: ".u32".to_string(),
        operand1: formatted_left,
        operand2: formatted_right,
        comparison: ".lt".to_string(),
    });
    stack.push(pred_reg, RegisterType::Predicate);
}