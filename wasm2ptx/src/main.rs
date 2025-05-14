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
use crate::ir::{WasmOperator, convert_wasm_operator};
use crate::kernel_detector::detect_kernel;  
use crate::ptx_module::PTXModule;
use crate::label_context::{LabelContext, LabelKind, LabelFrame};

fn main() {
    env_logger::init();
    let wasm_bytes = fs::read("test/go.wasm").expect("Failed to read input.wasm");
    let mut ptx_module = PTXModule::new(".version 8.0".to_string(), ".target sm_80".to_string());
    let parser = Parser::new(0);
    let mut ptx_code = String::new();
    ptx_code.push_str(".version 8.0\n.target sm_80\n\n");
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
    for (export_idx, kernel_name) in exported_funcs {
        let body_idx = export_idx - func_index_offset;
        let ops = &func_bodies[body_idx as usize];
        let (params, locals) = extract_all_variables(
            &wasm_bytes, 
            body_idx as usize,
            &function_signatures, 
            &func_type_map,
        );
        let all_variables = [params.clone(), locals.clone()].concat();
        let kernel_info = detect_kernel(&kernel_name);
        if kernel_info.is_kernel {
            let ops_converted: Vec<WasmOperator> = ops
            .iter()
            .map(|op| convert_wasm_operator(op, &all_variables.as_slice(), kernel_info.first_data_param, true))
            .collect();
            let entry_point = translator::translate_to_ptx(&ops_converted, &kernel_info, params.len(), locals.len(), &mut ptx_module);
            ptx_module.add_entry_point(entry_point);
        } else {
            println!("Skipping non-kernel function: {}", kernel_name);
        }
    }
    let ptx_code = ptx_module.generate_ptx_string();
    fs::write("output.ptx", ptx_code).expect("Failed writing PTX");
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