//==============================================================================
// WASM to PTX Translator Module
//==============================================================================
//
// This module serves as the core translation engine that converts WebAssembly 
// operations into PTX instructions. It orchestrates the entire translation 
// process through several key functions:
//
// 1. translate_to_ptx: The main entry point that processes a sequence of WASM
//    operations, managing control flow structures and building a complete PTX
//    entry point (kernel or function).
//
// 2. translate_to_ptx_instruction: Maps individual WASM operations to their PTX
//    equivalents by delegating to specialized handler functions.
//
// 3. analyze_shared_memory_patterns: Detects shared memory usage patterns in the
//    WASM code to generate appropriate shared memory declarations in PTX.
//
// The translator simulates WebAssembly's stack-based execution model on PTX's
// register-based architecture by carefully tracking values on a virtual stack
// and mapping them to PTX registers when needed for computation.
//==============================================================================


use std::{collections::{HashMap, VecDeque}, hash::Hash};
use crate::ptx_module::PTXInstruction;

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum RegisterType {
    U32,
    U64, 
    F32, 
    F64,
    I32,
    I64,
    S64,
    S32,
    Predicate,
    Special(SpecialRegister), 
    SharesMem(SharedMemoryType),
}

pub enum IndexType {
    SpecialRegister(usize),
    KernelParameter(usize),
    LocalVariable(usize),
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum SharedMemoryType {
    U32,
    F32,
    U64,
    F64,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum SpecialRegister {
    ThreadIdX,
    ThreadIdY,
    ThreadIdZ,
    BlockIdX,
    BlockIdY,
    BlockIdZ,
    BlockDimX,
    BlockDimY,
    BlockDimZ,
    GridDimX,
    GridDimY,
    GridDimZ,
}

impl std::fmt::Display for SpecialRegister {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let name = match self {
            SpecialRegister::ThreadIdX => "ThreadIdX",
            SpecialRegister::ThreadIdY => "ThreadIdY",
            SpecialRegister::ThreadIdZ => "ThreadIdZ",
            SpecialRegister::BlockIdX => "BlockIdX",
            SpecialRegister::BlockIdY => "BlockIdY",
            SpecialRegister::BlockIdZ => "BlockIdZ",
            SpecialRegister::BlockDimX => "BlockDimX",
            SpecialRegister::BlockDimY => "BlockDimY",
            SpecialRegister::BlockDimZ => "BlockDimZ",
            SpecialRegister::GridDimX => "GridDimX",
            SpecialRegister::GridDimY => "GridDimY",
            SpecialRegister::GridDimZ => "GridDimZ",
        };
        write!(f, "{}", name)
    }
}

impl SharedMemoryType {
    pub fn to_ptx_type(&self) -> &'static str {
        match self {
            SharedMemoryType::U32 => ".u32",
            SharedMemoryType::F32 => ".f32",
            SharedMemoryType::U64 => ".u64",
            SharedMemoryType::F64 => ".f64",
        }
    }
    
    pub fn size_in_bytes(&self) -> usize {
        match self {
            SharedMemoryType::U32 | SharedMemoryType::F32 => 4,
            SharedMemoryType::U64 | SharedMemoryType::F64 => 8,
        }
    }
}

