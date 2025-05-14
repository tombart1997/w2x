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
    if let Some((bridge_reg, bridge_type)) = memory_manager.get_bridge_register(local_index as usize, RegisterType::U32) {
        // If found, push it onto the stack
        stack.push(bridge_reg, bridge_type);
    }  else {
        // If not found, create a new bridge register of the desired type
        if let Some((new_bridge_reg, new_bridge_type)) = memory_manager.get_or_create_bridge_register(local_index as usize, RegisterType::U32) {
            let formatted_special_reg = memory_manager.get_special_register_name(*reg)
                .expect("Failed to get special register name");
            let formatted_bridge_reg = memory_manager.format_register(new_bridge_reg, new_bridge_type);
            // Emit a mov or cvt instruction to copy the special register value into the new bridge register
            // PTX special registers are always .u32, so we might need a conversion if the desired type is .u64
            entry_point.add_instruction(PTXInstruction::Mov {
                data_type: reg_type.to_ptx_type().to_string(),
                destination: formatted_bridge_reg.clone(),
                source: formatted_special_reg.clone(),
            });
            println!("Special Register Mov Types: {:?} -> {:?}", formatted_bridge_reg.clone(), formatted_special_reg.clone());
            stack.push(new_bridge_reg, new_bridge_type);
        } else {
            panic!("Failed to get or create bridge register for special index {}", local_index);
        }
    }
}