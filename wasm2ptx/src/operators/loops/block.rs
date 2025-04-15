use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::ir::WasmOperator;
use crate::translator::get_nested_instructions;
use crate::translator::translate_to_ptx;

pub fn handle_block(
    block_id: usize,
    kernel_info: &crate::kernel_detector::KernelInfo,
    entry_point: &mut PTXEntryPoint,
    ops: &[WasmOperator],        
    param_count: usize,          
    local_count: usize,          
    ptx_module: &mut crate::ptx_module::PTXModule  
) { 
    let label = format!("block_{}_start", block_id);
    entry_point.add_instruction(PTXInstruction::Label { name: label.clone() });
    
    let nested_instructions = get_nested_instructions(block_id, ops);
    translate_to_ptx(&nested_instructions, kernel_info, param_count, local_count, ptx_module);
}