use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::ir::WasmOperator;
use crate::translator::get_nested_instructions;
use crate::translator::translate_to_ptx;

pub fn handle_loop(
    block_id: usize,
    kernel_info: &crate::kernel_detector::KernelInfo,
    entry_point: &mut PTXEntryPoint,
    ops: &[WasmOperator],        
    param_count: usize,          
    local_count: usize,          
    ptx_module: &mut crate::ptx_module::PTXModule  
) { 
    let start_label = format!("loop_{}_start", block_id);
    let end_label = format!("loop_{}_end", block_id);
    entry_point.add_instruction(PTXInstruction::Label { name: start_label.clone() });
    let nested_instructions = get_nested_instructions(block_id, ops);
    translate_to_ptx(&nested_instructions, kernel_info, param_count, local_count, ptx_module);
    entry_point.add_instruction(PTXInstruction::Bra { target: start_label });
    entry_point.add_instruction(PTXInstruction::Label { name: end_label });
}