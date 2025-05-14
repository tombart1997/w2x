use crate::memory::{IndexType, MemoryManager, RegisterType, SpecialRegister};
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
            if let Some(special_register) = memory_manager.get_special_register_by_index(local_index as usize) {
                stack.push(local_index, RegisterType::Special(special_register));
            } else {
                panic!("No special register found for local_index {}", local_index);
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