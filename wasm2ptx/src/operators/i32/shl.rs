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

    let use_u64 = value_type == RegisterType::U64;

    // Upcast value to U64 if needed
    let (value, value_type) = if use_u64 && value_type != RegisterType::U64 {
        convert_register(entry_point, memory_manager, value, value_type, RegisterType::U64)
    } else if !use_u64 && value_type != RegisterType::U32 {
        convert_register(entry_point, memory_manager, value, value_type, RegisterType::U32)
    } else {
        (value, value_type)
    };

    // Always convert shift amount to U32
    let (shift_amount, _) = if shift_type != RegisterType::U32 {
        convert_register(entry_point, memory_manager, shift_amount, shift_type, RegisterType::U32)
    } else {
        (shift_amount, shift_type)
    };

    let result_type = if use_u64 { RegisterType::U64 } else { RegisterType::U32 };
    let shl_instr = if use_u64 { "shl.b64" } else { "shl.b32" };

    if let Some((result_reg, reg_type)) = memory_manager.new_register(result_type) {
        let formatted_result = memory_manager.format_register(result_reg, reg_type);
        let formatted_value = memory_manager.format_register(value, value_type);
        let formatted_shift = memory_manager.format_register(shift_amount, RegisterType::U32);
        entry_point.add_instruction(PTXInstruction::Other(format!(
            "{} {}, {}, {};",
            shl_instr, formatted_result, formatted_value, formatted_shift
        )));
        stack.push(result_reg, reg_type);
    } else {
        panic!("Failed to allocate a new register for I32Shl operation");
    }
}