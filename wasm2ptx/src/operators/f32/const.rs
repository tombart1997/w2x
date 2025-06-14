use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;

pub fn handle_f32_const(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
    value: &f32,
) {
    if let Some((result_reg, reg_type)) = memory_manager.new_register(RegisterType::F32) {
        let formatted_result = memory_manager.format_register(result_reg, reg_type);

        // Format float as PTX-compatible literal
        let value_str = if value.is_nan() {
            // Canonical quiet NaN
            "0fFFC00000".to_string()
        } else if *value == f32::INFINITY {
            "0f7F800000".to_string()  // +∞
        } else if *value == f32::NEG_INFINITY {
            "0fFF800000".to_string()  // −∞
        } else if *value == 0.0 {
            // Zero should use decimal format to avoid PTX parsing issues
            "0.0".to_string()
        } else {
            // Convert float to hexadecimal representation
            format!("0f{:08x}", value.to_bits())
        };

        entry_point.add_instruction(PTXInstruction::Mov {
            data_type: ".f32".to_string(),
            destination: formatted_result,
            source: value_str,
        });

        stack.push(result_reg, reg_type);
    } else {
        panic!("Failed to allocate a new register for F32Const operation");
    }
}