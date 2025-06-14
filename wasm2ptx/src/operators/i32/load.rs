use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;
pub fn handle_i32_load(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
    reg_type: &RegisterType,
    alignment: &u8,
    offset: &u64,
) { 
    let (addr_reg, address_type) = stack.pop().expect("Stack underflow during I32Load (offset)");
    let (addr_reg_f, address_type_f) = convert_register(entry_point, memory_manager, addr_reg, address_type, RegisterType::U64);

    let formatted_addr_reg = memory_manager.format_register(addr_reg_f, address_type_f);
    let (loaded_reg, _) = memory_manager
        .new_register(*reg_type)
        .expect("Failed to allocate register for loaded value");
    let formatted_loaded_reg = memory_manager.format_register(loaded_reg, *reg_type);
    entry_point.add_instruction(PTXInstruction::Load {
        data_type: reg_type.to_ptx_type().to_string(),
        destination: formatted_loaded_reg.clone(),
        address: formatted_addr_reg,
    });
    stack.push(loaded_reg, *reg_type);
}