use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;

pub fn handle_i32_store(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
    reg_type: &RegisterType,
) { 
    let (value, value_type) = stack.pop().expect("Stack underflow during I32Store (value)");
    let (address, address_type) = stack.pop().expect("Stack underflow during I32Store (address)");
    // Upcast value to reg_type if needed (never downcast)
    let formatted_value = if value_type != *reg_type {
        convert_register(entry_point, memory_manager, value, value_type, *reg_type)
    } else {
        (value, value_type)
    };
    // Always upcast address to U64
    let formatted_address = if address_type != RegisterType::U64 {
        convert_register(entry_point, memory_manager, address, address_type, RegisterType::U64)
    } else {
        (address, address_type)
    };
    // Perform the store operation
    entry_point.add_instruction(PTXInstruction::Store {
        data_type: reg_type.to_ptx_type().to_string(),
        address: memory_manager.format_register(formatted_address.0, formatted_address.1),
        source: memory_manager.format_register(formatted_value.0, formatted_value.1),
    });
}