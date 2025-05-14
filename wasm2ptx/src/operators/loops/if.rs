use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::ir::WasmOperator;
use crate::translator::{get_nested_instructions, translate_to_ptx, translate_ops_into_entry_point};
use crate::label_context::{LabelFrame, LabelKind, LabelContext};
use crate::memory::{IndexType, MemoryManager, RegisterType};
use crate::stack::Stack;


pub fn handle_if(
    block_id: usize,
    kernel_info: &crate::kernel_detector::KernelInfo,
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
    ops: &[WasmOperator],        
    param_count: usize,          
    local_count: usize,          
    ptx_module: &mut crate::ptx_module::PTXModule,
    ctx: &mut LabelContext,
    current_idx: usize,
) { 
    // Pop the condition from the stack
    let (condition_reg, condition_type) = stack.pop()
        .expect("Stack underflow in if operator");
    
    let start_label = format!("{}_{}_start", "if", block_id);
    let else_label = format!("{}_{}_else", "if", block_id);
    let end_label = format!("{}_{}_end", "if", block_id);
    
    ctx.push(LabelFrame { 
        kind: LabelKind::If, 
        start: start_label.clone(), 
        end: end_label.clone(),
    });
    
    // Create a predicate if condition is not already one
    let predicate = if condition_type == RegisterType::Predicate {
        memory_manager.format_register(condition_reg, condition_type)
    } else {
        // Compare non-predicate to zero to get a predicate
        let (pred_reg, pred_type) = memory_manager.new_predicate_register()
            .expect("Failed to allocate predicate register");
        let formatted_pred = memory_manager.format_register(pred_reg, pred_type);
        let formatted_cond = memory_manager.format_register(condition_reg, condition_type);
        
        // Create a comparison instruction (val != 0)
        entry_point.add_instruction(PTXInstruction::Setp {
            predicate: formatted_pred.clone(),
            data_type: condition_type.to_ptx_type().to_string(),
            operand1: formatted_cond,
            operand2: "0".to_string(),
            comparison: ".ne".to_string(),
        });
        
        formatted_pred
    };

    // Conditional branch - skip the "if" body if predicate is false
    entry_point.add_instruction(PTXInstruction::Other(format!(
        "@!{} bra {};",
        predicate, end_label
    )));
    
    // "If" body starts here
    entry_point.add_instruction(PTXInstruction::Label { name: start_label.clone() });
    
    let (nested, end_idx) = get_nested_instructions(ops, current_idx + 1);
    translate_ops_into_entry_point(
        &nested,
        kernel_info,
        memory_manager,
        stack,
        entry_point,
        param_count,
        local_count,
        ptx_module,
        ctx,
    );
    
    // End of "if" block
    entry_point.add_instruction(PTXInstruction::Label { name: end_label.clone() });
    ctx.pop();
}