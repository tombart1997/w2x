//==============================================================================
// PTX Code Generation Model
//==============================================================================
//
// This module defines the structure and generation of PTX (Parallel Thread
// Execution) code from the intermediate representation. It provides:
//
// 1. PTXModule: The top-level container for holding multiple entry points
//    (kernels and device functions) and generating complete PTX source code.
//
// 2. PTXEntryPoint: Represents a single CUDA kernel or function with its
//    parameters, register declarations, and instruction sequence.
//
// 3. PTXInstruction: Models individual PTX instructions with their operands,
//    data types, and formatting rules.
//
// 4. PTXParameter: Handles parameter declarations for kernel functions.
//
// The design separates structural concerns (modules, functions) from
// instruction-level details, allowing for clean code generation with proper
// scoping and formatting of the final PTX assembly code targeting NVIDIA GPUs.
//==============================================================================

#[derive(Debug, Default)]
pub struct PTXModule {
    version: String,
    target: String,
    entry_points: Vec<PTXEntryPoint>,
}

impl PTXModule {
    pub fn new(version: String, target: String) -> Self {
        PTXModule {
            version,
            target,
            entry_points: Vec::new(),
        }
    }

    pub fn add_entry_point(&mut self, entry_point: PTXEntryPoint) {
        self.entry_points.push(entry_point);
    }

    pub fn generate_ptx_string(&self) -> String {
        let mut ptx_code = String::new();
        ptx_code.push_str(&self.version);
        ptx_code.push('\n');
        ptx_code.push_str(&self.target);
        ptx_code.push('\n');
        for entry_point in &self.entry_points {
            ptx_code.push_str(&entry_point.to_string());
            ptx_code.push('\n');
        }
        ptx_code
    }

}

#[derive(Debug, Default)]
pub struct PTXEntryPoint {
    name: String,
    parameters: Vec<PTXParameter>, 
    register_declarations: Vec<PTXInstruction>, 
    body: Vec<PTXInstruction>,    
}

impl PTXEntryPoint {
    pub fn new(name: String, parameters: Vec<PTXParameter>) -> Self {
        PTXEntryPoint {
            name,
            parameters,
            register_declarations: Vec::new(),
            body: Vec::new(),
        }
    }

    pub fn add_instruction(&mut self, instruction: PTXInstruction) {
        self.body.push(instruction);
    }

    pub fn add_register_declaration(&mut self, declaration: PTXInstruction) {
        self.register_declaraijijjiiitions.push(declaration);
    }
}

impl ToString for PTXEntryPoint {
    fn to_string(&self) -> String {
        let mut result = format!(".visible .entry {}(\n", self.name);
        for (i, param) in self.parameters.iter().enumerate() {
            if i > 0 {
                result.push_str(",\n");
            }
            result.push_str(&format!("\t.param {} {}", param.data_type, param.name));
        }
        result.push_str("\n) {\n");
        for declaration in &self.register_declarations {
            result.push_str(&format!("\t{}\n", declaration.to_string()));
        }
        for instruction in &self.body {
            // Only indent if not a label
            match instruction {
                PTXInstruction::Label { .. } => {
                    result.push_str(&format!("{}\n", instruction.to_string()));
                }
                _ => {
                    result.push_str(&format!("\t{}\n", instruction.to_string()));
                }
            }
        }
        result.push_str("}\n");
        result
    }
}

#[derive(Debug, Clone)]
pub struct PTXParameter {
    name: String,
    data_type: String, 
}

impl PTXParameter {
    pub fn new(name: String, data_type: String) -> Self {
        PTXParameter { name, data_type }
    }
}

