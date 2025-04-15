use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;

pub fn handle_br_if(
    relative_depth: u32,
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) { 
    println!("BrIf: relative_depth: {}", relative_depth);
    let (condition, condition_type) = stack.pop().expect("Stack underflow during BrIf");
    println!("Condition: {:?} {:?}", condition, condition_type);
    let label = format!("br_if_label_{}", relative_depth);

    if matches!(condition_type, RegisterType::Predicate) {
        let formatted_condition = memory_manager.format_register(condition, condition_type);
    
        if relative_depth == 0 {
            if let Some((negated_pred, reg_type)) = memory_manager.new_predicate_register() {
                let formatted_negated_pred = memory_manager.format_register(negated_pred, reg_type);
                entry_point.add_instruction(PTXInstruction::Other(format!(
                    "not.pred {}, {};",
                    formatted_negated_pred, formatted_condition
                )));
                entry_point.add_instruction(PTXInstruction::Other(format!(
                    "@{} bra {};",
                    formatted_negated_pred, label
                )));
            } else {
                panic!("Failed to allocate predicate register for negation in BrIf");
            }
        } else {
            entry_point.add_instruction(PTXInstruction::Other(format!(
                "@{} bra {};",
                formatted_condition, label
            )));
        }
    }else {
        if let Some((pred_reg, reg_type)) = memory_manager.new_predicate_register() {
            let formatted_pred_reg = memory_manager.format_register(pred_reg, reg_type);
            let formatted_condition = memory_manager.format_register(condition, condition_type);

            entry_point.add_instruction(PTXInstruction::Setp {
                predicate: formatted_pred_reg.clone(),
                data_type: condition_type.to_ptx_type().to_string(),
                operand1: "0".to_string(),
                operand2: formatted_condition,
                comparison: ".ne".to_string(),
            });

            if relative_depth == 0 {
                if let Some((negated_pred, reg_type)) = memory_manager.new_predicate_register() {
                    let formatted_negated_pred = memory_manager.format_register(negated_pred, reg_type);
                    entry_point.add_instruction(PTXInstruction::Setp {
                        predicate: formatted_negated_pred.clone(),
                        data_type: ".u32".to_string(),
                        operand1: "0".to_string(),
                        operand2: formatted_pred_reg.clone(),
                        comparison: ".eq".to_string(),
                    });
                    entry_point.add_instruction(PTXInstruction::Other(format!(
                        "@{} bra {};",
                        formatted_negated_pred, label
                    )));
                } else {
                    panic!("Failed to allocate predicate register for negation in BrIf");
                }
            } else {
                entry_point.add_instruction(PTXInstruction::Other(format!(
                    "@{} bra {};",
                    formatted_pred_reg, label
                )));
            }
        } else {
            panic!("Failed to allocate predicate register for BrIf");
        }
    }

    entry_point.add_instruction(PTXInstruction::Label { name: label });
}