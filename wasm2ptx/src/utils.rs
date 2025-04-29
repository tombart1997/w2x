use crate::memory::{MemoryManager, RegisterType};
use crate::ptx_module::{PTXEntryPoint, PTXInstruction};


pub fn convert_register(
    entry_point: &mut PTXEntryPoint,
    memory_manager: &mut MemoryManager,
    source: u32,
    source_type: RegisterType,
    target_type: RegisterType,
) -> (u32, RegisterType) {
    if source_type == target_type {
        return (source, source_type);
    }
    // Disallow 64->32 conversions
    if (source_type == RegisterType::U64 && target_type == RegisterType::U32)
        || (source_type == RegisterType::S64 && target_type == RegisterType::S32)
        || (source_type == RegisterType::I64 && target_type == RegisterType::I32)
    {
        panic!("Unsafe conversion from 64-bit to 32-bit is not allowed: {:?} -> {:?}", source_type, target_type);
    }
    if let RegisterType::Special(_) = source_type {
        return (source, source_type);
    }
    let (result_reg, _) = memory_manager
        .new_register(target_type)
        .expect("Failed to allocate register for conversion");
    let formatted_source = memory_manager.format_register(source, source_type);
    let formatted_result = memory_manager.format_register(result_reg, target_type);
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
        (RegisterType::U32, RegisterType::U64) => PTXInstruction::Other(format!(
            "cvt.u64.u32 {}, {};", 
            formatted_result, formatted_source
        )),
        (RegisterType::S32, RegisterType::U64) => PTXInstruction::Other(format!(
            "cvt.u64.s32 {}, {};", 
            formatted_result, formatted_source
        )),
        (RegisterType::S32, RegisterType::S64) => PTXInstruction::Other(format!(
            "cvt.s64.s32 {}, {};", 
            formatted_result, formatted_source
        )),
        (RegisterType::S64, RegisterType::U64) => PTXInstruction::Other(format!(
            "cvt.u64.s64 {}, {};", 
            formatted_result, formatted_source
        )),
        (RegisterType::U32, RegisterType::S64) => PTXInstruction::Other(format!(
            "cvt.s64.u32 {}, {};", 
            formatted_result, formatted_source
        )),
        _ => panic!(
            "Unsupported conversion from {:?} to {:?}",
            source_type, target_type
        ),
    };
    entry_point.add_instruction(conversion_instruction);
    (result_reg, target_type)
}