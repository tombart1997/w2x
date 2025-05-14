use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};
use crate::stack::Stack;
use crate::utils::convert_register;

/*
    NVIDIA PTX Documentation states:
    For .SHL OPS 
    Syntax

    shl.type d, a, b;

    .type = { .b16, .b32, .b64 };
    Description

    Shift a left by the amount specified by unsigned 32-bit value in b.

    shr.type d, a, b;

    .type = { .b16, .b32, .b64,
            .u16, .u32, .u64,
            .s16, .s32, .s64 };

    The sizes of the destination and first source operand must match, 
    but not necessarily the type. 

    The b operand must be a 32-bit value, regardless of the instruction type.
*/


pub fn handle_i32_shl(
    memory_manager: &mut MemoryManager,
    stack: &mut Stack,
    entry_point: &mut PTXEntryPoint,
) { 
    let (shift_amount, shift_type) = stack.pop().expect("Stack underflow during I32Shl");
    let (value, value_type) = stack.pop().expect("Stack underflow during I32Shl");

    let use_u64 = value_type.is_64();

    // Always convert shift amount to U32
    let (shift_amount, _) = if shift_type.is_32() == false{
        convert_register(entry_point, memory_manager, shift_amount, shift_type, shift_type.get_32_equivalent())
    } else {
        (shift_amount, shift_type)
    };

    let result_type = value_type;
    let shl_instr = if use_u64 {
        "shl.b64"
    } else {
        "shl.b32"
    };

    if let Some((result_reg, reg_type)) = memory_manager.new_register(result_type) {
        let formatted_result = memory_manager.format_register(result_reg, reg_type);
        let formatted_value = memory_manager.format_register(value, value_type);
        let formatted_shift = memory_manager.format_register(shift_amount, RegisterType::U32);
        entry_point.add_instruction(PTXInstruction::Other(format!(
            "{} {}, {}, {};",
            shl_instr, formatted_result, formatted_value, formatted_shift
        )));
        stack.push(result_reg, reg_type);
    } else {
        panic!("Failed to allocate a new register for I32Shl operation");
    }
}