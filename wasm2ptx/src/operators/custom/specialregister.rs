use crate::memory::{MemoryManager, RegisterType, SpecialRegister};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;

pub fn handle_special_register(
    local_index: u32,
    reg: &SpecialRegister,
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
    reg_type: &RegisterType,
) {
    // Always get or create a bridge register as .u32 (PTX special registers are .u32)
    let (bridge_reg, bridge_type) = if let Some((reg, ty)) =
        memory_manager.get_or_create_bridge_register(local_index as usize, RegisterType::U32)
    {
        (reg, ty)
    } else {
        panic!("Failed to get or create bridge register for special index {}", local_index);
    };

    let formatted_special_reg = memory_manager
        .get_special_register_name(*reg)
        .expect("Failed to get special register name");

    let formatted_bridge_reg = memory_manager.format_register(bridge_reg, bridge_type);

    // Emit mov from special register to bridge register (.u32)
    entry_point.add_instruction(PTXInstruction::Mov {
        data_type: ".u32".to_string(),
        destination: formatted_bridge_reg.clone(),
        source: formatted_special_reg.clone(),
    });

    // If the requested type is not .u32, convert
    if *reg_type != RegisterType::U32 && reg_type.is_special() == false {
        let (converted_reg, converted_type) = convert_register(
            entry_point,
            memory_manager,
            bridge_reg,
            RegisterType::U32,
            *reg_type,
        );
        stack.push(converted_reg, converted_type);
    } else {
        stack.push(bridge_reg, bridge_type);
    }
}