impl RegisterType {
    pub fn is_32(&self) -> bool {
        matches!(self, RegisterType::U32 | RegisterType::S32 | RegisterType::I32)
    }
    pub fn is_64(&self) -> bool {
        matches!(self, RegisterType::U64 | RegisterType::S64 | RegisterType::I64)
    }
    pub fn is_signed(&self) -> bool {
        matches!(self, RegisterType::S32 | RegisterType::S64 | RegisterType::I32 | RegisterType::I64)
    }
    pub fn to_ptx_type(&self) -> &'static str {
        match self {
            RegisterType::U32 => ".u32",
            RegisterType::S32 => ".s32",
            RegisterType::U64 => ".u64",
            RegisterType::S64 => ".s64",
            RegisterType::F32 => ".f32",
            RegisterType::F64 => ".f64",
            RegisterType::I32 => ".u32",
            RegisterType::I64 => ".u64",
            RegisterType::Predicate => ".pred",
            RegisterType::Special(_) => ".u32",
            RegisterType::SharesMem(shared_memory_type) => {
                shared_memory_type.to_ptx_type()
            }
        }
    }

    pub fn get_64_equivalent(&self) -> RegisterType {
        match self {
            RegisterType::U32 | RegisterType::U64 => RegisterType::U64,
            RegisterType::S32 | RegisterType::S64 => RegisterType::S64,
            RegisterType::I32 | RegisterType::I64 => RegisterType::I64,
            RegisterType::F32 | RegisterType::F64 => RegisterType::F64,
            _ => *self,
        }
    }

    pub fn get_32_equivalent(&self) -> RegisterType {
        match self {
            RegisterType::U64 | RegisterType::U32 => RegisterType::U32,
            RegisterType::S64 | RegisterType::S32 => RegisterType::S32,
            RegisterType::I64 | RegisterType::I32 => RegisterType::I32,
            RegisterType::F64 | RegisterType::F32 => RegisterType::F32,
            _ => *self,
        }
    }
}

pub struct MemoryManager {
    register_types: HashMap<u32, RegisterType>,
    free_registers: VecDeque<u32>,            
    special_registers: HashMap<SpecialRegister, String>,
    bridge_registers: HashMap<usize, (u32, RegisterType)>, 
    local_registers: HashMap<u32, (u32, RegisterType)>,
    parameter_registers: HashMap<u32, RegisterType>,
    shared_memory_regions: HashMap<u32, (String, SharedMemoryType, usize)>, // id -> (name, type, size)
    shared_memory_address_ranges: Vec<(u32, u32, u32)>,  // (start_addr, end_addr, region_id)
    next_shared_id: u32,

}

impl MemoryManager {
    pub fn new(max_registers: u32) -> Self {
        let mut manager = MemoryManager {
            free_registers: (0..max_registers).collect(), 
            register_types: HashMap::new(),
            local_registers: HashMap::new(),
            parameter_registers: HashMap::new(),
            shared_memory_regions: HashMap::new(),
            shared_memory_address_ranges: Vec::new(),
            next_shared_id: 0,
            special_registers: {
                let mut map = HashMap::new();
                map.insert(SpecialRegister::ThreadIdX, "%tid.x".to_string());
                map.insert(SpecialRegister::ThreadIdY, "%tid.y".to_string());
                map.insert(SpecialRegister::ThreadIdZ, "%tid.z".to_string());
                map.insert(SpecialRegister::BlockIdX, "%ctaid.x".to_string());
                map.insert(SpecialRegister::BlockIdY, "%ctaid.y".to_string());
                map.insert(SpecialRegister::BlockIdZ, "%ctaid.z".to_string());
                map.insert(SpecialRegister::BlockDimX, "%ntid.x".to_string());
                map.insert(SpecialRegister::BlockDimY, "%ntid.y".to_string());
                map.insert(SpecialRegister::BlockDimZ, "%ntid.z".to_string());
                map.insert(SpecialRegister::GridDimX, "%nctaid.x".to_string());
                map.insert(SpecialRegister::GridDimY, "%nctaid.y".to_string());
                map.insert(SpecialRegister::GridDimZ, "%nctaid.z".to_string());
                map
            },
            bridge_registers: HashMap::new(),
        };
        manager
    }


    pub fn is_address_in_registered_shared_memory_range(&self, addr: u32) -> bool {
        self.shared_memory_address_ranges.iter()
            .any(|&(start, end, _)| addr >= start && addr < end)
    }

    pub fn format_register(&self, reg: u32, reg_type: RegisterType) -> String {    
        let prefix = match reg_type {
            RegisterType::U32 | RegisterType::S32 | RegisterType::I32 => "%r",
            RegisterType::U64 | RegisterType::S64 | RegisterType::I64 => "%rd",
            RegisterType::F32 => "%f",
            RegisterType::F64 => "%fd",
            RegisterType::Predicate => "%p",
            RegisterType::Special(special_reg) => return self.get_special_register_name(special_reg).unwrap_or_else(|| reg.to_string()),
            RegisterType::SharesMem(shared_memory_type) => {
                return format!("%sm{}", shared_memory_type.to_ptx_type());
            }
        };
        format!("{}{}", prefix, reg)
    }

