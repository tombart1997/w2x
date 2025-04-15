use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;

pub fn handle_i32_mul(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) { 
    let (right, right_type) = stack.pop().expect("Stack underflow during I32Mul");
    let (left, left_type) = stack.pop().expect("Stack underflow during I32Mul");

    let formatted_right = memory_manager.format_register(right, right_type);
    let formatted_left = memory_manager.format_register(left, left_type);

    if let Some((result_reg, reg_type)) = memory_manager.new_register(RegisterType::U32) {
        let formatted_result = memory_manager.format_register(result_reg, reg_type);
        entry_point.add_instruction(PTXInstruction::Mul {
            data_type: ".lo.s32".to_string(),
            destination: formatted_result.clone(),
            operand1: formatted_left,
            operand2: formatted_right,
        });
        stack.push(result_reg, reg_type);
    }
}