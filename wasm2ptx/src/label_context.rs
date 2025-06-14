//==============================================================================
// Control Flow Label Management Container
//==============================================================================
//
// This module provides the data structures for tracking WebAssembly's 
// structured control flow constructs during translation to PTX's unstructured
// jumps. The LabelContext serves as a container that:
//
// 1. Stores Label Information: Maintains a stack of LabelFrames with start/end
//    labels and their control flow type (Block, Loop, If).
//
// 2. Enables Branch Resolution: Used by branch handlers to resolve relative
//    branch depths to concrete label targets.
//
// The actual label generation happens in operator handlers:
// - wasm2ptx/src/operators/loops/loop.rs:handle_loop() - creates loop labels
// - wasm2ptx/src/operators/loops/block.rs:handle_block() - creates block labels
// - wasm2ptx/src/operators/controlflow/if.rs:handle_if() - creates if labels
//
// Nested instruction detection is managed by:
// - wasm2ptx/src/translator.rs:get_nested_instructions() - finds instructions
//   within control structures
//
// Branch resolution uses this context in:
// - wasm2ptx/src/operators/loops/br.rs:handle_br() - for unconditional branches
// - wasm2ptx/src/operators/loops/brif.rs:handle_br_if() - for conditional branches
//
// This separation of concerns allows for clean handling of WebAssembly's
// structured control flow when translating to PTX's unstructured jumps.
//==============================================================================

#[derive(Clone, Debug)]
pub enum LabelKind {
    Block,
    Loop,
    If,
}

#[derive(Clone, Debug)] 
pub struct LabelFrame {
    pub kind: LabelKind,
    pub start: String,
    pub end: String,
}


#[derive(Clone, Debug)]
pub struct LabelContext {
    pub label_stack: Vec<LabelFrame>,
}


impl LabelContext {
    pub fn new() -> Self {
        LabelContext {
            label_stack: Vec::new(),
        }
    }

    pub fn push(&mut self, frame: LabelFrame) {
        self.label_stack.push(frame);
    }

    pub fn pop(&mut self) -> Option<LabelFrame> {
        self.label_stack.pop()
    }
    
    pub fn len(&self) -> usize {
        self.label_stack.len()
    }

    pub fn index(&self, index: usize) -> &LabelFrame {
        &self.label_stack[index]
    }

}