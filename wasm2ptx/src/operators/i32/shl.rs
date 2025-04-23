use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;

pub fn handle_i32_shl(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) { 
    let (shift_amount, shift_type) = stack.pop().expect("Stack underflow during I32Shl");
    let (value, value_type) = stack.pop().expect("Stack underflow during I32Shl");
    let (value, value_type) = if value_type != RegisterType::U32 {
        convert_register(entry_point, memory_manager, value, value_type, RegisterType::U32)
    } else {
        (value, value_type)
    };
    let formatted_shift = memory_manager.format_register(shift_amount, shift_type);
    let formatted_value = memory_manager.format_register(value, value_type);


    if let Some((result_reg, reg_type)) = memory_manager.new_register(RegisterType::U32) {
        let formatted_result = memory_manager.format_register(result_reg, reg_type);
        entry_point.add_instruction(PTXInstruction::Other(format!(
            "shl.b32 {}, {}, {};",
            formatted_result, formatted_value, formatted_shift
        )));
        stack.push(result_reg, reg_type);
    } else {
        panic!("Failed to allocate a new register for I32Shl operation");
    }
}