use crate::ptx_module::{PTXEntryPoint, PTXInstruction};

pub fn handle_br(
    relative_depth: u32,
    entry_point: &mut PTXEntryPoint,
) {
    let label = format!("br_if_label_{}", relative_depth);
    entry_point.add_instruction(PTXInstruction::Bra { target: label });
}