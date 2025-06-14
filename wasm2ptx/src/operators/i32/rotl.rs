use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;

pub fn handle_i32_rotl(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) { 
    let (rotation_amount, rotation_type) = stack.pop().expect("Stack underflow during I32Rotl");
    let (value, value_type) = stack.pop().expect("Stack underflow during I32Rotl");

    let use_u64 = value_type.is_64();

    // Always convert rotation amount to U32
    let (rotation_amount, _) = if !rotation_type.is_32() {
        convert_register(entry_point, memory_manager, rotation_amount, rotation_type, rotation_type.get_32_equivalent())
    } else {
        (rotation_amount, rotation_type)
    };

    // Allocate result register
    if let Some((result_reg, result_type)) = memory_manager.new_register(value_type) {
        let formatted_result = memory_manager.format_register(result_reg, result_type);
        let formatted_value = memory_manager.format_register(value, value_type);
        let formatted_rotation = memory_manager.format_register(rotation_amount, RegisterType::U32);
        
        // Use native PTX rotation instruction
        if use_u64 {
            // For 64-bit, might need additional handling or fallback
            entry_point.add_instruction(PTXInstruction::Other(format!(
                "shf.l.wrap.b64 {}, {}, {}, {};",
                formatted_result, formatted_value, formatted_value, formatted_rotation
            )));
        } else {
            // For 32-bit, use the native rotation
            entry_point.add_instruction(PTXInstruction::Other(format!(
                "shf.l.wrap.b32 {}, {}, {}, {};",
                formatted_result, formatted_value, formatted_value, formatted_rotation
            )));
        }
        
        stack.push(result_reg, result_type);
    } else {
        panic!("Failed to allocate a new register for I32Rotl operation");
    }
}