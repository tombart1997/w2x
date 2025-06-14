//==============================================================================
// WASM to PTX Compiler Starting Point
//==============================================================================
//
// This module serves as the starting point for the WebAssembly to PTX compiler,
// orchestrating the complete translation process:
//
// 1. File Processing: Locates and reads WebAssembly (.wasm) files from a
//    directory, creating output directories for each module.
//
// 2. WASM Parsing: Uses wasmparser to extract function signatures, exports,
//    bodies, and type information from the WebAssembly binary.
//
// 3. Kernel Detection: Identifies which exported functions represent CUDA
//    kernels based on naming conventions and parameter patterns.
//
// 4. Translation Pipeline:
//    a. Converts WASM operators to internal IR
//    b. Translates IR to PTX using the translator module
//    c. Generates complete PTX modules with kernel entry points
//
// 5. Output Generation: Writes the resulting PTX code to files that can be
//    loaded by CUDA applications at runtime.
//
// The compiler maintains separate stages to allow for clean separation of
// concerns while managing the complex translation from WebAssembly's stack-based
// virtual machine to PTX's register-based GPU assembly language.
//==============================================================================
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
use std::path::Path;
use std::io;
use std::str;
use crate::ir::{WasmOperator, convert_wasm_operator};
use crate::kernel_detector::detect_kernel;  
use crate::ptx_module::PTXModule;

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
        _ => {}
        }
    }
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
                .map(|op| convert_wasm_operator(op, &all_variables.as_slice(), true))
                .collect();
                
            let entry_point: ptx_module::PTXEntryPoint = translator::translate_to_ptx(&ops_converted, &kernel_info, params.len(), locals.len(), &mut ptx_module);
            ptx_module.add_entry_point(entry_point);
            let ptx_code = ptx_module.generate_ptx_string();
            let ptx_filename = format!("{}.ptx", function_name);
            let ptx_path = output_dir.join(ptx_filename);
            fs::write(&ptx_path, ptx_code)?;
        }
    }
    
    Ok(())
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



