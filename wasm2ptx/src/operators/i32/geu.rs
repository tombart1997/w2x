use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;

pub fn handle_i32_geu(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) {  
    let (right, right_type) = stack.pop().expect("Stack underflow during I32GeU");
    let (formatted_right, new_type_right) = if right_type != RegisterType::U32 {
        convert_register(entry_point, memory_manager, right, right_type, RegisterType::U32)
    } else {
        (right, right_type)
    };

    let (left, left_type) = stack.pop().expect("Stack underflow during I32GeU");
    let (formatted_left, new_type_left) = if left_type != RegisterType::U32 {
        convert_register(entry_point, memory_manager, left, left_type, RegisterType::U32)
    } else {
        (left, left_type)
    };            
    if new_type_left != RegisterType::U32 || new_type_right != RegisterType::U32 {
        panic!(
            "Type mismatch in I32GeU: left operand is {:?}, right operand is {:?}",
            new_type_left, new_type_right
        );
    }
    let formatted_right = if new_type_right != RegisterType::U32 {
        let (converted_right, _) = convert_register(
            entry_point,
            memory_manager,
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
        let data_type = ".u32".to_string();
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