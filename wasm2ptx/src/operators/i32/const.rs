use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;

pub fn handle_i32_const(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
    value: &i32,
    reg_type: &RegisterType,
) { 
    let actual_type = if *value < 0 { RegisterType::S32 } else { *reg_type };
    if let Some((result_reg, _)) = memory_manager.new_register(actual_type) {
        let formatted_result = memory_manager.format_register(result_reg, actual_type);
        entry_point.add_instruction(PTXInstruction::Mov {
            data_type: if *value < 0 { ".s32".to_string() } else { ".u32".to_string() },
            destination: formatted_result.clone(),
            source: value.to_string(),
        });
        stack.push(result_reg, actual_type);
    } else {
        panic!("Failed to allocate a new register for I32Const operation");
    }
}