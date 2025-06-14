use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;

pub fn handle_i32_shru(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) {
    let (shift_amount, shift_type) = stack.pop().expect("Stack underflow during I32Shru (shift amount)");
    let (value, value_type) = stack.pop().expect("Stack underflow during I32Shru (value)");
    let requires_u64 = value_type.is_64();
    
    let (value, value_type) = if requires_u64 && !value_type.is_64() {
        convert_register(entry_point, memory_manager, value, value_type, RegisterType::U64)
    } else {
        (value, value_type)
    };

    // Ensure shift amount is U32
    let (shift_amount, shift_type) = if shift_type != RegisterType::U32 {
        convert_register(entry_point, memory_manager, shift_amount, shift_type, RegisterType::U32)
    } else {
        (shift_amount, shift_type)
    };

    let result_type = if requires_u64 { RegisterType::U64 } else { RegisterType::U32 };
    
    // Determine data type string for PTX
    let data_type = match result_type {
        RegisterType::U64 => ".b64",
        RegisterType::U32 => ".b32",
        _ => panic!("Unsupported type for shift right unsigned"),
    };

    // Allocate result register
    let (result_reg, reg_type) = memory_manager
        .new_register(result_type)
        .expect("Failed to allocate register for I32Shru result");
    entry_point.add_instruction(PTXInstruction::Shru {
        data_type: data_type.to_string(),
        destination: memory_manager.format_register(result_reg, reg_type),
        operand1: memory_manager.format_register(value, value_type),
        operand2: memory_manager.format_register(shift_amount, shift_type),
    });
    
    stack.push(result_reg, reg_type);
}