use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;

pub fn handle_i32_divu(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) {
    // Pop divisor (right operand) and dividend (left operand)
    let (divisor, divisor_type) = stack.pop().expect("Stack underflow during I32DivU");
    let (dividend, dividend_type) = stack.pop().expect("Stack underflow during I32DivU");

    let requires_u64 = divisor_type.is_64() || dividend_type.is_64();

    // Convert operands to appropriate type if needed
    let (divisor, divisor_type) = if requires_u64 && !divisor_type.is_64() {
        convert_register(entry_point, memory_manager, divisor, divisor_type, RegisterType::U64)
    } else if !requires_u64 && divisor_type != RegisterType::U32 {
        convert_register(entry_point, memory_manager, divisor, divisor_type, RegisterType::U32)
    } else {
        (divisor, divisor_type)
    };

    let (dividend, dividend_type) = if requires_u64 && !dividend_type.is_64() {
        convert_register(entry_point, memory_manager, dividend, dividend_type, RegisterType::U64)
    } else if !requires_u64 && dividend_type != RegisterType::U32 {
        convert_register(entry_point, memory_manager, dividend, dividend_type, RegisterType::U32)
    } else {
        (dividend, dividend_type)
    };

    // The result type is unsigned
    let result_type = if requires_u64 { RegisterType::U64 } else { RegisterType::U32 };
    
    let (result_reg, reg_type) = memory_manager
        .new_register(result_type)
        .expect("Failed to allocate register for I32DivU result");

    let formatted_result = memory_manager.format_register(result_reg, reg_type);
    let formatted_dividend = memory_manager.format_register(dividend, dividend_type);
    let formatted_divisor = memory_manager.format_register(divisor, divisor_type);
    
    // For unsigned division, we use div.u32 or div.u64
    let div_instr = if requires_u64 { "div.u64" } else { "div.u32" };
    
    entry_point.add_instruction(PTXInstruction::Other(format!(
        "{} {}, {}, {};",
        div_instr, formatted_result, formatted_dividend, formatted_divisor
    )));
    
    stack.push(result_reg, reg_type);
}