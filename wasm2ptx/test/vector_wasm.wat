(module $vector_wasm.wasm
  (type (;0;) (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)))
  (func $vector_add_kernel (type 0) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 6
      local.get 3
      i32.mul
      local.get 0
      i32.add
      local.tee 3
      local.get 12
      i32.ge_u
      br_if 0 (;@1;)
      local.get 11
      local.get 3
      i32.const 2
      i32.shl
      local.tee 3
      i32.add
      local.get 10
      local.get 3
      i32.add
      i32.load
      local.get 9
      local.get 3
      i32.add
      i32.load
      i32.add
      i32.store
    end)
  (func $vector_add_loop_kernel (type 0) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    (local i32)
    local.get 6
    local.get 8
    i32.mul
    local.get 7
    i32.mul
    local.tee 7
    i32.const 2
    i32.shl
    local.set 13
    local.get 6
    local.get 3
    i32.mul
    local.get 0
    i32.add
    local.tee 8
    i32.const 2
    i32.shl
    local.set 6
    loop  ;; label = @1
      block  ;; label = @2
        local.get 8
        local.get 12
        i32.lt_u
        br_if 0 (;@2;)
        return
      end
      local.get 11
      local.get 6
      i32.add
      local.get 10
      local.get 6
      i32.add
      i32.load
      local.get 9
      local.get 6
      i32.add
      i32.load
      i32.add
      i32.store
      local.get 6
      local.get 13
      i32.add
      local.set 6
      local.get 8
      local.get 7
      i32.add
      local.set 8
      br 0 (;@1;)
    end)
  (memory (;0;) 16)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1048576))
  (global (;2;) i32 (i32.const 1048576))
  (export "memory" (memory 0))
  (export "vector_add_kernel" (func $vector_add_kernel))
  (export "vector_add_loop_kernel" (func $vector_add_loop_kernel))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2)))