        // Methods for shared memory management
    pub fn register_shared_memory_range(&mut self, start_addr: u32, end_addr: u32, 
                                       mem_type: SharedMemoryType, 
                                       name_hint: Option<&str>) -> u32 {
        let id = self.next_shared_id;
        self.next_shared_id += 1;
        
        let name = name_hint.map(String::from)
            .unwrap_or_else(|| format!("shared_mem{}", id));
            
        let size = (end_addr - start_addr) as usize / mem_type.size_in_bytes();

        self.shared_memory_regions.insert(id, (name, mem_type, size));
        self.shared_memory_address_ranges.push((start_addr, end_addr, id));
        
        id
    }
    
    pub fn is_shared_memory_address(&self, addr: u32) -> Option<(u32, &(String, SharedMemoryType, usize))> {
        for &(start, end, id) in &self.shared_memory_address_ranges {
            if addr >= start && addr < end {
                if let Some(region) = self.shared_memory_regions.get(&id) {
                    return Some((addr - start, region));
                }
            }
        }
        None
    }
    
    pub fn is_barrier_address(&self, addr: u32) -> bool {
        // Special address for __syncthreads()
        addr == 0xFFFFFFF0
    }

    pub fn get_or_create_bridge_register(&mut self, special_index: usize, reg_type: RegisterType) -> Option<(u32, RegisterType)> {
        if let Some((bridge_reg, bridge_type)) = self.bridge_registers.get(&special_index) {
            if *bridge_type == reg_type {
                return Some((*bridge_reg, *bridge_type));
            } else {
                let (new_bridge_reg, new_bridge_type) = self.new_register(reg_type)?;
                self.bridge_registers.insert(special_index, (new_bridge_reg, new_bridge_type));
                return Some((new_bridge_reg, new_bridge_type));
            }
        }
        let (bridge_reg, bridge_type) = self.new_register(reg_type).expect("Failed to allocate bridge register");
        self.bridge_registers.insert(special_index, (bridge_reg, reg_type));
        Some((bridge_reg, bridge_type))
    }

    pub fn get_bridge_register(&self, special_index: usize) -> Option<(u32, RegisterType)> {
        self.bridge_registers.get(&special_index).map(|(reg, type_)| (*reg, *type_))
    }

    pub fn get_register(&self, index_type: IndexType) -> Option<(u32, RegisterType)> {
        match index_type {
            IndexType::SpecialRegister(idx) => {
                if let Some((bridge_reg, bridge_type)) = self.get_bridge_register(idx) {
                    return Some((bridge_reg, bridge_type));
                }
                if let Some((bridge_reg, bridge_type)) = self.get_bridge_register(idx) {
                    return Some((bridge_reg, bridge_type));
                }
                self.get_special_register_by_index(idx)
                    .and_then(|special_reg| {
                        self.special_registers.get(&special_reg)?;
                        Some((idx as u32, RegisterType::Special(special_reg)))
                    })
            }
            IndexType::KernelParameter(idx) => {
                self.parameter_registers.get(&((idx) as u32)).map(|reg_type| {
                    ((idx) as u32, *reg_type)
                })
            }
            IndexType::LocalVariable(idx) => {
                self.local_registers.get(&(idx as u32)).map(|(reg, reg_type)| {
                    (*reg, *reg_type)
                })
            }
        }
    }
    
    pub fn assign_parameter_register(&mut self, param_idx: usize, reg_type: RegisterType) -> Option<(u32, RegisterType)> {
        let reg = if let Some(pos) = self.free_registers.iter().position(|&r| r == param_idx as u32) {
            self.free_registers.remove(pos).unwrap()
        } else {
            self.free_registers.pop_front()?
        };
        self.register_types.insert(reg, reg_type);
        self.parameter_registers.insert(param_idx as u32, reg_type);
        Some((reg, reg_type))
    }

    pub fn new_predicate_register(&mut self) -> Option<(u32, RegisterType)> {
        if self.free_registers.is_empty() {
            return None; 
        }

        let reg = self.free_registers.pop_front()?;
        self.register_types.insert(reg, RegisterType::Predicate);
        Some((reg, RegisterType::Predicate))
    }

