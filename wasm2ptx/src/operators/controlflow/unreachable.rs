use crate::ptx_module::{PTXEntryPoint, PTXInstruction};

pub fn handle_unreachable(entry_point: &mut PTXEntryPoint) {
    entry_point.add_instruction(PTXInstruction::Trap);
}