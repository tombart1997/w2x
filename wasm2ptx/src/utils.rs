use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};


pub fn convert_register(
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
        (RegisterType::U32, RegisterType::F32) => PTXInstruction::Other(format!(
            "cvt.rn.f32.u32 {}, {};",
            formatted_result, formatted_source
        )),
        (RegisterType::U64, RegisterType::F32) => PTXInstruction::Other(format!(
            "cvt.rn.f32.u64 {}, {};",
            formatted_result, formatted_source
        )),
        (RegisterType::F32, RegisterType::U32) => PTXInstruction::Other(format!(
            "cvt.rzi.u32.f32 {}, {};",
            formatted_result, formatted_source
        )),
        (RegisterType::F32, RegisterType::U64) => PTXInstruction::Other(format!(
            "cvt.rzi.u64.f32 {}, {};",
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