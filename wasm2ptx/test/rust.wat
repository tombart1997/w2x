(module $rust.wasm
  (type (;0;) (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)))
  (type (;3;) (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)))
  (type (;4;) (func))
  (func $matmul_shared_kernel (type 0) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 f32 i32 f32 i32)
    local.get 0
    local.get 7
    i32.const 5
    i32.shl
    local.get 9
    i32.add
    local.tee 12
    local.get 5
    i32.mul
    i32.const 2
    i32.shl
    i32.add
    local.get 8
    i32.const 2
    i32.shl
    i32.add
    local.set 13
    local.get 5
    i32.const 31
    i32.add
    i32.const 5
    i32.shr_u
    local.set 14
    local.get 11
    local.get 9
    i32.const 5
    i32.shl
    local.tee 15
    local.get 8
    i32.add
    local.tee 16
    i32.const 2
    i32.shl
    local.tee 7
    i32.add
    local.set 17
    local.get 10
    local.get 7
    i32.add
    local.set 18
    local.get 1
    local.get 6
    i32.const 5
    i32.shl
    local.get 8
    i32.add
    local.tee 19
    i32.const 2
    i32.shl
    i32.add
    local.set 20
    f32.const 0x0p+0 (;=0;)
    local.set 21
    i32.const -1
    local.set 6
    local.get 16
    i32.const 512
    i32.lt_u
    local.set 22
    i32.const 0
    local.set 1
    block  ;; label = @1
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                local.get 14
                i32.ne
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 19
                  local.get 4
                  i32.ge_u
                  br_if 0 (;@7;)
                  local.get 12
                  local.get 3
                  i32.lt_u
                  br_if 2 (;@5;)
                end
                return
              end
              local.get 1
              i32.const 5
              i32.shl
              local.set 7
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 12
                    local.get 3
                    i32.ge_u
                    br_if 0 (;@8;)
                    local.get 7
                    local.get 8
                    i32.add
                    local.get 5
                    i32.lt_u
                    br_if 1 (;@7;)
                  end
                  f32.const 0x0p+0 (;=0;)
                  local.set 23
                  local.get 22
                  i32.eqz
                  br_if 1 (;@6;)
                  br 4 (;@3;)
                end
                local.get 22
                br_if 2 (;@4;)
              end
              local.get 16
              call $_ZN4core9panicking18panic_bounds_check17h0e5544bfd55094cbE
              unreachable
            end
            local.get 2
            local.get 12
            local.get 4
            i32.mul
            i32.const 2
            i32.shl
            i32.add
            local.get 19
            i32.const 2
            i32.shl
            i32.add
            local.get 21
            f32.store
            return
          end
          local.get 13
          local.get 7
          i32.const 2
          i32.shl
          i32.add
          f32.load
          local.set 23
        end
        local.get 18
        local.get 23
        f32.store
        f32.const 0x0p+0 (;=0;)
        local.set 23
        block  ;; label = @3
          local.get 19
          local.get 4
          i32.ge_u
          br_if 0 (;@3;)
          local.get 7
          local.get 9
          i32.add
          local.tee 7
          local.get 5
          i32.ge_u
          br_if 0 (;@3;)
          local.get 20
          local.get 7
          local.get 4
          i32.mul
          i32.const 2
          i32.shl
          i32.add
          f32.load
          local.set 23
        end
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 17
        local.get 23
        f32.store
        i32.const 0
        local.set 0
        i32.const 0
        i32.const 1
        i32.store offset=4294967280
        i32.const 0
        i32.load offset=4294967280
        drop
        loop  ;; label = @3
          block  ;; label = @4
            local.get 0
            local.tee 7
            i32.const 32
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            i32.const 1
            i32.store offset=4294967280
            i32.const 0
            i32.load offset=4294967280
            drop
            local.get 6
            i32.const 32
            i32.add
            local.set 6
            br 2 (;@2;)
          end
          local.get 6
          local.get 7
          i32.const 1
          i32.add
          local.tee 0
          i32.add
          local.get 5
          i32.ge_u
          br_if 0 (;@3;)
          local.get 7
          local.get 15
          i32.or
          local.tee 24
          i32.const 511
          i32.gt_u
          br_if 2 (;@1;)
          block  ;; label = @4
            local.get 7
            i32.const 5
            i32.shl
            local.get 8
            i32.add
            local.tee 7
            i32.const 512
            i32.ge_u
            br_if 0 (;@4;)
            local.get 21
            local.get 10
            local.get 24
            i32.const 2
            i32.shl
            i32.add
            f32.load
            local.get 11
            local.get 7
            i32.const 2
            i32.shl
            i32.add
            f32.load
            f32.mul
            f32.add
            local.set 21
            br 1 (;@3;)
          end
        end
      end
      local.get 7
      call $_ZN4core9panicking18panic_bounds_check17h0e5544bfd55094cbE
      unreachable
    end
    local.get 24
    call $_ZN4core9panicking18panic_bounds_check17h0e5544bfd55094cbE
    unreachable)
  (func $_ZN4core9panicking18panic_bounds_check17h0e5544bfd55094cbE (type 1) (param i32)
    call $_ZN4core9panicking9panic_fmt17h6f4dae69dcc1a6d2E
    unreachable)
  (func $vector_add_kernel (type 2) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
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
  (func $vector_sub_kernel (type 2) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
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
      local.get 9
      local.get 3
      i32.add
      i32.load
      local.get 10
      local.get 3
      i32.add
      i32.load
      i32.sub
      i32.store
    end)
  (func $vector_add_loop_kernel (type 2) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
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
  (func $vector_scale_kernel (type 2) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
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
      local.get 9
      local.get 3
      i32.add
      i32.load
      local.get 10
      i32.mul
      i32.store
    end)
  (func $matrix_mul_kernel (type 3) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
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
  (func $matrix_transpose_kernel (type 2) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 7
      local.get 4
      i32.mul
      local.get 1
      i32.add
      local.tee 4
      local.get 11
      i32.ge_u
      br_if 0 (;@1;)
      local.get 6
      local.get 3
      i32.mul
      local.get 0
      i32.add
      local.tee 7
      local.get 12
      i32.ge_u
      br_if 0 (;@1;)
      local.get 10
      local.get 7
      local.get 11
      i32.mul
      i32.const 2
      i32.shl
      i32.add
      local.get 4
      i32.const 2
      i32.shl
      i32.add
      local.get 9
      local.get 4
      local.get 12
      i32.mul
      i32.const 2
      i32.shl
      i32.add
      local.get 7
      i32.const 2
      i32.shl
      i32.add
      i32.load
      i32.store
    end)
  (func $dot_product_kernel (type 2) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
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
      i32.mul
      i32.store
    end)
  (func $relu_kernel (type 0) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    (local f32)
    block  ;; label = @1
      local.get 6
      local.get 3
      i32.mul
      local.get 0
      i32.add
      local.tee 3
      local.get 11
      i32.ge_u
      br_if 0 (;@1;)
      local.get 10
      local.get 3
      i32.const 2
      i32.shl
      local.tee 3
      i32.add
      local.get 9
      local.get 3
      i32.add
      f32.load
      local.tee 12
      f32.const 0x0p+0 (;=0;)
      local.get 12
      f32.const 0x0p+0 (;=0;)
      f32.gt
      select
      f32.store
    end)
  (func $max_pooling_2d_kernel (type 3) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    (local i32 f32 f32)
    block  ;; label = @1
      local.get 12
      local.get 13
      i32.lt_u
      br_if 0 (;@1;)
      local.get 14
      i32.eqz
      br_if 0 (;@1;)
      local.get 13
      i32.const -1
      i32.add
      local.get 11
      i32.ge_u
      br_if 0 (;@1;)
      local.get 12
      local.get 13
      i32.sub
      local.get 14
      i32.div_u
      local.set 15
      local.get 7
      local.get 4
      i32.mul
      local.get 1
      i32.add
      local.tee 1
      local.get 11
      local.get 13
      i32.sub
      local.get 14
      i32.div_u
      i32.const 1
      i32.add
      i32.ge_u
      br_if 0 (;@1;)
      local.get 6
      local.get 3
      i32.mul
      local.get 0
      i32.add
      local.tee 6
      local.get 15
      i32.const 1
      i32.add
      local.tee 3
      i32.ge_u
      br_if 0 (;@1;)
      local.get 9
      local.get 14
      local.get 12
      local.get 1
      i32.mul
      i32.const 2
      i32.shl
      local.get 6
      i32.const 2
      i32.shl
      i32.add
      i32.mul
      i32.add
      local.set 7
      local.get 12
      i32.const 2
      i32.shl
      local.set 4
      f32.const -inf (;=-inf;)
      local.set 16
      i32.const 0
      local.set 11
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 11
            local.get 13
            i32.eq
            br_if 0 (;@4;)
            local.get 13
            local.set 12
            local.get 7
            local.set 14
            loop  ;; label = @5
              local.get 12
              i32.eqz
              br_if 2 (;@3;)
              local.get 14
              f32.load
              local.tee 17
              local.get 16
              local.get 17
              local.get 16
              f32.gt
              select
              local.set 16
              local.get 12
              i32.const -1
              i32.add
              local.set 12
              local.get 14
              i32.const 4
              i32.add
              local.set 14
              br 0 (;@5;)
            end
          end
          local.get 10
          local.get 3
          local.get 1
          i32.mul
          i32.const 2
          i32.shl
          i32.add
          local.get 6
          i32.const 2
          i32.shl
          i32.add
          local.get 16
          f32.store
          br 2 (;@1;)
        end
        local.get 7
        local.get 4
        i32.add
        local.set 7
        local.get 11
        i32.const 1
        i32.add
        local.set 11
        br 0 (;@2;)
      end
    end)
  (func $softmax_kernel (type 2) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    (local f32 f32 f32)
    block  ;; label = @1
      local.get 7
      local.get 4
      i32.mul
      local.get 1
      i32.add
      local.tee 4
      local.get 11
      i32.ge_u
      br_if 0 (;@1;)
      local.get 9
      local.get 4
      local.get 12
      i32.mul
      local.tee 11
      i32.const 2
      i32.shl
      i32.add
      local.set 7
      f32.const -inf (;=-inf;)
      local.set 13
      local.get 12
      local.set 4
      loop  ;; label = @2
        block  ;; label = @3
          local.get 4
          br_if 0 (;@3;)
          local.get 10
          local.get 11
          i32.const 2
          i32.shl
          local.tee 4
          i32.add
          local.set 7
          local.get 9
          local.get 4
          i32.add
          local.set 1
          f32.const 0x0p+0 (;=0;)
          local.set 14
          local.get 12
          local.set 4
          loop  ;; label = @4
            block  ;; label = @5
              local.get 4
              br_if 0 (;@5;)
              local.get 10
              local.get 11
              i32.const 2
              i32.shl
              i32.add
              local.set 4
              loop  ;; label = @6
                local.get 12
                i32.eqz
                br_if 5 (;@1;)
                local.get 4
                local.get 4
                f32.load
                local.get 14
                f32.div
                f32.store
                local.get 12
                i32.const -1
                i32.add
                local.set 12
                local.get 4
                i32.const 4
                i32.add
                local.set 4
                br 0 (;@6;)
              end
            end
            local.get 7
            f32.const 0x1.6p+6 (;=88;)
            f32.const -0x1.6p+6 (;=-88;)
            local.get 1
            f32.load
            local.get 13
            f32.sub
            local.tee 15
            local.get 15
            f32.const -0x1.6p+6 (;=-88;)
            f32.lt
            select
            local.get 15
            f32.const 0x1.6p+6 (;=88;)
            f32.gt
            select
            local.tee 15
            local.get 15
            f32.const 0x1p-1 (;=0.5;)
            f32.mul
            local.get 15
            f32.const 0x1.555714p-3 (;=0.16667;)
            f32.mul
            local.get 15
            f32.const 0x1.555608p-5 (;=0.041667;)
            f32.mul
            f32.const 0x1p+0 (;=1;)
            f32.add
            f32.mul
            f32.const 0x1p+0 (;=1;)
            f32.add
            f32.mul
            f32.const 0x1p+0 (;=1;)
            f32.add
            f32.mul
            f32.const 0x1p+0 (;=1;)
            f32.add
            local.tee 15
            f32.store
            local.get 14
            local.get 15
            f32.add
            local.set 14
            local.get 4
            i32.const -1
            i32.add
            local.set 4
            local.get 7
            i32.const 4
            i32.add
            local.set 7
            local.get 1
            i32.const 4
            i32.add
            local.set 1
            br 0 (;@4;)
          end
        end
        local.get 7
        f32.load
        local.tee 15
        local.get 13
        local.get 15
        local.get 13
        f32.gt
        select
        local.set 13
        local.get 4
        i32.const -1
        i32.add
        local.set 4
        local.get 7
        i32.const 4
        i32.add
        local.set 7
        br 0 (;@2;)
      end
    end)
  (func $_ZN4core9panicking9panic_fmt17h6f4dae69dcc1a6d2E (type 4)
    loop  ;; label = @1
      br 0 (;@1;)
    end)
  (memory (;0;) 16)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1048576))
  (global (;2;) i32 (i32.const 1048576))
  (export "memory" (memory 0))
  (export "matmul_shared_kernel" (func $matmul_shared_kernel))
  (export "vector_add_kernel" (func $vector_add_kernel))
  (export "vector_sub_kernel" (func $vector_sub_kernel))
  (export "vector_add_loop_kernel" (func $vector_add_loop_kernel))
  (export "vector_scale_kernel" (func $vector_scale_kernel))
  (export "matrix_mul_kernel" (func $matrix_mul_kernel))
  (export "matrix_transpose_kernel" (func $matrix_transpose_kernel))
  (export "dot_product_kernel" (func $dot_product_kernel))
  (export "relu_kernel" (func $relu_kernel))
  (export "max_pooling_2d_kernel" (func $max_pooling_2d_kernel))
  (export "softmax_kernel" (func $softmax_kernel))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2)))
