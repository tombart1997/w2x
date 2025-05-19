mod translator;
mod ir;
mod stack;
mod memory;
mod ptx_module;
mod label_context;
mod kernel_detector;
mod operators;
mod utils;
use wasmparser::{Parser, Payload, Operator, ExternalKind, TypeRef, ValType, CompositeType};
use std::fs;
use std::path::{Path, PathBuf};
use std::io;
use serde_json::{Value, from_str};
use std::collections::HashMap;
use std::str;
use crate::ir::{WasmOperator, convert_wasm_operator};
use crate::kernel_detector::detect_kernel;  
use crate::ptx_module::PTXModule;
use crate::label_context::{LabelContext, LabelKind, LabelFrame};

fn main() {
    env_logger::init();
    let search_dir = "./test";
    
    match process_wasm_files(search_dir) {
        Ok(_) => println!("Successfully processed all WASM files"),
        Err(e) => eprintln!("Error processing WASM files: {}", e),
    }
}

fn process_wasm_files(dir: &str) -> io::Result<()> {
    let entries = fs::read_dir(dir)?;
    
    for entry in entries {
        let entry = entry?;
        let path = entry.path();
        if path.is_file() && path.extension().map_or(false, |ext| ext == "wasm") {
            let filename = path.file_stem().unwrap().to_str().unwrap();
            let output_dir = Path::new(dir).join(filename);
            fs::create_dir_all(&output_dir)?;
            process_single_wasm_file(&path, &output_dir)?;
        }
    }
    
    Ok(())
}

fn process_single_wasm_file(wasm_path: &Path, output_dir: &Path) -> io::Result<()> {
    let wasm_bytes = fs::read(wasm_path)?;
    let parser = Parser::new(0);
    let mut exported_funcs = Vec::new();
    let mut func_bodies = Vec::new();
    let mut func_index_offset = 0;
    let mut function_signatures: Vec<Vec<ValType>> = Vec::new();
    let mut func_type_map: Vec<usize> = Vec::new();
    let mut metadata_address: Option<u32> = None;
    let mut data_sections: HashMap<u32, Vec<u8>> = HashMap::new();
    let mut shared_memory_info = SharedMemoryInfo::new();
    for payload in parser.parse_all(&wasm_bytes) {
        match payload.expect("Failed parsing payload") 
        {
            Payload::TypeSection(reader) => {
                for (_, ty) in reader.into_iter().enumerate().filter_map(|(i, r)| r.ok().map(|ty| (i, ty))) {
                    for subtype in ty.types() {
                        if let CompositeType::Func(func_type) = &subtype.composite_type {
                            let param_types: Vec<ValType> = func_type.params().iter().copied().collect();
                            function_signatures.push(param_types);
                        }
                    }
                }
            }
            Payload::FunctionSection(reader) => {
                for (_, func_type) in reader.into_iter().enumerate() {
                    if let Ok(type_idx) = func_type {
                        func_type_map.push(type_idx as usize);
                    }
                }
            }
            Payload::ImportSection(import_reader) => {
                for import in import_reader {
                    if let Ok(import) = import {
                        if let TypeRef::Func(_) = import.ty {
                            func_index_offset += 1;
                        }
                    }
                }
            }
            Payload::ExportSection(reader) => {
                for export in reader {
                    if let Ok(export) = export {
                        if let ExternalKind::Func = export.kind {
                            exported_funcs.push((export.index, export.name.to_string()));
                        }
                    }
                }
            }
            Payload::CodeSectionEntry(body) => {
                let operators = body.get_operators_reader().expect("Failed to read operators");
                let ops: Vec<Operator> = operators.into_iter().collect::<Result<_, _>>().unwrap();    
                func_bodies.push(ops);
            }
            Payload::DataSection(reader) => {
                for data_entry in reader {
                    if let Ok(data) = data_entry {
                        // Handle only passive and active data with memory 0
                        match data.kind {
                            wasmparser::DataKind::Active { memory_index: 0, init_expr } => {
                                let mut reader = init_expr.get_binary_reader();
                                if let Ok(Operator::I32Const { value }) = reader.read() {
                                    // Store data section content by address
                                    data_sections.insert(value as u32, data.data.to_vec());
                                }
                            },
                            _ => {}
                        }
                    }
                }
            },
        _ => {}
        }
    }
    // First pass: find the metadata function address
    for (export_idx, function_name) in &exported_funcs {
        if function_name == "__shared_mem_metadata" {
            let body_idx = export_idx - func_index_offset;
            let ops = &func_bodies[body_idx as usize];
            
            // Extract the return value (metadata address) from the function
            for op in ops {
                if let Operator::I32Const { value } = op {
                    metadata_address = Some(*value as u32);
                    break;
                }
            }
            break;
        }
    }
    
   shared_memory_info =  parse_shared_memory_metadata(metadata_address, &data_sections);



    for (export_idx, function_name) in exported_funcs {
        let body_idx = export_idx - func_index_offset;
        let ops = &func_bodies[body_idx as usize];
        let (params, locals) = extract_all_variables(
            &wasm_bytes, 
            body_idx as usize,
            &function_signatures, 
            &func_type_map,
        );
        let all_variables = [params.clone(), locals.clone()].concat();
        let kernel_info = detect_kernel(&function_name);
        
        if kernel_info.is_kernel {
            let mut ptx_module = PTXModule::new(".version 8.0".to_string(), ".target sm_80".to_string());
            
            let ops_converted: Vec<WasmOperator> = ops
                .iter()
                .map(|op| convert_wasm_operator(op, &all_variables.as_slice(), kernel_info.first_data_param, true))
                .collect();
                
            let entry_point = translator::translate_to_ptx(&ops_converted, &kernel_info, params.len(), locals.len(), &mut ptx_module);
            ptx_module.add_entry_point(entry_point);
            let ptx_code = ptx_module.generate_ptx_string();
            let ptx_filename = format!("{}.ptx", function_name);
            let ptx_path = output_dir.join(ptx_filename);
            fs::write(&ptx_path, ptx_code)?;
        }
    }
    
    Ok(())
}


