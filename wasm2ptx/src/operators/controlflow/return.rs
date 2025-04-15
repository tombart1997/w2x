use crate::memory::MemoryManager;
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;

pub fn handle_return(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) { 
    while let Some((value, value_type)) = stack.pop() {
        let formatted_value = memory_manager.format_register(value, value_type);
        entry_point.add_instruction(PTXInstruction::Mov {
            data_type: value_type.to_ptx_type().to_string(),
            destination: format!("return_value_{}", value), 
            source: formatted_value,
        });
    }

    entry_point.add_instruction(PTXInstruction::Other("ret;".to_string()));
}