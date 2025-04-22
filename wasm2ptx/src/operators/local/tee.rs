use core::convert;

use crate::memory::{IndexType, MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;
pub fn handle_local_tee(
    local_index: u32,
    kernel_info: &crate::kernel_detector::KernelInfo,
    param_count: usize,
    _local_count: usize,
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
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

    let (val, val_type) = stack.pop().expect("Stack underflow during LocalTee");

    match index_type {
        IndexType::SpecialRegister(idx) => {
            let bridge_reg = memory_manager.get_or_create_bridge_register(idx, *reg_type);
            let (converted_val, converted_type) = if val_type != *reg_type {
                convert_register(entry_point, memory_manager, val, val_type, *reg_type)
            } else {
                (val, val_type)
            };
            entry_point.add_instruction(PTXInstruction::Mov {
                data_type: reg_type.to_ptx_type().to_string(),
                destination: memory_manager.format_register(bridge_reg, *reg_type),
                source: memory_manager.format_register(converted_val, converted_type),
            });
            stack.push(converted_val, converted_type);
        }
        IndexType::KernelParameter(idx) => {
            if let Some((param_reg, param_type)) = memory_manager.get_register(IndexType::KernelParameter(idx)) {
                let (converted_val, converted_type) = if val_type != param_type {
                    convert_register(entry_point, memory_manager, val, val_type, param_type)
                } else {
                    (val, val_type)
                };
                entry_point.add_instruction(PTXInstruction::Mov {
                    data_type: param_type.to_ptx_type().to_string(),
                    destination: memory_manager.format_register(param_reg, param_type),
                    source: memory_manager.format_register(converted_val, converted_type),
                });
                stack.push(converted_val, converted_type);
            } else {
                panic!("LocalTee failed to retrieve kernel parameter register for index: {}", idx);
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
                panic!("No registers available for LocalTee! Index: {}", idx);
            };
            let (converted_val, converted_type) = if val_type != reg_type {
                convert_register(entry_point, memory_manager, val, val_type, reg_type)
            } else {
                (val, val_type)
            };
            entry_point.add_instruction(PTXInstruction::Mov {
                data_type: reg_type.to_ptx_type().to_string(),
                destination: memory_manager.format_register(raw_reg, reg_type),
                source: memory_manager.format_register(converted_val, converted_type),
            });
            stack.push(converted_val, converted_type);
        }
    }
}