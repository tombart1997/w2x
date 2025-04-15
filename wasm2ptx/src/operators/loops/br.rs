use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::label_context::{LabelContext, LabelKind, LabelFrame};

pub fn handle_br(
    relative_depth: u32,
    entry_point: &mut PTXEntryPoint,
    label_ctx: &LabelContext,
) {
    if (relative_depth as usize) >= label_ctx.len() {
        panic!(
            "Br: relative_depth {} exceeds label stack depth {}",
            relative_depth,
            label_ctx.label_stack.len()
        );
    }
    let idx = label_ctx.len() - 1 - (relative_depth as usize);
    let frame = &label_ctx.index(idx);
    let target_label = match frame.kind {
        LabelKind::Loop => &frame.start,
        LabelKind::Block => &frame.end,
        LabelKind::If => panic!("Br: `If` label kind is not supported in this context"),
    };
    entry_point.add_instruction(PTXInstruction::Bra { target: target_label.clone() });
}