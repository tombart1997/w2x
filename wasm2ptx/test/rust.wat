(module $rust.wasm
  (type (;0;) (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)))
  (type (;1;) (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)))
  (type (;2;) (func))
  (type (;3;) (func (result i32)))
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
  (func $matrix_mul_kernel (type 1) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    (local i32)
    block  ;; label = @1
      local.get 7
      local.get 4
      i32.mul
      local.get 1
      i32.add
      local.tee 15
      local.get 12
      i32.ge_u
      br_if 0 (;@1;)
      local.get 6
      local.get 3
      i32.mul
      local.get 0
      i32.add
      local.tee 3
      local.get 14
      i32.ge_u
      br_if 0 (;@1;)
      local.get 14
      i32.const 2
      i32.shl
      local.set 12
      local.get 10
      local.get 3
      i32.const 2
      i32.shl
      i32.add
      local.set 4
      local.get 9
      local.get 15
      local.get 13
      i32.mul
      i32.const 2
      i32.shl
      i32.add
      local.set 7
      i32.const 0
      local.set 1
      loop  ;; label = @2
        block  ;; label = @3
          local.get 13
          br_if 0 (;@3;)
          local.get 11
          local.get 15
          local.get 14
          i32.mul
          i32.const 2
          i32.shl
          i32.add
          local.get 3
          i32.const 2
          i32.shl
          i32.add
          local.get 1
          i32.store
          br 2 (;@1;)
        end
        local.get 13
        i32.const -1
        i32.add
        local.set 13
        local.get 4
        i32.load
        local.get 7
        i32.load
        i32.mul
        local.get 1
        i32.add
        local.set 1
        local.get 7
        i32.const 4
        i32.add
        local.set 7
        local.get 4
        local.get 12
        i32.add
        local.set 4
        br 0 (;@2;)
      end
    end)
  (func $vector_add_shared_kernel (type 0) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.const 255
      i32.gt_u
      br_if 0 (;@1;)
      local.get 6
      local.get 3
      i32.mul
      local.get 0
      i32.add
      local.tee 3
      local.get 12
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 2
      i32.shl
      local.tee 6
      i32.const 1048840
      i32.add
      local.get 9
      local.get 3
      i32.const 2
      i32.shl
      local.tee 0
      i32.add
      i32.load
      local.tee 3
      i32.store
      local.get 6
      i32.const 1049864
      i32.add
      local.get 10
      local.get 0
      i32.add
      i32.load
      local.tee 6
      i32.store
      local.get 11
      local.get 0
      i32.add
      local.get 6
      local.get 3
      i32.add
      i32.store
    end)
  (func $__barrier_sync (type 2))
  (func $__shared_mem_metadata (type 3) (result i32)
    i32.const 1048576)
  (memory (;0;) 17)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1050888))
  (global (;2;) i32 (i32.const 1050896))
  (export "memory" (memory 0))
  (export "vector_add_kernel" (func $vector_add_kernel))
  (export "vector_add_loop_kernel" (func $vector_add_loop_kernel))
  (export "matrix_mul_kernel" (func $matrix_mul_kernel))
  (export "vector_add_shared_kernel" (func $vector_add_shared_kernel))
  (export "__barrier_sync" (func $__barrier_sync))
  (export "__shared_mem_metadata" (func $__shared_mem_metadata))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (data $.rodata (i32.const 1048576) "{\0a      \22kernels\22: [\0a        {\0a          \22name\22: \22vector_add_shared_kernel\22,\0a          \22shared_memory\22: [\0a            {\22name\22:\22SHARED_A\22,\22size\22:256,\22offset\22:1048700},\0a            {\22name\22:\22SHARED_B\22,\22size\22:256,\22offset\22:1049724}\0a          ]\0a        }\0a      ]\0a    }"))
