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