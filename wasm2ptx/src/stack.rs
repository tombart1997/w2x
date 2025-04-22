
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
        println!("Push: {:?}, with type {:?}", reg, reg_type);
        self.stack.push_front((reg, reg_type));
    }

    pub fn pop(&mut self) -> Option<(u32, RegisterType)> {
        self.stack.pop_front()
    }

}

