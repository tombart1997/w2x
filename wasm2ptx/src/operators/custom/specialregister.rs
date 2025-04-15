use crate::memory::{MemoryManager, RegisterType, SpecialRegister};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;

pub fn handle_special_register(
    local_index : u32,
    reg: &SpecialRegister,
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
    reg_type: &RegisterType,
) { 
    let bridge_reg = memory_manager.get_bridge_register(local_index as usize);
    if let Some(bridge_reg) = bridge_reg {
        let formatted_bridge_reg = memory_manager.format_register(bridge_reg, RegisterType::U32);
        stack.push(bridge_reg, RegisterType::U32);
    } else {
        let new_bridge_reg = memory_manager.get_or_create_bridge_register(local_index as usize, RegisterType::U32);
        let formatted_special_reg = memory_manager.get_special_register_name(*reg)
            .expect("Failed to get special register name");
        let formatted_bridge_reg = memory_manager.format_register(new_bridge_reg, RegisterType::U32);
        entry_point.add_instruction(PTXInstruction::Mov {
            data_type: reg_type.to_ptx_type().to_string(),
            destination: formatted_bridge_reg.clone(),
            source: formatted_special_reg.clone(),
        });
        stack.push(new_bridge_reg, RegisterType::U32);
    }
}