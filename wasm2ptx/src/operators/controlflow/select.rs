use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;

pub fn handle_select(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) {
    let (condition, cond_type) = stack.pop().expect("Stack underflow during Select");
    let (true_value, true_type) = stack.pop().expect("Stack underflow during Select");
    let (false_value, false_type) = stack.pop().expect("Stack underflow during Select");
    
    if true_type != false_type {
        panic!("Select operator requires consistent value types");
    }

    let result_type = true_type;
    let data_type = match result_type {
        RegisterType::U32 | RegisterType::S32 => ".b32",
        RegisterType::U64 | RegisterType::S64 => ".b64",
        RegisterType::F32 => ".f32",
        RegisterType::F64 => ".f64",
        _ => panic!("Unsupported type for Select operation"),
    };
    
    let (result_reg, reg_type) = memory_manager
        .new_register(result_type)
        .expect("Failed to allocate register for Select result");
    
    let formatted_result = memory_manager.format_register(result_reg, reg_type);
    let formatted_true = memory_manager.format_register(true_value, true_type);
    let formatted_false = memory_manager.format_register(false_value, false_type);
    let formatted_cond = memory_manager.format_register(condition, cond_type);
    
    if cond_type == RegisterType::Predicate {
        entry_point.add_instruction(PTXInstruction::Other(format!(
            "selp{} {}, {}, {}, {};",
            data_type, formatted_result, formatted_false, formatted_true, formatted_cond
        )));
    } else {
        let (pred_reg, pred_type) = memory_manager
            .new_predicate_register()
            .expect("Failed to allocate predicate register for Select");
        
        let formatted_pred = memory_manager.format_register(pred_reg, pred_type);
        
        entry_point.add_instruction(PTXInstruction::Setp {
            predicate: formatted_pred.clone(),
            data_type: ".u32".to_string(),
            operand1: formatted_cond,
            operand2: "0".to_string(),
            comparison: ".ne".to_string(),
        });
        
        entry_point.add_instruction(PTXInstruction::Other(format!(
            "selp{} {}, {}, {}, {};",
            data_type, formatted_result, formatted_false, formatted_true, formatted_pred
        )));
    }
    
    stack.push(result_reg, reg_type);
}