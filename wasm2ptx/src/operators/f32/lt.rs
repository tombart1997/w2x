use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;

/// Handles the WebAssembly F32Lt (floating-point less-than) operator.
/// Pops two values from the stack, compares them as 32-bit floating point values,
/// and pushes the result as a predicate register.
pub fn handle_f32_lt(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) {  
    let (right, right_type) = stack.pop().expect("Stack underflow during F32Lt");
    let (left, left_type) = stack.pop().expect("Stack underflow during F32Lt");
    
    // Ensure both operands are F32
    let (right, _right_type) = if right_type != RegisterType::F32 {
        convert_register(entry_point, memory_manager, right, right_type, RegisterType::F32)
    } else {
        (right, right_type)
    };
    
    let (left, _left_type) = if left_type != RegisterType::F32 {
        convert_register(entry_point, memory_manager, left, left_type, RegisterType::F32)
    } else {
        (left, left_type)
    };

    // For F32, we always use .f32 data type
    let data_type = ".f32".to_string();
    let comparison = ".lt".to_string(); // Less than comparison
    
    if let Some((pred_reg, reg_type)) = memory_manager.new_predicate_register() {
        let formatted_pred_reg = memory_manager.format_register(pred_reg, reg_type);
        entry_point.add_instruction(PTXInstruction::Setp {
            predicate: formatted_pred_reg.clone(),
            data_type,
            operand1: memory_manager.format_register(left, RegisterType::F32),
            operand2: memory_manager.format_register(right, RegisterType::F32),
            comparison,
        });
        stack.push(pred_reg, RegisterType::Predicate);
    } else {
        panic!("Failed to allocate predicate register for F32Lt");
    }
}