fn parse_shared_memory_metadata(metadata_address: Option<u32>, data_sections: &HashMap<u32, Vec<u8>>, shared_memory_info: SharedMemoryInfo ) -> SharedMemoryInfo {

    // Second pass: parse the metadata if found
    if let Some(address) = metadata_address {
        if let Some(data) = data_sections.get(&address) {
            // Convert raw bytes to string, handling null termination
            let metadata_str = match data.iter().position(|&b| b == 0) {
                Some(pos) => str::from_utf8(&data[0..pos]),
                None => str::from_utf8(data),
            };
            
            if let Ok(json_str) = metadata_str {
                if let Ok(json) = from_str::<Value>(json_str) {
                    // Parse the kernel metadata
                    if let Some(kernels) = json.get("kernels").and_then(|k| k.as_array()) {
                        for kernel in kernels {
                            let kernel_name = kernel.get("name")
                                .and_then(|n| n.as_str())
                                .unwrap_or_default()
                                .to_string();
                                
                            if let Some(shared_mem) = kernel.get("shared_memory").and_then(|s| s.as_array()) {
                                let mut regions = Vec::new();
                                
                                for region in shared_mem {
                                    if let (Some(name), Some(size), Some(offset)) = (
                                        region.get("name").and_then(|n| n.as_str()),
                                        region.get("size").and_then(|s| s.as_u64()),
                                        region.get("offset").and_then(|o| o.as_u64())
                                    ) {
                                        regions.push(SharedMemoryRegion {
                                            name: name.to_string(),
                                            size: size as usize,
                                            offset: offset as u32,
                                        });
                                    }
                                }
                                shared_memory_info.kernel_to_regions.insert(kernel_name, regions);
                            }
                        }
                    }
                }
            }
        }
    }
    shared_memory_info
}


fn extract_function_params(
    func_index: usize,
    function_signatures: &[Vec<ValType>],
    func_type_map: &[usize],
) -> Vec<ValType> {
    if func_index < func_type_map.len() {
        let type_idx = func_type_map[func_index];
        
        if type_idx < function_signatures.len() {
            let param_types = &function_signatures[type_idx];
            return param_types.clone();
        }
    }
    Vec::new()
}

fn extract_local_variables(
    wasm_bytes: &[u8],
    func_body_index: usize,
) -> Vec<ValType> {
    let parser = Parser::new(0);
    let mut local_variables = Vec::new();
    let mut current_func = 0;

    for payload in parser.parse_all(wasm_bytes) {
        if let Ok(Payload::CodeSectionEntry(body)) = payload {
            if current_func == func_body_index {
                let locals_reader = body.get_locals_reader().expect("Failed to read locals");
                for (count, local_type) in locals_reader.into_iter().flatten() {
                    local_variables.extend(std::iter::repeat(local_type).take(count as usize));
                }
                break;
            }
            current_func += 1;
        }
    }
    local_variables
}

fn extract_all_variables(
    wasm_bytes: &[u8],
    func_index: usize,
    function_signatures: &[Vec<ValType>],
    func_type_map: &[usize],
) -> (Vec<ValType>, Vec<ValType>) {
    let params = extract_function_params(func_index, function_signatures, func_type_map);
    let locals = extract_local_variables(wasm_bytes, func_index);
    (params, locals)
}




// Define a struct to hold shared memory information
#[derive(Debug, Clone)]
struct SharedMemoryRegion {
    name: String,
    size: usize,
    offset: u32,
}

#[derive(Debug, Clone)]
struct SharedMemoryInfo {
    kernel_to_regions: HashMap<String, Vec<SharedMemoryRegion>>,
}

impl SharedMemoryInfo {
    fn new() -> Self {
        SharedMemoryInfo {
            kernel_to_regions: HashMap::new(),
        }
    }

    fn is_shared_memory_address(&self, kernel_name: &str, address: u32) -> Option<&SharedMemoryRegion> {
        if let Some(regions) = self.kernel_to_regions.get(kernel_name) {
            for region in regions {
                let end_offset = region.offset + (region.size * 4) as u32;
                if address >= region.offset && address < end_offset {
                    return Some(region);
                }
            }
        }
        None
    }
}
