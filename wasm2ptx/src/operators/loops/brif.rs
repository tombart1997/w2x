use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::label_context::{LabelContext, LabelKind};

pub fn handle_br_if(
    relative_depth: u32,
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
    label_ctx: &mut LabelContext,
) {
    let (condition, condition_type) = stack.pop().expect("Stack underflow during BrIf");
    if (relative_depth as usize) >= label_ctx.len() {
        panic!(
            "BrIf: relative_depth {} exceeds label stack depth {}",
            relative_depth,
            label_ctx.label_stack.len()
        );
    }
    let idx = label_ctx.len() - 1 - (relative_depth as usize);
    let frame = &label_ctx.index(idx);
    let target_label = match frame.kind {
        LabelKind::Loop => &frame.start,
        LabelKind::Block => &frame.end,
        LabelKind::If => &frame.end,
    };

    if matches!(condition_type, RegisterType::Predicate) {
        let formatted_condition = memory_manager.format_register(condition, condition_type);
        entry_point.add_instruction(PTXInstruction::Other(format!(
            "@{} bra {};",
            formatted_condition, target_label
        )));
    } else {
        if let Some((pred_reg, reg_type)) = memory_manager.new_predicate_register() {
            let formatted_pred_reg = memory_manager.format_register(pred_reg, reg_type);
            let formatted_condition = memory_manager.format_register(condition, condition_type);

            entry_point.add_instruction(PTXInstruction::Setp {
                predicate: formatted_pred_reg.clone(),
                data_type: condition_type.to_ptx_type().to_string(),
                operand1: formatted_condition,
                operand2: "0".to_string(),
                comparison: ".ne".to_string(),
            });

            entry_point.add_instruction(PTXInstruction::Other(format!(
                "@{} bra {};",
                formatted_pred_reg, target_label
            )));
        } else {
            panic!("Failed to allocate predicate register for BrIf");
        }
    }
}