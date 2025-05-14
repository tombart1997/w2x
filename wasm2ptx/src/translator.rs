use super::ir::WasmOperator;
use super::memory::MemoryManager;
use super::stack::Stack;
use crate::memory::RegisterType;
use crate::operators::local;
use crate::ptx_module::PTXModule;
use super::ptx_module::{PTXEntryPoint, PTXParameter, PTXInstruction};
use super::label_context::{LabelContext, LabelKind, LabelFrame};


 
pub fn translate_to_ptx(
    ops: &[WasmOperator],
    kernel_info: &crate::kernel_detector::KernelInfo,
    param_count: usize,
    local_count: usize,
    ptx_module: &mut PTXModule,
) -> PTXEntryPoint {
    let mut stack = Stack::new();
    let mut memory_manager = MemoryManager::new(255);
    let mut parameters = Vec::new();
    let mut label_ctx = LabelContext::new();
    for i in kernel_info.first_data_param..(param_count) {
        parameters.push(PTXParameter::new(format!("param{}", i), ".u64".to_string()));
    }

    let mut entry_point = PTXEntryPoint::new(kernel_info.name.clone(), parameters);
    let func_start = format!("{}_start", kernel_info.name);
    let func_end = format!("{}_end", kernel_info.name);
    label_ctx.push(LabelFrame {
        kind: LabelKind::Block,
        start: func_start.clone(),
        end: func_end.clone(),
    });
    entry_point.add_instruction(PTXInstruction::Label { name: func_start });
    if kernel_info.is_kernel {
        for i in kernel_info.first_data_param..(param_count) {
            if let Some((result_reg, reg_type)) = memory_manager.assign_parameter_register(  i, RegisterType::U64) {
                let formatted_result = memory_manager.format_register(i as u32, reg_type);
                entry_point.add_instruction(PTXInstruction::ParamLoad {
                    param_index:  i as usize,
                    destination: formatted_result.clone(),
                });
                //stack.push(result_reg, reg_type);
            } else {
                panic!("Failed to allocate register for kernel parameter param{}", i);
            }
        }
    }
    let mut idx = 0;
    while idx < ops.len() {
        let op = &ops[idx];
        match op {
            WasmOperator::Block { .. }
            | WasmOperator::Loop { .. }
            | WasmOperator::If { .. } => {
                let (_, end_idx) = get_nested_instructions(ops, idx + 1);
                translate_to_ptx_instruction(
                    op,
                    kernel_info,
                    &mut memory_manager,
                    &mut stack,
                    &mut entry_point,
                    ops,
                    param_count,
                    local_count,
                    ptx_module,
                    &mut label_ctx,
                    idx,
                );
                idx = end_idx + 1;
            }
            _ => {
                translate_to_ptx_instruction(
                    op,
                    kernel_info,
                    &mut memory_manager,
                    &mut stack,
                    &mut entry_point,
                    ops,
                    param_count,
                    local_count,
                    ptx_module,
                    &mut label_ctx,
                    idx,
                );
                idx += 1;
            }
        }
    }
    entry_point.add_instruction(PTXInstruction::Label { name: func_end });
    label_ctx.pop();
    let register_declarations = memory_manager.generate_register_declarations();
    for declaration in register_declarations {
        entry_point.add_register_declaration(declaration);
    }
    entry_point
}


