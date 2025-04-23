use crate::memory::{IndexType, MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;


pub fn handle_local_get(
    local_index: u32,
    kernel_info: &crate::kernel_detector::KernelInfo,
    param_count: usize,
    local_count: usize,
    memory_manager:  &mut MemoryManager,
    stack: &mut Stack,
    entry_point:  &mut PTXEntryPoint,
    reg_type: &RegisterType,
) {
    let index_type = 
    if local_index < kernel_info.first_data_param as u32 {
        IndexType::SpecialRegister(local_index as usize)
    } else if local_index < param_count as u32 {
        IndexType::KernelParameter((local_index) as usize)
    } else {
        IndexType::LocalVariable((local_index) as usize)
    };


    match index_type {
        IndexType::SpecialRegister(idx) => {
            if let Some(special_register) = memory_manager.get_special_register_by_index(idx) {
                if let Some(ptx_var) = memory_manager.get_special_register_name(special_register) {
                    if let Some((result_reg, reg_type_out)) = memory_manager.new_register(RegisterType::U32) {
                        let formatted_reg = memory_manager.format_register(result_reg, reg_type_out);
                        entry_point.add_instruction(PTXInstruction::Mov {
                            data_type: ".u32".to_string(),
                            destination: formatted_reg.clone(),
                            source: ptx_var.clone(),
                        });
                        stack.push(result_reg, reg_type_out);
                    }
                }
            }
        }
        IndexType::KernelParameter(idx) => {
            if let Some((param_reg, param_type)) = memory_manager.get_register(IndexType::KernelParameter(idx)) {
                stack.push(param_reg, param_type);
            }
        }
        IndexType::LocalVariable(idx) => {
            let (raw_reg, reg_type) = if let Some((raw_reg, reg_type)) =
                memory_manager.get_register(IndexType::LocalVariable(idx))
            {
                (raw_reg, reg_type)
            } else if let Some((raw_reg, reg_type)) = memory_manager.assign_register(IndexType::LocalVariable(idx), *reg_type) {
                (raw_reg, reg_type)
            } else {
                panic!("No registers available for LocalGet! Index: {}", idx);
            };
        
            stack.push(raw_reg, reg_type);
        }
    }
}