(module $vector_runner-77572b77216d28d9.wasm
  (type (;0;) (func))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32 i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32) (result i32)))
  (type (;4;) (func (param i32 i32)))
  (type (;5;) (func (result i32)))
  (type (;6;) (func (param i32) (result i32)))
  (type (;7;) (func (param i32 i32 i32)))
  (type (;8;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;9;) (func (param i32 i32 i32 i32)))
  (import "env" "break_down_matrix_mul" (func $break_down_matrix_mul (type 5)))
  (func $_ZN3std3sys9backtrace28__rust_begin_short_backtrace17ha38420a5a5025315E (type 1) (param i32)
    local.get 0
    call_indirect (type 0))
  (func $_ZN13vector_runner4main17h9e310ceb15120183E (type 0)
    (local i32 i32 i32 i32 i32 i64 i64 i64 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 112
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i32.const 14
    i32.add
    i32.const 1
    i32.add
    local.set 1
    call $break_down_matrix_mul
    local.set 2
    i32.const 0
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                loop  ;; label = @7
                  local.get 3
                  i32.const 9
                  i32.eq
                  br_if 1 (;@6;)
                  local.get 0
                  local.get 2
                  local.get 3
                  i32.const 1
                  i32.shl
                  i32.add
                  i32.load16_u align=1
                  i32.store16 offset=14 align=1
                  local.get 0
                  i32.const 3
                  i32.store offset=20
                  local.get 0
                  i32.const 1048600
                  i32.store offset=16
                  local.get 0
                  i64.const 2
                  i64.store offset=28 align=4
                  local.get 0
                  i32.const 1
                  i32.store offset=52
                  local.get 0
                  local.get 1
                  i32.store offset=48
                  local.get 0
                  i32.const 1
                  i32.store offset=44
                  local.get 0
                  local.get 0
                  i32.const 40
                  i32.add
                  i32.store offset=24
                  local.get 0
                  local.get 0
                  i32.const 14
                  i32.add
                  i32.store offset=40
                  local.get 0
                  i32.const 6
                  i32.store offset=60
                  local.get 0
                  i32.const 1050528
                  i32.store offset=56
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load8_u offset=1051448
                      br_table 0 (;@9;) 0 (;@9;) 5 (;@4;) 1 (;@8;) 0 (;@9;)
                    end
                    i32.const 0
                    i32.const 2
                    i32.store8 offset=1051448
                    i32.const 0
                    i32.load8_u offset=1051392
                    drop
                    i32.const 1024
                    call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17hd2421ed15302c503E
                    local.tee 4
                    i32.eqz
                    br_if 3 (;@5;)
                    i32.const 0
                    i32.const 3
                    i32.store8 offset=1051448
                    i32.const 0
                    local.get 4
                    i32.store offset=1051432
                    i32.const 0
                    i64.const 4398046511104
                    i64.store offset=1051424
                    i32.const 0
                    i64.const 0
                    i64.store offset=1051408
                    i32.const 0
                    i32.const 0
                    i32.store8 offset=1051440
                    i32.const 0
                    i32.const 0
                    i32.store offset=1051436
                    i32.const 0
                    i32.const 0
                    i32.store8 offset=1051420
                    i32.const 0
                    i32.const 0
                    i32.store offset=1051416
                  end
                  block  ;; label = @8
                    i32.const 0
                    i64.load offset=1051464
                    local.tee 5
                    i64.const 0
                    i64.ne
                    br_if 0 (;@8;)
                    i32.const 0
                    i64.load offset=1051472
                    local.set 6
                    loop  ;; label = @9
                      local.get 6
                      i64.const -1
                      i64.eq
                      br_if 6 (;@3;)
                      i32.const 0
                      local.get 6
                      i64.const 1
                      i64.add
                      local.tee 5
                      i32.const 0
                      i64.load offset=1051472
                      local.tee 7
                      local.get 7
                      local.get 6
                      i64.eq
                      local.tee 4
                      select
                      i64.store offset=1051472
                      local.get 7
                      local.set 6
                      local.get 4
                      i32.eqz
                      br_if 0 (;@9;)
                    end
                    i32.const 0
                    local.get 5
                    i64.store offset=1051464
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 5
                        i32.const 0
                        i64.load offset=1051408
                        i64.eq
                        br_if 0 (;@10;)
                        i32.const 0
                        i32.load8_u offset=1051420
                        local.set 4
                        i32.const 0
                        i32.const 1
                        i32.store8 offset=1051420
                        local.get 0
                        local.get 4
                        i32.store8 offset=72
                        local.get 4
                        i32.eqz
                        br_if 1 (;@9;)
                        local.get 0
                        i64.const 0
                        i64.store offset=100 align=4
                        local.get 0
                        i64.const 17179869185
                        i64.store offset=92 align=4
                        local.get 0
                        i32.const 1050704
                        i32.store offset=88
                        local.get 0
                        i32.const 72
                        i32.add
                        local.get 0
                        i32.const 88
                        i32.add
                        call $_ZN4core9panicking13assert_failed17h1c5f4c6790bfa14cE
                        unreachable
                      end
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=1051416
                        local.tee 4
                        i32.const -1
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 4
                        i32.const 1
                        i32.add
                        local.set 4
                        br 2 (;@8;)
                      end
                      call $_ZN4core6option13expect_failed17hada3d336a83d09a3E
                      unreachable
                    end
                    i32.const 0
                    local.get 5
                    i64.store offset=1051408
                    i32.const 1
                    local.set 4
                  end
                  i32.const 0
                  local.get 4
                  i32.store offset=1051416
                  local.get 0
                  i32.const 1051408
                  i32.store offset=64
                  local.get 0
                  i32.const 4
                  i32.store8 offset=72
                  local.get 0
                  local.get 0
                  i32.const 64
                  i32.add
                  i32.store offset=80
                  local.get 0
                  i32.const 72
                  i32.add
                  i32.const 1049196
                  local.get 0
                  i32.const 16
                  i32.add
                  call $_ZN4core3fmt5write17h2db157f4177a0bcdE
                  local.set 8
                  local.get 0
                  i32.load8_u offset=72
                  local.set 4
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 8
                      br_if 0 (;@9;)
                      i32.const 4
                      local.set 8
                      local.get 0
                      i32.load offset=76
                      local.set 9
                      block  ;; label = @10
                        local.get 4
                        i32.const 4
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 4
                        i32.const 3
                        i32.ne
                        br_if 2 (;@8;)
                      end
                      local.get 9
                      i32.load
                      local.set 4
                      block  ;; label = @10
                        local.get 9
                        i32.const 4
                        i32.add
                        i32.load
                        local.tee 10
                        i32.load
                        local.tee 11
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 4
                        local.get 11
                        call_indirect (type 1)
                      end
                      block  ;; label = @10
                        local.get 10
                        i32.load offset=4
                        local.tee 10
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 4
                        local.get 10
                        call $__rust_dealloc
                      end
                      local.get 9
                      i32.const 12
                      call $__rust_dealloc
                      br 1 (;@8;)
                    end
                    local.get 4
                    i32.const 4
                    i32.eq
                    br_if 6 (;@2;)
                    local.get 0
                    i64.load offset=72
                    local.tee 6
                    i64.const 8
                    i64.shr_u
                    local.set 12
                    local.get 6
                    i32.wrap_i64
                    local.set 8
                  end
                  local.get 0
                  i32.load offset=64
                  local.tee 4
                  local.get 4
                  i32.load offset=8
                  i32.const -1
                  i32.add
                  local.tee 9
                  i32.store offset=8
                  block  ;; label = @8
                    local.get 9
                    br_if 0 (;@8;)
                    local.get 4
                    i32.const 0
                    i32.store8 offset=12
                    local.get 4
                    i64.const 0
                    i64.store
                  end
                  local.get 8
                  i32.const 255
                  i32.and
                  i32.const 4
                  i32.ne
                  br_if 6 (;@1;)
                  local.get 3
                  i32.const 1
                  i32.add
                  local.set 3
                  br 0 (;@7;)
                end
              end
              local.get 0
              i32.const 112
              i32.add
              global.set $__stack_pointer
              return
            end
            unreachable
          end
          local.get 0
          i32.const 0
          i32.store offset=104
          local.get 0
          i32.const 1
          i32.store offset=92
          local.get 0
          i32.const 1051044
          i32.store offset=88
          local.get 0
          i64.const 4
          i64.store offset=96 align=4
          local.get 0
          i32.const 88
          i32.add
          i32.const 1050808
          call $_ZN4core9panicking9panic_fmt17h6f4dae69dcc1a6d2E
          unreachable
        end
        call $_ZN3std6thread8ThreadId3new9exhausted17he9e2f79c8ed76320E
        unreachable
      end
      local.get 0
      i32.const 0
      i32.store offset=104
      local.get 0
      i32.const 1
      i32.store offset=92
      local.get 0
      i32.const 1050648
      i32.store offset=88
      local.get 0
      i64.const 4
      i64.store offset=96 align=4
      local.get 0
      i32.const 88
      i32.add
      i32.const 1050656
      call $_ZN4core9panicking9panic_fmt17h6f4dae69dcc1a6d2E
      unreachable
    end
    local.get 0
    local.get 12
    i64.const 8
    i64.shl
    local.get 8
    i64.extend_i32_u
    i64.const 255
    i64.and
    i64.or
    i64.store offset=64
    local.get 0
    i32.const 2
    i32.store offset=92
    local.get 0
    i32.const 1050496
    i32.store offset=88
    local.get 0
    i64.const 2
    i64.store offset=100 align=4
    local.get 0
    i32.const 2
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 0
    i32.const 64
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=80
    local.get 0
    i32.const 3
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 0
    i32.const 56
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=72
    local.get 0
    local.get 0
    i32.const 72
    i32.add
    i32.store offset=96
    local.get 0
    i32.const 88
    i32.add
    i32.const 1050512
    call $_ZN4core9panicking9panic_fmt17h6f4dae69dcc1a6d2E
    unreachable)
  (func $_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17h827e6c298a6efca8E (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u
            local.tee 3
            i32.const 100
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            local.get 3
            i32.const 100
            i32.div_u
            local.tee 4
            i32.const -100
            i32.mul
            local.get 3
            i32.add
            i32.const 255
            i32.and
            i32.const 1
            i32.shl
            i32.const 1048800
            i32.add
            i32.load16_u align=1
            i32.store16 offset=14 align=1
            i32.const 0
            local.set 0
            br 1 (;@3;)
          end
          i32.const 2
          local.set 0
          local.get 3
          i32.const 10
          i32.ge_u
          br_if 1 (;@2;)
          local.get 3
          local.set 4
        end
        local.get 2
        i32.const 13
        i32.add
        local.get 0
        i32.add
        local.get 4
        i32.const 48
        i32.or
        i32.store8
        br 1 (;@1;)
      end
      i32.const 1
      local.set 0
      local.get 2
      local.get 3
      i32.const 1
      i32.shl
      i32.const 1048800
      i32.add
      i32.load16_u align=1
      i32.store16 offset=14 align=1
    end
    local.get 1
    i32.const 1
    local.get 2
    i32.const 13
    i32.add
    local.get 0
    i32.add
    local.get 0
    i32.const 3
    i32.xor
    call $_ZN4core3fmt9Formatter12pad_integral17hcd2413804a182f1fE
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17hd2421ed15302c503E (type 6) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i64)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.const 244
                    i32.gt_u
                    br_if 0 (;@8;)
                    i32.const 0
                    i32.load offset=1051888
                    local.tee 1
                    i32.const 16
                    local.get 0
                    i32.const 11
                    i32.add
                    i32.const 504
                    i32.and
                    local.get 0
                    i32.const 11
                    i32.lt_u
                    select
                    local.tee 2
                    i32.const 3
                    i32.shr_u
                    local.tee 3
                    i32.shr_u
                    local.tee 0
                    i32.const 3
                    i32.and
                    br_if 1 (;@7;)
                    local.get 2
                    i32.const 0
                    i32.load offset=1051896
                    i32.le_u
                    br_if 7 (;@1;)
                    local.get 0
                    br_if 2 (;@6;)
                    i32.const 0
                    i32.load offset=1051892
                    local.tee 0
                    br_if 3 (;@5;)
                    br 7 (;@1;)
                  end
                  local.get 0
                  i32.const 11
                  i32.add
                  local.tee 3
                  i32.const -8
                  i32.and
                  local.set 2
                  i32.const 0
                  i32.load offset=1051892
                  local.tee 4
                  i32.eqz
                  br_if 6 (;@1;)
                  i32.const 31
                  local.set 5
                  block  ;; label = @8
                    local.get 0
                    i32.const 16777204
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 2
                    i32.const 6
                    local.get 3
                    i32.const 8
                    i32.shr_u
                    i32.clz
                    local.tee 0
                    i32.sub
                    i32.shr_u
                    i32.const 1
                    i32.and
                    local.get 0
                    i32.const 1
                    i32.shl
                    i32.sub
                    i32.const 62
                    i32.add
                    local.set 5
                  end
                  i32.const 0
                  local.get 2
                  i32.sub
                  local.set 3
                  block  ;; label = @8
                    local.get 5
                    i32.const 2
                    i32.shl
                    i32.const 1051480
                    i32.add
                    i32.load
                    local.tee 1
                    br_if 0 (;@8;)
                    i32.const 0
                    local.set 0
                    i32.const 0
                    local.set 6
                    br 4 (;@4;)
                  end
                  i32.const 0
                  local.set 0
                  local.get 2
                  i32.const 0
                  i32.const 25
                  local.get 5
                  i32.const 1
                  i32.shr_u
                  i32.sub
                  local.get 5
                  i32.const 31
                  i32.eq
                  select
                  i32.shl
                  local.set 7
                  i32.const 0
                  local.set 6
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 1
                      local.tee 1
                      i32.load offset=4
                      i32.const -8
                      i32.and
                      local.tee 8
                      local.get 2
                      i32.lt_u
                      br_if 0 (;@9;)
                      local.get 8
                      local.get 2
                      i32.sub
                      local.tee 8
                      local.get 3
                      i32.ge_u
                      br_if 0 (;@9;)
                      local.get 8
                      local.set 3
                      local.get 1
                      local.set 6
                      local.get 8
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 3
                      local.get 1
                      local.set 6
                      local.get 1
                      local.set 0
                      br 6 (;@3;)
                    end
                    local.get 1
                    i32.load offset=20
                    local.tee 8
                    local.get 0
                    local.get 8
                    local.get 1
                    local.get 7
                    i32.const 29
                    i32.shr_u
                    i32.const 4
                    i32.and
                    i32.add
                    i32.const 16
                    i32.add
                    i32.load
                    local.tee 1
                    i32.ne
                    select
                    local.get 0
                    local.get 8
                    select
                    local.set 0
                    local.get 7
                    i32.const 1
                    i32.shl
                    local.set 7
                    local.get 1
                    i32.eqz
                    br_if 4 (;@4;)
                    br 0 (;@8;)
                  end
                end
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.const -1
                    i32.xor
                    i32.const 1
                    i32.and
                    local.get 3
                    i32.add
                    local.tee 7
                    i32.const 3
                    i32.shl
                    local.tee 0
                    i32.const 1051624
                    i32.add
                    local.tee 2
                    local.get 0
                    i32.const 1051632
                    i32.add
                    i32.load
                    local.tee 3
                    i32.load offset=8
                    local.tee 6
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 6
                    local.get 2
                    i32.store offset=12
                    local.get 2
                    local.get 6
                    i32.store offset=8
                    br 1 (;@7;)
                  end
                  i32.const 0
                  local.get 1
                  i32.const -2
                  local.get 7
                  i32.rotl
                  i32.and
                  i32.store offset=1051888
                end
                local.get 3
                local.get 0
                i32.const 3
                i32.or
                i32.store offset=4
                local.get 3
                local.get 0
                i32.add
                local.tee 0
                local.get 0
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 3
                i32.const 8
                i32.add
                return
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  local.get 3
                  i32.shl
                  i32.const 2
                  local.get 3
                  i32.shl
                  local.tee 0
                  i32.const 0
                  local.get 0
                  i32.sub
                  i32.or
                  i32.and
                  i32.ctz
                  local.tee 8
                  i32.const 3
                  i32.shl
                  local.tee 3
                  i32.const 1051624
                  i32.add
                  local.tee 6
                  local.get 3
                  i32.const 1051632
                  i32.add
                  i32.load
                  local.tee 0
                  i32.load offset=8
                  local.tee 7
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 7
                  local.get 6
                  i32.store offset=12
                  local.get 6
                  local.get 7
                  i32.store offset=8
                  br 1 (;@6;)
                end
                i32.const 0
                local.get 1
                i32.const -2
                local.get 8
                i32.rotl
                i32.and
                i32.store offset=1051888
              end
              local.get 0
              local.get 2
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 0
              local.get 2
              i32.add
              local.tee 7
              local.get 3
              local.get 2
              i32.sub
              local.tee 2
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 3
              i32.add
              local.get 2
              i32.store
              block  ;; label = @6
                i32.const 0
                i32.load offset=1051896
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                local.get 1
                i32.const -8
                i32.and
                i32.const 1051624
                i32.add
                local.set 6
                i32.const 0
                i32.load offset=1051904
                local.set 3
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1051888
                    local.tee 8
                    i32.const 1
                    local.get 1
                    i32.const 3
                    i32.shr_u
                    i32.shl
                    local.tee 1
                    i32.and
                    br_if 0 (;@8;)
                    i32.const 0
                    local.get 8
                    local.get 1
                    i32.or
                    i32.store offset=1051888
                    local.get 6
                    local.set 1
                    br 1 (;@7;)
                  end
                  local.get 6
                  i32.load offset=8
                  local.set 1
                end
                local.get 6
                local.get 3
                i32.store offset=8
                local.get 1
                local.get 3
                i32.store offset=12
                local.get 3
                local.get 6
                i32.store offset=12
                local.get 3
                local.get 1
                i32.store offset=8
              end
              i32.const 0
              local.get 7
              i32.store offset=1051904
              i32.const 0
              local.get 2
              i32.store offset=1051896
              local.get 0
              i32.const 8
              i32.add
              return
            end
            local.get 0
            i32.ctz
            i32.const 2
            i32.shl
            i32.const 1051480
            i32.add
            i32.load
            local.tee 6
            i32.load offset=4
            i32.const -8
            i32.and
            local.get 2
            i32.sub
            local.set 3
            local.get 6
            local.set 1
            block  ;; label = @5
              block  ;; label = @6
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 6
                    i32.load offset=16
                    local.tee 0
                    br_if 0 (;@8;)
                    local.get 6
                    i32.load offset=20
                    local.tee 0
                    br_if 0 (;@8;)
                    local.get 1
                    i32.load offset=24
                    local.set 5
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 1
                          i32.load offset=12
                          local.tee 0
                          local.get 1
                          i32.ne
                          br_if 0 (;@11;)
                          local.get 1
                          i32.const 20
                          i32.const 16
                          local.get 1
                          i32.load offset=20
                          local.tee 0
                          select
                          i32.add
                          i32.load
                          local.tee 6
                          br_if 1 (;@10;)
                          i32.const 0
                          local.set 0
                          br 2 (;@9;)
                        end
                        local.get 1
                        i32.load offset=8
                        local.tee 6
                        local.get 0
                        i32.store offset=12
                        local.get 0
                        local.get 6
                        i32.store offset=8
                        br 1 (;@9;)
                      end
                      local.get 1
                      i32.const 20
                      i32.add
                      local.get 1
                      i32.const 16
                      i32.add
                      local.get 0
                      select
                      local.set 7
                      loop  ;; label = @10
                        local.get 7
                        local.set 8
                        local.get 6
                        local.tee 0
                        i32.const 20
                        i32.add
                        local.get 0
                        i32.const 16
                        i32.add
                        local.get 0
                        i32.load offset=20
                        local.tee 6
                        select
                        local.set 7
                        local.get 0
                        i32.const 20
                        i32.const 16
                        local.get 6
                        select
                        i32.add
                        i32.load
                        local.tee 6
                        br_if 0 (;@10;)
                      end
                      local.get 8
                      i32.const 0
                      i32.store
                    end
                    local.get 5
                    i32.eqz
                    br_if 3 (;@5;)
                    block  ;; label = @9
                      local.get 1
                      i32.load offset=28
                      i32.const 2
                      i32.shl
                      i32.const 1051480
                      i32.add
                      local.tee 6
                      i32.load
                      local.get 1
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 16
                      i32.const 20
                      local.get 5
                      i32.load offset=16
                      local.get 1
                      i32.eq
                      select
                      i32.add
                      local.get 0
                      i32.store
                      local.get 0
                      i32.eqz
                      br_if 4 (;@5;)
                      br 3 (;@6;)
                    end
                    local.get 6
                    local.get 0
                    i32.store
                    local.get 0
                    br_if 2 (;@6;)
                    i32.const 0
                    i32.const 0
                    i32.load offset=1051892
                    i32.const -2
                    local.get 1
                    i32.load offset=28
                    i32.rotl
                    i32.and
                    i32.store offset=1051892
                    br 3 (;@5;)
                  end
                  local.get 0
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get 2
                  i32.sub
                  local.tee 6
                  local.get 3
                  local.get 6
                  local.get 3
                  i32.lt_u
                  local.tee 6
                  select
                  local.set 3
                  local.get 0
                  local.get 1
                  local.get 6
                  select
                  local.set 1
                  local.get 0
                  local.set 6
                  br 0 (;@7;)
                end
              end
              local.get 0
              local.get 5
              i32.store offset=24
              block  ;; label = @6
                local.get 1
                i32.load offset=16
                local.tee 6
                i32.eqz
                br_if 0 (;@6;)
                local.get 0
                local.get 6
                i32.store offset=16
                local.get 6
                local.get 0
                i32.store offset=24
              end
              local.get 1
              i32.load offset=20
              local.tee 6
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              local.get 6
              i32.store offset=20
              local.get 6
              local.get 0
              i32.store offset=24
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.const 16
                  i32.lt_u
                  br_if 0 (;@7;)
                  local.get 1
                  local.get 2
                  i32.const 3
                  i32.or
                  i32.store offset=4
                  local.get 1
                  local.get 2
                  i32.add
                  local.tee 2
                  local.get 3
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 2
                  local.get 3
                  i32.add
                  local.get 3
                  i32.store
                  i32.const 0
                  i32.load offset=1051896
                  local.tee 7
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 7
                  i32.const -8
                  i32.and
                  i32.const 1051624
                  i32.add
                  local.set 6
                  i32.const 0
                  i32.load offset=1051904
                  local.set 0
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=1051888
                      local.tee 8
                      i32.const 1
                      local.get 7
                      i32.const 3
                      i32.shr_u
                      i32.shl
                      local.tee 7
                      i32.and
                      br_if 0 (;@9;)
                      i32.const 0
                      local.get 8
                      local.get 7
                      i32.or
                      i32.store offset=1051888
                      local.get 6
                      local.set 7
                      br 1 (;@8;)
                    end
                    local.get 6
                    i32.load offset=8
                    local.set 7
                  end
                  local.get 6
                  local.get 0
                  i32.store offset=8
                  local.get 7
                  local.get 0
                  i32.store offset=12
                  local.get 0
                  local.get 6
                  i32.store offset=12
                  local.get 0
                  local.get 7
                  i32.store offset=8
                  br 1 (;@6;)
                end
                local.get 1
                local.get 3
                local.get 2
                i32.add
                local.tee 0
                i32.const 3
                i32.or
                i32.store offset=4
                local.get 1
                local.get 0
                i32.add
                local.tee 0
                local.get 0
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                br 1 (;@5;)
              end
              i32.const 0
              local.get 2
              i32.store offset=1051904
              i32.const 0
              local.get 3
              i32.store offset=1051896
            end
            local.get 1
            i32.const 8
            i32.add
            return
          end
          block  ;; label = @4
            local.get 0
            local.get 6
            i32.or
            br_if 0 (;@4;)
            i32.const 0
            local.set 6
            i32.const 2
            local.get 5
            i32.shl
            local.tee 0
            i32.const 0
            local.get 0
            i32.sub
            i32.or
            local.get 4
            i32.and
            local.tee 0
            i32.eqz
            br_if 3 (;@1;)
            local.get 0
            i32.ctz
            i32.const 2
            i32.shl
            i32.const 1051480
            i32.add
            i32.load
            local.set 0
          end
          local.get 0
          i32.eqz
          br_if 1 (;@2;)
        end
        loop  ;; label = @3
          local.get 0
          local.get 6
          local.get 0
          i32.load offset=4
          i32.const -8
          i32.and
          local.tee 1
          local.get 2
          i32.sub
          local.tee 8
          local.get 3
          i32.lt_u
          local.tee 5
          select
          local.set 4
          local.get 1
          local.get 2
          i32.lt_u
          local.set 7
          local.get 8
          local.get 3
          local.get 5
          select
          local.set 8
          block  ;; label = @4
            local.get 0
            i32.load offset=16
            local.tee 1
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=20
            local.set 1
          end
          local.get 6
          local.get 4
          local.get 7
          select
          local.set 6
          local.get 3
          local.get 8
          local.get 7
          select
          local.set 3
          local.get 1
          local.set 0
          local.get 1
          br_if 0 (;@3;)
        end
      end
      local.get 6
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        i32.const 0
        i32.load offset=1051896
        local.tee 0
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
        local.get 3
        local.get 0
        local.get 2
        i32.sub
        i32.ge_u
        br_if 1 (;@1;)
      end
      local.get 6
      i32.load offset=24
      local.set 5
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 6
            i32.load offset=12
            local.tee 0
            local.get 6
            i32.ne
            br_if 0 (;@4;)
            local.get 6
            i32.const 20
            i32.const 16
            local.get 6
            i32.load offset=20
            local.tee 0
            select
            i32.add
            i32.load
            local.tee 1
            br_if 1 (;@3;)
            i32.const 0
            local.set 0
            br 2 (;@2;)
          end
          local.get 6
          i32.load offset=8
          local.tee 1
          local.get 0
          i32.store offset=12
          local.get 0
          local.get 1
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 6
        i32.const 20
        i32.add
        local.get 6
        i32.const 16
        i32.add
        local.get 0
        select
        local.set 7
        loop  ;; label = @3
          local.get 7
          local.set 8
          local.get 1
          local.tee 0
          i32.const 20
          i32.add
          local.get 0
          i32.const 16
          i32.add
          local.get 0
          i32.load offset=20
          local.tee 1
          select
          local.set 7
          local.get 0
          i32.const 20
          i32.const 16
          local.get 1
          select
          i32.add
          i32.load
          local.tee 1
          br_if 0 (;@3;)
        end
        local.get 8
        i32.const 0
        i32.store
      end
      block  ;; label = @2
        local.get 5
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 6
            i32.load offset=28
            i32.const 2
            i32.shl
            i32.const 1051480
            i32.add
            local.tee 1
            i32.load
            local.get 6
            i32.eq
            br_if 0 (;@4;)
            local.get 5
            i32.const 16
            i32.const 20
            local.get 5
            i32.load offset=16
            local.get 6
            i32.eq
            select
            i32.add
            local.get 0
            i32.store
            local.get 0
            i32.eqz
            br_if 2 (;@2;)
            br 1 (;@3;)
          end
          local.get 1
          local.get 0
          i32.store
          local.get 0
          br_if 0 (;@3;)
          i32.const 0
          i32.const 0
          i32.load offset=1051892
          i32.const -2
          local.get 6
          i32.load offset=28
          i32.rotl
          i32.and
          i32.store offset=1051892
          br 1 (;@2;)
        end
        local.get 0
        local.get 5
        i32.store offset=24
        block  ;; label = @3
          local.get 6
          i32.load offset=16
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.store offset=16
          local.get 1
          local.get 0
          i32.store offset=24
        end
        local.get 6
        i32.load offset=20
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.store offset=20
        local.get 1
        local.get 0
        i32.store offset=24
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 6
          local.get 2
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 6
          local.get 2
          i32.add
          local.tee 0
          local.get 3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          local.get 3
          i32.add
          local.get 3
          i32.store
          block  ;; label = @4
            local.get 3
            i32.const 256
            i32.lt_u
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17ha51abd6cd7031e06E
            br 2 (;@2;)
          end
          local.get 3
          i32.const 248
          i32.and
          i32.const 1051624
          i32.add
          local.set 2
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=1051888
              local.tee 1
              i32.const 1
              local.get 3
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 3
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 1
              local.get 3
              i32.or
              i32.store offset=1051888
              local.get 2
              local.set 3
              br 1 (;@4;)
            end
            local.get 2
            i32.load offset=8
            local.set 3
          end
          local.get 2
          local.get 0
          i32.store offset=8
          local.get 3
          local.get 0
          i32.store offset=12
          local.get 0
          local.get 2
          i32.store offset=12
          local.get 0
          local.get 3
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 6
        local.get 3
        local.get 2
        i32.add
        local.tee 0
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 6
        local.get 0
        i32.add
        local.tee 0
        local.get 0
        i32.load offset=4
        i32.const 1
        i32.or
        i32.store offset=4
      end
      local.get 6
      i32.const 8
      i32.add
      return
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  i32.const 0
                  i32.load offset=1051896
                  local.tee 0
                  local.get 2
                  i32.ge_u
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1051900
                    local.tee 0
                    local.get 2
                    i32.gt_u
                    br_if 0 (;@8;)
                    i32.const 0
                    local.set 0
                    local.get 2
                    i32.const 65583
                    i32.add
                    local.tee 6
                    i32.const 16
                    i32.shr_u
                    memory.grow
                    local.tee 3
                    i32.const -1
                    i32.eq
                    local.tee 7
                    br_if 7 (;@1;)
                    local.get 3
                    i32.const 16
                    i32.shl
                    local.tee 1
                    i32.eqz
                    br_if 7 (;@1;)
                    i32.const 0
                    i32.const 0
                    i32.load offset=1051912
                    i32.const 0
                    local.get 6
                    i32.const -65536
                    i32.and
                    local.get 7
                    select
                    local.tee 8
                    i32.add
                    local.tee 0
                    i32.store offset=1051912
                    i32.const 0
                    i32.const 0
                    i32.load offset=1051916
                    local.tee 3
                    local.get 0
                    local.get 3
                    local.get 0
                    i32.gt_u
                    select
                    i32.store offset=1051916
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1051908
                          local.tee 3
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 1051608
                          local.set 0
                          loop  ;; label = @12
                            local.get 0
                            i32.load
                            local.tee 6
                            local.get 0
                            i32.load offset=4
                            local.tee 7
                            i32.add
                            local.get 1
                            i32.eq
                            br_if 2 (;@10;)
                            local.get 0
                            i32.load offset=8
                            local.tee 0
                            br_if 0 (;@12;)
                            br 3 (;@9;)
                          end
                        end
                        block  ;; label = @11
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=1051924
                            local.tee 0
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 0
                            local.get 1
                            i32.le_u
                            br_if 1 (;@11;)
                          end
                          i32.const 0
                          local.get 1
                          i32.store offset=1051924
                        end
                        i32.const 0
                        i32.const 4095
                        i32.store offset=1051928
                        i32.const 0
                        local.get 8
                        i32.store offset=1051612
                        i32.const 0
                        local.get 1
                        i32.store offset=1051608
                        i32.const 0
                        i32.const 1051624
                        i32.store offset=1051636
                        i32.const 0
                        i32.const 1051632
                        i32.store offset=1051644
                        i32.const 0
                        i32.const 1051624
                        i32.store offset=1051632
                        i32.const 0
                        i32.const 1051640
                        i32.store offset=1051652
                        i32.const 0
                        i32.const 1051632
                        i32.store offset=1051640
                        i32.const 0
                        i32.const 1051648
                        i32.store offset=1051660
                        i32.const 0
                        i32.const 1051640
                        i32.store offset=1051648
                        i32.const 0
                        i32.const 1051656
                        i32.store offset=1051668
                        i32.const 0
                        i32.const 1051648
                        i32.store offset=1051656
                        i32.const 0
                        i32.const 1051664
                        i32.store offset=1051676
                        i32.const 0
                        i32.const 1051656
                        i32.store offset=1051664
                        i32.const 0
                        i32.const 1051672
                        i32.store offset=1051684
                        i32.const 0
                        i32.const 1051664
                        i32.store offset=1051672
                        i32.const 0
                        i32.const 1051680
                        i32.store offset=1051692
                        i32.const 0
                        i32.const 1051672
                        i32.store offset=1051680
                        i32.const 0
                        i32.const 0
                        i32.store offset=1051620
                        i32.const 0
                        i32.const 1051688
                        i32.store offset=1051700
                        i32.const 0
                        i32.const 1051680
                        i32.store offset=1051688
                        i32.const 0
                        i32.const 1051688
                        i32.store offset=1051696
                        i32.const 0
                        i32.const 1051696
                        i32.store offset=1051708
                        i32.const 0
                        i32.const 1051696
                        i32.store offset=1051704
                        i32.const 0
                        i32.const 1051704
                        i32.store offset=1051716
                        i32.const 0
                        i32.const 1051704
                        i32.store offset=1051712
                        i32.const 0
                        i32.const 1051712
                        i32.store offset=1051724
                        i32.const 0
                        i32.const 1051712
                        i32.store offset=1051720
                        i32.const 0
                        i32.const 1051720
                        i32.store offset=1051732
                        i32.const 0
                        i32.const 1051720
                        i32.store offset=1051728
                        i32.const 0
                        i32.const 1051728
                        i32.store offset=1051740
                        i32.const 0
                        i32.const 1051728
                        i32.store offset=1051736
                        i32.const 0
                        i32.const 1051736
                        i32.store offset=1051748
                        i32.const 0
                        i32.const 1051736
                        i32.store offset=1051744
                        i32.const 0
                        i32.const 1051744
                        i32.store offset=1051756
                        i32.const 0
                        i32.const 1051744
                        i32.store offset=1051752
                        i32.const 0
                        i32.const 1051752
                        i32.store offset=1051764
                        i32.const 0
                        i32.const 1051760
                        i32.store offset=1051772
                        i32.const 0
                        i32.const 1051752
                        i32.store offset=1051760
                        i32.const 0
                        i32.const 1051768
                        i32.store offset=1051780
                        i32.const 0
                        i32.const 1051760
                        i32.store offset=1051768
                        i32.const 0
                        i32.const 1051776
                        i32.store offset=1051788
                        i32.const 0
                        i32.const 1051768
                        i32.store offset=1051776
                        i32.const 0
                        i32.const 1051784
                        i32.store offset=1051796
                        i32.const 0
                        i32.const 1051776
                        i32.store offset=1051784
                        i32.const 0
                        i32.const 1051792
                        i32.store offset=1051804
                        i32.const 0
                        i32.const 1051784
                        i32.store offset=1051792
                        i32.const 0
                        i32.const 1051800
                        i32.store offset=1051812
                        i32.const 0
                        i32.const 1051792
                        i32.store offset=1051800
                        i32.const 0
                        i32.const 1051808
                        i32.store offset=1051820
                        i32.const 0
                        i32.const 1051800
                        i32.store offset=1051808
                        i32.const 0
                        i32.const 1051816
                        i32.store offset=1051828
                        i32.const 0
                        i32.const 1051808
                        i32.store offset=1051816
                        i32.const 0
                        i32.const 1051824
                        i32.store offset=1051836
                        i32.const 0
                        i32.const 1051816
                        i32.store offset=1051824
                        i32.const 0
                        i32.const 1051832
                        i32.store offset=1051844
                        i32.const 0
                        i32.const 1051824
                        i32.store offset=1051832
                        i32.const 0
                        i32.const 1051840
                        i32.store offset=1051852
                        i32.const 0
                        i32.const 1051832
                        i32.store offset=1051840
                        i32.const 0
                        i32.const 1051848
                        i32.store offset=1051860
                        i32.const 0
                        i32.const 1051840
                        i32.store offset=1051848
                        i32.const 0
                        i32.const 1051856
                        i32.store offset=1051868
                        i32.const 0
                        i32.const 1051848
                        i32.store offset=1051856
                        i32.const 0
                        i32.const 1051864
                        i32.store offset=1051876
                        i32.const 0
                        i32.const 1051856
                        i32.store offset=1051864
                        i32.const 0
                        i32.const 1051872
                        i32.store offset=1051884
                        i32.const 0
                        i32.const 1051864
                        i32.store offset=1051872
                        i32.const 0
                        local.get 1
                        i32.store offset=1051908
                        i32.const 0
                        i32.const 1051872
                        i32.store offset=1051880
                        i32.const 0
                        local.get 8
                        i32.const -40
                        i32.add
                        local.tee 0
                        i32.store offset=1051900
                        local.get 1
                        local.get 0
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 1
                        local.get 0
                        i32.add
                        i32.const 40
                        i32.store offset=4
                        i32.const 0
                        i32.const 2097152
                        i32.store offset=1051920
                        br 8 (;@2;)
                      end
                      local.get 3
                      local.get 1
                      i32.ge_u
                      br_if 0 (;@9;)
                      local.get 6
                      local.get 3
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 0
                      i32.load offset=12
                      i32.eqz
                      br_if 3 (;@6;)
                    end
                    i32.const 0
                    i32.const 0
                    i32.load offset=1051924
                    local.tee 0
                    local.get 1
                    local.get 0
                    local.get 1
                    i32.lt_u
                    select
                    i32.store offset=1051924
                    local.get 1
                    local.get 8
                    i32.add
                    local.set 6
                    i32.const 1051608
                    local.set 0
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          loop  ;; label = @12
                            local.get 0
                            i32.load
                            local.tee 7
                            local.get 6
                            i32.eq
                            br_if 1 (;@11;)
                            local.get 0
                            i32.load offset=8
                            local.tee 0
                            br_if 0 (;@12;)
                            br 2 (;@10;)
                          end
                        end
                        local.get 0
                        i32.load offset=12
                        i32.eqz
                        br_if 1 (;@9;)
                      end
                      i32.const 1051608
                      local.set 0
                      block  ;; label = @10
                        loop  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.load
                            local.tee 6
                            local.get 3
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 3
                            local.get 6
                            local.get 0
                            i32.load offset=4
                            i32.add
                            local.tee 6
                            i32.lt_u
                            br_if 2 (;@10;)
                          end
                          local.get 0
                          i32.load offset=8
                          local.set 0
                          br 0 (;@11;)
                        end
                      end
                      i32.const 0
                      local.get 1
                      i32.store offset=1051908
                      i32.const 0
                      local.get 8
                      i32.const -40
                      i32.add
                      local.tee 0
                      i32.store offset=1051900
                      local.get 1
                      local.get 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 1
                      local.get 0
                      i32.add
                      i32.const 40
                      i32.store offset=4
                      i32.const 0
                      i32.const 2097152
                      i32.store offset=1051920
                      local.get 3
                      local.get 6
                      i32.const -32
                      i32.add
                      i32.const -8
                      i32.and
                      i32.const -8
                      i32.add
                      local.tee 0
                      local.get 0
                      local.get 3
                      i32.const 16
                      i32.add
                      i32.lt_u
                      select
                      local.tee 7
                      i32.const 27
                      i32.store offset=4
                      i32.const 0
                      i64.load offset=1051608 align=4
                      local.set 9
                      local.get 7
                      i32.const 16
                      i32.add
                      i32.const 0
                      i64.load offset=1051616 align=4
                      i64.store align=4
                      local.get 7
                      local.get 9
                      i64.store offset=8 align=4
                      i32.const 0
                      local.get 8
                      i32.store offset=1051612
                      i32.const 0
                      local.get 1
                      i32.store offset=1051608
                      i32.const 0
                      local.get 7
                      i32.const 8
                      i32.add
                      i32.store offset=1051616
                      i32.const 0
                      i32.const 0
                      i32.store offset=1051620
                      local.get 7
                      i32.const 28
                      i32.add
                      local.set 0
                      loop  ;; label = @10
                        local.get 0
                        i32.const 7
                        i32.store
                        local.get 0
                        i32.const 4
                        i32.add
                        local.tee 0
                        local.get 6
                        i32.lt_u
                        br_if 0 (;@10;)
                      end
                      local.get 7
                      local.get 3
                      i32.eq
                      br_if 7 (;@2;)
                      local.get 7
                      local.get 7
                      i32.load offset=4
                      i32.const -2
                      i32.and
                      i32.store offset=4
                      local.get 3
                      local.get 7
                      local.get 3
                      i32.sub
                      local.tee 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 7
                      local.get 0
                      i32.store
                      block  ;; label = @10
                        local.get 0
                        i32.const 256
                        i32.lt_u
                        br_if 0 (;@10;)
                        local.get 3
                        local.get 0
                        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17ha51abd6cd7031e06E
                        br 8 (;@2;)
                      end
                      local.get 0
                      i32.const 248
                      i32.and
                      i32.const 1051624
                      i32.add
                      local.set 6
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1051888
                          local.tee 1
                          i32.const 1
                          local.get 0
                          i32.const 3
                          i32.shr_u
                          i32.shl
                          local.tee 0
                          i32.and
                          br_if 0 (;@11;)
                          i32.const 0
                          local.get 1
                          local.get 0
                          i32.or
                          i32.store offset=1051888
                          local.get 6
                          local.set 0
                          br 1 (;@10;)
                        end
                        local.get 6
                        i32.load offset=8
                        local.set 0
                      end
                      local.get 6
                      local.get 3
                      i32.store offset=8
                      local.get 0
                      local.get 3
                      i32.store offset=12
                      local.get 3
                      local.get 6
                      i32.store offset=12
                      local.get 3
                      local.get 0
                      i32.store offset=8
                      br 7 (;@2;)
                    end
                    local.get 0
                    local.get 1
                    i32.store
                    local.get 0
                    local.get 0
                    i32.load offset=4
                    local.get 8
                    i32.add
                    i32.store offset=4
                    local.get 1
                    local.get 2
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get 7
                    i32.const 15
                    i32.add
                    i32.const -8
                    i32.and
                    i32.const -8
                    i32.add
                    local.tee 6
                    local.get 1
                    local.get 2
                    i32.add
                    local.tee 0
                    i32.sub
                    local.set 3
                    local.get 6
                    i32.const 0
                    i32.load offset=1051908
                    i32.eq
                    br_if 3 (;@5;)
                    local.get 6
                    i32.const 0
                    i32.load offset=1051904
                    i32.eq
                    br_if 4 (;@4;)
                    block  ;; label = @9
                      local.get 6
                      i32.load offset=4
                      local.tee 2
                      i32.const 3
                      i32.and
                      i32.const 1
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 6
                      local.get 2
                      i32.const -8
                      i32.and
                      local.tee 2
                      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h0d0f475ea8907bb5E
                      local.get 2
                      local.get 3
                      i32.add
                      local.set 3
                      local.get 6
                      local.get 2
                      i32.add
                      local.tee 6
                      i32.load offset=4
                      local.set 2
                    end
                    local.get 6
                    local.get 2
                    i32.const -2
                    i32.and
                    i32.store offset=4
                    local.get 0
                    local.get 3
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 0
                    local.get 3
                    i32.add
                    local.get 3
                    i32.store
                    block  ;; label = @9
                      local.get 3
                      i32.const 256
                      i32.lt_u
                      br_if 0 (;@9;)
                      local.get 0
                      local.get 3
                      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17ha51abd6cd7031e06E
                      br 6 (;@3;)
                    end
                    local.get 3
                    i32.const 248
                    i32.and
                    i32.const 1051624
                    i32.add
                    local.set 2
                    block  ;; label = @9
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=1051888
                        local.tee 6
                        i32.const 1
                        local.get 3
                        i32.const 3
                        i32.shr_u
                        i32.shl
                        local.tee 3
                        i32.and
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 6
                        local.get 3
                        i32.or
                        i32.store offset=1051888
                        local.get 2
                        local.set 3
                        br 1 (;@9;)
                      end
                      local.get 2
                      i32.load offset=8
                      local.set 3
                    end
                    local.get 2
                    local.get 0
                    i32.store offset=8
                    local.get 3
                    local.get 0
                    i32.store offset=12
                    local.get 0
                    local.get 2
                    i32.store offset=12
                    local.get 0
                    local.get 3
                    i32.store offset=8
                    br 5 (;@3;)
                  end
                  i32.const 0
                  local.get 0
                  local.get 2
                  i32.sub
                  local.tee 3
                  i32.store offset=1051900
                  i32.const 0
                  i32.const 0
                  i32.load offset=1051908
                  local.tee 0
                  local.get 2
                  i32.add
                  local.tee 6
                  i32.store offset=1051908
                  local.get 6
                  local.get 3
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 0
                  local.get 2
                  i32.const 3
                  i32.or
                  i32.store offset=4
                  local.get 0
                  i32.const 8
                  i32.add
                  local.set 0
                  br 6 (;@1;)
                end
                i32.const 0
                i32.load offset=1051904
                local.set 3
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    local.get 2
                    i32.sub
                    local.tee 6
                    i32.const 15
                    i32.gt_u
                    br_if 0 (;@8;)
                    i32.const 0
                    i32.const 0
                    i32.store offset=1051904
                    i32.const 0
                    i32.const 0
                    i32.store offset=1051896
                    local.get 3
                    local.get 0
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get 3
                    local.get 0
                    i32.add
                    local.tee 0
                    local.get 0
                    i32.load offset=4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    br 1 (;@7;)
                  end
                  i32.const 0
                  local.get 6
                  i32.store offset=1051896
                  i32.const 0
                  local.get 3
                  local.get 2
                  i32.add
                  local.tee 1
                  i32.store offset=1051904
                  local.get 1
                  local.get 6
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 3
                  local.get 0
                  i32.add
                  local.get 6
                  i32.store
                  local.get 3
                  local.get 2
                  i32.const 3
                  i32.or
                  i32.store offset=4
                end
                local.get 3
                i32.const 8
                i32.add
                return
              end
              local.get 0
              local.get 7
              local.get 8
              i32.add
              i32.store offset=4
              i32.const 0
              i32.const 0
              i32.load offset=1051908
              local.tee 0
              i32.const 15
              i32.add
              i32.const -8
              i32.and
              local.tee 3
              i32.const -8
              i32.add
              local.tee 6
              i32.store offset=1051908
              i32.const 0
              local.get 0
              local.get 3
              i32.sub
              i32.const 0
              i32.load offset=1051900
              local.get 8
              i32.add
              local.tee 3
              i32.add
              i32.const 8
              i32.add
              local.tee 1
              i32.store offset=1051900
              local.get 6
              local.get 1
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 3
              i32.add
              i32.const 40
              i32.store offset=4
              i32.const 0
              i32.const 2097152
              i32.store offset=1051920
              br 3 (;@2;)
            end
            i32.const 0
            local.get 0
            i32.store offset=1051908
            i32.const 0
            i32.const 0
            i32.load offset=1051900
            local.get 3
            i32.add
            local.tee 3
            i32.store offset=1051900
            local.get 0
            local.get 3
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          i32.const 0
          local.get 0
          i32.store offset=1051904
          i32.const 0
          i32.const 0
          i32.load offset=1051896
          local.get 3
          i32.add
          local.tee 3
          i32.store offset=1051896
          local.get 0
          local.get 3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          local.get 3
          i32.add
          local.get 3
          i32.store
        end
        local.get 1
        i32.const 8
        i32.add
        return
      end
      i32.const 0
      local.set 0
      i32.const 0
      i32.load offset=1051900
      local.tee 3
      local.get 2
      i32.le_u
      br_if 0 (;@1;)
      i32.const 0
      local.get 3
      local.get 2
      i32.sub
      local.tee 3
      i32.store offset=1051900
      i32.const 0
      i32.const 0
      i32.load offset=1051908
      local.tee 0
      local.get 2
      i32.add
      local.tee 6
      i32.store offset=1051908
      local.get 6
      local.get 3
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 0
      local.get 2
      i32.const 3
      i32.or
      i32.store offset=4
      local.get 0
      i32.const 8
      i32.add
      return
    end
    local.get 0)
  (func $_ZN4core9panicking13assert_failed17h1c5f4c6790bfa14cE (type 4) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 1049176
    i32.store offset=12
    local.get 2
    local.get 0
    i32.store offset=8
    local.get 2
    i32.const 8
    i32.add
    local.get 2
    i32.const 12
    i32.add
    local.get 1
    call $_ZN4core9panicking19assert_failed_inner17h1ca1e1236d2cdf82E
    unreachable)
  (func $_ZN4core6option13expect_failed17hada3d336a83d09a3E (type 0)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i32.const 38
    i32.store offset=12
    local.get 0
    i32.const 1050824
    i32.store offset=8
    local.get 0
    i32.const 1
    i32.store offset=20
    local.get 0
    i32.const 1049536
    i32.store offset=16
    local.get 0
    i64.const 1
    i64.store offset=28 align=4
    local.get 0
    i32.const 3
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 0
    i32.const 8
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 0
    local.get 0
    i32.const 40
    i32.add
    i32.store offset=24
    local.get 0
    i32.const 16
    i32.add
    i32.const 1050900
    call $_ZN4core9panicking9panic_fmt17h6f4dae69dcc1a6d2E
    unreachable)
  (func $_ZN4core3fmt5write17h2db157f4177a0bcdE (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=44
    local.get 3
    local.get 0
    i32.store offset=40
    local.get 3
    i32.const 3
    i32.store8 offset=36
    local.get 3
    i64.const 32
    i64.store offset=28 align=4
    i32.const 0
    local.set 4
    local.get 3
    i32.const 0
    i32.store offset=20
    local.get 3
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.load offset=16
              local.tee 5
              br_if 0 (;@5;)
              local.get 2
              i32.load offset=12
              local.tee 0
              i32.eqz
              br_if 1 (;@4;)
              local.get 2
              i32.load offset=8
              local.tee 1
              local.get 0
              i32.const 3
              i32.shl
              i32.add
              local.set 6
              local.get 0
              i32.const -1
              i32.add
              i32.const 536870911
              i32.and
              i32.const 1
              i32.add
              local.set 4
              local.get 2
              i32.load
              local.set 0
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.const 4
                  i32.add
                  i32.load
                  local.tee 7
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 3
                  i32.load offset=40
                  local.get 0
                  i32.load
                  local.get 7
                  local.get 3
                  i32.load offset=44
                  i32.load offset=12
                  call_indirect (type 2)
                  br_if 4 (;@3;)
                end
                local.get 1
                i32.load
                local.get 3
                i32.const 12
                i32.add
                local.get 1
                i32.const 4
                i32.add
                i32.load
                call_indirect (type 3)
                br_if 3 (;@3;)
                local.get 0
                i32.const 8
                i32.add
                local.set 0
                local.get 1
                i32.const 8
                i32.add
                local.tee 1
                local.get 6
                i32.ne
                br_if 0 (;@6;)
                br 2 (;@4;)
              end
            end
            local.get 2
            i32.load offset=20
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 5
            i32.shl
            local.set 8
            local.get 1
            i32.const -1
            i32.add
            i32.const 134217727
            i32.and
            i32.const 1
            i32.add
            local.set 4
            local.get 2
            i32.load offset=8
            local.set 9
            local.get 2
            i32.load
            local.set 0
            i32.const 0
            local.set 7
            loop  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.const 4
                i32.add
                i32.load
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                local.get 3
                i32.load offset=40
                local.get 0
                i32.load
                local.get 1
                local.get 3
                i32.load offset=44
                i32.load offset=12
                call_indirect (type 2)
                br_if 3 (;@3;)
              end
              local.get 3
              local.get 5
              local.get 7
              i32.add
              local.tee 1
              i32.const 16
              i32.add
              i32.load
              i32.store offset=28
              local.get 3
              local.get 1
              i32.const 28
              i32.add
              i32.load8_u
              i32.store8 offset=36
              local.get 3
              local.get 1
              i32.const 24
              i32.add
              i32.load
              i32.store offset=32
              local.get 1
              i32.const 12
              i32.add
              i32.load
              local.set 6
              i32.const 0
              local.set 10
              i32.const 0
              local.set 11
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.const 8
                    i32.add
                    i32.load
                    br_table 1 (;@7;) 0 (;@8;) 2 (;@6;) 1 (;@7;)
                  end
                  local.get 6
                  i32.const 3
                  i32.shl
                  local.set 12
                  i32.const 0
                  local.set 11
                  local.get 9
                  local.get 12
                  i32.add
                  local.tee 12
                  i32.load
                  br_if 1 (;@6;)
                  local.get 12
                  i32.load offset=4
                  local.set 6
                end
                i32.const 1
                local.set 11
              end
              local.get 3
              local.get 6
              i32.store offset=16
              local.get 3
              local.get 11
              i32.store offset=12
              local.get 1
              i32.const 4
              i32.add
              i32.load
              local.set 6
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.load
                    br_table 1 (;@7;) 0 (;@8;) 2 (;@6;) 1 (;@7;)
                  end
                  local.get 6
                  i32.const 3
                  i32.shl
                  local.set 11
                  local.get 9
                  local.get 11
                  i32.add
                  local.tee 11
                  i32.load
                  br_if 1 (;@6;)
                  local.get 11
                  i32.load offset=4
                  local.set 6
                end
                i32.const 1
                local.set 10
              end
              local.get 3
              local.get 6
              i32.store offset=24
              local.get 3
              local.get 10
              i32.store offset=20
              local.get 9
              local.get 1
              i32.const 20
              i32.add
              i32.load
              i32.const 3
              i32.shl
              i32.add
              local.tee 1
              i32.load
              local.get 3
              i32.const 12
              i32.add
              local.get 1
              i32.const 4
              i32.add
              i32.load
              call_indirect (type 3)
              br_if 2 (;@3;)
              local.get 0
              i32.const 8
              i32.add
              local.set 0
              local.get 8
              local.get 7
              i32.const 32
              i32.add
              local.tee 7
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 4
          local.get 2
          i32.load offset=4
          i32.ge_u
          br_if 1 (;@2;)
          local.get 3
          i32.load offset=40
          local.get 2
          i32.load
          local.get 4
          i32.const 3
          i32.shl
          i32.add
          local.tee 1
          i32.load
          local.get 1
          i32.load offset=4
          local.get 3
          i32.load offset=44
          i32.load offset=12
          call_indirect (type 2)
          i32.eqz
          br_if 1 (;@2;)
        end
        i32.const 1
        local.set 1
        br 1 (;@1;)
      end
      i32.const 0
      local.set 1
    end
    local.get 3
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $__rust_dealloc (type 4) (param i32 i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const -4
        i32.add
        i32.load
        local.tee 2
        i32.const -8
        i32.and
        local.tee 3
        i32.const 4
        i32.const 8
        local.get 2
        i32.const 3
        i32.and
        local.tee 2
        select
        local.get 1
        i32.add
        i32.lt_u
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 1
          i32.const 39
          i32.add
          i32.gt_u
          br_if 2 (;@1;)
        end
        local.get 0
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17hbb624227e39e47e9E
        return
      end
      i32.const 1049261
      i32.const 46
      i32.const 1049308
      call $_ZN4core9panicking5panic17hb7d13004db45f2e3E
      unreachable
    end
    i32.const 1049324
    i32.const 46
    i32.const 1049372
    call $_ZN4core9panicking5panic17hb7d13004db45f2e3E
    unreachable)
  (func $_ZN4core9panicking9panic_fmt17h6f4dae69dcc1a6d2E (type 4) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 1
    i32.store16 offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    local.get 0
    i32.store offset=4
    local.get 2
    i32.const 4
    i32.add
    call $rust_begin_unwind
    unreachable)
  (func $_ZN3std6thread8ThreadId3new9exhausted17he9e2f79c8ed76320E (type 0)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i32.const 0
    i32.store offset=24
    local.get 0
    i32.const 1
    i32.store offset=12
    local.get 0
    i32.const 1049512
    i32.store offset=8
    local.get 0
    i64.const 4
    i64.store offset=16 align=4
    local.get 0
    i32.const 8
    i32.add
    i32.const 1049520
    call $_ZN4core9panicking9panic_fmt17h6f4dae69dcc1a6d2E
    unreachable)
  (func $_ZN60_$LT$std..io..error..Error$u20$as$u20$core..fmt..Display$GT$3fmt17h30be016d72c8d3dcE (type 3) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load8_u
                br_table 0 (;@6;) 1 (;@5;) 2 (;@4;) 3 (;@3;) 0 (;@6;)
              end
              local.get 2
              local.get 0
              i32.load offset=4
              i32.store offset=4
              i32.const 0
              i32.load8_u offset=1051392
              drop
              i32.const 20
              call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17hd2421ed15302c503E
              local.tee 0
              i32.eqz
              br_if 4 (;@1;)
              local.get 0
              i32.const 16
              i32.add
              i32.const 0
              i32.load offset=1050932 align=1
              i32.store align=1
              local.get 0
              i32.const 8
              i32.add
              i32.const 0
              i64.load offset=1050924 align=1
              i64.store align=1
              local.get 0
              i32.const 0
              i64.load offset=1050916 align=1
              i64.store align=1
              local.get 2
              i32.const 20
              i32.store offset=16
              local.get 2
              local.get 0
              i32.store offset=12
              local.get 2
              i32.const 20
              i32.store offset=8
              local.get 2
              i32.const 3
              i32.store offset=44
              local.get 2
              i32.const 1050388
              i32.store offset=40
              local.get 2
              i64.const 2
              i64.store offset=52 align=4
              local.get 2
              i32.const 4
              i64.extend_i32_u
              i64.const 32
              i64.shl
              local.get 2
              i32.const 4
              i32.add
              i64.extend_i32_u
              i64.or
              i64.store offset=32
              local.get 2
              i32.const 5
              i64.extend_i32_u
              i64.const 32
              i64.shl
              local.get 2
              i32.const 8
              i32.add
              i64.extend_i32_u
              i64.or
              i64.store offset=24
              local.get 2
              local.get 2
              i32.const 24
              i32.add
              i32.store offset=48
              local.get 1
              i32.load offset=28
              local.get 1
              i32.load offset=32
              local.get 2
              i32.const 40
              i32.add
              call $_ZN4core3fmt5write17h2db157f4177a0bcdE
              local.set 0
              local.get 2
              i32.load offset=8
              local.tee 1
              i32.eqz
              br_if 3 (;@2;)
              local.get 2
              i32.load offset=12
              local.get 1
              call $__rust_dealloc
              br 3 (;@2;)
            end
            local.get 0
            i32.load8_u offset=1
            local.set 0
            local.get 2
            i32.const 1
            i32.store offset=44
            local.get 2
            i32.const 1049536
            i32.store offset=40
            local.get 2
            i64.const 1
            i64.store offset=52 align=4
            local.get 2
            i32.const 3
            i64.extend_i32_u
            i64.const 32
            i64.shl
            local.get 2
            i32.const 24
            i32.add
            i64.extend_i32_u
            i64.or
            i64.store offset=8
            local.get 2
            local.get 0
            i32.const 2
            i32.shl
            local.tee 0
            i32.const 1051052
            i32.add
            i32.load
            i32.store offset=28
            local.get 2
            local.get 0
            i32.const 1051220
            i32.add
            i32.load
            i32.store offset=24
            local.get 2
            local.get 2
            i32.const 8
            i32.add
            i32.store offset=48
            local.get 1
            i32.load offset=28
            local.get 1
            i32.load offset=32
            local.get 2
            i32.const 40
            i32.add
            call $_ZN4core3fmt5write17h2db157f4177a0bcdE
            local.set 0
            br 2 (;@2;)
          end
          local.get 1
          local.get 0
          i32.load offset=4
          local.tee 0
          i32.load
          local.get 0
          i32.load offset=4
          call $_ZN4core3fmt9Formatter3pad17hc11ca54d5ab5b124E
          local.set 0
          br 1 (;@2;)
        end
        local.get 0
        i32.load offset=4
        local.tee 0
        i32.load
        local.get 1
        local.get 0
        i32.load offset=4
        i32.load offset=16
        call_indirect (type 3)
        local.set 0
      end
      local.get 2
      i32.const 64
      i32.add
      global.set $__stack_pointer
      local.get 0
      return
    end
    unreachable)
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h3f6b07f8c27f3005E (type 3) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call $_ZN4core3fmt9Formatter3pad17hc11ca54d5ab5b124E)
  (func $main (type 3) (param i32 i32) (result i32)
    (local i32 i64 i64 i64 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i64.load offset=1051464
        local.tee 3
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
        i32.const 0
        i64.load offset=1051472
        local.set 4
        loop  ;; label = @3
          local.get 4
          i64.const -1
          i64.eq
          br_if 2 (;@1;)
          i32.const 0
          local.get 4
          i64.const 1
          i64.add
          local.tee 3
          i32.const 0
          i64.load offset=1051472
          local.tee 5
          local.get 5
          local.get 4
          i64.eq
          local.tee 6
          select
          i64.store offset=1051472
          local.get 5
          local.set 4
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
        end
        i32.const 0
        local.get 3
        i64.store offset=1051464
      end
      i32.const 0
      local.get 3
      i64.store offset=1051400
      block  ;; label = @2
        i32.const 0
        i32.load offset=1051940
        br_if 0 (;@2;)
        i32.const 0
        i32.const 1051400
        i32.store offset=1051940
        i32.const 6
        call $_ZN3std3sys9backtrace28__rust_begin_short_backtrace17ha38420a5a5025315E
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load8_u offset=1051393
              local.tee 6
              i32.const 3
              i32.eq
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 6
                br_table 0 (;@6;) 3 (;@3;) 2 (;@4;) 0 (;@6;)
              end
              i32.const 0
              i32.const 2
              i32.store8 offset=1051393
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load8_u offset=1051448
                    local.tee 6
                    i32.const 3
                    i32.eq
                    br_if 0 (;@8;)
                    block  ;; label = @9
                      local.get 6
                      br_table 2 (;@7;) 2 (;@7;) 0 (;@9;) 2 (;@7;)
                    end
                    local.get 2
                    i32.const 0
                    i32.store offset=24
                    local.get 2
                    i32.const 1
                    i32.store offset=12
                    local.get 2
                    i32.const 1051044
                    i32.store offset=8
                    local.get 2
                    i64.const 4
                    i64.store offset=16 align=4
                    local.get 2
                    i32.const 8
                    i32.add
                    i32.const 1050808
                    call $_ZN4core9panicking9panic_fmt17h6f4dae69dcc1a6d2E
                    unreachable
                  end
                  block  ;; label = @8
                    i32.const 0
                    i64.load offset=1051464
                    local.tee 3
                    i64.const 0
                    i64.ne
                    br_if 0 (;@8;)
                    i32.const 0
                    i64.load offset=1051472
                    local.set 4
                    loop  ;; label = @9
                      local.get 4
                      i64.const -1
                      i64.eq
                      br_if 8 (;@1;)
                      i32.const 0
                      local.get 4
                      i64.const 1
                      i64.add
                      local.tee 3
                      i32.const 0
                      i64.load offset=1051472
                      local.tee 5
                      local.get 5
                      local.get 4
                      i64.eq
                      local.tee 6
                      select
                      i64.store offset=1051472
                      local.get 5
                      local.set 4
                      local.get 6
                      i32.eqz
                      br_if 0 (;@9;)
                    end
                    i32.const 0
                    local.get 3
                    i64.store offset=1051464
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 3
                      i32.const 0
                      i64.load offset=1051408
                      i64.eq
                      br_if 0 (;@9;)
                      i32.const 0
                      i32.load8_u offset=1051420
                      local.set 7
                      i32.const 1
                      local.set 6
                      i32.const 0
                      i32.const 1
                      i32.store8 offset=1051420
                      local.get 7
                      br_if 3 (;@6;)
                      i32.const 0
                      local.get 3
                      i64.store offset=1051408
                      br 1 (;@8;)
                    end
                    i32.const 0
                    i32.load offset=1051416
                    local.tee 6
                    i32.const -1
                    i32.eq
                    br_if 2 (;@6;)
                    local.get 6
                    i32.const 1
                    i32.add
                    local.set 6
                  end
                  i32.const 0
                  local.set 7
                  i32.const 0
                  local.get 6
                  i32.store offset=1051416
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1051424
                    br_if 0 (;@8;)
                    i32.const 0
                    i32.const -1
                    i32.store offset=1051424
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=1051428
                      local.tee 8
                      i32.eqz
                      br_if 0 (;@9;)
                      i32.const 0
                      i32.load offset=1051432
                      local.get 8
                      call $__rust_dealloc
                      i32.const 0
                      i32.load offset=1051424
                      i32.const 1
                      i32.add
                      local.set 7
                      i32.const 0
                      i32.load offset=1051416
                      local.set 6
                    end
                    i32.const 0
                    i64.const 4294967296
                    i64.store offset=1051428 align=4
                    i32.const 0
                    local.get 7
                    i32.store offset=1051424
                    i32.const 0
                    local.get 6
                    i32.const -1
                    i32.add
                    local.tee 6
                    i32.store offset=1051416
                    i32.const 0
                    i32.const 0
                    i32.store8 offset=1051440
                    i32.const 0
                    i32.const 0
                    i32.store offset=1051436
                    local.get 6
                    br_if 2 (;@6;)
                    i32.const 0
                    i64.const 0
                    i64.store offset=1051408
                    i32.const 0
                    i32.const 0
                    i32.store8 offset=1051420
                    br 2 (;@6;)
                  end
                  i32.const 1050440
                  call $_ZN4core4cell22panic_already_borrowed17hbffcf7bee9630722E
                  unreachable
                end
                i32.const 0
                i32.const 3
                i32.store8 offset=1051448
                i32.const 0
                i64.const 1
                i64.store offset=1051432
                i32.const 0
                i64.const 0
                i64.store offset=1051424
                i32.const 0
                i64.const 0
                i64.store offset=1051408
                i32.const 0
                i32.const 0
                i32.store8 offset=1051440
                i32.const 0
                i32.const 0
                i32.store8 offset=1051420
                i32.const 0
                i32.const 0
                i32.store offset=1051416
              end
              i32.const 0
              i32.const 3
              i32.store8 offset=1051393
            end
            local.get 2
            i32.const 32
            i32.add
            global.set $__stack_pointer
            i32.const 0
            return
          end
          local.get 2
          i32.const 0
          i32.store offset=24
          local.get 2
          i32.const 1
          i32.store offset=12
          local.get 2
          i32.const 1051044
          i32.store offset=8
          local.get 2
          i64.const 4
          i64.store offset=16 align=4
          local.get 2
          i32.const 8
          i32.add
          i32.const 1049412
          call $_ZN4core9panicking9panic_fmt17h6f4dae69dcc1a6d2E
          unreachable
        end
        local.get 2
        i32.const 0
        i32.store offset=24
        local.get 2
        i32.const 1
        i32.store offset=12
        local.get 2
        i32.const 1050980
        i32.store offset=8
        local.get 2
        i64.const 4
        i64.store offset=16 align=4
        local.get 2
        i32.const 8
        i32.add
        i32.const 1049412
        call $_ZN4core9panicking9panic_fmt17h6f4dae69dcc1a6d2E
      end
      unreachable
    end
    call $_ZN3std6thread8ThreadId3new9exhausted17he9e2f79c8ed76320E
    unreachable)
  (func $_ZN4core4cell22panic_already_borrowed17hbffcf7bee9630722E (type 1) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 1
    i32.store offset=12
    local.get 1
    i32.const 1048656
    i32.store offset=8
    local.get 1
    i64.const 1
    i64.store offset=20 align=4
    local.get 1
    i32.const 7
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 1
    i32.const 47
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get 1
    local.get 1
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 1
    i32.const 8
    i32.add
    local.get 0
    call $_ZN4core9panicking9panic_fmt17h6f4dae69dcc1a6d2E
    unreachable)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17hbb624227e39e47e9E (type 1) (param i32)
    (local i32 i32 i32 i32 i32)
    local.get 0
    i32.const -8
    i32.add
    local.tee 1
    local.get 0
    i32.const -4
    i32.add
    i32.load
    local.tee 2
    i32.const -8
    i32.and
    local.tee 0
    i32.add
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 2
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        i32.load
        local.tee 2
        local.get 0
        i32.add
        local.set 0
        block  ;; label = @3
          local.get 1
          local.get 2
          i32.sub
          local.tee 1
          i32.const 0
          i32.load offset=1051904
          i32.ne
          br_if 0 (;@3;)
          local.get 3
          i32.load offset=4
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
          i32.const 0
          local.get 0
          i32.store offset=1051896
          local.get 3
          local.get 3
          i32.load offset=4
          i32.const -2
          i32.and
          i32.store offset=4
          local.get 1
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 3
          local.get 0
          i32.store
          return
        end
        local.get 1
        local.get 2
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h0d0f475ea8907bb5E
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.load offset=4
                  local.tee 2
                  i32.const 2
                  i32.and
                  br_if 0 (;@7;)
                  local.get 3
                  i32.const 0
                  i32.load offset=1051908
                  i32.eq
                  br_if 2 (;@5;)
                  local.get 3
                  i32.const 0
                  i32.load offset=1051904
                  i32.eq
                  br_if 3 (;@4;)
                  local.get 3
                  local.get 2
                  i32.const -8
                  i32.and
                  local.tee 2
                  call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h0d0f475ea8907bb5E
                  local.get 1
                  local.get 2
                  local.get 0
                  i32.add
                  local.tee 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 1
                  local.get 0
                  i32.add
                  local.get 0
                  i32.store
                  local.get 1
                  i32.const 0
                  i32.load offset=1051904
                  i32.ne
                  br_if 1 (;@6;)
                  i32.const 0
                  local.get 0
                  i32.store offset=1051896
                  return
                end
                local.get 3
                local.get 2
                i32.const -2
                i32.and
                i32.store offset=4
                local.get 1
                local.get 0
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 1
                local.get 0
                i32.add
                local.get 0
                i32.store
              end
              local.get 0
              i32.const 256
              i32.lt_u
              br_if 2 (;@3;)
              local.get 1
              local.get 0
              call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17ha51abd6cd7031e06E
              i32.const 0
              local.set 1
              i32.const 0
              i32.const 0
              i32.load offset=1051928
              i32.const -1
              i32.add
              local.tee 0
              i32.store offset=1051928
              local.get 0
              br_if 4 (;@1;)
              block  ;; label = @6
                i32.const 0
                i32.load offset=1051616
                local.tee 0
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                local.set 1
                loop  ;; label = @7
                  local.get 1
                  i32.const 1
                  i32.add
                  local.set 1
                  local.get 0
                  i32.load offset=8
                  local.tee 0
                  br_if 0 (;@7;)
                end
              end
              i32.const 0
              local.get 1
              i32.const 4095
              local.get 1
              i32.const 4095
              i32.gt_u
              select
              i32.store offset=1051928
              return
            end
            i32.const 0
            local.get 1
            i32.store offset=1051908
            i32.const 0
            i32.const 0
            i32.load offset=1051900
            local.get 0
            i32.add
            local.tee 0
            i32.store offset=1051900
            local.get 1
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            block  ;; label = @5
              local.get 1
              i32.const 0
              i32.load offset=1051904
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              i32.const 0
              i32.store offset=1051896
              i32.const 0
              i32.const 0
              i32.store offset=1051904
            end
            local.get 0
            i32.const 0
            i32.load offset=1051920
            local.tee 4
            i32.le_u
            br_if 3 (;@1;)
            i32.const 0
            i32.load offset=1051908
            local.tee 0
            i32.eqz
            br_if 3 (;@1;)
            i32.const 0
            local.set 2
            i32.const 0
            i32.load offset=1051900
            local.tee 5
            i32.const 41
            i32.lt_u
            br_if 2 (;@2;)
            i32.const 1051608
            local.set 1
            loop  ;; label = @5
              block  ;; label = @6
                local.get 1
                i32.load
                local.tee 3
                local.get 0
                i32.gt_u
                br_if 0 (;@6;)
                local.get 0
                local.get 3
                local.get 1
                i32.load offset=4
                i32.add
                i32.lt_u
                br_if 4 (;@2;)
              end
              local.get 1
              i32.load offset=8
              local.set 1
              br 0 (;@5;)
            end
          end
          i32.const 0
          local.get 1
          i32.store offset=1051904
          i32.const 0
          i32.const 0
          i32.load offset=1051896
          local.get 0
          i32.add
          local.tee 0
          i32.store offset=1051896
          local.get 1
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 1
          local.get 0
          i32.add
          local.get 0
          i32.store
          return
        end
        local.get 0
        i32.const 248
        i32.and
        i32.const 1051624
        i32.add
        local.set 3
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=1051888
            local.tee 2
            i32.const 1
            local.get 0
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee 0
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 2
            local.get 0
            i32.or
            i32.store offset=1051888
            local.get 3
            local.set 0
            br 1 (;@3;)
          end
          local.get 3
          i32.load offset=8
          local.set 0
        end
        local.get 3
        local.get 1
        i32.store offset=8
        local.get 0
        local.get 1
        i32.store offset=12
        local.get 1
        local.get 3
        i32.store offset=12
        local.get 1
        local.get 0
        i32.store offset=8
        return
      end
      block  ;; label = @2
        i32.const 0
        i32.load offset=1051616
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        loop  ;; label = @3
          local.get 2
          i32.const 1
          i32.add
          local.set 2
          local.get 1
          i32.load offset=8
          local.tee 1
          br_if 0 (;@3;)
        end
      end
      i32.const 0
      local.get 2
      i32.const 4095
      local.get 2
      i32.const 4095
      i32.gt_u
      select
      i32.store offset=1051928
      local.get 5
      local.get 4
      i32.le_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const -1
      i32.store offset=1051920
    end)
  (func $_ZN4core9panicking5panic17hb7d13004db45f2e3E (type 7) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 0
    i32.store offset=16
    local.get 3
    i32.const 1
    i32.store offset=4
    local.get 3
    i64.const 4
    i64.store offset=8 align=4
    local.get 3
    local.get 1
    i32.store offset=28
    local.get 3
    local.get 0
    i32.store offset=24
    local.get 3
    local.get 3
    i32.const 24
    i32.add
    i32.store
    local.get 3
    local.get 2
    call $_ZN4core9panicking9panic_fmt17h6f4dae69dcc1a6d2E
    unreachable)
  (func $_ZN4core5slice5index26slice_start_index_len_fail17h6ba96fe804246016E (type 4) (param i32 i32)
    local.get 0
    local.get 1
    call $_ZN4core5slice5index26slice_start_index_len_fail8do_panic7runtime17h8f5f6eb23a09cf83E
    unreachable)
  (func $_ZN4core5slice5index26slice_start_index_len_fail8do_panic7runtime17h8f5f6eb23a09cf83E (type 4) (param i32 i32)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.store offset=4
    local.get 2
    local.get 0
    i32.store
    local.get 2
    i32.const 2
    i32.store offset=12
    local.get 2
    i32.const 1049128
    i32.store offset=8
    local.get 2
    i64.const 2
    i64.store offset=20 align=4
    local.get 2
    i32.const 8
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee 3
    local.get 2
    i32.const 4
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 2
    local.get 3
    local.get 2
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get 2
    local.get 2
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 2
    i32.const 8
    i32.add
    i32.const 1049044
    call $_ZN4core9panicking9panic_fmt17h6f4dae69dcc1a6d2E
    unreachable)
  (func $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h63293e3d55e16e04E (type 3) (param i32 i32) (result i32)
    local.get 0
    i32.load
    i32.const 1
    local.get 1
    call $_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hccdc97766a169818E)
  (func $_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hccdc97766a169818E (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const 10
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 10000
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.set 5
        br 1 (;@1;)
      end
      i32.const 10
      local.set 4
      loop  ;; label = @2
        local.get 3
        i32.const 6
        i32.add
        local.get 4
        i32.add
        local.tee 6
        i32.const -4
        i32.add
        local.get 0
        i32.const 10000
        i32.div_u
        local.tee 5
        i32.const 55536
        i32.mul
        local.get 0
        i32.add
        local.tee 7
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee 8
        i32.const 1
        i32.shl
        i32.const 1048800
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 6
        i32.const -2
        i32.add
        local.get 8
        i32.const -100
        i32.mul
        local.get 7
        i32.add
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.const 1048800
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 4
        i32.const -4
        i32.add
        local.set 4
        local.get 0
        i32.const 99999999
        i32.gt_u
        local.set 6
        local.get 5
        local.set 0
        local.get 6
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 5
        i32.const 99
        i32.gt_u
        br_if 0 (;@2;)
        local.get 5
        local.set 0
        br 1 (;@1;)
      end
      local.get 3
      i32.const 6
      i32.add
      local.get 4
      i32.const -2
      i32.add
      local.tee 4
      i32.add
      local.get 5
      i32.const 65535
      i32.and
      i32.const 100
      i32.div_u
      local.tee 0
      i32.const -100
      i32.mul
      local.get 5
      i32.add
      i32.const 65535
      i32.and
      i32.const 1
      i32.shl
      i32.const 1048800
      i32.add
      i32.load16_u align=1
      i32.store16 align=1
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 10
        i32.lt_u
        br_if 0 (;@2;)
        local.get 3
        i32.const 6
        i32.add
        local.get 4
        i32.const -2
        i32.add
        local.tee 4
        i32.add
        local.get 0
        i32.const 1
        i32.shl
        i32.const 1048800
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        br 1 (;@1;)
      end
      local.get 3
      i32.const 6
      i32.add
      local.get 4
      i32.const -1
      i32.add
      local.tee 4
      i32.add
      local.get 0
      i32.const 48
      i32.or
      i32.store8
    end
    local.get 2
    local.get 1
    local.get 3
    i32.const 6
    i32.add
    local.get 4
    i32.add
    i32.const 10
    local.get 4
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17hcd2413804a182f1fE
    local.set 0
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $rust_begin_unwind (type 1) (param i32)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 0
    i64.load align=4
    local.set 2
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    local.get 2
    i64.store offset=4 align=4
    local.get 1
    i32.const 4
    i32.add
    call $_ZN3std3sys9backtrace26__rust_end_short_backtrace17h8eb99c908c86e40bE
    unreachable)
  (func $_ZN4core3fmt9Formatter12pad_integral17hcd2413804a182f1fE (type 8) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        local.get 3
        i32.const 1
        i32.add
        local.set 4
        local.get 0
        i32.load offset=20
        local.set 1
        i32.const 45
        local.set 5
        br 1 (;@1;)
      end
      i32.const 43
      i32.const 1114112
      local.get 0
      i32.load offset=20
      local.tee 1
      i32.const 1
      i32.and
      local.tee 4
      select
      local.set 5
      local.get 4
      local.get 3
      i32.add
      local.set 4
    end
    local.get 1
    i32.const 4
    i32.and
    i32.const 2
    i32.shr_u
    local.set 6
    block  ;; label = @1
      local.get 0
      i32.load
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load offset=28
        local.tee 1
        local.get 0
        i32.load offset=32
        local.tee 0
        local.get 5
        local.get 6
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h2d8dc401c4f74e4cE
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1
        return
      end
      local.get 1
      local.get 2
      local.get 3
      local.get 0
      i32.load offset=12
      call_indirect (type 2)
      return
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load offset=4
            local.tee 7
            local.get 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=28
            local.tee 1
            local.get 0
            i32.load offset=32
            local.tee 0
            local.get 5
            local.get 6
            call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h2d8dc401c4f74e4cE
            i32.eqz
            br_if 1 (;@3;)
            i32.const 1
            return
          end
          local.get 1
          i32.const 8
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.load offset=16
          local.set 8
          local.get 0
          i32.const 48
          i32.store offset=16
          local.get 0
          i32.load8_u offset=24
          local.set 9
          i32.const 1
          local.set 1
          local.get 0
          i32.const 1
          i32.store8 offset=24
          local.get 0
          i32.load offset=28
          local.tee 10
          local.get 0
          i32.load offset=32
          local.tee 11
          local.get 5
          local.get 6
          call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h2d8dc401c4f74e4cE
          br_if 2 (;@1;)
          local.get 7
          local.get 4
          i32.sub
          i32.const 1
          i32.add
          local.set 1
          block  ;; label = @4
            loop  ;; label = @5
              local.get 1
              i32.const -1
              i32.add
              local.tee 1
              i32.eqz
              br_if 1 (;@4;)
              local.get 10
              i32.const 48
              local.get 11
              i32.load offset=16
              call_indirect (type 3)
              i32.eqz
              br_if 0 (;@5;)
            end
            i32.const 1
            return
          end
          block  ;; label = @4
            local.get 10
            local.get 2
            local.get 3
            local.get 11
            i32.load offset=12
            call_indirect (type 2)
            i32.eqz
            br_if 0 (;@4;)
            i32.const 1
            return
          end
          local.get 0
          local.get 9
          i32.store8 offset=24
          local.get 0
          local.get 8
          i32.store offset=16
          i32.const 0
          return
        end
        local.get 1
        local.get 2
        local.get 3
        local.get 0
        i32.load offset=12
        call_indirect (type 2)
        local.set 1
        br 1 (;@1;)
      end
      local.get 7
      local.get 4
      i32.sub
      local.set 11
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 1
            local.get 0
            i32.load8_u offset=24
            local.tee 1
            local.get 1
            i32.const 3
            i32.eq
            select
            local.tee 1
            br_table 2 (;@2;) 0 (;@4;) 1 (;@3;) 2 (;@2;)
          end
          local.get 11
          local.set 1
          i32.const 0
          local.set 11
          br 1 (;@2;)
        end
        local.get 11
        i32.const 1
        i32.shr_u
        local.set 1
        local.get 11
        i32.const 1
        i32.add
        i32.const 1
        i32.shr_u
        local.set 11
      end
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      local.get 0
      i32.load offset=16
      local.set 10
      local.get 0
      i32.load offset=32
      local.set 4
      local.get 0
      i32.load offset=28
      local.set 0
      block  ;; label = @2
        loop  ;; label = @3
          local.get 1
          i32.const -1
          i32.add
          local.tee 1
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          local.get 10
          local.get 4
          i32.load offset=16
          call_indirect (type 3)
          i32.eqz
          br_if 0 (;@3;)
        end
        i32.const 1
        return
      end
      i32.const 1
      local.set 1
      local.get 0
      local.get 4
      local.get 5
      local.get 6
      call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h2d8dc401c4f74e4cE
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      local.get 3
      local.get 4
      i32.load offset=12
      call_indirect (type 2)
      br_if 0 (;@1;)
      i32.const 0
      local.set 1
      loop  ;; label = @2
        block  ;; label = @3
          local.get 11
          local.get 1
          i32.ne
          br_if 0 (;@3;)
          local.get 11
          local.get 11
          i32.lt_u
          return
        end
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 0
        local.get 10
        local.get 4
        i32.load offset=16
        call_indirect (type 3)
        i32.eqz
        br_if 0 (;@2;)
      end
      local.get 1
      i32.const -1
      i32.add
      local.get 11
      i32.lt_u
      return
    end
    local.get 1)
  (func $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h2d8dc401c4f74e4cE (type 8) (param i32 i32 i32 i32) (result i32)
    block  ;; label = @1
      local.get 2
      i32.const 1114112
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      local.get 1
      i32.load offset=16
      call_indirect (type 3)
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1
      return
    end
    block  ;; label = @1
      local.get 3
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    local.get 0
    local.get 3
    i32.const 0
    local.get 1
    i32.load offset=12
    call_indirect (type 2))
  (func $_ZN4core5slice5index24slice_end_index_len_fail17hddeff0f8fd5a93e3E (type 4) (param i32 i32)
    local.get 0
    local.get 1
    call $_ZN4core5slice5index24slice_end_index_len_fail8do_panic7runtime17h7780901f520234faE
    unreachable)
  (func $_ZN4core5slice5index24slice_end_index_len_fail8do_panic7runtime17h7780901f520234faE (type 4) (param i32 i32)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.store offset=4
    local.get 2
    local.get 0
    i32.store
    local.get 2
    i32.const 2
    i32.store offset=12
    local.get 2
    i32.const 1049160
    i32.store offset=8
    local.get 2
    i64.const 2
    i64.store offset=20 align=4
    local.get 2
    i32.const 8
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee 3
    local.get 2
    i32.const 4
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 2
    local.get 3
    local.get 2
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get 2
    local.get 2
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 2
    i32.const 8
    i32.add
    i32.const 1049060
    call $_ZN4core9panicking9panic_fmt17h6f4dae69dcc1a6d2E
    unreachable)
  (func $_ZN4core3fmt9Formatter3pad17hc11ca54d5ab5b124E (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load
          local.tee 3
          local.get 0
          i32.load offset=8
          local.tee 4
          i32.or
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 4
            i32.const 1
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            local.get 2
            i32.add
            local.set 5
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load offset=12
                local.tee 6
                br_if 0 (;@6;)
                i32.const 0
                local.set 7
                local.get 1
                local.set 8
                br 1 (;@5;)
              end
              i32.const 0
              local.set 7
              i32.const 0
              local.set 9
              local.get 1
              local.set 8
              loop  ;; label = @6
                local.get 8
                local.tee 4
                local.get 5
                i32.eq
                br_if 2 (;@4;)
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 4
                    i32.load8_s
                    local.tee 8
                    i32.const -1
                    i32.le_s
                    br_if 0 (;@8;)
                    local.get 4
                    i32.const 1
                    i32.add
                    local.set 8
                    br 1 (;@7;)
                  end
                  block  ;; label = @8
                    local.get 8
                    i32.const -32
                    i32.ge_u
                    br_if 0 (;@8;)
                    local.get 4
                    i32.const 2
                    i32.add
                    local.set 8
                    br 1 (;@7;)
                  end
                  block  ;; label = @8
                    local.get 8
                    i32.const -16
                    i32.ge_u
                    br_if 0 (;@8;)
                    local.get 4
                    i32.const 3
                    i32.add
                    local.set 8
                    br 1 (;@7;)
                  end
                  local.get 4
                  i32.const 4
                  i32.add
                  local.set 8
                end
                local.get 8
                local.get 4
                i32.sub
                local.get 7
                i32.add
                local.set 7
                local.get 6
                local.get 9
                i32.const 1
                i32.add
                local.tee 9
                i32.ne
                br_if 0 (;@6;)
              end
            end
            local.get 8
            local.get 5
            i32.eq
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 8
              i32.load8_s
              local.tee 4
              i32.const -1
              i32.gt_s
              br_if 0 (;@5;)
              local.get 4
              i32.const -32
              i32.lt_u
              drop
            end
            block  ;; label = @5
              block  ;; label = @6
                local.get 7
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 7
                  local.get 2
                  i32.lt_u
                  br_if 0 (;@7;)
                  local.get 7
                  local.get 2
                  i32.eq
                  br_if 1 (;@6;)
                  i32.const 0
                  local.set 4
                  br 2 (;@5;)
                end
                local.get 1
                local.get 7
                i32.add
                i32.load8_s
                i32.const -64
                i32.ge_s
                br_if 0 (;@6;)
                i32.const 0
                local.set 4
                br 1 (;@5;)
              end
              local.get 1
              local.set 4
            end
            local.get 7
            local.get 2
            local.get 4
            select
            local.set 2
            local.get 4
            local.get 1
            local.get 4
            select
            local.set 1
          end
          block  ;; label = @4
            local.get 3
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=28
            local.get 1
            local.get 2
            local.get 0
            i32.load offset=32
            i32.load offset=12
            call_indirect (type 2)
            return
          end
          local.get 0
          i32.load offset=4
          local.set 10
          block  ;; label = @4
            local.get 2
            i32.const 16
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            local.get 1
            local.get 1
            i32.const 3
            i32.add
            i32.const -4
            i32.and
            local.tee 7
            i32.sub
            local.tee 9
            i32.add
            local.tee 11
            i32.const 3
            i32.and
            local.set 3
            i32.const 0
            local.set 6
            i32.const 0
            local.set 4
            block  ;; label = @5
              local.get 1
              local.get 7
              i32.eq
              br_if 0 (;@5;)
              i32.const 0
              local.set 4
              block  ;; label = @6
                local.get 9
                i32.const -4
                i32.gt_u
                br_if 0 (;@6;)
                i32.const 0
                local.set 4
                i32.const 0
                local.set 5
                loop  ;; label = @7
                  local.get 4
                  local.get 1
                  local.get 5
                  i32.add
                  local.tee 8
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  i32.add
                  local.get 8
                  i32.const 1
                  i32.add
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  i32.add
                  local.get 8
                  i32.const 2
                  i32.add
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  i32.add
                  local.get 8
                  i32.const 3
                  i32.add
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  i32.add
                  local.set 4
                  local.get 5
                  i32.const 4
                  i32.add
                  local.tee 5
                  br_if 0 (;@7;)
                end
              end
              local.get 1
              local.set 8
              loop  ;; label = @6
                local.get 4
                local.get 8
                i32.load8_s
                i32.const -65
                i32.gt_s
                i32.add
                local.set 4
                local.get 8
                i32.const 1
                i32.add
                local.set 8
                local.get 9
                i32.const 1
                i32.add
                local.tee 9
                br_if 0 (;@6;)
              end
            end
            block  ;; label = @5
              local.get 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 7
              local.get 11
              i32.const -4
              i32.and
              i32.add
              local.tee 8
              i32.load8_s
              i32.const -65
              i32.gt_s
              local.set 6
              local.get 3
              i32.const 1
              i32.eq
              br_if 0 (;@5;)
              local.get 6
              local.get 8
              i32.load8_s offset=1
              i32.const -65
              i32.gt_s
              i32.add
              local.set 6
              local.get 3
              i32.const 2
              i32.eq
              br_if 0 (;@5;)
              local.get 6
              local.get 8
              i32.load8_s offset=2
              i32.const -65
              i32.gt_s
              i32.add
              local.set 6
            end
            local.get 11
            i32.const 2
            i32.shr_u
            local.set 5
            local.get 6
            local.get 4
            i32.add
            local.set 6
            loop  ;; label = @5
              local.get 7
              local.set 3
              local.get 5
              i32.eqz
              br_if 4 (;@1;)
              local.get 5
              i32.const 192
              local.get 5
              i32.const 192
              i32.lt_u
              select
              local.tee 11
              i32.const 3
              i32.and
              local.set 12
              local.get 11
              i32.const 2
              i32.shl
              local.set 13
              i32.const 0
              local.set 8
              block  ;; label = @6
                local.get 5
                i32.const 4
                i32.lt_u
                br_if 0 (;@6;)
                local.get 3
                local.get 13
                i32.const 1008
                i32.and
                i32.add
                local.set 9
                i32.const 0
                local.set 8
                local.get 3
                local.set 4
                loop  ;; label = @7
                  local.get 4
                  i32.load offset=12
                  local.tee 7
                  i32.const -1
                  i32.xor
                  i32.const 7
                  i32.shr_u
                  local.get 7
                  i32.const 6
                  i32.shr_u
                  i32.or
                  i32.const 16843009
                  i32.and
                  local.get 4
                  i32.load offset=8
                  local.tee 7
                  i32.const -1
                  i32.xor
                  i32.const 7
                  i32.shr_u
                  local.get 7
                  i32.const 6
                  i32.shr_u
                  i32.or
                  i32.const 16843009
                  i32.and
                  local.get 4
                  i32.load offset=4
                  local.tee 7
                  i32.const -1
                  i32.xor
                  i32.const 7
                  i32.shr_u
                  local.get 7
                  i32.const 6
                  i32.shr_u
                  i32.or
                  i32.const 16843009
                  i32.and
                  local.get 4
                  i32.load
                  local.tee 7
                  i32.const -1
                  i32.xor
                  i32.const 7
                  i32.shr_u
                  local.get 7
                  i32.const 6
                  i32.shr_u
                  i32.or
                  i32.const 16843009
                  i32.and
                  local.get 8
                  i32.add
                  i32.add
                  i32.add
                  i32.add
                  local.set 8
                  local.get 4
                  i32.const 16
                  i32.add
                  local.tee 4
                  local.get 9
                  i32.ne
                  br_if 0 (;@7;)
                end
              end
              local.get 5
              local.get 11
              i32.sub
              local.set 5
              local.get 3
              local.get 13
              i32.add
              local.set 7
              local.get 8
              i32.const 8
              i32.shr_u
              i32.const 16711935
              i32.and
              local.get 8
              i32.const 16711935
              i32.and
              i32.add
              i32.const 65537
              i32.mul
              i32.const 16
              i32.shr_u
              local.get 6
              i32.add
              local.set 6
              local.get 12
              i32.eqz
              br_if 0 (;@5;)
            end
            local.get 3
            local.get 11
            i32.const 252
            i32.and
            i32.const 2
            i32.shl
            i32.add
            local.tee 8
            i32.load
            local.tee 4
            i32.const -1
            i32.xor
            i32.const 7
            i32.shr_u
            local.get 4
            i32.const 6
            i32.shr_u
            i32.or
            i32.const 16843009
            i32.and
            local.set 4
            local.get 12
            i32.const 1
            i32.eq
            br_if 2 (;@2;)
            local.get 8
            i32.load offset=4
            local.tee 7
            i32.const -1
            i32.xor
            i32.const 7
            i32.shr_u
            local.get 7
            i32.const 6
            i32.shr_u
            i32.or
            i32.const 16843009
            i32.and
            local.get 4
            i32.add
            local.set 4
            local.get 12
            i32.const 2
            i32.eq
            br_if 2 (;@2;)
            local.get 8
            i32.load offset=8
            local.tee 8
            i32.const -1
            i32.xor
            i32.const 7
            i32.shr_u
            local.get 8
            i32.const 6
            i32.shr_u
            i32.or
            i32.const 16843009
            i32.and
            local.get 4
            i32.add
            local.set 4
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 2
            br_if 0 (;@4;)
            i32.const 0
            local.set 6
            br 3 (;@1;)
          end
          local.get 2
          i32.const 3
          i32.and
          local.set 8
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.const 4
              i32.ge_u
              br_if 0 (;@5;)
              i32.const 0
              local.set 6
              i32.const 0
              local.set 9
              br 1 (;@4;)
            end
            i32.const 0
            local.set 6
            local.get 1
            local.set 4
            local.get 2
            i32.const 12
            i32.and
            local.tee 9
            local.set 7
            loop  ;; label = @5
              local.get 6
              local.get 4
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 4
              i32.const 1
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 4
              i32.const 2
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 4
              i32.const 3
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.set 6
              local.get 4
              i32.const 4
              i32.add
              local.set 4
              local.get 7
              i32.const -4
              i32.add
              local.tee 7
              br_if 0 (;@5;)
            end
          end
          local.get 8
          i32.eqz
          br_if 2 (;@1;)
          local.get 1
          local.get 9
          i32.add
          local.set 4
          loop  ;; label = @4
            local.get 6
            local.get 4
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 6
            local.get 4
            i32.const 1
            i32.add
            local.set 4
            local.get 8
            i32.const -1
            i32.add
            local.tee 8
            br_if 0 (;@4;)
            br 3 (;@1;)
          end
        end
        local.get 0
        i32.load offset=28
        local.get 1
        local.get 2
        local.get 0
        i32.load offset=32
        i32.load offset=12
        call_indirect (type 2)
        return
      end
      local.get 4
      i32.const 8
      i32.shr_u
      i32.const 459007
      i32.and
      local.get 4
      i32.const 16711935
      i32.and
      i32.add
      i32.const 65537
      i32.mul
      i32.const 16
      i32.shr_u
      local.get 6
      i32.add
      local.set 6
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 10
        local.get 6
        i32.le_u
        br_if 0 (;@2;)
        local.get 10
        local.get 6
        i32.sub
        local.set 5
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              local.get 0
              i32.load8_u offset=24
              local.tee 4
              local.get 4
              i32.const 3
              i32.eq
              select
              local.tee 4
              br_table 2 (;@3;) 0 (;@5;) 1 (;@4;) 2 (;@3;)
            end
            local.get 5
            local.set 4
            i32.const 0
            local.set 5
            br 1 (;@3;)
          end
          local.get 5
          i32.const 1
          i32.shr_u
          local.set 4
          local.get 5
          i32.const 1
          i32.add
          i32.const 1
          i32.shr_u
          local.set 5
        end
        local.get 4
        i32.const 1
        i32.add
        local.set 4
        local.get 0
        i32.load offset=16
        local.set 9
        local.get 0
        i32.load offset=32
        local.set 8
        local.get 0
        i32.load offset=28
        local.set 7
        loop  ;; label = @3
          local.get 4
          i32.const -1
          i32.add
          local.tee 4
          i32.eqz
          br_if 2 (;@1;)
          local.get 7
          local.get 9
          local.get 8
          i32.load offset=16
          call_indirect (type 3)
          i32.eqz
          br_if 0 (;@3;)
        end
        i32.const 1
        return
      end
      local.get 0
      i32.load offset=28
      local.get 1
      local.get 2
      local.get 0
      i32.load offset=32
      i32.load offset=12
      call_indirect (type 2)
      return
    end
    block  ;; label = @1
      local.get 7
      local.get 1
      local.get 2
      local.get 8
      i32.load offset=12
      call_indirect (type 2)
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1
      return
    end
    i32.const 0
    local.set 4
    loop  ;; label = @1
      block  ;; label = @2
        local.get 5
        local.get 4
        i32.ne
        br_if 0 (;@2;)
        local.get 5
        local.get 5
        i32.lt_u
        return
      end
      local.get 4
      i32.const 1
      i32.add
      local.set 4
      local.get 7
      local.get 9
      local.get 8
      i32.load offset=16
      call_indirect (type 3)
      i32.eqz
      br_if 0 (;@1;)
    end
    local.get 4
    i32.const -1
    i32.add
    local.get 5
    i32.lt_u)
  (func $_ZN4core9panicking19assert_failed_inner17h1ca1e1236d2cdf82E (type 7) (param i32 i32 i32)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 112
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 1049180
    i32.store offset=12
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 3
    i32.const 1049180
    i32.store offset=20
    local.get 3
    local.get 1
    i32.store offset=16
    local.get 3
    i32.const 2
    i32.store offset=28
    local.get 3
    i32.const 1048664
    i32.store offset=24
    block  ;; label = @1
      local.get 2
      i32.load
      br_if 0 (;@1;)
      local.get 3
      i32.const 3
      i32.store offset=92
      local.get 3
      i32.const 1048716
      i32.store offset=88
      local.get 3
      i64.const 3
      i64.store offset=100 align=4
      local.get 3
      i32.const 9
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.tee 4
      local.get 3
      i32.const 16
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=72
      local.get 3
      local.get 4
      local.get 3
      i32.const 8
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=64
      local.get 3
      i32.const 3
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 3
      i32.const 24
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=56
      local.get 3
      local.get 3
      i32.const 56
      i32.add
      i32.store offset=96
      local.get 3
      i32.const 88
      i32.add
      i32.const 1050756
      call $_ZN4core9panicking9panic_fmt17h6f4dae69dcc1a6d2E
      unreachable
    end
    local.get 3
    i32.const 32
    i32.add
    i32.const 16
    i32.add
    local.get 2
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 3
    i32.const 32
    i32.add
    i32.const 8
    i32.add
    local.get 2
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 3
    local.get 2
    i64.load align=4
    i64.store offset=32
    local.get 3
    i32.const 4
    i32.store offset=92
    local.get 3
    i32.const 1048768
    i32.store offset=88
    local.get 3
    i64.const 4
    i64.store offset=100 align=4
    local.get 3
    i32.const 9
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee 4
    local.get 3
    i32.const 16
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=80
    local.get 3
    local.get 4
    local.get 3
    i32.const 8
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=72
    local.get 3
    i32.const 10
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 3
    i32.const 32
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=64
    local.get 3
    i32.const 3
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 3
    i32.const 24
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=56
    local.get 3
    local.get 3
    i32.const 56
    i32.add
    i32.store offset=96
    local.get 3
    i32.const 88
    i32.add
    i32.const 1050756
    call $_ZN4core9panicking9panic_fmt17h6f4dae69dcc1a6d2E
    unreachable)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h9262c679b64284cbE (type 3) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    local.get 0
    i32.load offset=4
    i32.load offset=12
    call_indirect (type 3))
  (func $_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17hd4dee50c6e05b753E (type 3) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=28
    local.get 1
    i32.load offset=32
    local.get 0
    call $_ZN4core3fmt5write17h2db157f4177a0bcdE)
  (func $_ZN63_$LT$core..cell..BorrowMutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h7e2d25337e043f9fE (type 3) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=28
    i32.const 1048624
    i32.const 14
    local.get 1
    i32.load offset=32
    i32.load offset=12
    call_indirect (type 2))
  (func $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17h93b0412dfe493e5eE (type 3) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    i32.load
    local.tee 0
    local.get 0
    i32.const 31
    i32.shr_s
    local.tee 2
    i32.xor
    local.get 2
    i32.sub
    local.get 0
    i32.const -1
    i32.xor
    i32.const 31
    i32.shr_u
    local.get 1
    call $_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hccdc97766a169818E)
  (func $_ZN4core5panic12PanicPayload6as_str17had35548f12cb95a5E (type 4) (param i32 i32)
    local.get 0
    i32.const 0
    i32.store)
  (func $_ZN3std9panicking20rust_panic_with_hook17hb39abb160cd4038cE (type 9) (param i32 i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    i32.const 0
    i32.const 0
    i32.load offset=1051460
    local.tee 5
    i32.const 1
    i32.add
    i32.store offset=1051460
    block  ;; label = @1
      local.get 5
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load8_u offset=1051936
          br_if 0 (;@3;)
          i32.const 0
          i32.const 0
          i32.load offset=1051932
          i32.const 1
          i32.add
          i32.store offset=1051932
          i32.const 0
          i32.load offset=1051456
          i32.const -1
          i32.gt_s
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        local.get 4
        i32.const 8
        i32.add
        local.get 0
        local.get 1
        call_indirect (type 4)
        unreachable
      end
      i32.const 0
      i32.const 0
      i32.store8 offset=1051936
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      call $rust_panic
      unreachable
    end
    unreachable)
  (func $rust_panic (type 0)
    unreachable)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hefbdb4092462aad3E (type 3) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.load
      i32.load8_u
      br_if 0 (;@1;)
      local.get 1
      i32.const 1049000
      i32.const 5
      call $_ZN4core3fmt9Formatter3pad17hc11ca54d5ab5b124E
      return
    end
    local.get 1
    i32.const 1049005
    i32.const 4
    call $_ZN4core3fmt9Formatter3pad17hc11ca54d5ab5b124E)
  (func $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17h913478210c562bc5E (type 9) (param i32 i32 i32 i32)
    (local i32 i32)
    local.get 1
    i32.load
    local.set 4
    block  ;; label = @1
      local.get 1
      i32.load offset=8
      local.tee 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      local.get 5
      i32.sub
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      i32.const 0
      local.set 5
      local.get 1
      i32.const 0
      i32.store offset=8
      local.get 1
      i32.const 0
      i32.store8 offset=12
    end
    block  ;; label = @1
      local.get 4
      local.get 3
      i32.le_u
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=4
      local.get 5
      i32.add
      local.get 2
      local.get 3
      call $memcpy
      drop
      local.get 0
      i32.const 4
      i32.store8
      local.get 1
      local.get 5
      local.get 3
      i32.add
      i32.store offset=8
      return
    end
    local.get 0
    i64.const 4
    i64.store align=4
    local.get 1
    i32.const 0
    i32.store8 offset=12)
  (func $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17hf020f522a8b3fdb1E (type 3) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load offset=8
    call $_ZN4core3fmt9Formatter3pad17hc11ca54d5ab5b124E)
  (func $_ZN4core3ptr118drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$std..io..cursor..Cursor$LT$$RF$mut$u20$$u5b$u8$u5d$$GT$$GT$$GT$17h638793d60ce6c6f0E (type 1) (param i32)
    (local i32 i32 i32)
    local.get 0
    i32.load offset=4
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u
        local.tee 0
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load
      local.set 0
      block  ;; label = @2
        local.get 1
        i32.const 4
        i32.add
        i32.load
        local.tee 2
        i32.load
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 3
        call_indirect (type 1)
      end
      block  ;; label = @2
        local.get 2
        i32.load offset=4
        local.tee 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 2
        call $__rust_dealloc
      end
      local.get 1
      i32.const 12
      call $__rust_dealloc
    end)
  (func $_ZN61_$LT$std..io..stdio..StdoutLock$u20$as$u20$std..io..Write$GT$9write_all17ha088a781b811bc7cE (type 9) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load offset=16
              br_if 0 (;@5;)
              local.get 1
              i32.const -1
              i32.store offset=16
              local.get 3
              i32.const 0
              local.get 3
              local.get 2
              i32.const 3
              i32.add
              i32.const -4
              i32.and
              local.get 2
              i32.sub
              local.tee 5
              i32.sub
              i32.const 7
              i32.and
              local.get 3
              local.get 5
              i32.lt_u
              select
              local.tee 6
              i32.sub
              local.set 7
              local.get 3
              local.get 6
              i32.lt_u
              br_if 1 (;@4;)
              block  ;; label = @6
                local.get 6
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 2
                    local.get 3
                    i32.add
                    local.tee 8
                    i32.const -1
                    i32.add
                    local.tee 9
                    i32.load8_u
                    i32.const 10
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 6
                    i32.const -1
                    i32.add
                    local.set 6
                    br 1 (;@7;)
                  end
                  local.get 2
                  local.get 7
                  i32.add
                  local.tee 10
                  local.get 9
                  i32.eq
                  br_if 1 (;@6;)
                  block  ;; label = @8
                    local.get 8
                    i32.const -2
                    i32.add
                    local.tee 9
                    i32.load8_u
                    i32.const 10
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 6
                    i32.const -2
                    i32.add
                    local.set 6
                    br 1 (;@7;)
                  end
                  local.get 10
                  local.get 9
                  i32.eq
                  br_if 1 (;@6;)
                  block  ;; label = @8
                    local.get 8
                    i32.const -3
                    i32.add
                    local.tee 9
                    i32.load8_u
                    i32.const 10
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 6
                    i32.const -3
                    i32.add
                    local.set 6
                    br 1 (;@7;)
                  end
                  local.get 10
                  local.get 9
                  i32.eq
                  br_if 1 (;@6;)
                  block  ;; label = @8
                    local.get 8
                    i32.const -4
                    i32.add
                    local.tee 9
                    i32.load8_u
                    i32.const 10
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 6
                    i32.const -4
                    i32.add
                    local.set 6
                    br 1 (;@7;)
                  end
                  local.get 10
                  local.get 9
                  i32.eq
                  br_if 1 (;@6;)
                  block  ;; label = @8
                    local.get 8
                    i32.const -5
                    i32.add
                    local.tee 9
                    i32.load8_u
                    i32.const 10
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 6
                    i32.const -5
                    i32.add
                    local.set 6
                    br 1 (;@7;)
                  end
                  local.get 10
                  local.get 9
                  i32.eq
                  br_if 1 (;@6;)
                  block  ;; label = @8
                    local.get 8
                    i32.const -6
                    i32.add
                    local.tee 9
                    i32.load8_u
                    i32.const 10
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 6
                    i32.const -6
                    i32.add
                    local.set 6
                    br 1 (;@7;)
                  end
                  local.get 10
                  local.get 9
                  i32.eq
                  br_if 1 (;@6;)
                  block  ;; label = @8
                    local.get 8
                    i32.const -7
                    i32.add
                    local.tee 9
                    i32.load8_u
                    i32.const 10
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 6
                    i32.const -7
                    i32.add
                    local.set 6
                    br 1 (;@7;)
                  end
                  local.get 10
                  local.get 9
                  i32.eq
                  br_if 1 (;@6;)
                  local.get 6
                  i32.const -8
                  i32.or
                  local.set 6
                end
                local.get 6
                local.get 7
                i32.add
                i32.const 1
                i32.add
                local.set 6
                br 4 (;@2;)
              end
              local.get 5
              local.get 3
              local.get 3
              local.get 5
              i32.gt_u
              select
              local.set 11
              i32.const 0
              local.get 6
              i32.sub
              local.set 8
              local.get 2
              i32.const -4
              i32.add
              local.set 12
              local.get 6
              i32.const -1
              i32.xor
              local.get 2
              i32.add
              local.set 10
              block  ;; label = @6
                loop  ;; label = @7
                  local.get 10
                  local.set 5
                  local.get 8
                  local.set 6
                  local.get 7
                  local.tee 9
                  local.get 11
                  i32.le_u
                  br_if 1 (;@6;)
                  local.get 6
                  i32.const -8
                  i32.add
                  local.set 8
                  local.get 5
                  i32.const -8
                  i32.add
                  local.set 10
                  i32.const 16843008
                  local.get 2
                  local.get 9
                  i32.const -8
                  i32.add
                  local.tee 7
                  i32.add
                  i32.load
                  local.tee 13
                  i32.const 168430090
                  i32.xor
                  i32.sub
                  local.get 13
                  i32.or
                  i32.const 16843008
                  local.get 12
                  local.get 9
                  i32.add
                  i32.load
                  local.tee 13
                  i32.const 168430090
                  i32.xor
                  i32.sub
                  local.get 13
                  i32.or
                  i32.and
                  i32.const -2139062144
                  i32.and
                  i32.const -2139062144
                  i32.eq
                  br_if 0 (;@7;)
                end
              end
              local.get 9
              local.get 3
              i32.gt_u
              br_if 2 (;@3;)
              block  ;; label = @6
                loop  ;; label = @7
                  local.get 3
                  local.get 6
                  i32.add
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 6
                  i32.const -1
                  i32.add
                  local.set 6
                  local.get 5
                  local.get 3
                  i32.add
                  local.set 9
                  local.get 5
                  i32.const -1
                  i32.add
                  local.set 5
                  local.get 9
                  i32.load8_u
                  i32.const 10
                  i32.ne
                  br_if 0 (;@7;)
                end
                local.get 3
                local.get 6
                i32.add
                i32.const 1
                i32.add
                local.set 6
                br 4 (;@2;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  i32.const 28
                  i32.add
                  i32.load
                  local.tee 6
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 6
                  br 1 (;@6;)
                end
                local.get 1
                i32.const 24
                i32.add
                i32.load
                local.get 6
                i32.add
                i32.const -1
                i32.add
                i32.load8_u
                i32.const 10
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                local.set 6
                local.get 1
                i32.const 0
                i32.store8 offset=32
                local.get 1
                i32.const 28
                i32.add
                i32.const 0
                i32.store
              end
              block  ;; label = @6
                local.get 1
                i32.load offset=20
                local.get 6
                i32.sub
                local.get 3
                i32.gt_u
                br_if 0 (;@6;)
                local.get 0
                local.get 1
                i32.const 20
                i32.add
                local.get 2
                local.get 3
                call $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17h913478210c562bc5E
                br 5 (;@1;)
              end
              local.get 1
              i32.load offset=24
              local.get 6
              i32.add
              local.get 2
              local.get 3
              call $memcpy
              drop
              local.get 0
              i32.const 4
              i32.store8
              local.get 1
              i32.const 28
              i32.add
              local.get 6
              local.get 3
              i32.add
              i32.store
              br 4 (;@1;)
            end
            i32.const 1050456
            call $_ZN4core4cell22panic_already_borrowed17hbffcf7bee9630722E
            unreachable
          end
          local.get 7
          local.get 3
          call $_ZN4core5slice5index26slice_start_index_len_fail17h6ba96fe804246016E
          unreachable
        end
        local.get 9
        local.get 3
        call $_ZN4core5slice5index24slice_end_index_len_fail17hddeff0f8fd5a93e3E
        unreachable
      end
      block  ;; label = @2
        local.get 3
        local.get 6
        i32.ge_u
        br_if 0 (;@2;)
        local.get 4
        i32.const 0
        i32.store offset=24
        local.get 4
        i32.const 1
        i32.store offset=12
        local.get 4
        i32.const 1049600
        i32.store offset=8
        local.get 4
        i64.const 4
        i64.store offset=16 align=4
        local.get 4
        i32.const 8
        i32.add
        i32.const 1049608
        call $_ZN4core9panicking9panic_fmt17h6f4dae69dcc1a6d2E
        unreachable
      end
      block  ;; label = @2
        local.get 1
        i32.const 28
        i32.add
        i32.load
        local.tee 5
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 6
              local.get 1
              i32.load offset=20
              local.get 5
              i32.sub
              i32.lt_u
              br_if 0 (;@5;)
              local.get 4
              i32.const 8
              i32.add
              local.get 1
              i32.const 20
              i32.add
              local.get 2
              local.get 6
              call $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17h913478210c562bc5E
              local.get 4
              i32.load8_u offset=8
              i32.const 4
              i32.ne
              br_if 1 (;@4;)
              local.get 1
              i32.const 28
              i32.add
              i32.load
              local.set 5
              br 2 (;@3;)
            end
            local.get 1
            i32.const 24
            i32.add
            i32.load
            local.get 5
            i32.add
            local.get 2
            local.get 6
            call $memcpy
            drop
            local.get 1
            i32.const 28
            i32.add
            local.get 5
            local.get 6
            i32.add
            local.tee 5
            i32.store
            br 1 (;@3;)
          end
          local.get 0
          local.get 4
          i64.load offset=8
          i64.store align=4
          br 2 (;@1;)
        end
        local.get 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.const 0
        i32.store8 offset=32
        local.get 1
        i32.const 28
        i32.add
        i32.const 0
        i32.store
      end
      local.get 2
      local.get 6
      i32.add
      local.set 5
      block  ;; label = @2
        local.get 3
        local.get 6
        i32.sub
        local.tee 6
        local.get 1
        i32.load offset=20
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.const 20
        i32.add
        local.get 5
        local.get 6
        call $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17h913478210c562bc5E
        br 1 (;@1;)
      end
      local.get 1
      i32.const 24
      i32.add
      i32.load
      local.get 5
      local.get 6
      call $memcpy
      drop
      local.get 0
      i32.const 4
      i32.store8
      local.get 1
      i32.const 28
      i32.add
      local.get 6
      i32.store
    end
    local.get 1
    local.get 1
    i32.load offset=16
    i32.const 1
    i32.add
    i32.store offset=16
    local.get 4
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h06fde2fde8459d7cE (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i64 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 8
    i32.add
    local.get 0
    i32.load offset=8
    i32.load
    local.get 1
    local.get 2
    call $_ZN61_$LT$std..io..stdio..StdoutLock$u20$as$u20$std..io..Write$GT$9write_all17ha088a781b811bc7cE
    block  ;; label = @1
      local.get 3
      i32.load8_u offset=8
      local.tee 2
      i32.const 4
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.set 4
      local.get 3
      i64.load offset=8
      local.set 5
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load8_u
          local.tee 1
          i32.const 4
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 4
        i32.load
        local.set 1
        block  ;; label = @3
          local.get 4
          i32.const 4
          i32.add
          i32.load
          local.tee 6
          i32.load
          local.tee 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 7
          call_indirect (type 1)
        end
        block  ;; label = @3
          local.get 6
          i32.load offset=4
          local.tee 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 6
          call $__rust_dealloc
        end
        local.get 4
        i32.const 12
        call $__rust_dealloc
      end
      local.get 0
      local.get 5
      i64.store align=4
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2
    i32.const 4
    i32.ne)
  (func $_ZN4core3fmt5Write10write_char17h4bfce8670c10859bE (type 3) (param i32 i32) (result i32)
    (local i32 i32 i64 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=4
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 128
        i32.lt_u
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 1
          i32.const 2048
          i32.lt_u
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 1
            i32.const 65536
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=7
            local.get 2
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 240
            i32.or
            i32.store8 offset=4
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=6
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=5
            i32.const 4
            local.set 1
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=6
          local.get 2
          local.get 1
          i32.const 12
          i32.shr_u
          i32.const 224
          i32.or
          i32.store8 offset=4
          local.get 2
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=5
          i32.const 3
          local.set 1
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=5
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=4
        i32.const 2
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.store8 offset=4
      i32.const 1
      local.set 1
    end
    local.get 2
    i32.const 8
    i32.add
    local.get 0
    i32.load offset=8
    i32.load
    local.get 2
    i32.const 4
    i32.add
    local.get 1
    call $_ZN61_$LT$std..io..stdio..StdoutLock$u20$as$u20$std..io..Write$GT$9write_all17ha088a781b811bc7cE
    block  ;; label = @1
      local.get 2
      i32.load8_u offset=8
      local.tee 1
      i32.const 4
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.set 3
      local.get 2
      i64.load offset=8
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load8_u
          local.tee 5
          i32.const 4
          i32.gt_u
          br_if 0 (;@3;)
          local.get 5
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 3
        i32.load
        local.set 5
        block  ;; label = @3
          local.get 3
          i32.const 4
          i32.add
          i32.load
          local.tee 6
          i32.load
          local.tee 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          local.get 7
          call_indirect (type 1)
        end
        block  ;; label = @3
          local.get 6
          i32.load offset=4
          local.tee 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          local.get 6
          call $__rust_dealloc
        end
        local.get 3
        i32.const 12
        call $__rust_dealloc
      end
      local.get 0
      local.get 4
      i64.store align=4
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1
    i32.const 4
    i32.ne)
  (func $_ZN4core3fmt5Write9write_fmt17hafadb5e83a43beb6E (type 3) (param i32 i32) (result i32)
    local.get 0
    i32.const 1049196
    local.get 1
    call $_ZN4core3fmt5write17h2db157f4177a0bcdE)
  (func $_ZN3std3sys9backtrace26__rust_end_short_backtrace17h8eb99c908c86e40bE (type 1) (param i32)
    local.get 0
    call $_ZN3std9panicking19begin_panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17h83b3d84f04c7372bE
    unreachable)
  (func $_ZN3std9panicking19begin_panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17h83b3d84f04c7372bE (type 1) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.tee 2
    i32.load offset=12
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.load offset=4
            br_table 0 (;@4;) 1 (;@3;) 2 (;@2;)
          end
          local.get 3
          br_if 1 (;@2;)
          i32.const 1
          local.set 2
          i32.const 0
          local.set 3
          br 2 (;@1;)
        end
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        i32.load
        local.tee 2
        i32.load offset=4
        local.set 3
        local.get 2
        i32.load
        local.set 2
        br 1 (;@1;)
      end
      local.get 1
      i32.const -2147483648
      i32.store
      local.get 1
      local.get 0
      i32.store offset=12
      local.get 1
      i32.const 11
      local.get 0
      i32.load offset=8
      local.tee 0
      i32.load8_u offset=8
      local.get 0
      i32.load8_u offset=9
      call $_ZN3std9panicking20rust_panic_with_hook17hb39abb160cd4038cE
      unreachable
    end
    local.get 1
    local.get 3
    i32.store offset=4
    local.get 1
    local.get 2
    i32.store
    local.get 1
    i32.const 12
    local.get 0
    i32.load offset=8
    local.tee 0
    i32.load8_u offset=8
    local.get 0
    i32.load8_u offset=9
    call $_ZN3std9panicking20rust_panic_with_hook17hb39abb160cd4038cE
    unreachable)
  (func $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$6as_str17h942de68efd2647a4E (type 4) (param i32 i32)
    local.get 0
    local.get 1
    i64.load align=4
    i64.store)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17ha51abd6cd7031e06E (type 4) (param i32 i32)
    (local i32 i32 i32 i32)
    i32.const 31
    local.set 2
    block  ;; label = @1
      local.get 1
      i32.const 16777215
      i32.gt_u
      br_if 0 (;@1;)
      local.get 1
      i32.const 6
      local.get 1
      i32.const 8
      i32.shr_u
      i32.clz
      local.tee 2
      i32.sub
      i32.shr_u
      i32.const 1
      i32.and
      local.get 2
      i32.const 1
      i32.shl
      i32.sub
      i32.const 62
      i32.add
      local.set 2
    end
    local.get 0
    i64.const 0
    i64.store offset=16 align=4
    local.get 0
    local.get 2
    i32.store offset=28
    local.get 2
    i32.const 2
    i32.shl
    i32.const 1051480
    i32.add
    local.set 3
    block  ;; label = @1
      i32.const 0
      i32.load offset=1051892
      i32.const 1
      local.get 2
      i32.shl
      local.tee 4
      i32.and
      br_if 0 (;@1;)
      local.get 3
      local.get 0
      i32.store
      local.get 0
      local.get 3
      i32.store offset=24
      local.get 0
      local.get 0
      i32.store offset=12
      local.get 0
      local.get 0
      i32.store offset=8
      i32.const 0
      i32.const 0
      i32.load offset=1051892
      local.get 4
      i32.or
      i32.store offset=1051892
      return
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.load
          local.tee 4
          i32.load offset=4
          i32.const -8
          i32.and
          local.get 1
          i32.ne
          br_if 0 (;@3;)
          local.get 4
          local.set 2
          br 1 (;@2;)
        end
        local.get 1
        i32.const 0
        i32.const 25
        local.get 2
        i32.const 1
        i32.shr_u
        i32.sub
        local.get 2
        i32.const 31
        i32.eq
        select
        i32.shl
        local.set 3
        loop  ;; label = @3
          local.get 4
          local.get 3
          i32.const 29
          i32.shr_u
          i32.const 4
          i32.and
          i32.add
          i32.const 16
          i32.add
          local.tee 5
          i32.load
          local.tee 2
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.const 1
          i32.shl
          local.set 3
          local.get 2
          local.set 4
          local.get 2
          i32.load offset=4
          i32.const -8
          i32.and
          local.get 1
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 2
      i32.load offset=8
      local.tee 3
      local.get 0
      i32.store offset=12
      local.get 2
      local.get 0
      i32.store offset=8
      local.get 0
      i32.const 0
      i32.store offset=24
      local.get 0
      local.get 2
      i32.store offset=12
      local.get 0
      local.get 3
      i32.store offset=8
      return
    end
    local.get 5
    local.get 0
    i32.store
    local.get 0
    local.get 4
    i32.store offset=24
    local.get 0
    local.get 0
    i32.store offset=12
    local.get 0
    local.get 0
    i32.store offset=8)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h0d0f475ea8907bb5E (type 4) (param i32 i32)
    (local i32 i32 i32 i32)
    local.get 0
    i32.load offset=12
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const 256
          i32.lt_u
          br_if 0 (;@3;)
          local.get 0
          i32.load offset=24
          local.set 3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                local.get 0
                i32.ne
                br_if 0 (;@6;)
                local.get 0
                i32.const 20
                i32.const 16
                local.get 0
                i32.load offset=20
                local.tee 2
                select
                i32.add
                i32.load
                local.tee 1
                br_if 1 (;@5;)
                i32.const 0
                local.set 2
                br 2 (;@4;)
              end
              local.get 0
              i32.load offset=8
              local.tee 1
              local.get 2
              i32.store offset=12
              local.get 2
              local.get 1
              i32.store offset=8
              br 1 (;@4;)
            end
            local.get 0
            i32.const 20
            i32.add
            local.get 0
            i32.const 16
            i32.add
            local.get 2
            select
            local.set 4
            loop  ;; label = @5
              local.get 4
              local.set 5
              local.get 1
              local.tee 2
              i32.const 20
              i32.add
              local.get 2
              i32.const 16
              i32.add
              local.get 2
              i32.load offset=20
              local.tee 1
              select
              local.set 4
              local.get 2
              i32.const 20
              i32.const 16
              local.get 1
              select
              i32.add
              i32.load
              local.tee 1
              br_if 0 (;@5;)
            end
            local.get 5
            i32.const 0
            i32.store
          end
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          block  ;; label = @4
            local.get 0
            i32.load offset=28
            i32.const 2
            i32.shl
            i32.const 1051480
            i32.add
            local.tee 1
            i32.load
            local.get 0
            i32.eq
            br_if 0 (;@4;)
            local.get 3
            i32.const 16
            i32.const 20
            local.get 3
            i32.load offset=16
            local.get 0
            i32.eq
            select
            i32.add
            local.get 2
            i32.store
            local.get 2
            i32.eqz
            br_if 3 (;@1;)
            br 2 (;@2;)
          end
          local.get 1
          local.get 2
          i32.store
          local.get 2
          br_if 1 (;@2;)
          i32.const 0
          i32.const 0
          i32.load offset=1051892
          i32.const -2
          local.get 0
          i32.load offset=28
          i32.rotl
          i32.and
          i32.store offset=1051892
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 2
          local.get 0
          i32.load offset=8
          local.tee 4
          i32.eq
          br_if 0 (;@3;)
          local.get 4
          local.get 2
          i32.store offset=12
          local.get 2
          local.get 4
          i32.store offset=8
          return
        end
        i32.const 0
        i32.const 0
        i32.load offset=1051888
        i32.const -2
        local.get 1
        i32.const 3
        i32.shr_u
        i32.rotl
        i32.and
        i32.store offset=1051888
        return
      end
      local.get 2
      local.get 3
      i32.store offset=24
      block  ;; label = @2
        local.get 0
        i32.load offset=16
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 1
        i32.store offset=16
        local.get 1
        local.get 2
        i32.store offset=24
      end
      local.get 0
      i32.load offset=20
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 1
      i32.store offset=20
      local.get 1
      local.get 2
      i32.store offset=24
      return
    end)
  (func $memcpy (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 16
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.set 3
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 0
        i32.const 0
        local.get 0
        i32.sub
        i32.const 3
        i32.and
        local.tee 4
        i32.add
        local.tee 5
        local.get 0
        i32.le_u
        br_if 0 (;@2;)
        local.get 4
        i32.const -1
        i32.add
        local.set 6
        local.get 0
        local.set 3
        local.get 1
        local.set 7
        block  ;; label = @3
          local.get 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.set 8
          local.get 0
          local.set 3
          local.get 1
          local.set 7
          loop  ;; label = @4
            local.get 3
            local.get 7
            i32.load8_u
            i32.store8
            local.get 7
            i32.const 1
            i32.add
            local.set 7
            local.get 3
            i32.const 1
            i32.add
            local.set 3
            local.get 8
            i32.const -1
            i32.add
            local.tee 8
            br_if 0 (;@4;)
          end
        end
        local.get 6
        i32.const 7
        i32.lt_u
        br_if 0 (;@2;)
        loop  ;; label = @3
          local.get 3
          local.get 7
          i32.load8_u
          i32.store8
          local.get 3
          i32.const 1
          i32.add
          local.get 7
          i32.const 1
          i32.add
          i32.load8_u
          i32.store8
          local.get 3
          i32.const 2
          i32.add
          local.get 7
          i32.const 2
          i32.add
          i32.load8_u
          i32.store8
          local.get 3
          i32.const 3
          i32.add
          local.get 7
          i32.const 3
          i32.add
          i32.load8_u
          i32.store8
          local.get 3
          i32.const 4
          i32.add
          local.get 7
          i32.const 4
          i32.add
          i32.load8_u
          i32.store8
          local.get 3
          i32.const 5
          i32.add
          local.get 7
          i32.const 5
          i32.add
          i32.load8_u
          i32.store8
          local.get 3
          i32.const 6
          i32.add
          local.get 7
          i32.const 6
          i32.add
          i32.load8_u
          i32.store8
          local.get 3
          i32.const 7
          i32.add
          local.get 7
          i32.const 7
          i32.add
          i32.load8_u
          i32.store8
          local.get 7
          i32.const 8
          i32.add
          local.set 7
          local.get 3
          i32.const 8
          i32.add
          local.tee 3
          local.get 5
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 5
      local.get 2
      local.get 4
      i32.sub
      local.tee 8
      i32.const -4
      i32.and
      local.tee 6
      i32.add
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          local.get 4
          i32.add
          local.tee 7
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 5
          local.get 3
          i32.ge_u
          br_if 1 (;@2;)
          local.get 7
          local.set 1
          loop  ;; label = @4
            local.get 5
            local.get 1
            i32.load
            i32.store
            local.get 1
            i32.const 4
            i32.add
            local.set 1
            local.get 5
            i32.const 4
            i32.add
            local.tee 5
            local.get 3
            i32.lt_u
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        local.get 5
        local.get 3
        i32.ge_u
        br_if 0 (;@2;)
        local.get 7
        i32.const 3
        i32.shl
        local.tee 2
        i32.const 24
        i32.and
        local.set 4
        local.get 7
        i32.const -4
        i32.and
        local.tee 9
        i32.const 4
        i32.add
        local.set 1
        i32.const 0
        local.get 2
        i32.sub
        i32.const 24
        i32.and
        local.set 10
        local.get 9
        i32.load
        local.set 2
        loop  ;; label = @3
          local.get 5
          local.get 2
          local.get 4
          i32.shr_u
          local.get 1
          i32.load
          local.tee 2
          local.get 10
          i32.shl
          i32.or
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 4
          i32.add
          local.tee 5
          local.get 3
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 8
      i32.const 3
      i32.and
      local.set 2
      local.get 7
      local.get 6
      i32.add
      local.set 1
    end
    block  ;; label = @1
      local.get 3
      local.get 3
      local.get 2
      i32.add
      local.tee 5
      i32.ge_u
      br_if 0 (;@1;)
      local.get 2
      i32.const -1
      i32.add
      local.set 8
      block  ;; label = @2
        local.get 2
        i32.const 7
        i32.and
        local.tee 7
        i32.eqz
        br_if 0 (;@2;)
        loop  ;; label = @3
          local.get 3
          local.get 1
          i32.load8_u
          i32.store8
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 3
          i32.const 1
          i32.add
          local.set 3
          local.get 7
          i32.const -1
          i32.add
          local.tee 7
          br_if 0 (;@3;)
        end
      end
      local.get 8
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 1
        i32.add
        local.get 1
        i32.const 1
        i32.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 2
        i32.add
        local.get 1
        i32.const 2
        i32.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 3
        i32.add
        local.get 1
        i32.const 3
        i32.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 4
        i32.add
        local.get 1
        i32.const 4
        i32.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 5
        i32.add
        local.get 1
        i32.const 5
        i32.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 6
        i32.add
        local.get 1
        i32.const 6
        i32.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 7
        i32.add
        local.get 1
        i32.const 7
        i32.add
        i32.load8_u
        i32.store8
        local.get 1
        i32.const 8
        i32.add
        local.set 1
        local.get 3
        i32.const 8
        i32.add
        local.tee 3
        local.get 5
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (table (;0;) 18 18 funcref)
  (memory (;0;) 17)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1051944))
  (global (;2;) i32 (i32.const 1051952))
  (export "memory" (memory 0))
  (export "main" (func $main))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (elem (;0;) (i32.const 1) func $_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17h827e6c298a6efca8E $_ZN60_$LT$std..io..error..Error$u20$as$u20$core..fmt..Display$GT$3fmt17h30be016d72c8d3dcE $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h3f6b07f8c27f3005E $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17h93b0412dfe493e5eE $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17hf020f522a8b3fdb1E $_ZN13vector_runner4main17h9e310ceb15120183E $_ZN63_$LT$core..cell..BorrowMutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h7e2d25337e043f9fE $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h63293e3d55e16e04E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h9262c679b64284cbE $_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17hd4dee50c6e05b753E $_ZN4core5panic12PanicPayload6as_str17had35548f12cb95a5E $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$6as_str17h942de68efd2647a4E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hefbdb4092462aad3E $_ZN4core3ptr118drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$std..io..cursor..Cursor$LT$$RF$mut$u20$$u5b$u8$u5d$$GT$$GT$$GT$17h638793d60ce6c6f0E $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h06fde2fde8459d7cE $_ZN4core3fmt5Write10write_char17h4bfce8670c10859bE $_ZN4core3fmt5Write9write_fmt17hafadb5e83a43beb6E)
  (data $.rodata (i32.const 1048576) "KernelTask: row=, col=\0a\00\00\00\10\00\10\00\00\00\10\00\10\00\06\00\00\00\16\00\10\00\01\00\00\00BorrowMutErroralready borrowed: >\00\10\00\12\00\00\00==assertion `left  right` failed\0a  left: \0a right: \00\00Z\00\10\00\10\00\00\00j\00\10\00\17\00\00\00\81\00\10\00\09\00\00\00 right` failed: \0a  left: \00\00\00Z\00\10\00\10\00\00\00\a4\00\10\00\10\00\00\00\b4\00\10\00\09\00\00\00\81\00\10\00\09\00\00\0000010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899falsetruelibrary/core/src/slice/memchr.rs\00\00\00\b1\01\10\00 \00\00\00\85\00\00\00\1e\00\00\00\b1\01\10\00 \00\00\00\a1\00\00\00\09\00\00\00range start index  out of range for slice of length \f4\01\10\00\12\00\00\00\06\02\10\00\22\00\00\00range end index 8\02\10\00\10\00\00\00\06\02\10\00\22\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\0d\00\00\00\0e\00\00\00\0c\00\00\00\04\00\00\00\0f\00\00\00\10\00\00\00\11\00\00\00/rust/deps/dlmalloc-0.2.7/src/dlmalloc.rsassertion failed: psize >= size + min_overhead\00\84\02\10\00)\00\00\00\a8\04\00\00\09\00\00\00assertion failed: psize <= size + max_overhead\00\00\84\02\10\00)\00\00\00\ae\04\00\00\0d\00\00\00library/std/src/rt.rs\00\00\00,\03\10\00\15\00\00\00\90\00\00\00\0d\00\00\00library/std/src/thread/mod.rsfailed to generate unique thread ID: bitspace exhaustedq\03\10\007\00\00\00T\03\10\00\1d\00\00\00\ae\04\00\00\0d\00\00\00\01\00\00\00\00\00\00\00library/std/src/io/buffered/linewritershim.rsmid > len\00\00\f5\03\10\00\09\00\00\00\c8\03\10\00-\00\00\00\16\01\00\00)\00\00\00entity not foundpermission deniedconnection refusedconnection resethost unreachablenetwork unreachableconnection abortednot connectedaddress in useaddress not availablenetwork downbroken pipeentity already existsoperation would blocknot a directoryis a directorydirectory not emptyread-only filesystem or storage mediumfilesystem loop or indirection limit (e.g. symlink loop)stale network file handleinvalid input parameterinvalid datatimed outwrite zerono storage spaceseek on unseekable filequota exceededfile too largeresource busyexecutable file busydeadlockcross-device link or renametoo many linksinvalid filenameargument list too longoperation interruptedunsupportedunexpected end of fileout of memoryin progressother erroruncategorized error (os error )\00\00\00\01\00\00\00\00\00\00\00\05\07\10\00\0b\00\00\00\10\07\10\00\01\00\00\00library/std/src/io/stdio.rs\00,\07\10\00\1b\00\00\00\b9\02\00\00\13\00\00\00,\07\10\00\1b\00\00\002\03\00\00\14\00\00\00failed printing to : \00\00\00h\07\10\00\13\00\00\00{\07\10\00\02\00\00\00,\07\10\00\1b\00\00\00c\04\00\00\09\00\00\00stdoutlibrary/std/src/io/mod.rsa formatting trait implementation returned an error when the underlying stream did not\00\00\00\bf\07\10\00V\00\00\00\a6\07\10\00\19\00\00\00h\07\00\00\15\00\00\00cannot recursively acquire mutex0\08\10\00 \00\00\00library/std/src/sys/sync/mutex/no_threads.rsX\08\10\00,\00\00\00\13\00\00\00\09\00\00\00library/std/src/sync/poison/once.rs\00\94\08\10\00#\00\00\00\d9\00\00\00\14\00\00\00lock count overflow in reentrant mutexlibrary/std/src/sync/reentrant_lock.rs\ee\08\10\00&\00\00\00\22\01\00\00-\00\00\00operation successfulOnce instance has previously been poisoned\00\008\09\10\00*\00\00\00one-time initialization may not be performed recursivelyl\09\10\008\00\00\00\10\00\00\00\11\00\00\00\12\00\00\00\10\00\00\00\10\00\00\00\13\00\00\00\12\00\00\00\0d\00\00\00\0e\00\00\00\15\00\00\00\0c\00\00\00\0b\00\00\00\15\00\00\00\15\00\00\00\0f\00\00\00\0e\00\00\00\13\00\00\00&\00\00\008\00\00\00\19\00\00\00\17\00\00\00\0c\00\00\00\09\00\00\00\0a\00\00\00\10\00\00\00\17\00\00\00\0e\00\00\00\0e\00\00\00\0d\00\00\00\14\00\00\00\08\00\00\00\1b\00\00\00\0e\00\00\00\10\00\00\00\16\00\00\00\15\00\00\00\0b\00\00\00\16\00\00\00\0d\00\00\00\0b\00\00\00\0b\00\00\00\13\00\00\00\18\04\10\00(\04\10\009\04\10\00K\04\10\00[\04\10\00k\04\10\00~\04\10\00\90\04\10\00\9d\04\10\00\ab\04\10\00\c0\04\10\00\cc\04\10\00\d7\04\10\00\ec\04\10\00\01\05\10\00\10\05\10\00\1e\05\10\001\05\10\00W\05\10\00\8f\05\10\00\a8\05\10\00\bf\05\10\00\cb\05\10\00\d4\05\10\00\de\05\10\00\ee\05\10\00\05\06\10\00\13\06\10\00!\06\10\00.\06\10\00B\06\10\00J\06\10\00e\06\10\00s\06\10\00\83\06\10\00\99\06\10\00\ae\06\10\00\b9\06\10\00\cf\06\10\00\dc\06\10\00\e7\06\10\00\f2\06\10\00"))