fn translate_to_ptx_instruction(
    op: &WasmOperator,
    kernel_info: &crate::kernel_detector::KernelInfo,
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
    ops: &[WasmOperator],           
    param_count: usize,              
    local_count: usize,      
    ptx_module: &mut PTXModule,
    label_ctx: &mut LabelContext,
    current_idx: usize,
) {
    match op {
        WasmOperator::LocalGet { local_index, reg_type } => {
            crate::operators::local::get::handle_local_get(
                *local_index,
                kernel_info,
                param_count,
                local_count,
                memory_manager,
                stack,
                entry_point,
                reg_type,
            );
        }
        WasmOperator::LocalSet { local_index, reg_type } => {
            crate::operators::local::set::handle_local_set(
                *local_index,
                kernel_info,
                param_count,
                local_count,
                memory_manager,
                stack,
                entry_point,
                reg_type,
            );
        }
        WasmOperator::LocalTee { local_index, reg_type } => {
            crate::operators::local::tee::handle_local_tee(
                *local_index,
                kernel_info,
                param_count,
                local_count,
                memory_manager,
                stack,
                entry_point,
                reg_type,
            );
        }
        WasmOperator::I32Add => {
            crate::operators::i32::add::handle_i32_add(
                memory_manager,
                stack,
                entry_point,
            );
        }
        WasmOperator::I32Mul => {
            crate::operators::i32::mul::handle_i32_mul(
                memory_manager,
                stack,
                entry_point,
            );
        }
        WasmOperator::I32GeU => {
            crate::operators::i32::geu::handle_i32_geu(
                memory_manager,
                stack,
                entry_point,
            );
        }
        WasmOperator::I32Const { value, reg_type } => {
            crate::operators::i32::r#const::handle_i32_const(
                memory_manager,
                stack,
                entry_point,
                value,
                reg_type,
            );
        }
        WasmOperator::I32Shl => {
            crate::operators::i32::shl::handle_i32_shl(
                memory_manager,
                stack,
                entry_point,
            );
        }
        WasmOperator::I32Load { reg_type } => {
            crate::operators::i32::load::handle_i32_load(
                memory_manager,
                stack,
                entry_point,
                reg_type,
            );
        }
        WasmOperator::I32Store { reg_type } => {
            crate::operators::i32::store::handle_i32_store(
                memory_manager,
                stack,
                entry_point,
                reg_type,
            );
        }
        WasmOperator::I32LtU => {
            crate::operators::i32::ltu::handle_i32_ltu(
                memory_manager,
                stack,
                entry_point,
            );
        }
        WasmOperator::I32Sub => {
            crate::operators::i32::sub::handle_i32_sub(
                memory_manager,
                stack,
                entry_point,
            );
        }
        WasmOperator::I32GtU => {
            crate::operators::i32::gtu::handle_i32_gtu(
                memory_manager,
                stack,
                entry_point,
            );
        }
        WasmOperator::I32Eqz => {
            crate::operators::i32::eqz::handle_i32_eqz(
                memory_manager,
                stack,
                entry_point,
            );
        }
        WasmOperator::Unreachable => {
            crate::operators::controlflow::unreachable::handle_unreachable(
                entry_point,
            );
        }
        WasmOperator::Br { relative_depth } => {
            crate::operators::loops::br::handle_br(
                *relative_depth,
                entry_point,
                label_ctx,
            );
        }
        WasmOperator::BrIf { relative_depth } => {
            crate::operators::loops::brif::handle_br_if(
                *relative_depth,
                memory_manager,
                stack,
                entry_point,
                label_ctx,
            );
        }
        WasmOperator::Loop { block_id } => {
            crate::operators::loops::r#loop::handle_loop(
                *block_id,
                kernel_info,
                memory_manager,
                stack,
                entry_point,
                ops,               
                param_count,       
                local_count,      
                ptx_module,      
                label_ctx,  
                current_idx,
            );
        }
        WasmOperator::Block { block_id } => {
            crate::operators::loops::block::handle_block(
                *block_id,
                kernel_info,
                memory_manager,
                stack,
                entry_point,
                ops,               
                param_count,       
                local_count,      
                ptx_module,      
                label_ctx,  
                current_idx,
            );
        }
        WasmOperator::If { block_id } => {
            crate::operators::loops::r#if::handle_if(
                *block_id,
                kernel_info,
                memory_manager,
                stack,
                entry_point,
                ops,               
                param_count,       
                local_count,      
                ptx_module,      
                label_ctx,  
                current_idx,
            );
        }
        WasmOperator::SpecialRegister { reg, reg_type, local_index } => {
            crate::operators::custom::specialregister::handle_special_register(
                *local_index,
                reg,
                memory_manager,
                stack,
                entry_point,
                reg_type,
            );
        }
        WasmOperator::Return => {
            crate::operators::controlflow::r#return::handle_return(
                memory_manager,
                stack,
                entry_point,
            );
        }
        WasmOperator::End => {
            crate::operators::controlflow::end::handle_end(
            );
        }

        _ => {
            println!("Unhandled operator: {:?}", op);
        }
    }
}


pub fn get_nested_instructions<'a>(
    ops: &'a [WasmOperator],
    start_idx: usize,
) -> (Vec<WasmOperator>, usize) {
    let mut nested_instructions = Vec::new();
    let mut depth = 1; 
    let mut idx = start_idx;
    while idx < ops.len() {
        match &ops[idx] {
            WasmOperator::Block { .. }
            | WasmOperator::Loop { .. }
            | WasmOperator::If { .. } => {
                depth += 1;
            }
            WasmOperator::End => {
                depth -= 1;
                if depth == 0 {
                    return (nested_instructions, idx);
                }
            }
            _ => {}
        }
        if depth > 0 {
            nested_instructions.push(ops[idx].clone());
        }
        idx += 1;
    }
    (nested_instructions, idx)
}

pub fn translate_ops_into_entry_point(
    ops: &[WasmOperator],
    kernel_info: &crate::kernel_detector::KernelInfo,
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
    param_count: usize,
    local_count: usize,
    ptx_module: &mut PTXModule,
    label_ctx: &mut LabelContext,
) {
    let mut idx = 0;
    while idx < ops.len() {
        let op = &ops[idx];
        match op {
            WasmOperator::Block { .. }
            | WasmOperator::Loop { .. }
            | WasmOperator::If { .. } => {
                let (_, end_idx) = get_nested_instructions(ops, idx + 1);
                translate_to_ptx_instruction(
                    op,
                    kernel_info,
                    memory_manager,
                    stack,
                    entry_point,
                    ops,
                    param_count,
                    local_count,
                    ptx_module,
                    label_ctx,
                    idx,
                );
                idx = end_idx + 1;
            }
            _ => {
                translate_to_ptx_instruction(
                    op,
                    kernel_info,
                    memory_manager,
                    stack,
                    entry_point,
                    ops,
                    param_count,
                    local_count,
                    ptx_module,
                    label_ctx,
                    idx,
                );
                idx += 1;
            }
        }
    }
}