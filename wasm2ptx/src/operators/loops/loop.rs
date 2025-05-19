use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::ir::WasmOperator;
use crate::translator::{get_nested_instructions, translate_ops_into_entry_point};
use crate::label_context::{LabelFrame, LabelKind, LabelContext};
use crate::memory::{MemoryManager};
use crate::stack::Stack;


pub fn handle_loop(
    block_id: usize,
    kernel_info: &crate::kernel_detector::KernelInfo,
    memory_manager:  &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
    ops: &[WasmOperator],        
    param_count: usize,          
    local_count: usize,          
    ptx_module: &mut crate::ptx_module::PTXModule,
    ctx: &mut LabelContext,
    current_idx: usize,
) { 
    let start_label = format!("{}_{}_start", "loop", block_id);
    let end_label = format!("{}_{}_end", "loop", block_id);
    ctx.push(LabelFrame { 
        kind: LabelKind::Loop, 
        start: start_label.clone(), 
        end: end_label.clone(),
    });
    entry_point.add_instruction(PTXInstruction::Label { name: start_label.clone() });
    let (nested, _end_idx) = get_nested_instructions(ops, current_idx + 1);
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
    entry_point.add_instruction(PTXInstruction::Label { name: end_label.clone() });
    ctx.pop();
}