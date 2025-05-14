use crate::memory::{MemoryManager, RegisterType, SpecialRegister, map_local_to_special_register};
use crate::ptx_module::PTXEntryPoint;
use crate::stack::Stack;

pub fn handle_special_register(
    local_index: u32,
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) {
    if let Some((bridge_reg, bridge_type)) =
        memory_manager.get_bridge_register(local_index as usize, RegisterType::U32)
    {
        stack.push(bridge_reg, bridge_type);

        return;
    }


    if let Some(reg) = map_local_to_special_register(local_index) {
        stack.push(reg as u32, RegisterType::Special(reg));
    } else {
        panic!("No special register found for local_index {}", local_index);
    }
}