
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
}

pub enum IndexType {
    SpecialRegister(usize),
    KernelParameter(usize),
    LocalVariable(usize),
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


impl RegisterType {
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
        }
    }
}

pub struct MemoryManager {
    register_types: HashMap<u32, RegisterType>,
    free_registers: VecDeque<u32>,            
    special_registers: HashMap<SpecialRegister, String>,
    bridge_registers: HashMap<usize, u32>, 
    local_registers: HashMap<u32, RegisterType>, 
    parameter_registers: HashMap<u32, RegisterType>,
}

impl MemoryManager {
    pub fn new(max_registers: u32) -> Self {
        MemoryManager {
            free_registers: (0..max_registers).collect(), 
            register_types: HashMap::new(),
            local_registers: HashMap::new(),
            parameter_registers: HashMap::new(),
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
        }
    }


    pub fn format_register(&self, reg: u32, reg_type: RegisterType) -> String {    
        let prefix = match reg_type {
            RegisterType::U32 | RegisterType::S32 | RegisterType::I32 => "%r",
            RegisterType::U64 | RegisterType::S64 | RegisterType::I64 => "%rd",
            RegisterType::F32 => "%f",
            RegisterType::F64 => "%fd",
            RegisterType::Predicate => "%p",
            RegisterType::Special(special_reg) => return self.get_special_register_name(special_reg).unwrap_or_else(|| reg.to_string()), 
        };
        format!("{}{}", prefix, reg)
    }

    pub fn get_or_create_bridge_register(&mut self, special_index: usize, reg_type: RegisterType) -> u32 {
        if let Some(&bridge_reg) = self.bridge_registers.get(&special_index) {
            return bridge_reg;
        }
        let (bridge_reg, _) = self.new_register(reg_type).expect("Failed to allocate bridge register");
        self.bridge_registers.insert(special_index, bridge_reg);
        bridge_reg
    }

    pub fn get_bridge_register(&self, special_index: usize) -> Option<u32> {
        self.bridge_registers.get(&special_index).cloned()
    }

    pub fn get_register(&self, index_type: IndexType) -> Option<(u32, RegisterType)> {
        match index_type {
            IndexType::SpecialRegister(idx) => {
                if let Some(bridge_reg) = self.get_bridge_register(idx) {
                    return Some((bridge_reg, RegisterType::U32));
                }
                self.get_special_register_by_index(idx)
                    .and_then(|special_reg| {
                        self.special_registers.get(&special_reg)?;
                        Some((idx as u32, RegisterType::Special(special_reg)))
                    })
            }
            IndexType::KernelParameter(idx) => {
                println!("get_register: {} is a kernel parameter", idx);
                println!("get_register: parameter_registers: {:?}", self.parameter_registers);
                self.parameter_registers.get(&((idx) as u32)).map(|reg_type| {
                    ((idx) as u32, *reg_type)
                })
            }
            IndexType::LocalVariable(idx) => {
                self.local_registers.get(&(idx as u32)).map(|reg_type| {
                    (idx as u32, *reg_type)
                })
            }
        }
    }
    

    pub fn assign_parameter_register(&mut self, param_idx: usize, reg_type: RegisterType) -> Option<(u32, RegisterType)> {
        // Try to use param_idx as the register number for the parameter
        let reg = if let Some(pos) = self.free_registers.iter().position(|&r| r == param_idx as u32) {
            self.free_registers.remove(pos).unwrap()
        } else {
            // Fallback: just pop the next available register
            self.free_registers.pop_front()?
        };
        self.register_types.insert(reg, reg_type);
        self.parameter_registers.insert(param_idx as u32, reg_type);
        Some((reg, reg_type))
    }

    pub fn new_predicate_register(&mut self) -> Option<(u32, RegisterType)> {
        if self.free_registers.is_empty() {
            println!("new_predicate_register: No free registers available.");
            return None; 
        }

        let reg = self.free_registers.pop_front()?;
        self.register_types.insert(reg, RegisterType::Predicate);
        Some((reg, RegisterType::Predicate))
    }

    pub fn new_register(&mut self, reg_type: RegisterType) -> Option<(u32, RegisterType)> {

        if self.free_registers.is_empty() {
            println!("new_register: No free registers available.");
            return None; 
        }

        let reg = self.free_registers.pop_front()?;
        self.register_types.insert(reg, reg_type);
        Some((reg, reg_type))
    }

    pub fn assign_register(&mut self, index_type: IndexType, reg_type: RegisterType) -> Option<(u32, RegisterType)> {
        match index_type {
            IndexType::SpecialRegister(idx) => {
                let bridge_reg = self.get_or_create_bridge_register(idx, reg_type);
                Some((bridge_reg, reg_type))
            }
            IndexType::KernelParameter(idx) => {
                let reg = self.free_registers.pop_front()?;
                self.parameter_registers.insert(idx as u32, reg_type);
                Some((reg, reg_type))
            }
            IndexType::LocalVariable(idx) => {
                let reg = self.free_registers.pop_front()?;
                self.local_registers.insert(idx as u32, reg_type);
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


