//==============================================================================
// WebAssembly Stack Simulation
//==============================================================================
//
// This module implements a virtual stack that simulates WebAssembly's
// stack-based execution model within PTX's register-based architecture.
// The Stack provides:
//
// 1. Value Tracking: Maintains the data flow through WASM operations by
//    tracking which register holds each value pushed to or popped from the
//    stack.
//
// 2. Type Preservation: Ensures proper typing of values as they move through
//    stack operations, critical for generating type-correct PTX instructions.
//
// 3. Register Mapping: Creates the bridge between stack positions and actual
//    PTX registers, enabling the translation of stack manipulations to
//    register operations.
//
// This simulation is necessary because WASM operates on an implicit stack while
// PTX requires explicit register references for all operations. The Stack class
// maintains this mapping to generate efficient register-based code from
// stack-based WebAssembly.
//==============================================================================

use std::collections::VecDeque;
use crate::memory::RegisterType;

pub struct Stack {
    stack: VecDeque<(u32, RegisterType)>,
}

impl Stack {
    pub fn new() -> Self {
        Stack {
            stack: VecDeque::new(),
        }
    }

    pub fn push(&mut self, reg: u32, reg_type: RegisterType) {
        self.stack.push_front((reg, reg_type));
    }

    pub fn pop(&mut self) -> Option<(u32, RegisterType)> {
        self.stack.pop_front()
    }
}

