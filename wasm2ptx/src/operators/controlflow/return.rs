use crate::memory::{MemoryManager};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;

pub fn handle_return(
    _memory_manager: &mut MemoryManager,
    _stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) {
    entry_point.add_instruction(PTXInstruction::Return {});
}   