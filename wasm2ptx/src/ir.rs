use wasmparser::Operator;
use crate::memory::{RegisterType, SpecialRegister};
#[derive(Debug, Clone)]
pub enum WasmOperator {
    SpecialRegister {
        reg: SpecialRegister,
        reg_type: RegisterType,
        local_index: u32,
    },
    LocalGet { 
        local_index: u32, 
        reg_type: RegisterType 
    },
    LocalSet { 
        local_index: u32, 
        reg_type: RegisterType 
    },
    LocalTee { 
        local_index: u32, 
        reg_type: RegisterType 
    },
    I32Add,
    I32And,
    I32Eq,
    I32Eqz,
    I32Ne,
    I32LtU,
    I32Const { value: i32, reg_type: RegisterType },
    I32Sub,
    I32Mul,
    I32GeU,
    I32Shl,
    I32Store { reg_type: RegisterType },
    I32Load { reg_type: RegisterType },
    BrIf { relative_depth: u32 },
    Loop { block_id: usize },
    End,
    Return,
    Block { block_id: usize },
    Br { relative_depth: u32 },
    If { block_id: usize },
}

fn map_local_to_special_register(local_index: u32, is_kernel: bool) -> Option<SpecialRegister> {
    if !is_kernel {
        return None;
    }
    match local_index as usize {
        idx if idx == 0 => Some(SpecialRegister::ThreadIdX),
        idx if idx == 1 => Some(SpecialRegister::ThreadIdY),
        idx if idx == 2 => Some(SpecialRegister::ThreadIdZ),
        idx if idx == 3 => Some(SpecialRegister::BlockIdX),
        idx if idx == 4 => Some(SpecialRegister::BlockIdY),
        idx if idx == 5 => Some(SpecialRegister::BlockIdZ),
        idx if idx == 6 => Some(SpecialRegister::BlockDimX),
        idx if idx == 7 => Some(SpecialRegister::BlockDimY),
        idx if idx == 8 => Some(SpecialRegister::BlockDimZ),
        _ => None,
    }
}

/// **Convert a `wasmparser::Operator` into `WasmOperator` while preserving register types.**
pub fn convert_wasm_operator(op: &Operator, all_variables: &[wasmparser::ValType], first_data_param: usize, is_kernel: bool) -> WasmOperator {
    match op {
        Operator::LocalGet { local_index } => {
            let local_index = *local_index;
            let reg_type = get_variable_type(local_index, all_variables);
        
            if is_kernel {
                if let Some(special_reg) = map_local_to_special_register(local_index, is_kernel) {
                    return WasmOperator::SpecialRegister {
                        local_index: local_index,
                        reg: special_reg,
                        reg_type: RegisterType::Special(special_reg),
                    };
                }
            }
            WasmOperator::LocalGet {
                local_index,
                reg_type,
            }
        }
        Operator::LocalSet { local_index } => WasmOperator::LocalSet {
            local_index: *local_index,
            reg_type: get_variable_type(*local_index, all_variables)
        },
        
        Operator::LocalTee { local_index } => WasmOperator::LocalTee {
            local_index: *local_index,
            reg_type: get_variable_type(*local_index, all_variables)
        },
        // Integer Operations
        Operator::I32Const { value } => WasmOperator::I32Const { 
            value: *value, 
            reg_type: RegisterType::U32 
        },
        Operator::I32And => WasmOperator::I32And,
        Operator::I32Eq => WasmOperator::I32Eq,
        Operator::I32Eqz => WasmOperator::I32Eqz,
        Operator::I32Add => WasmOperator::I32Add,
        Operator::I32Sub => WasmOperator::I32Sub,
        Operator::I32Mul => WasmOperator::I32Mul,
        Operator::I32LtU => WasmOperator::I32LtU,
        Operator::I32GeU => WasmOperator::I32GeU,
        Operator::I32Shl => WasmOperator::I32Shl,
        Operator::I32Ne => WasmOperator::I32Ne,   
        Operator::I32Store { memarg: _ } => WasmOperator::I32Store { 
            reg_type: RegisterType::U32 
        },
        Operator::I32Load { memarg: _ } => WasmOperator::I32Load { 
            reg_type: RegisterType::U32 
        },
        // Control Flow
        Operator::BrIf { relative_depth } => WasmOperator::BrIf { relative_depth: *relative_depth },
        Operator::Loop { .. } => WasmOperator::Loop { block_id: 0 },
        Operator::End => WasmOperator::End,
        // Block Handling
        Operator::Return => WasmOperator::Return,
        Operator::Block { .. } => {
            static mut BLOCK_COUNTER: usize = 0;
            unsafe {
                BLOCK_COUNTER += 1;
                WasmOperator::Block { block_id: BLOCK_COUNTER }
            }
        },
        Operator::Br { relative_depth } => WasmOperator::Br { relative_depth: *relative_depth },
        _ => unimplemented!("Unhandled operator conversion: {:?}", op),
    }
}


/// **Determines the correct PTX register type based on the WebAssembly function's local variables.**
pub fn get_variable_type(local_index: u32, all_variables: &[wasmparser::ValType]) -> RegisterType {
    let val_type = all_variables
        .get(local_index as usize)
        .expect("Local variable index out of range");

    match val_type {
        wasmparser::ValType::I32 => RegisterType::U32,
        wasmparser::ValType::I64 => RegisterType::U64,
        wasmparser::ValType::F32 => RegisterType::F32,
        wasmparser::ValType::F64 => RegisterType::F64,
        wasmparser::ValType::V128 => {
            panic!("V128 (SIMD) type is not yet supported for PTX translation.")
        }
        wasmparser::ValType::Ref(_) => {
            panic!("Reference types are not supported for PTX translation.")
        }
    }
}


