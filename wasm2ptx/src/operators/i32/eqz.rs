use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;
pub fn handle_i32_eqz(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) {
    let (val, val_type) = stack.pop().expect("Stack underflow during I32Eqz");

    // Ensure the value is in a 32-bit register
    let (val, _val_type) = if val_type != RegisterType::U32 {
        convert_register(entry_point, memory_manager, val, val_type, RegisterType::U32)
    } else {
        (val, val_type)
    };

    if let Some((pred_reg, reg_type)) = memory_manager.new_predicate_register() {
        let formatted_pred_reg = memory_manager.format_register(pred_reg, reg_type);
        let formatted_val = memory_manager.format_register(val, RegisterType::U32);
        entry_point.add_instruction(PTXInstruction::Setp {
            predicate: formatted_pred_reg.clone(),
            data_type: ".u32".to_string(),
            operand1: formatted_val,
            operand2: "0".to_string(),
            comparison: ".eq".to_string(),
        });
        stack.push(pred_reg, RegisterType::Predicate);
    } else {
        panic!("Failed to allocate predicate register for I32Eqz");
    }
}