use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;

/// Handles the WebAssembly I32Eq (integer equality) operator.
/// Pops two values from the stack, compares them for equality,
/// and pushes a predicate result.
pub fn handle_i32_eq(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) {
    let (right, right_type) = stack.pop().expect("Stack underflow during I32Eq");
    let (left, left_type) = stack.pop().expect("Stack underflow during I32Eq");
    
    // Determine if we need 64-bit operations
    let use_64bit = right_type.is_64() || left_type.is_64();
    
    // Ensure operands have matching types
    let (right, right_type) = if use_64bit && !right_type.is_64() {
        // Convert to 64-bit if needed
        let target_type = if right_type.is_signed() { RegisterType::S64 } else { RegisterType::U64 };
        convert_register(entry_point, memory_manager, right, right_type, target_type)
    } else if !use_64bit && right_type.is_64() {
        // Convert to 32-bit if needed (unlikely in this code path)
        let target_type = if right_type.is_signed() { RegisterType::S32 } else { RegisterType::U32 };
        convert_register(entry_point, memory_manager, right, right_type, target_type)
    } else {
        (right, right_type)
    };
    
    let (left, left_type) = if use_64bit && !left_type.is_64() {
        // Convert to 64-bit if needed
        let target_type = if left_type.is_signed() { RegisterType::S64 } else { RegisterType::U64 };
        convert_register(entry_point, memory_manager, left, left_type, target_type)
    } else if !use_64bit && left_type.is_64() {
        // Convert to 32-bit if needed (unlikely in this code path)
        let target_type = if left_type.is_signed() { RegisterType::S32 } else { RegisterType::U32 };
        convert_register(entry_point, memory_manager, left, left_type, target_type)
    } else {
        (left, left_type)
    };
    
    // For equality comparisons, signedness doesn't matter for the PTX operation
    let data_type = if use_64bit { ".u64" } else { ".u32" };
    
    if let Some((pred_reg, reg_type)) = memory_manager.new_predicate_register() {
        let formatted_pred_reg = memory_manager.format_register(pred_reg, reg_type);
        entry_point.add_instruction(PTXInstruction::Setp {
            predicate: formatted_pred_reg.clone(),
            data_type: data_type.to_string(),
            operand1: memory_manager.format_register(left, left_type),
            operand2: memory_manager.format_register(right, right_type),
            comparison: ".eq".to_string(),
        });
        stack.push(pred_reg, RegisterType::Predicate);
    } else {
        panic!("Failed to allocate predicate register for I32Eq");
    }
}