use super::ir::WasmOperator;
use super::memory::MemoryManager;
use super::stack::Stack;
use crate::memory::RegisterType;
use crate::ptx_module::PTXModule;
use crate::kernel_detector;
use super::ptx_module::{PTXEntryPoint, PTXParameter, PTXInstruction}; // Add import
use super::memory::IndexType; 


pub fn translate_to_ptx(ops: &[WasmOperator], kernel_info: &kernel_detector::KernelInfo, param_count: usize, local_count:usize, ptx_module: &mut PTXModule) -> PTXEntryPoint {
    let mut stack = Stack::new();
    let mut memory_manager = MemoryManager::new(255); // Use max 255 registers

    // Create the PTX module and entry point
    let mut parameters = Vec::new();
    for i in kernel_info.first_data_param..kernel_info.first_data_param + 4 {
        parameters.push(PTXParameter::new(format!("param{}", i), ".u64".to_string()));
    }
    let mut entry_point = PTXEntryPoint::new(kernel_info.name.clone(), parameters);

    // Add kernel parameter loading instructions
    if kernel_info.is_kernel {
        for i in 9..13 {
            if let Some((result_reg, reg_type)) = memory_manager.assign_parameter_register(RegisterType::U64) {
                let formatted_result = memory_manager.format_register(result_reg, reg_type);
    
                // Use the new PTXInstruction::ParamLoad
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
        
    for op in ops {

        match op {
            /*
                LocalGet 
                    -> 9-12 thread param
                    -> 0-9 local variables 
            
                If thread param -> first move thread param into new register of type u32
                If local variable -> check if register is already assigned, if not assign a new one. 
             */
            WasmOperator::LocalGet { local_index, adjusted_index, reg_type } => {
                println!("TESTING LOCAL GET");
                println!(
                    "LocalGet: local_index: {}, adjusted_index: {}, reg_type: {:?}",
                    local_index, adjusted_index, reg_type
                );
            
                let index_type = if *local_index < kernel_info.first_data_param as u32 {
                    IndexType::SpecialRegister(*local_index as usize)
                } else if *local_index < kernel_info.first_data_param as u32 + 4 {
                    IndexType::KernelParameter((*local_index as u32) as usize)
                } else {
                    IndexType::LocalVariable((*local_index as u32 - 4) as usize)
                };
            
                match index_type {
                    IndexType::SpecialRegister(idx) => {
                        if let Some(special_register) = memory_manager.get_special_register_by_index(idx) {
                            if let Some(ptx_var) = memory_manager.get_special_register_name(special_register) {
                                if let Some((result_reg, reg_type_out)) = memory_manager.new_register(*reg_type) {
                                    let formatted_reg = memory_manager.format_register(result_reg, reg_type_out);
                                    entry_point.add_instruction(PTXInstruction::Mov {
                                        data_type: reg_type.to_ptx_type().to_string(),
                                        destination: formatted_reg.clone(),
                                        source: ptx_var.clone(),
                                    });
                                    stack.push(result_reg, reg_type_out);
                                } else {
                                    panic!("Failed to assign register for special register: {}", idx);
                                }
                            } else {
                                panic!("Invalid special register index: {}", idx);
                            }
                        } 
                    }
                    IndexType::KernelParameter(idx) => {
                        if let Some((param_reg, param_type)) = memory_manager.get_register(IndexType::KernelParameter(idx)) {
                            stack.push(param_reg, param_type);
                        } else {
                            panic!("Local Get Failed to retrieve kernel parameter register for index: {}", idx);
                        }
                    }
                    IndexType::LocalVariable(idx) => {
                        let (raw_reg, reg_type) = if let Some((raw_reg, reg_type)) =
                            memory_manager.get_register(IndexType::LocalVariable(idx))
                        {
                            (raw_reg, reg_type)
                        } else if let Some((raw_reg, reg_type)) = memory_manager.new_register(*reg_type) {
                            (raw_reg, reg_type)
                        } else {
                            panic!("No registers available for LocalGet! Index: {}", idx);
                        };
            
                        entry_point.add_instruction(PTXInstruction::Mov {
                            data_type: reg_type.to_ptx_type().to_string(),
                            destination: memory_manager.format_register(raw_reg, reg_type),
                            source: memory_manager.format_register(raw_reg, reg_type),
                        });
            
                        stack.push(raw_reg, reg_type);
                    }
                }
            }


            WasmOperator::LocalTee { local_index, adjusted_index, reg_type } => {
                println!(
                    "LocalTee: local_index: {}, adjusted_index: {}, reg_type: {:?}",
                    local_index, adjusted_index, reg_type
                );
            
                // Determine the index type
                let index_type = if let Some(special_register) = memory_manager.get_special_register_by_index(*local_index as usize) {
                    IndexType::SpecialRegister(*local_index as usize)
                } else if *local_index >= kernel_info.first_data_param as u32 && *local_index < kernel_info.first_data_param as u32 + 4 {
                    IndexType::KernelParameter((*local_index - kernel_info.first_data_param as u32) as usize)
                } else {
                    IndexType::LocalVariable((*local_index - kernel_info.first_data_param as u32 - 4) as usize)
                };
            
                match index_type {
                    IndexType::SpecialRegister(idx) => {
                        let (value, value_type) = stack.pop().expect("Stack underflow during LocalTee");

                        // Get or create a bridge register for the special register
                        let bridge_reg = memory_manager.get_or_create_bridge_register(idx, *reg_type);
                        println!("Bridge created for special register: {:?} with idx {}", bridge_reg, idx);
            
                        // Write the value to the bridge register
                        entry_point.add_instruction(PTXInstruction::Mov {
                            data_type: reg_type.to_ptx_type().to_string(),
                            destination: memory_manager.format_register(bridge_reg, *reg_type),
                            source: memory_manager.format_register(value, value_type),
                        });
            
                        // Push the value back onto the stack
                        stack.push(value, value_type);
                    }
                    _ => {
                        // Handle other cases (KernelParameter, LocalVariable) as usual
                    }
                    IndexType::KernelParameter(idx) => {
                        println!("Kernel Parameter: {}", idx);
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
                        println!("Local Variable: {}", idx);
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
                            convert_register(&mut entry_point, &mut memory_manager, value, value_type, reg_type)
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

            WasmOperator::LocalSet { local_index, adjusted_index, reg_type } => {
                println!(
                    "LocalSet: local_index: {}, adjusted_index: {}, reg_type: {:?}",
                    local_index, adjusted_index, reg_type
                );
                let index_type = if *local_index < kernel_info.first_data_param as u32 {
                    IndexType::SpecialRegister(*local_index as usize)
                } else if *local_index < kernel_info.first_data_param as u32 + 4 {
                    IndexType::KernelParameter((*local_index - kernel_info.first_data_param as u32) as usize)
                } else {
                    IndexType::LocalVariable((*local_index - kernel_info.first_data_param as u32 - 4) as usize)
                };
            
                let (val, val_type) = stack.pop().expect("Stack underflow during LocalSet");
            
                match index_type {
                    IndexType::SpecialRegister(_) => {
                        panic!("LocalSet is not allowed for special registers! Index: {}", local_index);
                    }
                    IndexType::KernelParameter(idx) => {
                        if let Some((param_reg, param_type)) = memory_manager.get_register(IndexType::KernelParameter(idx)) {
                            let (formatted_val, new_type) = if val_type != param_type {
                                convert_register(&mut entry_point, &mut memory_manager, val, val_type, param_type)
                            } else {
                                (val, val_type)
                            };
            
                            entry_point.add_instruction(PTXInstruction::Mov {
                                data_type: new_type.to_ptx_type().to_string(),
                                destination: memory_manager.format_register(param_reg, param_type),
                                source: memory_manager.format_register(formatted_val, new_type),
                            });
                        } else {
                            panic!("Local Set Failed to retrieve kernel parameter register for index: {}", idx);
                        }
                    }
                    IndexType::LocalVariable(idx) => {
                        let reg = if let Some((raw_reg, reg_type)) =
                            memory_manager.get_register(IndexType::LocalVariable(idx))
                        {
                            memory_manager.format_register(raw_reg, reg_type)
                        } else if let Some((raw_reg, reg_type)) = memory_manager.assign_register(IndexType::LocalVariable(idx), *reg_type) {
                            memory_manager.format_register(raw_reg, reg_type)
                        } else {
                            panic!("No registers available for LocalSet! Index: {}", idx);
                        };
            
                        let (formatted_val, new_type) = if val_type != *reg_type {
                            convert_register(&mut entry_point, &mut memory_manager, val, val_type, *reg_type)
                        } else {
                            (val, val_type)
                        };
            
                        entry_point.add_instruction(PTXInstruction::Mov {
                            data_type: new_type.to_ptx_type().to_string(),
                            destination: reg,
                            source: memory_manager.format_register(formatted_val, new_type),
                        });
                    }
                }
            }

            WasmOperator::I32GeU => {
                let (right, right_type) = stack.pop().expect("Stack underflow during I32GeU");
                let (formatted_right, new_type_right) = if right_type != RegisterType::U32 {
                    convert_register(&mut entry_point, &mut memory_manager, right, right_type, RegisterType::U32)
                } else {
                    (right, right_type)
                };
            
                let (left, left_type) = stack.pop().expect("Stack underflow during I32GeU");
                let (formatted_left, new_type_left) = if left_type != RegisterType::U32 {
                    convert_register(&mut entry_point, &mut memory_manager, left, left_type, RegisterType::U32)
                } else {
                    (left, left_type)
                };            
                // Ensure both operands are of the same type
                if new_type_left != RegisterType::U32 || new_type_right != RegisterType::U32 {
                    panic!(
                        "Type mismatch in I32GeU: left operand is {:?}, right operand is {:?}",
                        new_type_left, new_type_right
                    );
                }
                let formatted_right = if new_type_right != RegisterType::U32 {
                    let (converted_right, _) = convert_register(
                        &mut entry_point,
                        &mut memory_manager,
                        formatted_right,
                        new_type_right,
                        RegisterType::U32,
                    );
                    converted_right
                } else {
                    formatted_right
                };
            
                if let Some((pred_reg, reg_type)) = memory_manager.new_predicate_register() {
                    let formatted_pred_reg = memory_manager.format_register(pred_reg, reg_type);
            
                    // Use the correct data type based on the operand type
                    let data_type = ".u32".to_string(); // Both operands are now 32-bit
                    entry_point.add_instruction(PTXInstruction::Setp {
                        predicate: formatted_pred_reg.clone(),
                        data_type: data_type,
                        operand1: memory_manager.format_register(formatted_left, new_type_left),
                        operand2: memory_manager.format_register(formatted_right, new_type_right),
                        comparison: ".ge".to_string(),
                    });
            
                    stack.push(pred_reg, RegisterType::Predicate);
                } else {
                    panic!("Failed to allocate predicate register for I32GeU");
                }
            }

            WasmOperator::I32Load { offset, reg_type } => {
                let (addr_reg, address_type) = stack.pop().expect("Stack underflow during I32Load (offset)");

                let formatted_addr_reg = memory_manager.format_register(addr_reg, address_type);
                // Allocate a register for the loaded value
                let (loaded_reg, _) = memory_manager
                    .new_register(*reg_type)
                    .expect("Failed to allocate register for loaded value");
                let formatted_loaded_reg = memory_manager.format_register(loaded_reg, *reg_type);
            
                // Perform the load
                entry_point.add_instruction(PTXInstruction::Load {
                    data_type: reg_type.to_ptx_type().to_string(),
                    destination: formatted_loaded_reg.clone(),
                    address: formatted_addr_reg,
                });
            
                // Push the loaded value onto the stack
                stack.push(loaded_reg, *reg_type);
            }

            WasmOperator::I32Store { offset, reg_type } => {
                // Pop the value to store and the address from the stack
                let (value, value_type) = stack.pop().expect("Stack underflow during I32Store (value)");
                let (address, address_type) = stack.pop().expect("Stack underflow during I32Store (address)");
            
                // Convert the value to U32 if necessary
                let formatted_value = if value_type != RegisterType::U32 {
                    convert_register(&mut entry_point, &mut memory_manager, value, value_type, RegisterType::U32)
                } else {
                    (value, value_type)
                };
            
                // Convert the address to U64 if necessary
                let formatted_address = if address_type != RegisterType::U64 {
                    convert_register(&mut entry_point, &mut memory_manager, address, address_type, RegisterType::U64)
                } else {
                    (address, address_type)
                };
            
                // Perform the store operation
                entry_point.add_instruction(PTXInstruction::Store {
                    data_type: reg_type.to_ptx_type().to_string(),
                    address: memory_manager.format_register(formatted_address.0, formatted_address.1),
                    source: memory_manager.format_register(formatted_value.0, formatted_value.1),
                });
            }

            
            WasmOperator::I32Add => {
                let (right, right_type) = stack.pop().expect("Stack underflow during I32Add");
                let (left, left_type) = stack.pop().expect("Stack underflow during I32Add");
            
                // Determine if any of the operands are U64
                let requires_u64 = right_type == RegisterType::U64 || left_type == RegisterType::U64;
                // Convert both operands to U64 if necessary
                let formatted_right = if requires_u64 {
                    if right_type != RegisterType::U64 {
                        convert_register(&mut entry_point, &mut memory_manager, right, right_type, RegisterType::U64)
                    } else {
                        (right, right_type)
                    }
                } else {
                    (right, right_type)
                };
            
                let formatted_left = if requires_u64 {
                    if left_type != RegisterType::U64 {
                        convert_register(&mut entry_point, &mut memory_manager, left, left_type, RegisterType::U64)
                    } else {
                        (left, left_type)
                    }
                } else {
                    (left, left_type)
                };
            
                // Allocate a result register based on the operand types
                let (result_reg, reg_type) = memory_manager
                    .new_register(if requires_u64 { RegisterType::U64 } else { RegisterType::U32 })
                    .expect("Failed to allocate register for I32Add result");
                let (formatted_register, formatted_type) = if requires_u64 {
                    if reg_type != RegisterType::U64 {
                        convert_register(&mut entry_point, &mut memory_manager, result_reg, reg_type, RegisterType::U64)
                    } else {
                        (result_reg, reg_type)
                    }
                } else {
                    (result_reg, reg_type)
                };
                // Perform the addition
                entry_point.add_instruction(PTXInstruction::Add {
                    data_type: if requires_u64 { ".s64".to_string() } else { ".s32".to_string() },
                    destination: memory_manager.format_register(formatted_register, formatted_type),
                    operand1: memory_manager.format_register(formatted_left.0, formatted_left.1),
                    operand2: memory_manager.format_register(formatted_right.0, formatted_right.1),
                });
            
                // Push the result onto the stack
                stack.push(formatted_register, formatted_type);
            }
            


            /* 
                Wasm would create a const value in the stack, but we need to create a register for it.

                if value is < 0 use signed else unsigned
             */
            WasmOperator::I32Const { value, reg_type } => {
                if let Some((result_reg, reg_type)) = memory_manager.new_register(*reg_type) {
                    let formatted_result = memory_manager.format_register(result_reg, reg_type);
                    entry_point.add_instruction(PTXInstruction::Mov {
                        data_type: if value < &0 { ".s32".to_string() } else { ".u32".to_string() },
                        destination: formatted_result.clone(),
                        source: value.to_string(),
                    });
                    stack.push(result_reg, reg_type);
                } else {
                    panic!("Failed to allocate a new register for I32Const operation");
                }
            }

            WasmOperator::I32Mul => {
                let (right, right_type) = stack.pop().expect("Stack underflow during I32Mul");
                let (left, left_type) = stack.pop().expect("Stack underflow during I32Mul");

                let formatted_right = memory_manager.format_register(right, right_type);
                let formatted_left = memory_manager.format_register(left, left_type);

                if let Some((result_reg, reg_type)) = memory_manager.new_register(RegisterType::U32) {
                    let formatted_result = memory_manager.format_register(result_reg, reg_type);
                    entry_point.add_instruction(PTXInstruction::Mul {
                        data_type: ".lo.s32".to_string(),
                        destination: formatted_result.clone(),
                        operand1: formatted_left,
                        operand2: formatted_right,
                    });
                    stack.push(result_reg, reg_type);
                }
            }

            WasmOperator::I32Shl => {
                let (shift_amount, shift_type) = stack.pop().expect("Stack underflow during I32Shl");
                let (value, value_type) = stack.pop().expect("Stack underflow during I32Shl");

                let formatted_shift = memory_manager.format_register(shift_amount, shift_type);
                let formatted_value = memory_manager.format_register(value, value_type);

                if let Some((result_reg, reg_type)) = memory_manager.new_register(RegisterType::U32) {
                    let formatted_result = memory_manager.format_register(result_reg, reg_type);
                    entry_point.add_instruction(PTXInstruction::Other(format!(
                        "shl.b32 {}, {}, {};",
                        formatted_result, formatted_value, formatted_shift
                    )));
                    stack.push(result_reg, reg_type);
                } else {
                    panic!("Failed to allocate a new register for I32Shl operation");
                }
            }

            WasmOperator::BrIf { relative_depth } => {
                println!("BrIf: relative_depth: {}", relative_depth);
                let (condition, condition_type) = stack.pop().expect("Stack underflow during BrIf");
                println!("Condition: {:?} {:?}", condition, condition_type);
                let label = format!("br_if_label_{}", relative_depth);
            
                if matches!(condition_type, RegisterType::Predicate) {
                    let formatted_condition = memory_manager.format_register(condition, condition_type);
                
                    if *relative_depth == 0 {
                        // Negate the predicate
                        if let Some((negated_pred, reg_type)) = memory_manager.new_predicate_register() {
                            let formatted_negated_pred = memory_manager.format_register(negated_pred, reg_type);
                            entry_point.add_instruction(PTXInstruction::Other(format!(
                                "not.pred {}, {};",
                                formatted_negated_pred, formatted_condition
                            )));
                            entry_point.add_instruction(PTXInstruction::Other(format!(
                                "@{} bra {};",
                                formatted_negated_pred, label
                            )));
                        } else {
                            panic!("Failed to allocate predicate register for negation in BrIf");
                        }
                    } else {
                        // Use the predicate as-is
                        entry_point.add_instruction(PTXInstruction::Other(format!(
                            "@{} bra {};",
                            formatted_condition, label
                        )));
                    }
                }else {
                    // Convert the condition to a predicate
                    if let Some((pred_reg, reg_type)) = memory_manager.new_predicate_register() {
                        let formatted_pred_reg = memory_manager.format_register(pred_reg, reg_type);
                        let formatted_condition = memory_manager.format_register(condition, condition_type);
            
                        entry_point.add_instruction(PTXInstruction::Setp {
                            predicate: formatted_pred_reg.clone(),
                            data_type: condition_type.to_ptx_type().to_string(),
                            operand1: "0".to_string(),
                            operand2: formatted_condition,
                            comparison: ".ne".to_string(),
                        });
            
                        if *relative_depth == 0 {
                            // Negate the predicate
                            if let Some((negated_pred, reg_type)) = memory_manager.new_predicate_register() {
                                let formatted_negated_pred = memory_manager.format_register(negated_pred, reg_type);
                                entry_point.add_instruction(PTXInstruction::Setp {
                                    predicate: formatted_negated_pred.clone(),
                                    data_type: ".u32".to_string(),
                                    operand1: "0".to_string(),
                                    operand2: formatted_pred_reg.clone(),
                                    comparison: ".eq".to_string(), // Negation: set predicate if condition is false
                                });
                                entry_point.add_instruction(PTXInstruction::Other(format!(
                                    "@{} bra {};",
                                    formatted_negated_pred, label
                                )));
                            } else {
                                panic!("Failed to allocate predicate register for negation in BrIf");
                            }
                        } else {
                            // Use the predicate as-is
                            entry_point.add_instruction(PTXInstruction::Other(format!(
                                "@{} bra {};",
                                formatted_pred_reg, label
                            )));
                        }
                    } else {
                        panic!("Failed to allocate predicate register for BrIf");
                    }
                }
            
                entry_point.add_instruction(PTXInstruction::Label { name: label });
            }

            WasmOperator::Block { block_id } => {
                let label = format!("block_{}_start", block_id);
                entry_point.add_instruction(PTXInstruction::Label { name: label.clone() });
            }

            WasmOperator::End => {
            }

            WasmOperator::Br { relative_depth } => {
                let label = format!("br_if_label_{}", relative_depth);
                entry_point.add_instruction(PTXInstruction::Bra { target: label });
            }


            WasmOperator::SpecialRegister { reg, reg_type, local_index, adjusted_index } => {
                // Check if a bridge register exists for the special register
                let bridge_reg = memory_manager.get_bridge_register(*local_index as usize);
            
                if let Some(bridge_reg) = bridge_reg {
                    // If a bridge register exists, use it instead of the special register
                    let formatted_bridge_reg = memory_manager.format_register(bridge_reg, RegisterType::U32);
            
                    // Push the bridge register onto the stack
                    stack.push(bridge_reg, RegisterType::U32);
                } else {
                    // If no bridge register exists, create one
                    let new_bridge_reg = memory_manager.get_or_create_bridge_register(*local_index as usize, RegisterType::U32);
            
                    // Format the special register and the new bridge register
                    let formatted_special_reg = memory_manager.get_special_register_name(*reg)
                        .expect("Failed to get special register name");
                    let formatted_bridge_reg = memory_manager.format_register(new_bridge_reg, RegisterType::U32);
            
                    // Add a mov instruction to copy the value from the special register to the bridge register
                    entry_point.add_instruction(PTXInstruction::Mov {
                        data_type: reg_type.to_ptx_type().to_string(),
                        destination: formatted_bridge_reg.clone(),
                        source: formatted_special_reg.clone(),
                    });
            
                    // Push the new bridge register onto the stack
                    stack.push(new_bridge_reg, RegisterType::U32);
                }
            }
            _ => {
                println!("Unhandled operator: {:?}", op);
            }
        }
    }

    let register_declarations = memory_manager.generate_register_declarations();
    for declaration in register_declarations {
        entry_point.add_register_declaration(declaration);
    }
    return entry_point;
}

fn convert_register(
    entry_point: &mut PTXEntryPoint,
    memory_manager: &mut MemoryManager,
    source: u32,
    source_type: RegisterType,
    target_type: RegisterType,
) -> (u32, RegisterType) {
    // If the source and target types are the same, no conversion is needed
    if source_type == target_type {
        return (source, source_type);
    }

    // Handle special registers: return the source directly without conversion
    if let RegisterType::Special(_) = source_type {
        println!(
            "convert_register: Bypassing conversion for special register {:?} to {:?}",
            source_type, target_type
        );
        return (source, source_type);
    }

    // Allocate a new register for the conversion result
    let (result_reg, _) = memory_manager
        .new_register(target_type)
        .expect("Failed to allocate register for conversion");

    // Check if the source register is already in the memory manager  
    // Format the source and result registers
    let formatted_source = memory_manager.format_register(source, source_type);
    let formatted_result = memory_manager.format_register(result_reg, target_type);

    // Generate the appropriate PTX conversion instruction
    let conversion_instruction = match (source_type, target_type) {
        (RegisterType::U32, RegisterType::U64) => PTXInstruction::Other(format!(
            "cvt.u64.u32 {}, {};",
            formatted_result, formatted_source
        )),
        (RegisterType::U64, RegisterType::U32) => PTXInstruction::Other(format!(
            "cvt.u32.u64 {}, {};",
            formatted_result, formatted_source
        )),
        _ => panic!(
            "Unsupported conversion from {:?} to {:?}",
            source_type, target_type
        ),
    };

    // Add the conversion instruction to the entry point
    entry_point.add_instruction(conversion_instruction);
    (result_reg, target_type)
}