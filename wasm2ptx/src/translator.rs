use super::ir::WasmOperator;
use super::memory::MemoryManager;
use super::stack::Stack;
use crate::memory::RegisterType;
use crate::ptx_module::PTXModule;
use super::ptx_module::{PTXEntryPoint, PTXParameter, PTXInstruction};
use crate::label_context::{LabelKind, LabelFrame};


 
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

    // Add kernel parameters
    for i in kernel_info.first_data_param..kernel_info.first_data_param + 4 {
        parameters.push(PTXParameter::new(format!("param{}", i), ".u64".to_string()));
    }

    let mut entry_point = PTXEntryPoint::new(kernel_info.name.clone(), parameters);

    // Load kernel parameters into registers
    if kernel_info.is_kernel {
        for i in 9..13 {
            if let Some((result_reg, reg_type)) = memory_manager.assign_parameter_register(RegisterType::U64) {
                let formatted_result = memory_manager.format_register(result_reg, reg_type);
                entry_point.add_instruction(PTXInstruction::ParamLoad {
                    param_index: i as usize,
                    destination: formatted_result.clone(),
                });
                stack.push(result_reg, reg_type);
            } else {
                panic!("Failed to allocate register for kernel parameter param{}", i);
            }
        }
    }
    // Translate each operator
    for op in ops {
        translate_to_ptx_instruction(op, kernel_info, &mut memory_manager, &mut stack, &mut entry_point, ops, param_count, local_count, ptx_module);
    }

    // Add register declarations
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
    ptx_module: &mut PTXModule      
) {
    match op {
        WasmOperator::LocalGet { local_index, reg_type } => {
            crate::operators::local::get::handle_local_get(
                *local_index,
                kernel_info,
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
        WasmOperator::Br { relative_depth } => {
            crate::operators::loops::br::handle_br(
                *relative_depth,
                entry_point,
            );
        }
        WasmOperator::BrIf { relative_depth } => {
            crate::operators::loops::brif::handle_br_if(
                *relative_depth,
                memory_manager,
                stack,
                entry_point,
            );
        }
        WasmOperator::Loop { block_id } => {
            crate::operators::loops::r#loop::handle_loop(
                *block_id,
                kernel_info,
                entry_point,
                ops,               
                param_count,       
                local_count,      
                ptx_module,        
            );
        }
        WasmOperator::Block { block_id } => {
            crate::operators::loops::block::handle_block(
                *block_id,
                kernel_info,
                entry_point,
                ops,               
                param_count,      
                local_count,       
                ptx_module,        
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
    block_id: usize,
    ops: &'a [WasmOperator],
) -> Vec<WasmOperator> { 
    let mut nested_instructions = Vec::new();
    let mut depth = 0;
    let mut inside_target_block = false;

    for op in ops {
        match op {
            WasmOperator::Block { block_id: nested_block_id }
            | WasmOperator::Loop { block_id: nested_block_id } => {
                if *nested_block_id == block_id && depth == 0 {
                    inside_target_block = true;
                }
                if inside_target_block {
                    depth += 1;
                }
            }
            WasmOperator::End => {
                if inside_target_block {
                    depth -= 1;
                    if depth == 0 {
                        inside_target_block = false;
                        break;
                    }
                }
            }
            _ => {
                if inside_target_block {
                    nested_instructions.push(op.clone()); 
                }
            }
        }
    }
    nested_instructions
}