    pub fn new_register(&mut self, reg_type: RegisterType) -> Option<(u32, RegisterType)> {

        if self.free_registers.is_empty() {
            return None; 
        }

        let reg = self.free_registers.pop_front()?;
        self.register_types.insert(reg, reg_type);
        Some((reg, reg_type))
    }

    pub fn assign_register(&mut self, index_type: IndexType, reg_type: RegisterType) -> Option<(u32, RegisterType)> {
        match index_type {
            IndexType::SpecialRegister(idx) => {
                let (bridge_reg, bridge_type) = self.get_or_create_bridge_register(idx, reg_type)?;
                Some((bridge_reg, bridge_type))
            }
            IndexType::KernelParameter(idx) => {
                let reg = self.free_registers.pop_front()?;
                self.parameter_registers.insert(idx as u32, reg_type);
                Some((reg, reg_type))
            }
            IndexType::LocalVariable(idx) => {
                let reg = self.free_registers.pop_front()?;
                self.local_registers.insert(idx as u32, (reg, reg_type)); 
                self.register_types.insert(reg, reg_type);
                Some((reg, reg_type))
            }
        }
    }

    pub fn get_special_register_by_index(&self, local_index: usize) -> Option<SpecialRegister> {
        match local_index {
            0 => Some(SpecialRegister::ThreadIdX),
            1 => Some(SpecialRegister::ThreadIdY),
            2 => Some(SpecialRegister::ThreadIdZ),
            3 => Some(SpecialRegister::BlockIdX),
            4 => Some(SpecialRegister::BlockIdY),
            5 => Some(SpecialRegister::BlockIdZ),
            6 => Some(SpecialRegister::BlockDimX),
            7 => Some(SpecialRegister::BlockDimY),
            8 => Some(SpecialRegister::BlockDimZ),
            9 => Some(SpecialRegister::GridDimX),
            10 => Some(SpecialRegister::GridDimY),
            11 => Some(SpecialRegister::GridDimZ),
            _ => None, 
        }
    }

    pub fn get_special_register_name(&self, reg: SpecialRegister) -> Option<String> {
        self.special_registers.get(&reg).cloned()
    }

    pub fn generate_register_declarations(&self) -> Vec<PTXInstruction> {
        let mut declarations = Vec::new();
        let mut u32_registers = Vec::new();
        let mut u64_registers = Vec::new();
        let mut f32_registers = Vec::new();
        let mut f64_registers = Vec::new();
        let mut pred_registers = Vec::new();
        for (reg, reg_type) in &self.register_types {
            match reg_type {
                RegisterType::U32 | RegisterType::S32 | RegisterType::I32 => {
                    u32_registers.push(format!("%r{}", reg));
                }
                RegisterType::U64 | RegisterType::S64 | RegisterType::I64 => {
                    u64_registers.push(format!("%rd{}", reg));
                }
                RegisterType::F32 => {
                    f32_registers.push(format!("%f{}", reg));
                }
                RegisterType::F64 => {
                    f64_registers.push(format!("%fd{}", reg));
                }
                RegisterType::Predicate => {
                    pred_registers.push(format!("%p{}", reg));
                }
                _ => {
                }
            }
        }
    
        if !u32_registers.is_empty() {
            declarations.push(PTXInstruction::RegisterDeclaration {
                register_type: ".u32".to_string(),
                registers: u32_registers,
            });
        }
        if !u64_registers.is_empty() {
            declarations.push(PTXInstruction::RegisterDeclaration {
                register_type: ".u64".to_string(),
                registers: u64_registers,
            });
        }
        if !f32_registers.is_empty() {
            declarations.push(PTXInstruction::RegisterDeclaration {
                register_type: ".f32".to_string(),
                registers: f32_registers,
            });
        }
        if !f64_registers.is_empty() {
            declarations.push(PTXInstruction::RegisterDeclaration {
                register_type: ".f64".to_string(),
                registers: f64_registers,
            });
        }
        if !pred_registers.is_empty() {
            declarations.push(PTXInstruction::RegisterDeclaration {
                register_type: ".pred".to_string(),
                registers: pred_registers,
            });
        }
        declarations
    }
}