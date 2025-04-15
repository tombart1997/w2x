use crate::memory::{IndexType, MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;

pub fn handle_local_tee(
    local_index: u32,
    kernel_info: &crate::kernel_detector::KernelInfo,
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point:  &mut PTXEntryPoint,
    reg_type: &RegisterType,
) {            
    // Determine the index type
    let index_type = if let Some(special_register) = memory_manager.get_special_register_by_index(local_index as usize) {
        IndexType::SpecialRegister(local_index as usize)
    } else if local_index >= kernel_info.first_data_param as u32 && local_index < kernel_info.first_data_param as u32 + 4 {
        IndexType::KernelParameter((local_index - kernel_info.first_data_param as u32) as usize)
    } else {
        IndexType::LocalVariable((local_index - kernel_info.first_data_param as u32 - 4) as usize)
    };
    match index_type {
        IndexType::SpecialRegister(idx) => {
            let (value, value_type) = stack.pop().expect("Stack underflow during LocalTee");

            // Get or create a bridge register for the special register
            let bridge_reg = memory_manager.get_or_create_bridge_register(idx, *reg_type);
            // Write the value to the bridge register
            entry_point.add_instruction(PTXInstruction::Mov {
                data_type: reg_type.to_ptx_type().to_string(),
                destination: memory_manager.format_register(bridge_reg, *reg_type),
                source: memory_manager.format_register(value, value_type),
            });
            stack.push(value, value_type);
        }
        _ => {
        }
        IndexType::KernelParameter(idx) => {
            if let Some((param_reg, param_type)) = memory_manager.get_register(IndexType::KernelParameter(idx)) {
                if let Some((new_reg, new_reg_type)) = memory_manager.new_register(*reg_type) {
                    let formatted_param_reg = memory_manager.format_register(param_reg, param_type);
                    let formatted_new_reg = memory_manager.format_register(new_reg, new_reg_type);

                    entry_point.add_instruction(PTXInstruction::Mov {
                        data_type: reg_type.to_ptx_type().to_string(),
                        destination: formatted_new_reg.clone(),
                        source: formatted_param_reg.clone(),
                    });

                    stack.push(new_reg, new_reg_type);
                } else {
                    panic!("Failed to allocate a new register for LocalTee on parameter! Index: {}", local_index);
                }
            } else {
                panic!("Parameter register not found for LocalTee! Index: {}", local_index);
            }
        }
        IndexType::LocalVariable(idx) => {
            let (value, value_type) = stack.pop().expect("Stack underflow during LocalTee");
            let (reg, reg_type) = if let Some((raw_reg, reg_type)) =
                memory_manager.get_register(IndexType::LocalVariable(idx))
            {
                (raw_reg, reg_type)
            } else if let Some((raw_reg, reg_type)) = memory_manager.assign_register(IndexType::LocalVariable(idx), *reg_type) {
                (raw_reg, reg_type)
            } else {
                panic!("No registers available for LocalTee! Index: {}", local_index);
            };

            let (formatted_value, new_type) = if value_type != reg_type {
                convert_register(entry_point, memory_manager, value, value_type, reg_type)
            } else {
                (value, value_type)
            };

            entry_point.add_instruction(PTXInstruction::Mov {
                data_type: new_type.to_ptx_type().to_string(),
                destination: memory_manager.format_register(reg, reg_type),
                source: memory_manager.format_register(formatted_value, new_type),
            });

            stack.push(formatted_value, new_type);
        }
    }
}