#[derive(Debug, Clone)]
pub enum PTXInstruction {
    RegisterDeclaration {
        register_type: String,
        registers: Vec<String>,
    },
    Load {
        data_type: String,
        destination: String,
        address: String,
    },
    Store {
        data_type: String,
        address: String,
        source: String,
    },
    Add {
        data_type: String,
        destination: String,
        operand1: String,
        operand2: String,
    },
    Shru {
        data_type: String,
        destination: String,
        operand1: String,
        operand2: String,
    },
    Sub {
        data_type: String,
        destination: String,
        operand1: String,
        operand2: String,
    },
    Mul {
        data_type: String,
        destination: String,
        operand1: String,
        operand2: String,
    },
    Div {
        data_type: String,
        modifier: String,
        destination: String,
        operand1: String,
        operand2: String,
    },
    Bra {
        target: String,
    },
    Setp {
        predicate: String,
        data_type: String,
        operand1: String,
        operand2: String,
        comparison: String,
    },
    Mov {
        data_type: String,
        destination: String,
        source: String,
    },
    ParamLoad {
        param_index: usize,
        destination: String,
    },
    Label {
        name: String,
    },
    Return {
    },
    Other(String),
    Trap,
}

impl ToString for PTXInstruction {
    fn to_string(&self) -> String {
        match self {
            PTXInstruction::RegisterDeclaration {
                        register_type,
                        registers,
                    } => {               
                        let mut sorted_registers = registers.clone();
                
                        // Sort by the numeric part of register names
                        sorted_registers.sort_by(|a, b| {
                            // Extract the numeric part from each register name
                            let a_num = a.chars()
                                .skip_while(|c| !c.is_numeric())
                                .collect::<String>()
                                .parse::<usize>()
                                .unwrap_or(0);
                    
                            let b_num = b.chars()
                                .skip_while(|c| !c.is_numeric())
                                .collect::<String>()
                                .parse::<usize>()
                                .unwrap_or(0);
                    
                            // Compare by numeric value
                            a_num.cmp(&b_num)
                        });
                
                        format!(
                            ".reg {} {};", 
                            register_type, 
                            sorted_registers.join(", ")
                        )
                    },
            PTXInstruction::Load {
                        data_type,
                        destination,
                        address,
                    } => format!("ld.global{} {}, [{}];", data_type, destination, address),

            PTXInstruction::Shru {
                        data_type,
                        destination,
                        operand1,
                        operand2,
                    } => format!("shru{} {}, {}, {};", data_type, destination, operand1, operand2),
            PTXInstruction::Store {
                        data_type,
                        address,
                        source,
                    } => format!("st.global{} [{}], {};", data_type, address, source),
            PTXInstruction::Add {
                        data_type,
                        destination,
                        operand1,
                        operand2,
                    } => format!("add{} {}, {}, {};", data_type, destination, operand1, operand2),
            PTXInstruction::Sub {
                        data_type,
                        destination,
                        operand1,
                        operand2,
                    } => format!("sub{} {}, {}, {};", data_type, destination, operand1, operand2),
            PTXInstruction::Mul {
                        data_type,
                        destination,
                        operand1,
                        operand2,
                    } => format!("mul{} {}, {}, {};", data_type, destination, operand1, operand2),
            PTXInstruction::Bra { target } => format!("bra {};", target),
            PTXInstruction::Setp {
                        predicate,
                        data_type,
                        operand1,
                        operand2,
                        comparison,
                    } => format!(
                        "setp{}{} {}, {}, {};",
                        comparison, data_type, predicate, operand1, operand2
                    ),
            PTXInstruction::Mov {
                        data_type,
                        destination,
                        source,
                    } => format!("mov{} {}, {};", data_type, destination, source),
            PTXInstruction::ParamLoad { param_index, destination } => {
                        format!("ld.param.u64 {}, [param{}];", destination, param_index)
                    }
            PTXInstruction::Return {} => "ret;".to_string(),
            PTXInstruction::Label { name } => format!("{}:", name),
            PTXInstruction::Other(instruction) => instruction.clone(),
            PTXInstruction::Trap => "trap;".to_string(),
            PTXInstruction::Div { 
                data_type, 
                modifier,
                destination, 
                operand1, 
                operand2 } => {
                format!("div{}{} {}, {}, {};", data_type, modifier, destination, operand1, operand2)
            },
        }
    }
}