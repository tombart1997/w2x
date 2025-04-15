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

    pub fn top(&self) -> Option<&LabelFrame> {
        self.label_stack.last()
    }
    
    pub fn len(&self) -> usize {
        self.label_stack.len()
    }
    pub fn is_empty(&self) -> bool {
        self.label_stack.is_empty()
    }

    pub fn index(&self, index: usize) -> &LabelFrame {
        &self.label_stack[index]
    }

}