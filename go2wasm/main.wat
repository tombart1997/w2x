(module $main
  (type (;0;) (func (param i32)))
  (type (;1;) (func))
  (type (;2;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32) (result i32)))
  (type (;4;) (func (param i32 i32)))
  (type (;5;) (func (result i32)))
  (type (;6;) (func (param i32) (result i32)))
  (type (;7;) (func (param i32 i32 i32) (result i32)))
  (type (;8;) (func (param i32 i32 i32 i32)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $runtime.proc_exit (type 0)))
  (import "wasi_snapshot_preview1" "fd_write" (func $runtime.fd_write (type 2)))
  (import "wasi_snapshot_preview1" "random_get" (func $__imported_wasi_snapshot_preview1_random_get (type 3)))
  (func $tinygo_getCurrentStackPointer (type 5) (result i32)
    global.get $__stack_pointer)
  (func $tinygo_unwind (type 0) (param i32)
    i32.const 65808
    i32.load8_u
    if  ;; label = @1
      call $asyncify_stop_rewind
      i32.const 65808
      i32.const 0
      i32.store8
    else
      local.get 0
      global.get $__stack_pointer
      i32.store offset=4
      local.get 0
      call $asyncify_start_unwind
    end)
  (func $tinygo_launch (type 0) (param i32)
    (local i32)
    global.get $__stack_pointer
    local.set 1
    local.get 0
    i32.load offset=12
    global.set $__stack_pointer
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load
    call_indirect (type 0)
    call $asyncify_stop_unwind
    local.get 1
    global.set $__stack_pointer)
  (func $tinygo_rewind (type 0) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    local.set 1
    local.get 0
    i32.load offset=12
    global.set $__stack_pointer
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load
    local.set 2
    i32.const 65808
    i32.const 1
    i32.store8
    local.get 0
    i32.const 8
    i32.add
    call $asyncify_start_rewind
    local.get 2
    call_indirect (type 0)
    call $asyncify_stop_unwind
    local.get 1
    global.set $__stack_pointer)
  (func $__wasi_random_get (type 3) (param i32 i32) (result i32)
    (local i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 8
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 1
      i32.load
      local.set 0
      local.get 1
      i32.load offset=4
      local.set 1
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32)  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        i32.const 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        local.get 0
        local.get 1
        call $__imported_wasi_snapshot_preview1_random_get
        local.set 2
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 2
        local.set 0
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        local.get 0
        i32.const 65535
        i32.and
        return
      end
      unreachable
    end
    local.set 2
    global.get 2
    i32.load
    local.get 2
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 2
    local.get 0
    i32.store
    local.get 2
    local.get 1
    i32.store offset=4
    global.get 2
    global.get 2
    i32.load
    i32.const 8
    i32.add
    i32.store
    i32.const 0)
  (func $dummy (type 1)
    nop)
  (func $__wasm_call_dtors (type 1)
    call $dummy
    call $dummy)
  (func $__getentropy (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 12
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 2
      i32.load
      local.set 0
      local.get 2
      i32.load offset=4
      local.set 1
      local.get 2
      i32.load offset=8
      local.set 2
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 4
      end
      block  ;; label = @2
        global.get 1
        if (result i32)  ;; label = @3
          i32.const 0
        else
          i32.const 29
          local.set 2
          local.get 1
          i32.const 256
          i32.gt_u
        end
        global.get 1
        i32.eqz
        i32.and
        br_if 0 (;@2;)
        local.get 4
        i32.const 0
        global.get 1
        select
        i32.eqz
        if  ;; label = @3
          local.get 0
          local.get 1
          call $__wasi_random_get
          local.set 3
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 2 (;@1;)
          drop
          local.get 3
          local.set 2
        end
        global.get 1
        i32.eqz
        if  ;; label = @3
          local.get 2
          br_if 1 (;@2;)
          i32.const 0
          return
        end
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        i32.const 65812
        local.get 2
        i32.store
        i32.const -1
        return
      end
      unreachable
    end
    local.set 3
    global.get 2
    i32.load
    local.get 3
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 3
    local.get 0
    i32.store
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 2
    i32.store offset=8
    global.get 2
    global.get 2
    i32.load
    i32.const 12
    i32.add
    i32.store
    i32.const 0)
  (func $memcpy (type 7) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      block (result i32)  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 32
          i32.le_u
          if  ;; label = @4
            local.get 1
            i32.const 3
            i32.and
            i32.eqz
            local.get 2
            i32.eqz
            i32.or
            br_if 1 (;@3;)
            local.get 0
            local.get 1
            i32.load8_u
            i32.store8
            local.get 0
            i32.const 1
            i32.add
            local.tee 4
            local.get 1
            i32.const 1
            i32.add
            local.tee 3
            i32.const 3
            i32.and
            i32.eqz
            local.get 2
            i32.const 1
            i32.sub
            local.tee 5
            i32.eqz
            i32.or
            br_if 2 (;@2;)
            drop
            local.get 0
            local.get 1
            i32.load8_u offset=1
            i32.store8 offset=1
            local.get 0
            i32.const 2
            i32.add
            local.tee 4
            local.get 1
            i32.const 2
            i32.add
            local.tee 3
            i32.const 3
            i32.and
            i32.eqz
            local.get 2
            i32.const 2
            i32.sub
            local.tee 5
            i32.eqz
            i32.or
            br_if 2 (;@2;)
            drop
            local.get 0
            local.get 1
            i32.load8_u offset=2
            i32.store8 offset=2
            local.get 0
            i32.const 3
            i32.add
            local.tee 4
            local.get 1
            i32.const 3
            i32.add
            local.tee 3
            i32.const 3
            i32.and
            i32.eqz
            local.get 2
            i32.const 3
            i32.sub
            local.tee 5
            i32.eqz
            i32.or
            br_if 2 (;@2;)
            drop
            local.get 0
            local.get 1
            i32.load8_u offset=3
            i32.store8 offset=3
            local.get 2
            i32.const 4
            i32.sub
            local.set 5
            local.get 1
            i32.const 4
            i32.add
            local.set 3
            local.get 0
            i32.const 4
            i32.add
            br 2 (;@2;)
          end
          local.get 0
          local.get 1
          local.get 2
          memory.copy
          local.get 0
          return
        end
        local.get 2
        local.set 5
        local.get 1
        local.set 3
        local.get 0
      end
      local.tee 4
      i32.const 3
      i32.and
      local.tee 2
      i32.eqz
      if  ;; label = @2
        block  ;; label = @3
          local.get 5
          i32.const 16
          i32.lt_u
          if  ;; label = @4
            local.get 5
            local.set 2
            br 1 (;@3;)
          end
          local.get 5
          i32.const 16
          i32.sub
          local.tee 2
          i32.const 16
          i32.and
          i32.eqz
          if  ;; label = @4
            local.get 4
            local.get 3
            i64.load align=4
            i64.store align=4
            local.get 4
            local.get 3
            i64.load offset=8 align=4
            i64.store offset=8 align=4
            local.get 4
            i32.const 16
            i32.add
            local.set 4
            local.get 2
            local.set 5
            local.get 3
            i32.const 16
            i32.add
            local.set 3
          end
          local.get 2
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 5
          local.set 2
          loop  ;; label = @4
            local.get 4
            local.get 3
            i64.load align=4
            i64.store align=4
            local.get 4
            local.get 3
            i64.load offset=8 align=4
            i64.store offset=8 align=4
            local.get 4
            local.get 3
            i64.load offset=16 align=4
            i64.store offset=16 align=4
            local.get 4
            local.get 3
            i64.load offset=24 align=4
            i64.store offset=24 align=4
            local.get 4
            i32.const 32
            i32.add
            local.set 4
            local.get 3
            i32.const 32
            i32.add
            local.set 3
            local.get 2
            i32.const 32
            i32.sub
            local.tee 2
            i32.const 15
            i32.gt_u
            br_if 0 (;@4;)
          end
        end
        local.get 2
        i32.const 8
        i32.ge_u
        if  ;; label = @3
          local.get 4
          local.get 3
          i64.load align=4
          i64.store align=4
          local.get 4
          i32.const 8
          i32.add
          local.set 4
          local.get 3
          i32.const 8
          i32.add
          local.set 3
        end
        local.get 2
        i32.const 4
        i32.and
        if  ;; label = @3
          local.get 4
          local.get 3
          i32.load
          i32.store
          local.get 4
          i32.const 4
          i32.add
          local.set 4
          local.get 3
          i32.const 4
          i32.add
          local.set 3
        end
        local.get 2
        i32.const 2
        i32.and
        if  ;; label = @3
          local.get 4
          local.get 3
          i32.load16_u align=1
          i32.store16 align=1
          local.get 4
          i32.const 2
          i32.add
          local.set 4
          local.get 3
          i32.const 2
          i32.add
          local.set 3
        end
        local.get 2
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 3
        i32.load8_u
        i32.store8
        local.get 0
        return
      end
      block  ;; label = @2
        block  ;; label = @3
          block (result i32)  ;; label = @4
            block  ;; label = @5
              local.get 5
              i32.const 32
              i32.ge_u
              if  ;; label = @6
                local.get 4
                local.get 3
                i32.load
                local.tee 5
                i32.store8
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 2
                    i32.const 2
                    i32.sub
                    br_table 0 (;@8;) 1 (;@7;) 3 (;@5;)
                  end
                  local.get 4
                  local.get 5
                  i32.const 8
                  i32.shr_u
                  i32.store8 offset=1
                  local.get 4
                  local.get 3
                  i32.const 6
                  i32.add
                  i64.load align=2
                  i64.store offset=6 align=4
                  local.get 4
                  local.get 3
                  i32.load offset=4
                  i32.const 16
                  i32.shl
                  local.get 5
                  i32.const 16
                  i32.shr_u
                  i32.or
                  i32.store offset=2
                  local.get 3
                  i32.const 18
                  i32.add
                  local.set 1
                  i32.const 14
                  local.set 6
                  local.get 3
                  i32.const 14
                  i32.add
                  i32.load align=2
                  local.set 3
                  i32.const 14
                  local.set 5
                  local.get 4
                  i32.const 18
                  i32.add
                  br 3 (;@4;)
                end
                local.get 4
                local.get 3
                i32.const 5
                i32.add
                i64.load align=1
                i64.store offset=5 align=4
                local.get 4
                local.get 3
                i32.load offset=4
                i32.const 24
                i32.shl
                local.get 5
                i32.const 8
                i32.shr_u
                i32.or
                i32.store offset=1
                local.get 3
                i32.const 17
                i32.add
                local.set 1
                i32.const 13
                local.set 6
                local.get 3
                i32.const 13
                i32.add
                i32.load align=1
                local.set 3
                i32.const 15
                local.set 5
                local.get 4
                i32.const 17
                i32.add
                br 2 (;@4;)
              end
              block (result i32)  ;; label = @6
                local.get 5
                i32.const 16
                i32.lt_u
                if  ;; label = @7
                  local.get 4
                  local.set 2
                  local.get 3
                  br 1 (;@6;)
                end
                local.get 4
                local.get 3
                i32.load8_u
                i32.store8
                local.get 4
                local.get 3
                i32.load offset=1 align=1
                i32.store offset=1 align=1
                local.get 4
                local.get 3
                i64.load offset=5 align=1
                i64.store offset=5 align=1
                local.get 4
                local.get 3
                i32.load16_u offset=13 align=1
                i32.store16 offset=13 align=1
                local.get 4
                local.get 3
                i32.load8_u offset=15
                i32.store8 offset=15
                local.get 4
                i32.const 16
                i32.add
                local.set 2
                local.get 3
                i32.const 16
                i32.add
              end
              local.set 1
              local.get 5
              i32.const 8
              i32.and
              br_if 2 (;@3;)
              br 3 (;@2;)
            end
            local.get 4
            local.get 5
            i32.const 16
            i32.shr_u
            i32.store8 offset=2
            local.get 4
            local.get 5
            i32.const 8
            i32.shr_u
            i32.store8 offset=1
            local.get 4
            local.get 3
            i32.const 7
            i32.add
            i64.load align=1
            i64.store offset=7 align=4
            local.get 4
            local.get 3
            i32.load offset=4
            i32.const 8
            i32.shl
            local.get 5
            i32.const 24
            i32.shr_u
            i32.or
            i32.store offset=3
            local.get 3
            i32.const 19
            i32.add
            local.set 1
            i32.const 15
            local.set 6
            local.get 3
            i32.const 15
            i32.add
            i32.load align=1
            local.set 3
            i32.const 13
            local.set 5
            local.get 4
            i32.const 19
            i32.add
          end
          local.set 2
          local.get 4
          local.get 6
          i32.add
          local.get 3
          i32.store
        end
        local.get 2
        local.get 1
        i64.load align=1
        i64.store align=1
        local.get 2
        i32.const 8
        i32.add
        local.set 2
        local.get 1
        i32.const 8
        i32.add
        local.set 1
      end
      local.get 5
      i32.const 4
      i32.and
      if  ;; label = @2
        local.get 2
        local.get 1
        i32.load align=1
        i32.store align=1
        local.get 2
        i32.const 4
        i32.add
        local.set 2
        local.get 1
        i32.const 4
        i32.add
        local.set 1
      end
      local.get 5
      i32.const 2
      i32.and
      if  ;; label = @2
        local.get 2
        local.get 1
        i32.load16_u align=1
        i32.store16 align=1
        local.get 2
        i32.const 2
        i32.add
        local.set 2
        local.get 1
        i32.const 2
        i32.add
        local.set 1
      end
      local.get 5
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 1
      i32.load8_u
      i32.store8
    end
    local.get 0)
  (func $memset (type 7) (param i32 i32 i32) (result i32)
    (local i32 i32 i64 i32)
    local.get 2
    i32.const 33
    i32.ge_u
    if  ;; label = @1
      local.get 0
      local.get 1
      local.get 2
      memory.fill
      local.get 0
      return
    end
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8
      local.get 0
      local.get 2
      i32.add
      local.tee 3
      i32.const 1
      i32.sub
      local.get 1
      i32.store8
      local.get 2
      i32.const 3
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=2
      local.get 0
      local.get 1
      i32.store8 offset=1
      local.get 3
      i32.const 3
      i32.sub
      local.get 1
      i32.store8
      local.get 3
      i32.const 2
      i32.sub
      local.get 1
      i32.store8
      local.get 2
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=3
      local.get 3
      i32.const 4
      i32.sub
      local.get 1
      i32.store8
      local.get 2
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 6
      i32.add
      local.tee 4
      local.get 1
      i32.const 255
      i32.and
      i32.const 16843009
      i32.mul
      local.tee 3
      i32.store
      local.get 4
      local.get 2
      local.get 6
      i32.sub
      i32.const 60
      i32.and
      local.tee 1
      i32.add
      local.tee 2
      i32.const 4
      i32.sub
      local.get 3
      i32.store
      local.get 1
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 4
      local.get 3
      i32.store offset=8
      local.get 4
      local.get 3
      i32.store offset=4
      local.get 2
      i32.const 8
      i32.sub
      local.get 3
      i32.store
      local.get 2
      i32.const 12
      i32.sub
      local.get 3
      i32.store
      local.get 1
      i32.const 25
      i32.lt_u
      br_if 0 (;@1;)
      local.get 4
      local.get 3
      i32.store offset=24
      local.get 4
      local.get 3
      i32.store offset=20
      local.get 4
      local.get 3
      i32.store offset=16
      local.get 4
      local.get 3
      i32.store offset=12
      local.get 2
      i32.const 16
      i32.sub
      local.get 3
      i32.store
      local.get 2
      i32.const 20
      i32.sub
      local.get 3
      i32.store
      local.get 2
      i32.const 24
      i32.sub
      local.get 3
      i32.store
      local.get 2
      i32.const 28
      i32.sub
      local.get 3
      i32.store
      local.get 1
      local.get 4
      i32.const 4
      i32.and
      i32.const 24
      i32.or
      local.tee 2
      i32.sub
      local.tee 1
      i32.const 32
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i64.extend_i32_u
      i64.const 4294967297
      i64.mul
      local.set 5
      local.get 2
      local.get 4
      i32.add
      local.set 2
      loop  ;; label = @2
        local.get 2
        local.get 5
        i64.store offset=24
        local.get 2
        local.get 5
        i64.store offset=16
        local.get 2
        local.get 5
        i64.store offset=8
        local.get 2
        local.get 5
        i64.store
        local.get 2
        i32.const 32
        i32.add
        local.set 2
        local.get 1
        i32.const 32
        i32.sub
        local.tee 1
        i32.const 31
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $arc4random_buf (type 4) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 8
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 1
      i32.load
      local.set 0
      local.get 1
      i32.load offset=4
      local.set 1
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 2
      end
      global.get 1
      i32.const 1
      global.get 1
      if (result i32)  ;; label = @2
        i32.const 0
      else
        i32.const 65816
        i32.load
      end
      select
      if  ;; label = @2
        local.get 2
        i32.const 0
        global.get 1
        select
        i32.eqz
        if  ;; label = @3
          i32.const 65824
          i32.const 32
          call $__getentropy
          drop
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 2 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if  ;; label = @3
          i32.const 65816
          i64.const 2199023255553
          i64.store align=4
        end
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          i32.const 65820
          i32.load
          local.set 2
          loop  ;; label = @4
            local.get 2
            i32.const 512
            i32.eq
            if  ;; label = @5
              local.get 1
              i32.const 512
              i32.ge_u
              if  ;; label = @6
                loop  ;; label = @7
                  local.get 0
                  local.get 4
                  i32.add
                  i32.const 65824
                  call $chacha20_rng
                  local.get 4
                  i32.const 512
                  i32.add
                  local.set 4
                  local.get 1
                  i32.const 512
                  i32.sub
                  local.tee 1
                  i32.const 511
                  i32.gt_u
                  br_if 0 (;@7;)
                end
              end
              local.get 1
              i32.eqz
              br_if 2 (;@3;)
              i32.const 65856
              i32.const 65824
              call $chacha20_rng
              i32.const 65820
              i32.const 0
              i32.store
              i32.const 0
              local.set 2
            end
            local.get 2
            i32.const 65856
            i32.add
            local.set 5
            i32.const 512
            local.get 2
            i32.sub
            local.tee 3
            local.get 1
            i32.gt_u
            local.set 2
            local.get 0
            local.get 4
            i32.add
            local.get 5
            local.get 1
            local.get 3
            local.get 2
            select
            local.tee 3
            call $memcpy
            drop
            i32.const 65820
            i32.load
            i32.const 65856
            i32.add
            i32.const 0
            local.get 3
            call $memset
            drop
            i32.const 65820
            i32.const 65820
            i32.load
            local.get 3
            i32.add
            local.tee 2
            i32.store
            local.get 3
            local.get 4
            i32.add
            local.set 4
            local.get 1
            local.get 3
            i32.sub
            local.tee 1
            br_if 0 (;@4;)
          end
        end
      end
      return
    end
    local.set 3
    global.get 2
    i32.load
    local.get 3
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 3
    local.get 0
    i32.store
    local.get 3
    local.get 1
    i32.store offset=4
    global.get 2
    global.get 2
    i32.load
    i32.const 8
    i32.add
    i32.store)
  (func $chacha20_rng (type 4) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const -64
    i32.add
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 56
    i32.add
    i64.const 0
    i64.store
    local.get 2
    i32.const 24
    i32.add
    local.get 1
    i32.const 8
    i32.add
    local.tee 3
    i64.load align=1
    i64.store
    local.get 2
    i32.const 32
    i32.add
    local.get 1
    i32.const 16
    i32.add
    local.tee 4
    i64.load align=1
    i64.store
    local.get 2
    i32.const 40
    i32.add
    local.get 1
    i32.const 24
    i32.add
    local.tee 5
    i64.load align=1
    i64.store
    local.get 2
    i64.const 0
    i64.store offset=48
    local.get 2
    i32.const 65544
    i64.load
    i64.store offset=8
    local.get 2
    i32.const 65536
    i64.load
    i64.store
    local.get 2
    local.get 1
    i64.load align=1
    i64.store offset=16
    local.get 0
    local.get 2
    call $chacha20_update
    local.get 5
    local.get 0
    i32.const 24
    i32.add
    i64.load align=1
    i64.store align=1
    local.get 4
    local.get 0
    i32.const 16
    i32.add
    i64.load align=1
    i64.store align=1
    local.get 3
    local.get 0
    i32.const 8
    i32.add
    i64.load align=1
    i64.store align=1
    local.get 1
    local.get 0
    i64.load align=1
    i64.store align=1
    local.get 0
    local.get 2
    call $chacha20_update
    local.get 0
    i32.const -64
    i32.sub
    local.get 2
    call $chacha20_update
    local.get 0
    i32.const 128
    i32.add
    local.get 2
    call $chacha20_update
    local.get 0
    i32.const 192
    i32.add
    local.get 2
    call $chacha20_update
    local.get 0
    i32.const 256
    i32.add
    local.get 2
    call $chacha20_update
    local.get 0
    i32.const 320
    i32.add
    local.get 2
    call $chacha20_update
    local.get 0
    i32.const 384
    i32.add
    local.get 2
    call $chacha20_update
    local.get 0
    i32.const 448
    i32.add
    local.get 2
    call $chacha20_update
    local.get 2
    i32.const -64
    i32.sub
    global.set $__stack_pointer)
  (func $chacha20_update (type 4) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    i32.const -2
    local.set 18
    local.get 1
    i32.load offset=16
    local.tee 19
    local.set 2
    local.get 1
    i32.load
    local.tee 20
    local.set 6
    local.get 1
    i32.load offset=48
    local.tee 21
    local.set 7
    local.get 1
    i32.load offset=32
    local.tee 22
    local.set 8
    local.get 1
    i32.load offset=20
    local.tee 23
    local.set 3
    local.get 1
    i32.load offset=4
    local.tee 24
    local.set 9
    local.get 1
    i32.load offset=52
    local.tee 25
    local.set 10
    local.get 1
    i32.load offset=36
    local.tee 26
    local.set 15
    local.get 1
    i32.load offset=24
    local.tee 27
    local.set 4
    local.get 1
    i32.load offset=8
    local.tee 28
    local.set 11
    local.get 1
    i32.load offset=56
    local.tee 29
    local.set 16
    local.get 1
    i32.load offset=40
    local.tee 30
    local.set 12
    local.get 1
    i32.load offset=28
    local.tee 31
    local.set 5
    local.get 1
    i32.load offset=12
    local.tee 32
    local.set 17
    local.get 1
    i32.load offset=60
    local.tee 33
    local.set 13
    local.get 1
    i32.load offset=44
    local.tee 34
    local.set 14
    loop  ;; label = @1
      local.get 13
      local.get 5
      local.get 17
      i32.add
      local.tee 17
      i32.xor
      i32.const 16
      i32.rotl
      local.tee 13
      local.get 14
      i32.add
      local.tee 14
      local.get 5
      i32.xor
      i32.const 12
      i32.rotl
      local.tee 5
      local.get 17
      i32.add
      local.tee 35
      local.get 7
      local.get 2
      local.get 6
      i32.add
      local.tee 6
      i32.xor
      i32.const 16
      i32.rotl
      local.tee 7
      local.get 8
      i32.add
      local.tee 8
      local.get 2
      i32.xor
      i32.const 12
      i32.rotl
      local.tee 2
      local.get 6
      i32.add
      local.tee 6
      local.get 7
      i32.xor
      i32.const 8
      i32.rotl
      local.tee 7
      local.get 8
      i32.add
      local.tee 8
      local.get 2
      i32.xor
      i32.const 7
      i32.rotl
      local.tee 2
      i32.add
      local.tee 17
      local.get 16
      local.get 4
      local.get 11
      i32.add
      local.tee 11
      i32.xor
      i32.const 16
      i32.rotl
      local.tee 16
      local.get 12
      i32.add
      local.tee 12
      local.get 4
      i32.xor
      i32.const 12
      i32.rotl
      local.tee 4
      local.get 11
      i32.add
      local.tee 11
      local.get 16
      i32.xor
      i32.const 8
      i32.rotl
      local.tee 36
      i32.xor
      i32.const 16
      i32.rotl
      local.tee 16
      local.get 10
      local.get 3
      local.get 9
      i32.add
      local.tee 9
      i32.xor
      i32.const 16
      i32.rotl
      local.tee 10
      local.get 15
      i32.add
      local.tee 15
      local.get 3
      i32.xor
      i32.const 12
      i32.rotl
      local.tee 3
      local.get 9
      i32.add
      local.tee 9
      local.get 10
      i32.xor
      i32.const 8
      i32.rotl
      local.tee 10
      local.get 15
      i32.add
      local.tee 37
      i32.add
      local.tee 15
      local.get 2
      i32.xor
      i32.const 12
      i32.rotl
      local.tee 2
      local.get 17
      i32.add
      local.tee 17
      local.get 16
      i32.xor
      i32.const 8
      i32.rotl
      local.tee 16
      local.get 15
      i32.add
      local.tee 15
      local.get 2
      i32.xor
      i32.const 7
      i32.rotl
      local.set 2
      local.get 13
      local.get 35
      i32.xor
      i32.const 8
      i32.rotl
      local.tee 13
      local.get 14
      i32.add
      local.tee 14
      local.get 5
      i32.xor
      i32.const 7
      i32.rotl
      local.tee 5
      local.get 11
      i32.add
      local.tee 11
      local.get 10
      i32.xor
      i32.const 16
      i32.rotl
      local.tee 10
      local.get 8
      i32.add
      local.tee 8
      local.get 5
      i32.xor
      i32.const 12
      i32.rotl
      local.tee 5
      local.get 11
      i32.add
      local.tee 11
      local.get 10
      i32.xor
      i32.const 8
      i32.rotl
      local.tee 10
      local.get 8
      i32.add
      local.tee 8
      local.get 5
      i32.xor
      i32.const 7
      i32.rotl
      local.set 5
      local.get 12
      local.get 36
      i32.add
      local.tee 12
      local.get 4
      i32.xor
      i32.const 7
      i32.rotl
      local.tee 4
      local.get 9
      i32.add
      local.tee 9
      local.get 7
      i32.xor
      i32.const 16
      i32.rotl
      local.tee 7
      local.get 14
      i32.add
      local.tee 14
      local.get 4
      i32.xor
      i32.const 12
      i32.rotl
      local.tee 4
      local.get 9
      i32.add
      local.tee 9
      local.get 7
      i32.xor
      i32.const 8
      i32.rotl
      local.tee 7
      local.get 14
      i32.add
      local.tee 14
      local.get 4
      i32.xor
      i32.const 7
      i32.rotl
      local.set 4
      local.get 13
      local.get 3
      local.get 37
      i32.xor
      i32.const 7
      i32.rotl
      local.tee 3
      local.get 6
      i32.add
      local.tee 6
      i32.xor
      i32.const 16
      i32.rotl
      local.tee 13
      local.get 12
      i32.add
      local.tee 12
      local.get 3
      i32.xor
      i32.const 12
      i32.rotl
      local.tee 3
      local.get 6
      i32.add
      local.tee 6
      local.get 13
      i32.xor
      i32.const 8
      i32.rotl
      local.tee 13
      local.get 12
      i32.add
      local.tee 12
      local.get 3
      i32.xor
      i32.const 7
      i32.rotl
      local.set 3
      local.get 18
      i32.const 2
      i32.add
      local.tee 18
      i32.const 18
      i32.lt_u
      br_if 0 (;@1;)
    end
    local.get 1
    local.get 7
    i32.store offset=48
    local.get 1
    local.get 6
    i32.store
    local.get 1
    local.get 2
    i32.store offset=16
    local.get 1
    local.get 8
    i32.store offset=32
    local.get 1
    local.get 3
    i32.store offset=20
    local.get 1
    local.get 10
    i32.store offset=52
    local.get 1
    local.get 9
    i32.store offset=4
    local.get 1
    local.get 15
    i32.store offset=36
    local.get 1
    local.get 4
    i32.store offset=24
    local.get 1
    local.get 16
    i32.store offset=56
    local.get 1
    local.get 11
    i32.store offset=8
    local.get 1
    local.get 12
    i32.store offset=40
    local.get 1
    local.get 5
    i32.store offset=28
    local.get 1
    local.get 13
    i32.store offset=60
    local.get 1
    local.get 17
    i32.store offset=12
    local.get 1
    local.get 14
    i32.store offset=44
    local.get 0
    local.get 13
    local.get 33
    i32.add
    i32.store offset=60 align=1
    local.get 0
    local.get 16
    local.get 29
    i32.add
    i32.store offset=56 align=1
    local.get 0
    local.get 10
    local.get 25
    i32.add
    i32.store offset=52 align=1
    local.get 0
    local.get 7
    local.get 21
    i32.add
    i32.store offset=48 align=1
    local.get 0
    local.get 14
    local.get 34
    i32.add
    i32.store offset=44 align=1
    local.get 0
    local.get 12
    local.get 30
    i32.add
    i32.store offset=40 align=1
    local.get 0
    local.get 15
    local.get 26
    i32.add
    i32.store offset=36 align=1
    local.get 0
    local.get 8
    local.get 22
    i32.add
    i32.store offset=32 align=1
    local.get 0
    local.get 5
    local.get 31
    i32.add
    i32.store offset=28 align=1
    local.get 0
    local.get 4
    local.get 27
    i32.add
    i32.store offset=24 align=1
    local.get 0
    local.get 3
    local.get 23
    i32.add
    i32.store offset=20 align=1
    local.get 0
    local.get 2
    local.get 19
    i32.add
    i32.store offset=16 align=1
    local.get 0
    local.get 17
    local.get 32
    i32.add
    i32.store offset=12 align=1
    local.get 0
    local.get 11
    local.get 28
    i32.add
    i32.store offset=8 align=1
    local.get 0
    local.get 9
    local.get 24
    i32.add
    i32.store offset=4 align=1
    local.get 0
    local.get 6
    local.get 20
    i32.add
    i32.store align=1
    local.get 1
    local.get 1
    i32.load offset=48
    i32.const 1
    i32.add
    i32.store offset=48)
  (func $arc4random (type 5) (result i32)
    (local i32 i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 8
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 0
      i32.load
      local.set 1
      local.get 0
      i32.load offset=4
      local.set 0
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 2
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        global.get $__stack_pointer
        i32.const 16
        i32.sub
        local.tee 0
        global.set $__stack_pointer
        local.get 0
        i32.const 12
        i32.add
        local.set 1
      end
      local.get 2
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        local.get 1
        i32.const 4
        call $arc4random_buf
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        local.get 0
        i32.load offset=12
        local.set 1
        local.get 0
        i32.const 16
        i32.add
        global.set $__stack_pointer
        local.get 1
        return
      end
      unreachable
    end
    local.set 2
    global.get 2
    i32.load
    local.get 2
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 2
    local.get 1
    i32.store
    local.get 2
    local.get 0
    i32.store offset=4
    global.get 2
    global.get 2
    i32.load
    i32.const 8
    i32.add
    i32.store
    i32.const 0)
  (func $internal/task.Pause (type 1)
    (local i32 i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.sub
      i32.store
      global.get 2
      i32.load
      i32.load
      local.set 0
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 1
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        i32.const 66368
        i32.load
        local.tee 0
        i32.eqz
        local.set 2
      end
      block  ;; label = @2
        block  ;; label = @3
          global.get 1
          i32.eqz
          if  ;; label = @4
            local.get 2
            br_if 1 (;@3;)
            local.get 0
            i32.load offset=36
            local.tee 2
            i32.eqz
            br_if 1 (;@3;)
            local.get 2
            i32.load
            i32.const -1204030091
            i32.ne
            br_if 2 (;@2;)
            local.get 0
            i32.const 28
            i32.add
            local.set 0
          end
          local.get 1
          i32.const 0
          global.get 1
          select
          i32.eqz
          if  ;; label = @4
            local.get 0
            call $tinygo_unwind
            i32.const 0
            global.get 1
            i32.const 1
            i32.eq
            br_if 3 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if  ;; label = @4
            return
          end
        end
        local.get 1
        i32.const 1
        i32.eq
        i32.const 1
        global.get 1
        select
        if  ;; label = @3
          call $runtime.nilPanic
          i32.const 1
          global.get 1
          i32.const 1
          i32.eq
          br_if 2 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if  ;; label = @3
          unreachable
        end
      end
      local.get 1
      i32.const 2
      i32.eq
      i32.const 1
      global.get 1
      select
      if  ;; label = @2
        i32.const 65552
        call $runtime.runtimePanic
        i32.const 2
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      return
    end
    local.set 1
    global.get 2
    i32.load
    local.get 1
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $runtime.nilPanic (type 1)
    (local i32)
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32)  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        i32.const 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        i32.const 65674
        i32.const 23
        call $runtime.runtimePanicAt
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $runtime.runtimePanic (type 0) (param i32)
    (local i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.sub
      i32.store
      global.get 2
      i32.load
      i32.load
      local.set 0
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32)  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        i32.const 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        local.get 0
        i32.const 14
        call $runtime.runtimePanicAt
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      return
    end
    local.set 1
    global.get 2
    i32.load
    local.get 1
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $internal/task.start (type 0) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 16
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 2
      i32.load
      local.set 0
      local.get 2
      i32.load offset=8
      local.set 3
      local.get 2
      i32.load offset=12
      local.set 4
      local.get 2
      i32.load offset=4
      local.set 1
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 5
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        global.get $__stack_pointer
        i32.const 48
        i32.sub
        local.tee 3
        global.set $__stack_pointer
        local.get 3
        i32.const 28
        i32.add
        i64.const 0
        i64.store align=4
        local.get 3
        i32.const 36
        i32.add
        i64.const 0
        i64.store align=4
        local.get 3
        i64.const 0
        i64.store offset=20 align=4
        local.get 3
        i32.const 7
        i32.store offset=12
        i32.const 66556
        i32.load
        local.set 4
        i32.const 66556
        local.get 3
        i32.const 8
        i32.add
        local.tee 1
        i32.store
        local.get 3
        local.get 4
        i32.store offset=8
      end
      local.get 5
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        i32.const 56
        i32.const 324829
        call $runtime.alloc
        local.set 2
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 2
        local.set 1
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        local.get 1
        i32.const 0
        i32.store offset=24
        local.get 1
        local.get 0
        i32.store offset=20
        local.get 3
        local.get 1
        i32.store offset=16
      end
      local.get 5
      i32.const 1
      i32.eq
      i32.const 1
      global.get 1
      select
      if  ;; label = @2
        i32.const 65536
        i32.const 0
        call $runtime.alloc
        local.set 2
        i32.const 1
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 2
        local.set 0
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        local.get 0
        i32.const -1204030091
        i32.store
        local.get 1
        local.get 0
        i32.store offset=36
        local.get 1
        local.get 0
        i32.const 65536
        i32.add
        i32.store offset=32
        local.get 1
        local.get 0
        i32.const 4
        i32.add
        i32.store offset=28
        i32.const 66572
        i32.load
        local.tee 0
        if  ;; label = @3
          local.get 0
          local.get 1
          i32.store
        end
        local.get 1
        i32.const 0
        i32.store
        i32.const 66572
        local.get 1
        i32.store
        i32.const 66568
        i32.load
        i32.eqz
        if  ;; label = @3
          i32.const 66568
          local.get 1
          i32.store
        end
        i32.const 66556
        local.get 4
        i32.store
        local.get 3
        i32.const 48
        i32.add
        global.set $__stack_pointer
      end
      return
    end
    local.set 2
    global.get 2
    i32.load
    local.get 2
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 2
    local.get 0
    i32.store
    local.get 2
    local.get 1
    i32.store offset=4
    local.get 2
    local.get 3
    i32.store offset=8
    local.get 2
    local.get 4
    i32.store offset=12
    global.get 2
    global.get 2
    i32.load
    i32.const 16
    i32.add
    i32.store)
  (func $runtime.alloc (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i64 i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 32
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 3
      i32.load
      local.set 0
      local.get 3
      i32.load offset=8
      local.set 2
      local.get 3
      i32.load offset=12
      local.set 4
      local.get 3
      i32.load offset=16
      local.set 5
      local.get 3
      i32.load offset=20
      local.set 6
      local.get 3
      i32.load offset=24
      local.set 7
      local.get 3
      i32.load offset=28
      local.set 8
      local.get 3
      i32.load offset=4
      local.set 1
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 9
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        local.get 0
        i32.eqz
        if  ;; label = @3
          i32.const 66552
          return
        end
        i32.const 66528
        i32.const 66528
        i64.load
        i64.const 1
        i64.add
        i64.store
        i32.const 66512
        i32.const 66512
        i64.load
        local.get 0
        i32.const 16
        i32.add
        i64.extend_i32_u
        i64.add
        i64.store
        i32.const 66520
        i32.const 66520
        i64.load
        local.get 0
        i32.const 31
        i32.add
        i32.const 4
        i32.shr_u
        local.tee 7
        i64.extend_i32_u
        i64.add
        i64.store
        i32.const 0
        local.set 8
        i32.const 66504
        i32.load
        local.tee 2
        local.set 5
        i32.const 0
        local.set 4
      end
      loop  ;; label = @2
        local.get 2
        local.get 2
        local.get 5
        i32.ne
        global.get 1
        select
        local.set 2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              global.get 1
              i32.eqz
              if  ;; label = @6
                local.get 2
                br_if 1 (;@5;)
                local.get 4
                i32.const 255
                i32.and
                local.set 2
                i32.const 1
                local.set 4
              end
              block  ;; label = @6
                global.get 1
                i32.eqz
                if  ;; label = @7
                  block  ;; label = @8
                    local.get 2
                    br_table 3 (;@5;) 0 (;@8;) 2 (;@6;)
                  end
                  i32.const 66556
                  i32.load
                  drop
                  i32.const 66368
                  i32.load
                  local.set 2
                end
                block  ;; label = @7
                  global.get 1
                  i32.eqz
                  if  ;; label = @8
                    local.get 2
                    br_if 1 (;@7;)
                    call $tinygo_getCurrentStackPointer
                    local.set 2
                  end
                  local.get 9
                  i32.const 0
                  global.get 1
                  select
                  i32.eqz
                  if  ;; label = @8
                    local.get 2
                    i32.const 65536
                    call $runtime.markRoots
                    i32.const 0
                    global.get 1
                    i32.const 1
                    i32.eq
                    br_if 7 (;@1;)
                    drop
                  end
                end
                local.get 9
                i32.const 1
                i32.eq
                i32.const 1
                global.get 1
                select
                if  ;; label = @7
                  i32.const 65536
                  i32.const 66864
                  call $runtime.markRoots
                  i32.const 1
                  global.get 1
                  i32.const 1
                  i32.eq
                  br_if 6 (;@1;)
                  drop
                end
                loop  ;; label = @7
                  global.get 1
                  i32.eqz
                  if  ;; label = @8
                    i32.const 66553
                    i32.load8_u
                    i32.eqz
                    if  ;; label = @9
                      i64.const 0
                      local.set 10
                      i32.const 0
                      local.set 11
                      i32.const 0
                      local.set 4
                      i32.const 0
                      local.set 2
                      loop  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 2
                            i32.const 66508
                            i32.load
                            i32.lt_u
                            if  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      local.get 2
                                      call $_runtime.gcBlock_.state
                                      i32.const 255
                                      i32.and
                                      i32.const 1
                                      i32.sub
                                      br_table 0 (;@17;) 1 (;@16;) 2 (;@15;) 3 (;@14;)
                                    end
                                    local.get 2
                                    call $_runtime.gcBlock_.markFree
                                    i32.const 66536
                                    i32.const 66536
                                    i64.load
                                    i64.const 1
                                    i64.add
                                    i64.store
                                    br 4 (;@12;)
                                  end
                                  local.get 4
                                  i32.const 1
                                  i32.and
                                  local.set 3
                                  i32.const 0
                                  local.set 4
                                  local.get 3
                                  i32.eqz
                                  br_if 4 (;@11;)
                                  local.get 2
                                  call $_runtime.gcBlock_.markFree
                                  br 3 (;@12;)
                                end
                                i32.const 0
                                local.set 4
                                i32.const 66500
                                i32.load
                                local.get 2
                                i32.const 2
                                i32.shr_u
                                i32.add
                                local.tee 3
                                i32.load8_u
                                local.set 6
                                local.get 3
                                local.get 6
                                i32.const 2
                                local.get 2
                                i32.const 1
                                i32.shl
                                i32.const 6
                                i32.and
                                i32.shl
                                i32.const -1
                                i32.xor
                                i32.and
                                i32.store8
                                br 3 (;@11;)
                              end
                              local.get 11
                              i32.const 16
                              i32.add
                              local.set 11
                              br 2 (;@11;)
                            end
                            i32.const 66544
                            local.get 10
                            i32.const 66544
                            i64.load
                            i64.add
                            i64.store
                            i32.const 2
                            local.set 4
                            local.get 11
                            local.get 10
                            i32.wrap_i64
                            i32.const 4
                            i32.shl
                            i32.add
                            local.tee 6
                            i32.const 66500
                            i32.load
                            i32.const 66864
                            i32.sub
                            i32.const 3
                            i32.div_u
                            i32.ge_u
                            br_if 7 (;@5;)
                            call $runtime.growHeap
                            drop
                            br 7 (;@5;)
                          end
                          local.get 10
                          i64.const 1
                          i64.add
                          local.set 10
                          i32.const 1
                          local.set 4
                        end
                        local.get 2
                        i32.const 1
                        i32.add
                        local.set 2
                        br 0 (;@10;)
                      end
                      unreachable
                    end
                    i32.const 66553
                    i32.const 0
                    i32.store8
                    i32.const 66508
                    i32.load
                    local.set 4
                    i32.const 0
                    local.set 2
                  end
                  loop  ;; label = @8
                    global.get 1
                    i32.eqz
                    if  ;; label = @9
                      local.get 2
                      local.get 4
                      i32.ge_u
                      local.tee 6
                      br_if 2 (;@7;)
                      local.get 2
                      call $_runtime.gcBlock_.state
                      i32.const 255
                      i32.and
                      i32.const 3
                      i32.ne
                      local.set 6
                    end
                    global.get 1
                    i32.const 1
                    local.get 6
                    select
                    if  ;; label = @9
                      local.get 9
                      i32.const 2
                      i32.eq
                      i32.const 1
                      global.get 1
                      select
                      if  ;; label = @10
                        local.get 2
                        call $runtime.startMark
                        i32.const 2
                        global.get 1
                        i32.const 1
                        i32.eq
                        br_if 9 (;@1;)
                        drop
                      end
                      global.get 1
                      if (result i32)  ;; label = @10
                        local.get 4
                      else
                        i32.const 66508
                        i32.load
                      end
                      local.set 4
                    end
                    global.get 1
                    i32.eqz
                    if  ;; label = @9
                      local.get 2
                      i32.const 1
                      i32.add
                      local.set 2
                      br 1 (;@8;)
                    end
                  end
                end
              end
              global.get 1
              i32.eqz
              if  ;; label = @6
                call $runtime.growHeap
                i32.const 1
                i32.and
                i32.eqz
                br_if 2 (;@4;)
                i32.const 2
                local.set 4
              end
            end
            global.get 1
            i32.eqz
            if  ;; label = @5
              block  ;; label = @6
                i32.const 66508
                i32.load
                local.get 5
                i32.eq
                if (result i32)  ;; label = @7
                  i32.const 0
                else
                  local.get 5
                  call $_runtime.gcBlock_.state
                  i32.const 255
                  i32.and
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 5
                  i32.const 1
                  i32.add
                end
                local.set 5
                i32.const 0
                local.set 8
                br 3 (;@3;)
              end
              local.get 5
              i32.const 1
              i32.add
              local.set 2
              local.get 8
              i32.const 1
              i32.add
              local.tee 8
              local.get 7
              i32.eq
              local.tee 6
              i32.eqz
              if  ;; label = @6
                local.get 2
                local.set 5
                br 3 (;@3;)
              end
              i32.const 66504
              local.get 2
              i32.store
              local.get 2
              local.get 7
              i32.sub
              local.tee 4
              i32.const 1
              call $_runtime.gcBlock_.setState
              local.get 5
              local.get 7
              i32.sub
              i32.const 2
              i32.add
              local.set 2
              loop  ;; label = @6
                local.get 2
                i32.const 66504
                i32.load
                i32.ne
                if  ;; label = @7
                  local.get 2
                  i32.const 2
                  call $_runtime.gcBlock_.setState
                  local.get 2
                  i32.const 1
                  i32.add
                  local.set 2
                  br 1 (;@6;)
                end
              end
              local.get 4
              i32.const 4
              i32.shl
              i32.const 66864
              i32.add
              local.tee 2
              local.get 1
              i32.store
              local.get 2
              i32.const 16
              i32.add
              local.tee 2
              i32.const 0
              local.get 0
              memory.fill
              local.get 2
              return
            end
          end
          local.get 9
          i32.const 3
          i32.eq
          i32.const 1
          global.get 1
          select
          if  ;; label = @4
            i32.const 65632
            i32.const 13
            call $runtime.runtimePanicAt
            i32.const 3
            global.get 1
            i32.const 1
            i32.eq
            br_if 3 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if  ;; label = @4
            unreachable
          end
        end
        global.get 1
        i32.eqz
        if  ;; label = @3
          i32.const 66504
          i32.load
          local.set 2
          br 1 (;@2;)
        end
      end
      unreachable
    end
    local.set 3
    global.get 2
    i32.load
    local.get 3
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 3
    local.get 0
    i32.store
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 2
    i32.store offset=8
    local.get 3
    local.get 4
    i32.store offset=12
    local.get 3
    local.get 5
    i32.store offset=16
    local.get 3
    local.get 6
    i32.store offset=20
    local.get 3
    local.get 7
    i32.store offset=24
    local.get 3
    local.get 8
    i32.store offset=28
    global.get 2
    global.get 2
    i32.load
    i32.const 32
    i32.add
    i32.store
    i32.const 0)
  (func $runtime.memequal (type 2) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32)
    block (result i32)  ;; label = @1
      loop  ;; label = @2
        local.get 2
        local.get 2
        local.get 4
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 1
        local.get 4
        i32.add
        local.set 5
        local.get 0
        local.get 4
        i32.add
        local.set 6
        local.get 4
        i32.const 1
        i32.add
        local.set 4
        local.get 6
        i32.load8_u
        local.get 5
        i32.load8_u
        i32.eq
        br_if 0 (;@2;)
      end
      local.get 4
      i32.const 1
      i32.sub
    end
    local.tee 4
    local.get 2
    i32.ge_u)
  (func $runtime.hash32 (type 2) (param i32 i32 i32 i32) (result i32)
    local.get 2
    i32.const -2128831035
    i32.mul
    local.set 2
    loop  ;; label = @1
      local.get 1
      if  ;; label = @2
        local.get 1
        i32.const 1
        i32.sub
        local.set 1
        local.get 2
        local.get 0
        i32.load8_u
        i32.xor
        i32.const 16777619
        i32.mul
        local.set 2
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        br 1 (;@1;)
      end
    end
    local.get 2)
  (func $malloc (type 6) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 16
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 2
      i32.load
      local.set 0
      local.get 2
      i32.load offset=12
      local.set 4
      local.get 2
      i32.load offset=8
      local.set 3
      local.get 2
      i32.load offset=4
      local.set 1
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 5
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        global.get $__stack_pointer
        i32.const 32
        i32.sub
        local.tee 1
        global.set $__stack_pointer
        local.get 1
        i32.const 2
        i32.store offset=20
        i32.const 66556
        i32.load
        local.set 4
        i32.const 66556
        local.get 1
        i32.const 16
        i32.add
        i32.store
        local.get 1
        local.get 4
        i32.store offset=16
        local.get 0
        i32.eqz
        local.set 6
        i32.const 0
        local.set 3
      end
      block  ;; label = @2
        block  ;; label = @3
          global.get 1
          i32.eqz
          if  ;; label = @4
            local.get 6
            br_if 1 (;@3;)
            local.get 0
            i32.const 0
            i32.lt_s
            local.tee 3
            br_if 2 (;@2;)
          end
          local.get 5
          i32.const 0
          global.get 1
          select
          i32.eqz
          if  ;; label = @4
            local.get 0
            i32.const 3
            call $runtime.alloc
            local.set 2
            i32.const 0
            global.get 1
            i32.const 1
            i32.eq
            br_if 3 (;@1;)
            drop
            local.get 2
            local.set 3
          end
          global.get 1
          i32.eqz
          if  ;; label = @4
            local.get 1
            local.get 3
            i32.store offset=24
            local.get 1
            local.get 3
            i32.store offset=28
            local.get 1
            local.get 0
            i32.store offset=8
            local.get 1
            local.get 0
            i32.store offset=4
            local.get 1
            local.get 3
            i32.store
            local.get 1
            local.get 3
            i32.store offset=12
            local.get 1
            i32.const 12
            i32.add
            local.set 0
          end
          local.get 5
          i32.const 1
          i32.eq
          i32.const 1
          global.get 1
          select
          if  ;; label = @4
            local.get 0
            local.get 1
            call $runtime.hashmapBinarySet
            i32.const 1
            global.get 1
            i32.const 1
            i32.eq
            br_if 3 (;@1;)
            drop
          end
        end
        global.get 1
        i32.eqz
        if  ;; label = @3
          i32.const 66556
          local.get 4
          i32.store
          local.get 1
          i32.const 32
          i32.add
          global.set $__stack_pointer
          local.get 3
          return
        end
      end
      local.get 5
      i32.const 2
      i32.eq
      i32.const 1
      global.get 1
      select
      if  ;; label = @2
        call $runtime.slicePanic
        i32.const 2
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      unreachable
    end
    local.set 2
    global.get 2
    i32.load
    local.get 2
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 2
    local.get 0
    i32.store
    local.get 2
    local.get 1
    i32.store offset=4
    local.get 2
    local.get 3
    i32.store offset=8
    local.get 2
    local.get 4
    i32.store offset=12
    global.get 2
    global.get 2
    i32.load
    i32.const 16
    i32.add
    i32.store
    i32.const 0)
  (func $runtime.hashmapBinarySet (type 4) (param i32 i32)
    (local i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 12
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 2
      i32.load
      local.set 0
      local.get 2
      i32.load offset=4
      local.set 1
      local.get 2
      i32.load offset=8
      local.set 2
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 3
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        local.get 0
        i32.const 65776
        i32.load
        i32.const 65768
        i32.load
        local.get 0
        call $runtime.hash32
        local.set 2
      end
      local.get 3
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        i32.const 65764
        local.get 0
        local.get 1
        local.get 2
        call $runtime.hashmapSet
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      return
    end
    local.set 3
    global.get 2
    i32.load
    local.get 3
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 3
    local.get 0
    i32.store
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 2
    i32.store offset=8
    global.get 2
    global.get 2
    i32.load
    i32.const 12
    i32.add
    i32.store)
  (func $runtime.slicePanic (type 1)
    (local i32)
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32)  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        i32.const 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        i32.const 65715
        i32.const 18
        call $runtime.runtimePanicAt
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $free (type 0) (param i32)
    (local i32 i32 i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 12
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 2
      i32.load
      local.set 0
      local.get 2
      i32.load offset=4
      local.set 1
      local.get 2
      i32.load offset=8
      local.set 3
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 4
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        global.get $__stack_pointer
        i32.const 16
        i32.sub
        local.tee 3
        global.set $__stack_pointer
        local.get 0
        i32.eqz
        local.set 1
      end
      block  ;; label = @2
        block  ;; label = @3
          global.get 1
          i32.eqz
          if  ;; label = @4
            local.get 1
            br_if 1 (;@3;)
            local.get 3
            local.get 0
            i32.store offset=12
            local.get 3
            i32.const 12
            i32.add
            local.set 1
          end
          local.get 4
          i32.const 0
          global.get 1
          select
          i32.eqz
          if  ;; label = @4
            local.get 1
            local.get 3
            call $runtime.hashmapBinaryGet
            local.set 2
            i32.const 0
            global.get 1
            i32.const 1
            i32.eq
            br_if 3 (;@1;)
            drop
            local.get 2
            local.set 1
          end
          global.get 1
          i32.eqz
          if  ;; label = @4
            local.get 1
            i32.const 1
            i32.and
            i32.eqz
            br_if 2 (;@2;)
            local.get 3
            local.get 0
            i32.store
          end
          local.get 4
          i32.const 1
          i32.eq
          i32.const 1
          global.get 1
          select
          if  ;; label = @4
            local.get 3
            call $runtime.hashmapBinaryDelete
            i32.const 1
            global.get 1
            i32.const 1
            i32.eq
            br_if 3 (;@1;)
            drop
          end
        end
        global.get 1
        i32.eqz
        if  ;; label = @3
          local.get 3
          i32.const 16
          i32.add
          global.set $__stack_pointer
          return
        end
      end
      local.get 4
      i32.const 2
      i32.eq
      i32.const 1
      global.get 1
      select
      if  ;; label = @2
        i32.const 65592
        call $runtime._panic
        i32.const 2
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      return
    end
    local.set 2
    global.get 2
    i32.load
    local.get 2
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 2
    local.get 0
    i32.store
    local.get 2
    local.get 1
    i32.store offset=4
    local.get 2
    local.get 3
    i32.store offset=8
    global.get 2
    global.get 2
    i32.load
    i32.const 12
    i32.add
    i32.store)
  (func $runtime.hashmapBinaryGet (type 3) (param i32 i32) (result i32)
    (local i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 12
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 3
      i32.load
      local.set 0
      local.get 3
      i32.load offset=4
      local.set 1
      local.get 3
      i32.load offset=8
      local.set 3
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 2
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        local.get 0
        i32.const 65776
        i32.load
        i32.const 65768
        i32.load
        local.get 0
        call $runtime.hash32
        local.set 3
      end
      local.get 2
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        i32.const 65764
        local.get 0
        local.get 1
        local.get 3
        call $runtime.hashmapGet
        local.set 2
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 2
        local.set 0
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        local.get 0
        return
      end
      unreachable
    end
    local.set 2
    global.get 2
    i32.load
    local.get 2
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 2
    local.get 0
    i32.store
    local.get 2
    local.get 1
    i32.store offset=4
    local.get 2
    local.get 3
    i32.store offset=8
    global.get 2
    global.get 2
    i32.load
    i32.const 12
    i32.add
    i32.store
    i32.const 0)
  (func $runtime.hashmapBinaryDelete (type 0) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 48
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 1
      i32.load
      local.set 0
      local.get 1
      i32.load offset=8
      local.set 3
      local.get 1
      i32.load offset=16
      local.set 5
      local.get 1
      i32.load offset=20
      local.set 6
      local.get 1
      i32.load offset=24
      local.set 7
      local.get 1
      i32.load offset=28
      local.set 8
      local.get 1
      i32.load offset=32
      local.set 10
      local.get 1
      i32.load offset=36
      local.set 11
      local.get 1
      i32.load offset=40
      local.set 12
      local.get 1
      i32.load offset=44
      local.set 13
      local.get 1
      i32.load offset=12
      local.set 4
      local.get 1
      i32.load offset=4
      local.set 2
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 9
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        global.get $__stack_pointer
        i32.const 32
        i32.sub
        local.tee 2
        global.set $__stack_pointer
        local.get 2
        i32.const 24
        i32.add
        i64.const 0
        i64.store
        local.get 2
        i64.const 0
        i64.store offset=16
        local.get 2
        i32.const 6
        i32.store offset=4
        i32.const 66556
        i32.load
        local.set 7
        i32.const 66556
        local.get 2
        i32.store
        local.get 2
        local.get 7
        i32.store
        i32.const 1
        local.get 0
        i32.const 65776
        i32.load
        i32.const 65768
        i32.load
        local.get 3
        call $runtime.hash32
        local.tee 3
        i32.const 24
        i32.shr_u
        local.tee 4
        local.get 3
        i32.const 16777216
        i32.lt_u
        local.tee 6
        select
        local.set 8
      end
      local.get 9
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        i32.const 65764
        local.get 3
        call $runtime.hashmapBucketAddrForHash
        local.set 1
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 1
        local.set 4
      end
      block  ;; label = @2
        loop  ;; label = @3
          global.get 1
          i32.eqz
          if  ;; label = @4
            local.get 2
            local.get 4
            i32.store offset=8
            local.get 2
            local.get 4
            i32.store offset=12
            local.get 4
            i32.eqz
            br_if 2 (;@2;)
            local.get 4
            i32.const 12
            i32.add
            local.set 10
            i32.const 0
            local.set 3
          end
          block  ;; label = @4
            loop  ;; label = @5
              block  ;; label = @6
                global.get 1
                i32.eqz
                if  ;; label = @7
                  local.get 3
                  i32.const 8
                  i32.eq
                  local.tee 6
                  br_if 1 (;@6;)
                  local.get 2
                  local.get 10
                  i32.const 65776
                  i32.load
                  local.tee 11
                  local.get 3
                  i32.mul
                  i32.add
                  local.tee 6
                  i32.store offset=16
                  local.get 8
                  local.get 3
                  local.get 4
                  i32.add
                  local.tee 12
                  i32.load8_u
                  i32.ne
                  local.set 5
                end
                block  ;; label = @7
                  global.get 1
                  i32.eqz
                  if  ;; label = @8
                    local.get 5
                    br_if 1 (;@7;)
                    local.get 2
                    i32.const 65788
                    i32.load
                    local.tee 13
                    i32.store offset=20
                    local.get 2
                    i32.const 65792
                    i32.load
                    local.tee 5
                    i32.store offset=24
                    local.get 5
                    i32.eqz
                    br_if 4 (;@4;)
                  end
                  local.get 9
                  i32.const 1
                  i32.eq
                  i32.const 1
                  global.get 1
                  select
                  if  ;; label = @8
                    local.get 0
                    local.get 6
                    local.get 11
                    local.get 13
                    local.get 5
                    call_indirect (type 2)
                    local.set 1
                    i32.const 1
                    global.get 1
                    i32.const 1
                    i32.eq
                    br_if 7 (;@1;)
                    drop
                    local.get 1
                    local.set 5
                  end
                  global.get 1
                  i32.eqz
                  if  ;; label = @8
                    local.get 5
                    i32.const 1
                    i32.and
                    i32.eqz
                    local.tee 5
                    br_if 1 (;@7;)
                    local.get 12
                    i32.const 0
                    i32.store8
                    local.get 6
                    i32.const 0
                    i32.const 65776
                    i32.load
                    memory.fill
                    local.get 4
                    i32.const 65776
                    i32.load
                    i32.const 3
                    i32.shl
                    i32.add
                    i32.const 65780
                    i32.load
                    local.tee 6
                    local.get 3
                    i32.mul
                    i32.add
                    i32.const 12
                    i32.add
                    i32.const 0
                    local.get 6
                    memory.fill
                    i32.const 65772
                    i32.const 65772
                    i32.load
                    i32.const 1
                    i32.sub
                    i32.store
                    br 6 (;@2;)
                  end
                end
                global.get 1
                i32.eqz
                if  ;; label = @7
                  local.get 3
                  i32.const 1
                  i32.add
                  local.set 3
                  br 2 (;@5;)
                end
              end
            end
            global.get 1
            i32.eqz
            if  ;; label = @5
              local.get 4
              i32.load offset=8
              local.set 4
              br 2 (;@3;)
            end
          end
        end
        local.get 9
        i32.const 2
        i32.eq
        i32.const 1
        global.get 1
        select
        if  ;; label = @3
          call $runtime.nilPanic
          i32.const 2
          global.get 1
          i32.const 1
          i32.eq
          br_if 2 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if  ;; label = @3
          unreachable
        end
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        i32.const 66556
        local.get 7
        i32.store
        local.get 2
        i32.const 32
        i32.add
        global.set $__stack_pointer
      end
      return
    end
    local.set 1
    global.get 2
    i32.load
    local.get 1
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 1
    local.get 0
    i32.store
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 1
    local.get 3
    i32.store offset=8
    local.get 1
    local.get 4
    i32.store offset=12
    local.get 1
    local.get 5
    i32.store offset=16
    local.get 1
    local.get 6
    i32.store offset=20
    local.get 1
    local.get 7
    i32.store offset=24
    local.get 1
    local.get 8
    i32.store offset=28
    local.get 1
    local.get 10
    i32.store offset=32
    local.get 1
    local.get 11
    i32.store offset=36
    local.get 1
    local.get 12
    i32.store offset=40
    local.get 1
    local.get 13
    i32.store offset=44
    global.get 2
    global.get 2
    i32.load
    i32.const 48
    i32.add
    i32.store)
  (func $runtime._panic (type 0) (param i32)
    (local i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.sub
      i32.store
      global.get 2
      i32.load
      i32.load
      local.set 0
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32)  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        i32.const 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        local.get 0
        call $runtime.panicOrGoexit
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      return
    end
    local.set 1
    global.get 2
    i32.load
    local.get 1
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $calloc (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 12
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 2
      i32.load
      local.set 0
      local.get 2
      i32.load offset=4
      local.set 3
      local.get 2
      i32.load offset=8
      local.set 2
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 4
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        global.get $__stack_pointer
        i32.const 16
        i32.sub
        local.tee 3
        global.set $__stack_pointer
        i32.const 66556
        i32.load
        local.set 2
        i32.const 66556
        local.get 3
        i32.store
        local.get 0
        local.get 1
        i32.mul
        local.set 0
      end
      local.get 4
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        local.get 0
        call $malloc
        local.set 1
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 1
        local.set 0
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        i32.const 66556
        local.get 2
        i32.store
        local.get 3
        i32.const 16
        i32.add
        global.set $__stack_pointer
        local.get 0
        return
      end
      unreachable
    end
    local.set 1
    global.get 2
    i32.load
    local.get 1
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 1
    local.get 0
    i32.store
    local.get 1
    local.get 3
    i32.store offset=4
    local.get 1
    local.get 2
    i32.store offset=8
    global.get 2
    global.get 2
    i32.load
    i32.const 12
    i32.add
    i32.store
    i32.const 0)
  (func $realloc (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 24
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 3
      i32.load
      local.set 0
      local.get 3
      i32.load offset=8
      local.set 2
      local.get 3
      i32.load offset=12
      local.set 4
      local.get 3
      i32.load offset=16
      local.set 5
      local.get 3
      i32.load offset=20
      local.set 7
      local.get 3
      i32.load offset=4
      local.set 1
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 6
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        global.get $__stack_pointer
        i32.const 32
        i32.sub
        local.tee 2
        global.set $__stack_pointer
        local.get 2
        i32.const 2
        i32.store offset=20
        i32.const 66556
        i32.load
        local.set 7
        i32.const 66556
        local.get 2
        i32.const 16
        i32.add
        local.tee 4
        i32.store
        local.get 2
        local.get 7
        i32.store offset=16
        i32.const 0
        local.set 5
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            global.get 1
            i32.const 1
            local.get 1
            select
            if  ;; label = @5
              local.get 6
              i32.const 0
              global.get 1
              select
              i32.eqz
              if  ;; label = @6
                local.get 0
                call $free
                i32.const 0
                global.get 1
                i32.const 1
                i32.eq
                br_if 5 (;@1;)
                drop
              end
              global.get 1
              i32.eqz
              br_if 1 (;@4;)
            end
            global.get 1
            i32.eqz
            if  ;; label = @5
              local.get 1
              i32.const 0
              i32.lt_s
              local.tee 5
              br_if 2 (;@3;)
            end
            local.get 6
            i32.const 1
            i32.eq
            i32.const 1
            global.get 1
            select
            if  ;; label = @5
              local.get 1
              i32.const 3
              call $runtime.alloc
              local.set 3
              i32.const 1
              global.get 1
              i32.const 1
              i32.eq
              br_if 4 (;@1;)
              drop
              local.get 3
              local.set 5
            end
            global.get 1
            i32.eqz
            if  ;; label = @5
              local.get 2
              local.get 5
              i32.store offset=24
              local.get 2
              local.get 5
              i32.store offset=28
              local.get 0
              i32.eqz
              local.set 4
            end
            block  ;; label = @5
              global.get 1
              i32.eqz
              if  ;; label = @6
                local.get 4
                br_if 1 (;@5;)
                local.get 2
                local.get 0
                i32.store offset=12
                local.get 2
                i32.const 12
                i32.add
                local.set 4
              end
              local.get 6
              i32.const 2
              i32.eq
              i32.const 1
              global.get 1
              select
              if  ;; label = @6
                local.get 4
                local.get 2
                call $runtime.hashmapBinaryGet
                local.set 3
                i32.const 2
                global.get 1
                i32.const 1
                i32.eq
                br_if 5 (;@1;)
                drop
                local.get 3
                local.set 4
              end
              global.get 1
              i32.eqz
              if  ;; label = @6
                local.get 4
                i32.const 1
                i32.and
                i32.eqz
                br_if 4 (;@2;)
                local.get 5
                local.get 2
                i32.load
                local.get 2
                i32.load offset=4
                local.tee 4
                local.get 1
                local.get 1
                local.get 4
                i32.gt_u
                select
                memory.copy
                local.get 2
                local.get 0
                i32.store
              end
              local.get 6
              i32.const 3
              i32.eq
              i32.const 1
              global.get 1
              select
              if  ;; label = @6
                local.get 2
                call $runtime.hashmapBinaryDelete
                i32.const 3
                global.get 1
                i32.const 1
                i32.eq
                br_if 5 (;@1;)
                drop
              end
            end
            global.get 1
            i32.eqz
            if  ;; label = @5
              local.get 2
              local.get 1
              i32.store offset=8
              local.get 2
              local.get 1
              i32.store offset=4
              local.get 2
              local.get 5
              i32.store
              local.get 2
              local.get 5
              i32.store offset=12
              local.get 2
              i32.const 12
              i32.add
              local.set 0
            end
            local.get 6
            i32.const 4
            i32.eq
            i32.const 1
            global.get 1
            select
            if  ;; label = @5
              local.get 0
              local.get 2
              call $runtime.hashmapBinarySet
              i32.const 4
              global.get 1
              i32.const 1
              i32.eq
              br_if 4 (;@1;)
              drop
            end
          end
          global.get 1
          i32.eqz
          if  ;; label = @4
            i32.const 66556
            local.get 7
            i32.store
            local.get 2
            i32.const 32
            i32.add
            global.set $__stack_pointer
            local.get 5
            return
          end
        end
        local.get 6
        i32.const 5
        i32.eq
        i32.const 1
        global.get 1
        select
        if  ;; label = @3
          call $runtime.slicePanic
          i32.const 5
          global.get 1
          i32.const 1
          i32.eq
          br_if 2 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if  ;; label = @3
          unreachable
        end
      end
      local.get 6
      i32.const 6
      i32.eq
      i32.const 1
      global.get 1
      select
      if  ;; label = @2
        i32.const 65624
        call $runtime._panic
        i32.const 6
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      unreachable
    end
    local.set 3
    global.get 2
    i32.load
    local.get 3
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 3
    local.get 0
    i32.store
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 2
    i32.store offset=8
    local.get 3
    local.get 4
    i32.store offset=12
    local.get 3
    local.get 5
    i32.store offset=16
    local.get 3
    local.get 7
    i32.store offset=20
    global.get 2
    global.get 2
    i32.load
    i32.const 24
    i32.add
    i32.store
    i32.const 0)
  (func $resume (type 1)
    (local i32)
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 0
      end
      local.get 0
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        i32.const 1
        call $internal/task.start
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      local.get 0
      i32.const 1
      i32.eq
      i32.const 1
      global.get 1
      select
      if  ;; label = @2
        call $runtime.scheduler
        i32.const 1
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $runtime.resume$1$gowrapper (type 0) (param i32)
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32)  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        i32.const 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        call $runtime.resume$1
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $runtime.scheduler (type 1)
    (local i32 i32 i32 i32)
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 2
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        loop  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 66564
              i32.load8_u
              br_if 0 (;@5;)
              i32.const 66568
              i32.load
              local.tee 0
              i32.eqz
              br_if 0 (;@5;)
              i32.const 66568
              local.get 0
              i32.load
              i32.store
              local.get 0
              i32.const 66572
              i32.load
              i32.eq
              if  ;; label = @6
                i32.const 66572
                i32.const 0
                i32.store
              end
              local.get 0
              i32.const 0
              i32.store
              local.get 0
              i32.load offset=16
              local.set 1
              local.get 0
              i32.const 66556
              i32.load
              i32.store offset=16
              i32.const 66556
              local.get 1
              i32.store
              i32.const 66368
              i32.load
              local.set 1
              i32.const 66368
              local.get 0
              i32.store
              local.get 0
              i32.const 20
              i32.add
              local.set 3
              local.get 0
              i32.load8_u offset=40
              if  ;; label = @6
                local.get 3
                call $tinygo_rewind
                br 2 (;@4;)
              end
              local.get 3
              call $tinygo_launch
              local.get 0
              i32.const 1
              i32.store8 offset=40
              br 1 (;@4;)
            end
            return
          end
          i32.const 66368
          local.get 1
          i32.store
          i32.const 66556
          i32.load
          local.set 1
          i32.const 66556
          local.get 0
          i32.load offset=16
          i32.store
          local.get 0
          local.get 1
          i32.store offset=16
          local.get 0
          i32.load offset=32
          local.get 0
          i32.load offset=28
          i32.ge_u
          br_if 0 (;@3;)
        end
      end
      local.get 2
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        i32.const 65552
        call $runtime.runtimePanic
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $go_scheduler (type 1)
    (local i32)
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32)  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        i32.const 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        call $runtime.scheduler
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $_start (type 1)
    (local i32 i32 i32 i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 12
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 1
      i32.load
      local.set 0
      local.get 1
      i32.load offset=8
      local.set 4
      local.get 1
      i32.load offset=4
      local.set 2
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 3
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        global.get $__stack_pointer
        i32.const 16
        i32.sub
        local.tee 2
        global.set $__stack_pointer
        local.get 2
        i32.const 0
        i32.store offset=12
        local.get 2
        i64.const 2
        i64.store offset=4 align=4
        i32.const 66556
        i32.load
        local.set 4
        i32.const 66556
        local.get 2
        i32.store
        local.get 2
        local.get 4
        i32.store
        i32.const 66372
        memory.size
        i32.const 16
        i32.shl
        local.tee 1
        i32.store
        call $runtime.calculateHeapAddresses
        local.get 2
        i32.const 66500
        i32.load
        local.tee 0
        i32.store offset=12
        local.get 2
        local.get 0
        i32.store offset=8
        local.get 0
        i32.const 0
        local.get 1
        local.get 0
        i32.sub
        memory.fill
      end
      local.get 3
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        call $arc4random
        local.set 1
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 1
        local.set 0
      end
      local.get 3
      i32.const 1
      i32.eq
      i32.const 1
      global.get 1
      select
      if  ;; label = @2
        call $arc4random
        drop
        i32.const 1
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        i32.const 65752
        local.get 0
        i32.const 1
        i32.or
        local.tee 0
        i32.store
      end
      local.get 3
      i32.const 2
      i32.eq
      i32.const 1
      global.get 1
      select
      if  ;; label = @2
        i32.const 2
        call $internal/task.start
        i32.const 2
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      local.get 3
      i32.const 3
      i32.eq
      i32.const 1
      global.get 1
      select
      if  ;; label = @2
        call $runtime.scheduler
        i32.const 3
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        i32.const 66564
        i32.load8_u
        i32.eqz
        local.set 0
      end
      block  ;; label = @2
        global.get 1
        i32.eqz
        if  ;; label = @3
          local.get 0
          br_if 1 (;@2;)
          call $dummy
        end
        local.get 3
        i32.const 4
        i32.eq
        i32.const 1
        global.get 1
        select
        if  ;; label = @3
          i32.const 0
          call $runtime.proc_exit
          i32.const 4
          global.get 1
          i32.const 1
          i32.eq
          br_if 2 (;@1;)
          drop
        end
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        i32.const 66556
        local.get 4
        i32.store
        local.get 2
        i32.const 16
        i32.add
        global.set $__stack_pointer
      end
      return
    end
    local.set 1
    global.get 2
    i32.load
    local.get 1
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 1
    local.get 0
    i32.store
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 1
    local.get 4
    i32.store offset=8
    global.get 2
    global.get 2
    i32.load
    i32.const 12
    i32.add
    i32.store)
  (func $runtime.calculateHeapAddresses (type 1)
    (local i32)
    i32.const 66500
    i32.const 66372
    i32.load
    local.tee 0
    local.get 0
    i32.const 66800
    i32.sub
    i32.const 65
    i32.div_u
    i32.sub
    local.tee 0
    i32.store
    i32.const 66508
    local.get 0
    i32.const 66864
    i32.sub
    i32.const 4
    i32.shr_u
    i32.store)
  (func $runtime.run$1$gowrapper (type 0) (param i32)
    (local i32)
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 1
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        memory.size
        local.set 0
        i32.const 66564
        i32.const 1
        i32.store8
        i32.const 66372
        local.get 0
        i32.const 16
        i32.shl
        i32.store
      end
      local.get 1
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        call $runtime.deadlock
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $runtime.deadlock (type 1)
    (local i32)
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 0
      end
      local.get 0
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        call $internal/task.Pause
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      local.get 0
      i32.const 1
      i32.eq
      i32.const 1
      global.get 1
      select
      if  ;; label = @2
        i32.const 65744
        call $runtime._panic
        i32.const 1
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $runtime.printstring (type 4) (param i32 i32)
    (local i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 12
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 2
      i32.load
      local.set 0
      local.get 2
      i32.load offset=4
      local.set 1
      local.get 2
      i32.load offset=8
      local.set 2
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 3
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        local.get 1
        i32.const 0
        local.get 1
        i32.const 0
        i32.gt_s
        local.tee 2
        select
        local.set 1
      end
      loop  ;; label = @2
        block  ;; label = @3
          global.get 1
          i32.eqz
          if  ;; label = @4
            local.get 1
            i32.eqz
            br_if 1 (;@3;)
            local.get 0
            i32.load8_u
            local.set 2
          end
          local.get 3
          i32.const 0
          global.get 1
          select
          i32.eqz
          if  ;; label = @4
            local.get 2
            call $runtime.putchar
            i32.const 0
            global.get 1
            i32.const 1
            i32.eq
            br_if 3 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if  ;; label = @4
            local.get 1
            i32.const 1
            i32.sub
            local.set 1
            local.get 0
            i32.const 1
            i32.add
            local.set 0
            br 2 (;@2;)
          end
        end
      end
      return
    end
    local.set 3
    global.get 2
    i32.load
    local.get 3
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 3
    local.get 0
    i32.store
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 2
    i32.store offset=8
    global.get 2
    global.get 2
    i32.load
    i32.const 12
    i32.add
    i32.store)
  (func $runtime.putchar (type 0) (param i32)
    (local i32 i32 i32)
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 2
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        i32.const 66376
        i32.load
        local.tee 3
        i32.const 119
        i32.gt_u
        local.set 1
      end
      block  ;; label = @2
        global.get 1
        i32.eqz
        if  ;; label = @3
          local.get 1
          br_if 1 (;@2;)
          i32.const 66376
          local.get 3
          i32.const 1
          i32.add
          local.tee 1
          i32.store
          local.get 3
          i32.const 66380
          i32.add
          local.get 0
          i32.store8
          local.get 0
          i32.const 255
          i32.and
          i32.const 10
          i32.eq
          local.set 0
        end
        block  ;; label = @3
          global.get 1
          i32.eqz
          if  ;; label = @4
            local.get 0
            i32.eqz
            local.get 3
            i32.const 119
            i32.ne
            i32.and
            br_if 1 (;@3;)
            i32.const 65760
            local.get 1
            i32.store
          end
          local.get 2
          i32.const 0
          global.get 1
          select
          i32.eqz
          if  ;; label = @4
            i32.const 1
            i32.const 65756
            i32.const 1
            i32.const 66560
            call $runtime.fd_write
            drop
            i32.const 0
            global.get 1
            i32.const 1
            i32.eq
            br_if 3 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if  ;; label = @4
            i32.const 66376
            i32.const 0
            i32.store
          end
        end
        global.get 1
        i32.eqz
        if  ;; label = @3
          return
        end
      end
      local.get 2
      i32.const 1
      i32.eq
      i32.const 1
      global.get 1
      select
      if  ;; label = @2
        call $runtime.lookupPanic
        i32.const 1
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $runtime.printnl (type 1)
    (local i32)
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32)  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        i32.const 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        i32.const 10
        call $runtime.putchar
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $runtime.runtimePanicAt (type 4) (param i32 i32)
    (local i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 8
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 1
      i32.load
      local.set 0
      local.get 1
      i32.load offset=4
      local.set 1
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 2
      end
      local.get 2
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        i32.const 65652
        i32.const 22
        call $runtime.printstring
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      local.get 2
      i32.const 1
      i32.eq
      i32.const 1
      global.get 1
      select
      if  ;; label = @2
        local.get 0
        local.get 1
        call $runtime.printstring
        i32.const 1
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      local.get 2
      i32.const 2
      i32.eq
      i32.const 1
      global.get 1
      select
      if  ;; label = @2
        call $runtime.printnl
        i32.const 2
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      return
    end
    local.set 2
    global.get 2
    i32.load
    local.get 2
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 2
    local.get 0
    i32.store
    local.get 2
    local.get 1
    i32.store offset=4
    global.get 2
    global.get 2
    i32.load
    i32.const 8
    i32.add
    i32.store)
  (func $runtime.lookupPanic (type 1)
    (local i32)
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32)  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        i32.const 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        i32.const 65697
        i32.const 18
        call $runtime.runtimePanicAt
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $runtime.panicOrGoexit (type 0) (param i32)
    (local i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.sub
      i32.store
      global.get 2
      i32.load
      i32.load
      local.set 0
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 1
      end
      local.get 1
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        i32.const 65645
        i32.const 7
        call $runtime.printstring
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      local.get 1
      i32.const 1
      i32.eq
      i32.const 1
      global.get 1
      select
      if  ;; label = @2
        local.get 0
        call $runtime.printitf
        i32.const 1
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      local.get 1
      i32.const 2
      i32.eq
      i32.const 1
      global.get 1
      select
      if  ;; label = @2
        call $runtime.printnl
        i32.const 2
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      return
    end
    local.set 1
    global.get 2
    i32.load
    local.get 1
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $runtime.printitf (type 0) (param i32)
    (local i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 8
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 1
      i32.load
      local.set 0
      local.get 1
      i32.load offset=4
      local.set 1
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 2
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        local.get 0
        i32.load
        local.set 1
        local.get 0
        i32.load offset=4
        local.set 0
      end
      local.get 2
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        local.get 1
        local.get 0
        call $runtime.printstring
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      return
    end
    local.set 2
    global.get 2
    i32.load
    local.get 2
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 2
    local.get 0
    i32.store
    local.get 2
    local.get 1
    i32.store offset=4
    global.get 2
    global.get 2
    i32.load
    i32.const 8
    i32.add
    i32.store)
  (func $runtime.markRoots (type 4) (param i32 i32)
    (local i32 i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 16
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 2
      i32.load
      local.set 0
      local.get 2
      i32.load offset=4
      local.set 1
      local.get 2
      i32.load offset=8
      local.set 3
      local.get 2
      i32.load offset=12
      local.set 2
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 4
      end
      loop  ;; label = @2
        block  ;; label = @3
          global.get 1
          i32.eqz
          if  ;; label = @4
            local.get 0
            local.get 1
            i32.ge_u
            br_if 1 (;@3;)
            local.get 0
            i32.load
            local.tee 3
            i32.const 66864
            i32.lt_u
            local.set 2
          end
          block  ;; label = @4
            global.get 1
            i32.eqz
            if  ;; label = @5
              local.get 2
              br_if 1 (;@4;)
              local.get 3
              i32.const 66500
              i32.load
              i32.ge_u
              local.tee 2
              br_if 1 (;@4;)
              local.get 3
              i32.const 66864
              i32.sub
              i32.const 4
              i32.shr_u
              local.tee 3
              call $_runtime.gcBlock_.state
              i32.const 255
              i32.and
              i32.eqz
              local.tee 2
              br_if 1 (;@4;)
              local.get 3
              call $_runtime.gcBlock_.findHead
              local.tee 3
              call $_runtime.gcBlock_.state
              i32.const 255
              i32.and
              i32.const 3
              i32.eq
              local.tee 2
              br_if 1 (;@4;)
            end
            local.get 4
            i32.const 0
            global.get 1
            select
            i32.eqz
            if  ;; label = @5
              local.get 3
              call $runtime.startMark
              i32.const 0
              global.get 1
              i32.const 1
              i32.eq
              br_if 4 (;@1;)
              drop
            end
          end
          global.get 1
          i32.eqz
          if  ;; label = @4
            local.get 0
            i32.const 4
            i32.add
            local.set 0
            br 2 (;@2;)
          end
        end
      end
      return
    end
    local.set 4
    global.get 2
    i32.load
    local.get 4
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 4
    local.get 0
    i32.store
    local.get 4
    local.get 1
    i32.store offset=4
    local.get 4
    local.get 3
    i32.store offset=8
    local.get 4
    local.get 2
    i32.store offset=12
    global.get 2
    global.get 2
    i32.load
    i32.const 16
    i32.add
    i32.store)
  (func $_runtime.gcBlock_.state (type 6) (param i32) (result i32)
    i32.const 66500
    i32.load
    local.get 0
    i32.const 2
    i32.shr_u
    i32.add
    i32.load8_u
    local.get 0
    i32.const 1
    i32.shl
    i32.const 6
    i32.and
    i32.shr_u
    i32.const 3
    i32.and)
  (func $_runtime.gcBlock_.markFree (type 0) (param i32)
    (local i32)
    i32.const 66500
    i32.load
    local.get 0
    i32.const 2
    i32.shr_u
    i32.add
    local.tee 1
    local.get 1
    i32.load8_u
    i32.const 3
    local.get 0
    i32.const 1
    i32.shl
    i32.const 6
    i32.and
    i32.shl
    i32.const -1
    i32.xor
    i32.and
    i32.store8)
  (func $runtime.growHeap (type 5) (result i32)
    (local i32 i32 i32)
    memory.size
    memory.grow
    i32.const -1
    i32.ne
    local.tee 1
    if  ;; label = @1
      memory.size
      local.set 0
      i32.const 66372
      i32.load
      local.set 2
      i32.const 66372
      local.get 0
      i32.const 16
      i32.shl
      i32.store
      i32.const 66500
      i32.load
      local.set 0
      call $runtime.calculateHeapAddresses
      i32.const 66500
      i32.load
      local.get 0
      local.get 2
      local.get 0
      i32.sub
      memory.copy
    end
    local.get 1)
  (func $runtime.startMark (type 0) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 9
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        global.get $__stack_pointer
        i32.const 128
        i32.sub
        local.tee 5
        global.set $__stack_pointer
        local.get 5
        i32.const 4
        i32.add
        i32.const 0
        i32.const 124
        memory.fill
        local.get 5
        local.get 0
        i32.store
        local.get 0
        i32.const 3
        call $_runtime.gcBlock_.setState
        i32.const 1
        local.set 4
        block  ;; label = @3
          loop  ;; label = @4
            local.get 4
            i32.const 0
            i32.gt_s
            if  ;; label = @5
              local.get 4
              i32.const 1
              i32.sub
              local.tee 4
              i32.const 31
              i32.gt_u
              br_if 2 (;@3;)
              block  ;; label = @6
                local.get 5
                local.get 4
                i32.const 2
                i32.shl
                i32.add
                i32.load
                local.tee 3
                i32.const 4
                i32.shl
                local.tee 1
                i32.const 66864
                i32.add
                local.tee 11
                i32.load
                local.tee 0
                i32.eqz
                if  ;; label = @7
                  i32.const 0
                  local.set 7
                  i32.const 1
                  local.set 10
                  i32.const 1
                  local.set 8
                  i32.const 1
                  local.set 6
                  br 1 (;@6;)
                end
                block (result i32)  ;; label = @7
                  local.get 0
                  i32.const 1
                  i32.and
                  if  ;; label = @8
                    local.get 0
                    i32.const 6
                    i32.shr_u
                    local.set 6
                    local.get 0
                    i32.const 1
                    i32.shr_u
                    i32.const 31
                    i32.and
                    local.set 8
                    i32.const 0
                    br 1 (;@7;)
                  end
                  local.get 0
                  i32.load
                  local.set 8
                  i32.const 0
                  local.set 6
                  local.get 0
                  i32.const 4
                  i32.add
                end
                local.tee 7
                i32.eqz
                local.set 10
                local.get 7
                br_if 0 (;@6;)
                local.get 6
                i32.eqz
                br_if 2 (;@4;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  call $_runtime.gcBlock_.state
                  i32.const 255
                  i32.and
                  i32.const 1
                  i32.sub
                  br_table 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;)
                end
                local.get 3
                i32.const 1
                i32.add
                local.set 3
              end
              local.get 3
              i32.const 4
              i32.shl
              local.tee 0
              i32.const 66864
              i32.add
              local.set 2
              local.get 0
              local.get 1
              i32.sub
              i32.const 16
              i32.sub
              local.set 1
              i32.const 66500
              i32.load
              local.set 12
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  local.set 0
                  local.get 2
                  local.get 12
                  i32.ge_u
                  br_if 0 (;@7;)
                  local.get 0
                  i32.const 16
                  i32.add
                  local.set 1
                  local.get 2
                  i32.const 16
                  i32.add
                  local.set 2
                  local.get 3
                  call $_runtime.gcBlock_.state
                  local.set 13
                  local.get 3
                  i32.const 1
                  i32.add
                  local.set 3
                  local.get 13
                  i32.const 255
                  i32.and
                  i32.const 2
                  i32.eq
                  br_if 1 (;@6;)
                end
              end
              local.get 11
              i32.const 16
              i32.add
              local.set 3
              i32.const 0
              local.set 2
              loop  ;; label = @6
                local.get 0
                i32.eqz
                br_if 2 (;@4;)
                block  ;; label = @7
                  local.get 3
                  i32.load
                  local.tee 1
                  i32.const 66864
                  i32.lt_u
                  br_if 0 (;@7;)
                  local.get 1
                  i32.const 66500
                  i32.load
                  i32.ge_u
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 10
                    i32.eqz
                    if  ;; label = @9
                      local.get 7
                      local.get 2
                      i32.const 3
                      i32.shr_u
                      i32.add
                      i32.load8_u
                      local.get 2
                      i32.const 7
                      i32.and
                      i32.shr_u
                      i32.const 1
                      i32.and
                      br_if 1 (;@8;)
                      br 2 (;@7;)
                    end
                    local.get 6
                    i32.const 1
                    local.get 2
                    i32.shl
                    i32.and
                    i32.eqz
                    local.get 2
                    i32.const 31
                    i32.gt_u
                    i32.or
                    br_if 1 (;@7;)
                  end
                  local.get 1
                  i32.const 66864
                  i32.sub
                  i32.const 4
                  i32.shr_u
                  local.tee 1
                  call $_runtime.gcBlock_.state
                  i32.const 255
                  i32.and
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 1
                  call $_runtime.gcBlock_.findHead
                  local.tee 1
                  call $_runtime.gcBlock_.state
                  i32.const 255
                  i32.and
                  i32.const 3
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 1
                  i32.const 3
                  call $_runtime.gcBlock_.setState
                  local.get 4
                  i32.const 32
                  i32.eq
                  if  ;; label = @8
                    i32.const 66553
                    i32.const 1
                    i32.store8
                    i32.const 32
                    local.set 4
                    br 1 (;@7;)
                  end
                  local.get 4
                  i32.const 31
                  i32.gt_u
                  br_if 4 (;@3;)
                  local.get 5
                  local.get 4
                  i32.const 2
                  i32.shl
                  i32.add
                  local.get 1
                  i32.store
                  local.get 4
                  i32.const 1
                  i32.add
                  local.set 4
                end
                local.get 8
                local.get 2
                i32.const 1
                i32.add
                local.tee 2
                i32.eq
                local.set 1
                i32.const 0
                local.get 2
                local.get 1
                select
                local.set 2
                local.get 0
                i32.const 4
                i32.sub
                local.set 0
                local.get 3
                i32.const 4
                i32.add
                local.set 3
                br 0 (;@6;)
              end
              unreachable
            end
          end
          local.get 5
          i32.const 128
          i32.add
          global.set $__stack_pointer
          return
        end
      end
      local.get 9
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        call $runtime.lookupPanic
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $_runtime.gcBlock_.setState (type 4) (param i32 i32)
    (local i32)
    i32.const 66500
    i32.load
    local.get 0
    i32.const 2
    i32.shr_u
    i32.add
    local.tee 2
    local.get 2
    i32.load8_u
    local.get 1
    local.get 0
    i32.const 1
    i32.shl
    i32.const 6
    i32.and
    i32.shl
    i32.or
    i32.store8)
  (func $_runtime.gcBlock_.findHead (type 6) (param i32) (result i32)
    (local i32 i32 i32)
    i32.const 66500
    i32.load
    local.set 2
    loop  ;; label = @1
      block  ;; label = @2
        local.get 2
        local.get 0
        i32.const 2
        i32.shr_u
        i32.add
        i32.load8_u
        local.tee 3
        i32.const 170
        i32.eq
        if  ;; label = @3
          local.get 0
          i32.const -1
          i32.xor
          i32.const -4
          i32.or
          local.set 1
          br 1 (;@2;)
        end
        i32.const -1
        local.set 1
        local.get 3
        local.get 0
        i32.const 1
        i32.shl
        i32.const 6
        i32.and
        i32.shr_u
        i32.const 3
        i32.and
        i32.const 2
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        return
      end
      local.get 0
      local.get 1
      i32.add
      local.set 0
      br 0 (;@1;)
    end
    unreachable)
  (func $runtime.resume$1 (type 1)
    (local i32)
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32)  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        i32.const 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        call $runtime.nilPanic
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $runtime.hashmapGet (type 2) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 56
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 4
      i32.load
      local.set 0
      local.get 4
      i32.load offset=8
      local.set 2
      local.get 4
      i32.load offset=12
      local.set 3
      local.get 4
      i32.load offset=16
      local.set 5
      local.get 4
      i32.load offset=20
      local.set 6
      local.get 4
      i32.load offset=24
      local.set 7
      local.get 4
      i32.load offset=28
      local.set 8
      local.get 4
      i32.load offset=32
      local.set 9
      local.get 4
      i32.load offset=36
      local.set 10
      local.get 4
      i32.load offset=40
      local.set 11
      local.get 4
      i32.load offset=44
      local.set 13
      local.get 4
      i32.load offset=48
      local.set 14
      local.get 4
      i32.load offset=52
      local.set 15
      local.get 4
      i32.load offset=4
      local.set 1
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 12
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        global.get $__stack_pointer
        i32.const 48
        i32.sub
        local.tee 5
        global.set $__stack_pointer
        local.get 5
        i32.const 32
        i32.add
        i64.const 0
        i64.store
        local.get 5
        i32.const 40
        i32.add
        i32.const 0
        i32.store
        local.get 5
        i64.const 0
        i64.store offset=24
        local.get 5
        i32.const 7
        i32.store offset=12
        i32.const 66556
        i32.load
        local.set 9
        i32.const 66556
        local.get 5
        i32.const 8
        i32.add
        local.tee 6
        i32.store
        local.get 5
        local.get 9
        i32.store offset=8
      end
      local.get 12
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        local.get 0
        local.get 3
        call $runtime.hashmapBucketAddrForHash
        local.set 4
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 4
        local.set 6
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        local.get 5
        local.get 6
        i32.store offset=16
        i32.const 1
        local.get 3
        i32.const 24
        i32.shr_u
        local.tee 7
        local.get 3
        i32.const 16777216
        i32.lt_u
        local.tee 3
        select
        local.set 10
      end
      block  ;; label = @2
        block  ;; label = @3
          loop  ;; label = @4
            block  ;; label = @5
              global.get 1
              i32.eqz
              if  ;; label = @6
                local.get 5
                local.get 6
                i32.store offset=20
                local.get 6
                i32.eqz
                br_if 1 (;@5;)
                local.get 6
                i32.const 12
                i32.add
                local.set 11
                i32.const 0
                local.set 3
              end
              loop  ;; label = @6
                block  ;; label = @7
                  global.get 1
                  i32.eqz
                  if  ;; label = @8
                    local.get 3
                    i32.const 8
                    i32.eq
                    local.tee 7
                    br_if 1 (;@7;)
                    local.get 5
                    local.get 11
                    local.get 0
                    i32.load offset=12
                    local.tee 7
                    local.get 3
                    i32.mul
                    i32.add
                    local.tee 13
                    i32.store offset=24
                    local.get 5
                    local.get 11
                    local.get 7
                    i32.const 3
                    i32.shl
                    i32.add
                    local.get 0
                    i32.load offset=16
                    local.get 3
                    i32.mul
                    i32.add
                    local.tee 14
                    i32.store offset=28
                    local.get 10
                    local.get 3
                    local.get 6
                    i32.add
                    i32.load8_u
                    i32.ne
                    local.set 8
                  end
                  block  ;; label = @8
                    global.get 1
                    i32.eqz
                    if  ;; label = @9
                      local.get 8
                      br_if 1 (;@8;)
                      local.get 5
                      local.get 0
                      i32.load offset=24
                      local.tee 15
                      i32.store offset=32
                      local.get 5
                      local.get 0
                      i32.load offset=28
                      local.tee 8
                      i32.store offset=36
                      local.get 8
                      i32.eqz
                      br_if 7 (;@2;)
                    end
                    local.get 12
                    i32.const 1
                    i32.eq
                    i32.const 1
                    global.get 1
                    select
                    if  ;; label = @9
                      local.get 1
                      local.get 13
                      local.get 7
                      local.get 15
                      local.get 8
                      call_indirect (type 2)
                      local.set 4
                      i32.const 1
                      global.get 1
                      i32.const 1
                      i32.eq
                      br_if 8 (;@1;)
                      drop
                      local.get 4
                      local.set 7
                    end
                    global.get 1
                    i32.eqz
                    if  ;; label = @9
                      local.get 7
                      i32.const 1
                      i32.and
                      i32.eqz
                      local.tee 7
                      br_if 1 (;@8;)
                      local.get 2
                      local.get 14
                      local.get 0
                      i32.load offset=16
                      memory.copy
                      br 6 (;@3;)
                    end
                  end
                  global.get 1
                  i32.eqz
                  if  ;; label = @8
                    local.get 3
                    i32.const 1
                    i32.add
                    local.set 3
                    br 2 (;@6;)
                  end
                end
              end
              global.get 1
              i32.eqz
              if  ;; label = @6
                local.get 5
                local.get 6
                i32.load offset=8
                local.tee 6
                i32.store offset=40
                br 2 (;@4;)
              end
            end
          end
          global.get 1
          i32.eqz
          if  ;; label = @4
            local.get 2
            i32.const 0
            local.get 0
            i32.load offset=16
            memory.fill
          end
        end
        global.get 1
        i32.eqz
        if  ;; label = @3
          i32.const 66556
          local.get 9
          i32.store
          local.get 5
          i32.const 48
          i32.add
          global.set $__stack_pointer
          local.get 6
          i32.const 0
          i32.ne
          return
        end
      end
      local.get 12
      i32.const 2
      i32.eq
      i32.const 1
      global.get 1
      select
      if  ;; label = @2
        call $runtime.nilPanic
        i32.const 2
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      unreachable
    end
    local.set 4
    global.get 2
    i32.load
    local.get 4
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 4
    local.get 0
    i32.store
    local.get 4
    local.get 1
    i32.store offset=4
    local.get 4
    local.get 2
    i32.store offset=8
    local.get 4
    local.get 3
    i32.store offset=12
    local.get 4
    local.get 5
    i32.store offset=16
    local.get 4
    local.get 6
    i32.store offset=20
    local.get 4
    local.get 7
    i32.store offset=24
    local.get 4
    local.get 8
    i32.store offset=28
    local.get 4
    local.get 9
    i32.store offset=32
    local.get 4
    local.get 10
    i32.store offset=36
    local.get 4
    local.get 11
    i32.store offset=40
    local.get 4
    local.get 13
    i32.store offset=44
    local.get 4
    local.get 14
    i32.store offset=48
    local.get 4
    local.get 15
    i32.store offset=52
    global.get 2
    global.get 2
    i32.load
    i32.const 56
    i32.add
    i32.store
    i32.const 0)
  (func $runtime.hashmapBucketAddrForHash (type 3) (param i32 i32) (result i32)
    (local i32 i32)
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 2
      end
      global.get 1
      i32.const 1
      local.get 0
      select
      i32.eqz
      if  ;; label = @2
        local.get 0
        i32.load
        local.set 2
        local.get 0
        i32.load offset=16
        local.get 0
        i32.load offset=12
        i32.add
        i32.const 3
        i32.shl
        i32.const 12
        i32.add
        local.set 3
        local.get 2
        local.get 3
        local.get 1
        i32.const -1
        i32.const -1
        local.get 0
        i32.load8_u offset=20
        local.tee 0
        i32.shl
        i32.const -1
        i32.xor
        local.get 0
        i32.const 31
        i32.gt_u
        select
        i32.and
        i32.mul
        i32.add
        return
      end
      local.get 2
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        call $runtime.nilPanic
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        unreachable
      end
      unreachable
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    i32.const 0)
  (func $runtime.hashmapSet (type 8) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 80
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 5
      i32.load
      local.set 0
      local.get 5
      i32.load offset=8
      local.set 2
      local.get 5
      i32.load offset=12
      local.set 3
      local.get 5
      i32.load offset=16
      local.set 4
      local.get 5
      i32.load offset=20
      local.set 6
      local.get 5
      i32.load offset=24
      local.set 7
      local.get 5
      i32.load offset=28
      local.set 8
      local.get 5
      i32.load offset=32
      local.set 9
      local.get 5
      i32.load offset=36
      local.set 10
      local.get 5
      i32.load offset=40
      local.set 11
      local.get 5
      i32.load offset=44
      local.set 12
      local.get 5
      i32.load offset=48
      local.set 13
      local.get 5
      i32.load offset=52
      local.set 15
      local.get 5
      i32.load offset=56
      local.set 16
      local.get 5
      i32.load offset=60
      local.set 17
      local.get 5
      i32.load offset=64
      local.set 18
      local.get 5
      i32.load offset=68
      local.set 19
      local.get 5
      i32.load offset=72
      local.set 20
      local.get 5
      i32.load offset=76
      local.set 21
      local.get 5
      i32.load offset=4
      local.set 1
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 14
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        global.get $__stack_pointer
        i32.const 272
        i32.sub
        local.tee 4
        global.set $__stack_pointer
        local.get 4
        i32.const 63
        i32.store offset=12
        local.get 4
        i32.const 16
        i32.add
        i32.const 0
        i32.const 252
        memory.fill
        local.get 4
        i32.const 66556
        i32.load
        local.tee 21
        i32.store offset=8
        i32.const 66556
        local.get 4
        i32.const 8
        i32.add
        i32.store
        local.get 0
        i32.eqz
        local.set 10
      end
      block  ;; label = @2
        block  ;; label = @3
          global.get 1
          i32.eqz
          if  ;; label = @4
            local.get 10
            br_if 1 (;@3;)
            local.get 0
            i32.load8_u offset=20
            local.tee 7
            i32.const 29
            i32.gt_u
            local.set 10
          end
          block  ;; label = @4
            global.get 1
            i32.eqz
            if  ;; label = @5
              local.get 10
              br_if 1 (;@4;)
              i32.const 6
              local.get 7
              i32.shl
              local.tee 16
              local.get 0
              i32.load offset=8
              i32.ge_u
              local.tee 10
              br_if 1 (;@4;)
            end
            local.get 14
            i32.const 0
            global.get 1
            select
            i32.eqz
            if  ;; label = @5
              i32.const 40
              i32.const 61525
              call $runtime.alloc
              local.set 5
              i32.const 0
              global.get 1
              i32.const 1
              i32.eq
              br_if 4 (;@1;)
              drop
              local.get 5
              local.set 8
            end
            global.get 1
            i32.eqz
            if  ;; label = @5
              local.get 8
              local.get 0
              i32.load
              local.tee 3
              i32.store
              local.get 8
              local.get 0
              i64.load offset=4 align=4
              i64.store offset=4 align=4
              local.get 8
              local.get 0
              i64.load offset=12 align=4
              i64.store offset=12 align=4
              local.get 8
              local.get 0
              i32.load8_u offset=20
              i32.store8 offset=20
              local.get 8
              local.get 0
              i32.load offset=24
              local.tee 9
              i32.store offset=24
              local.get 8
              local.get 0
              i32.load offset=28
              local.tee 11
              i32.store offset=28
              local.get 8
              local.get 0
              i32.load offset=32
              local.tee 6
              i32.store offset=32
              local.get 8
              local.get 0
              i32.load offset=36
              local.tee 12
              i32.store offset=36
              local.get 4
              local.get 8
              i32.store offset=16
              local.get 4
              local.get 12
              i32.store offset=36
              local.get 4
              local.get 6
              i32.store offset=32
              local.get 4
              local.get 11
              i32.store offset=28
              local.get 4
              local.get 9
              i32.store offset=24
              local.get 4
              local.get 3
              i32.store offset=20
              local.get 8
              i32.const 0
              i32.store offset=8
              call $runtime.fastrand
              local.set 3
              local.get 8
              local.get 7
              i32.const 1
              i32.add
              local.tee 7
              i32.store8 offset=20
              local.get 8
              local.get 3
              i32.store offset=4
              local.get 0
              i32.load offset=12
              local.get 0
              i32.load offset=16
              i32.add
              i32.const 3
              i32.shl
              i32.const 12
              i32.add
              local.tee 10
              local.get 7
              i32.shl
              local.set 3
            end
            local.get 14
            i32.const 1
            i32.eq
            i32.const 1
            global.get 1
            select
            if  ;; label = @5
              local.get 3
              i32.const 0
              call $runtime.alloc
              local.set 5
              i32.const 1
              global.get 1
              i32.const 1
              i32.eq
              br_if 4 (;@1;)
              drop
              local.get 5
              local.set 3
            end
            global.get 1
            i32.eqz
            if  ;; label = @5
              local.get 8
              local.get 3
              i32.store
              local.get 4
              local.get 3
              i32.store offset=40
              local.get 0
              i32.load offset=12
              local.set 3
            end
            local.get 14
            i32.const 2
            i32.eq
            i32.const 1
            global.get 1
            select
            if  ;; label = @5
              local.get 3
              i32.const 0
              call $runtime.alloc
              local.set 5
              i32.const 2
              global.get 1
              i32.const 1
              i32.eq
              br_if 4 (;@1;)
              drop
              local.get 5
              local.set 11
            end
            global.get 1
            i32.eqz
            if  ;; label = @5
              local.get 4
              local.get 11
              i32.store offset=44
              local.get 0
              i32.load offset=16
              local.set 3
            end
            local.get 14
            i32.const 3
            i32.eq
            i32.const 1
            global.get 1
            select
            if  ;; label = @5
              local.get 3
              i32.const 0
              call $runtime.alloc
              local.set 5
              i32.const 3
              global.get 1
              i32.const 1
              i32.eq
              br_if 4 (;@1;)
              drop
              local.get 5
              local.set 19
            end
            global.get 1
            i32.eqz
            if  ;; label = @5
              local.get 4
              local.get 19
              i32.store offset=48
              i32.const 0
              local.set 18
              i32.const 0
              local.set 7
              i32.const 0
              local.set 13
              i32.const 0
              local.set 16
              i32.const 0
              local.set 17
              i32.const 0
              local.set 20
              i32.const 0
              local.set 10
              i32.const 0
              local.set 3
            end
            loop  ;; label = @5
              global.get 1
              i32.eqz
              if  ;; label = @6
                local.get 4
                local.get 10
                i32.store offset=52
                local.get 10
                i32.eqz
                if  ;; label = @7
                  local.get 4
                  local.get 0
                  i32.load
                  local.tee 10
                  i32.store offset=60
                  local.get 4
                  local.get 10
                  i32.store offset=56
                  local.get 0
                  i32.load8_u offset=20
                  local.set 3
                  call $runtime.fastrand
                  local.set 7
                  call $runtime.fastrand
                  local.set 9
                  local.get 4
                  local.get 10
                  local.get 7
                  i32.const 1
                  local.get 3
                  i32.shl
                  i32.const 0
                  local.get 3
                  i32.const 31
                  i32.le_u
                  select
                  local.tee 20
                  i32.const 1
                  i32.sub
                  i32.and
                  local.tee 13
                  local.get 0
                  i32.load offset=12
                  local.get 0
                  i32.load offset=16
                  i32.add
                  i32.const 3
                  i32.shl
                  i32.const 12
                  i32.add
                  i32.mul
                  i32.add
                  local.tee 3
                  i32.store offset=64
                  local.get 13
                  local.set 17
                  local.get 9
                  i32.const 7
                  i32.and
                  local.tee 7
                  local.set 16
                end
                local.get 4
                local.get 10
                i32.store offset=80
                local.get 4
                local.get 10
                i32.store offset=100
              end
              block  ;; label = @6
                loop  ;; label = @7
                  global.get 1
                  i32.eqz
                  if  ;; label = @8
                    local.get 4
                    local.get 3
                    i32.store offset=68
                    local.get 18
                    local.get 13
                    local.get 17
                    i32.eq
                    local.tee 15
                    local.get 7
                    i32.const 255
                    i32.and
                    local.tee 9
                    local.get 16
                    i32.const 255
                    i32.and
                    i32.eq
                    i32.and
                    i32.and
                    local.tee 6
                    br_if 2 (;@6;)
                    local.get 9
                    i32.const 8
                    i32.ge_u
                    if  ;; label = @9
                      local.get 3
                      i32.eqz
                      br_if 6 (;@3;)
                      local.get 4
                      local.get 3
                      i32.load offset=8
                      local.tee 3
                      i32.store offset=72
                      i32.const 0
                      local.set 7
                    end
                    local.get 4
                    local.get 3
                    i32.store offset=92
                    local.get 4
                    local.get 3
                    i32.store offset=108
                    local.get 4
                    local.get 3
                    i32.store offset=88
                    local.get 4
                    local.get 3
                    i32.store offset=76
                    local.get 3
                    i32.eqz
                    if  ;; label = @9
                      local.get 20
                      local.get 13
                      i32.const 1
                      i32.add
                      local.tee 3
                      i32.le_u
                      local.set 9
                      local.get 4
                      local.get 10
                      local.get 0
                      i32.load offset=12
                      local.get 0
                      i32.load offset=16
                      i32.add
                      i32.const 3
                      i32.shl
                      i32.const 12
                      i32.add
                      local.tee 6
                      i32.const 0
                      local.get 3
                      local.get 9
                      select
                      local.tee 13
                      i32.mul
                      i32.add
                      local.tee 3
                      i32.store offset=84
                      local.get 9
                      local.get 18
                      i32.or
                      local.set 18
                      br 2 (;@7;)
                    end
                    local.get 7
                    i32.const 255
                    i32.and
                    local.tee 6
                    local.get 3
                    i32.add
                    i32.load8_u
                    local.tee 15
                    i32.eqz
                    if  ;; label = @9
                      local.get 7
                      i32.const 1
                      i32.add
                      local.set 7
                      br 2 (;@7;)
                    end
                    local.get 4
                    local.get 0
                    i32.load offset=12
                    local.tee 9
                    local.get 6
                    i32.mul
                    local.get 3
                    i32.add
                    i32.const 12
                    i32.add
                    local.tee 12
                    i32.store offset=96
                    local.get 11
                    local.get 12
                    local.get 9
                    memory.copy
                    local.get 4
                    local.get 0
                    i32.load
                    local.tee 12
                    i32.store offset=104
                    local.get 10
                    local.get 12
                    i32.ne
                    local.set 15
                  end
                  block  ;; label = @8
                    global.get 1
                    i32.eqz
                    if  ;; label = @9
                      local.get 15
                      i32.eqz
                      if  ;; label = @10
                        local.get 9
                        i32.const 3
                        i32.shl
                        local.get 3
                        i32.add
                        local.set 15
                        local.get 4
                        local.get 15
                        local.get 0
                        i32.load offset=16
                        local.tee 9
                        local.get 6
                        i32.mul
                        i32.add
                        i32.const 12
                        i32.add
                        local.tee 6
                        i32.store offset=112
                        local.get 19
                        local.get 6
                        local.get 9
                        memory.copy
                        local.get 7
                        i32.const 1
                        i32.add
                        local.set 7
                        br 2 (;@8;)
                      end
                      local.get 4
                      local.get 0
                      i32.load offset=32
                      local.tee 12
                      i32.store offset=116
                      local.get 4
                      local.get 0
                      i32.load offset=36
                      local.tee 6
                      i32.store offset=120
                      local.get 6
                      i32.eqz
                      br_if 6 (;@3;)
                      local.get 0
                      i32.load offset=4
                      local.set 15
                      local.get 7
                      i32.const 1
                      i32.add
                      local.set 7
                    end
                    local.get 14
                    i32.const 4
                    i32.eq
                    i32.const 1
                    global.get 1
                    select
                    if  ;; label = @9
                      local.get 11
                      local.get 9
                      local.get 15
                      local.get 12
                      local.get 6
                      call_indirect (type 2)
                      local.set 5
                      i32.const 4
                      global.get 1
                      i32.const 1
                      i32.eq
                      br_if 8 (;@1;)
                      drop
                      local.get 5
                      local.set 6
                    end
                    local.get 14
                    i32.const 5
                    i32.eq
                    i32.const 1
                    global.get 1
                    select
                    if  ;; label = @9
                      local.get 0
                      local.get 11
                      local.get 19
                      local.get 6
                      call $runtime.hashmapGet
                      local.set 5
                      i32.const 5
                      global.get 1
                      i32.const 1
                      i32.eq
                      br_if 8 (;@1;)
                      drop
                      local.get 5
                      local.set 6
                    end
                    global.get 1
                    i32.eqz
                    if  ;; label = @9
                      local.get 6
                      i32.const 1
                      i32.and
                      i32.eqz
                      local.tee 6
                      br_if 2 (;@7;)
                    end
                  end
                end
                global.get 1
                i32.eqz
                if  ;; label = @7
                  local.get 4
                  local.get 8
                  i32.load offset=32
                  local.tee 6
                  i32.store offset=124
                  local.get 4
                  local.get 8
                  i32.load offset=36
                  local.tee 9
                  i32.store offset=128
                  local.get 9
                  i32.eqz
                  br_if 4 (;@3;)
                  local.get 8
                  i32.load offset=4
                  local.set 15
                  local.get 8
                  i32.load offset=12
                  local.set 12
                end
                local.get 14
                i32.const 6
                i32.eq
                i32.const 1
                global.get 1
                select
                if  ;; label = @7
                  local.get 11
                  local.get 12
                  local.get 15
                  local.get 6
                  local.get 9
                  call_indirect (type 2)
                  local.set 5
                  i32.const 6
                  global.get 1
                  i32.const 1
                  i32.eq
                  br_if 6 (;@1;)
                  drop
                  local.get 5
                  local.set 6
                end
                local.get 14
                i32.const 7
                i32.eq
                i32.const 1
                global.get 1
                select
                if  ;; label = @7
                  local.get 8
                  local.get 11
                  local.get 19
                  local.get 6
                  call $runtime.hashmapSet
                  i32.const 7
                  global.get 1
                  i32.const 1
                  i32.eq
                  br_if 6 (;@1;)
                  drop
                end
                global.get 1
                i32.eqz
                br_if 1 (;@5;)
              end
            end
            global.get 1
            i32.eqz
            if  ;; label = @5
              local.get 4
              local.get 8
              i32.load
              local.tee 9
              i32.store offset=152
              local.get 4
              local.get 8
              i32.load offset=24
              local.tee 11
              i32.store offset=156
              local.get 4
              local.get 9
              i32.store offset=132
              local.get 4
              local.get 8
              i32.load offset=28
              local.tee 6
              i32.store offset=160
              local.get 4
              local.get 11
              i32.store offset=136
              local.get 4
              local.get 8
              i32.load offset=32
              local.tee 7
              i32.store offset=164
              local.get 4
              local.get 6
              i32.store offset=140
              local.get 4
              local.get 8
              i32.load offset=36
              local.tee 3
              i32.store offset=168
              local.get 4
              local.get 7
              i32.store offset=144
              local.get 8
              i64.load offset=4 align=4
              local.set 22
              local.get 8
              i64.load offset=12 align=4
              local.set 23
              local.get 8
              i32.load8_u offset=20
              local.set 12
              local.get 0
              local.get 3
              i32.store offset=36
              local.get 0
              local.get 7
              i32.store offset=32
              local.get 0
              local.get 6
              i32.store offset=28
              local.get 0
              local.get 11
              i32.store offset=24
              local.get 0
              local.get 12
              i32.store8 offset=20
              local.get 0
              local.get 23
              i64.store offset=12 align=4
              local.get 0
              local.get 22
              i64.store offset=4 align=4
              local.get 0
              local.get 9
              i32.store
              local.get 4
              local.get 3
              i32.store offset=148
              local.get 4
              local.get 7
              i32.store offset=172
              local.get 4
              local.get 3
              i32.store offset=176
              local.get 3
              i32.eqz
              br_if 2 (;@3;)
              local.get 0
              i32.load offset=12
              local.set 16
              local.get 0
              i32.load offset=4
              local.set 10
            end
            local.get 14
            i32.const 8
            i32.eq
            i32.const 1
            global.get 1
            select
            if  ;; label = @5
              local.get 1
              local.get 16
              local.get 10
              local.get 7
              local.get 3
              call_indirect (type 2)
              local.set 5
              i32.const 8
              global.get 1
              i32.const 1
              i32.eq
              br_if 4 (;@1;)
              drop
              local.get 5
              local.set 3
            end
          end
          local.get 14
          i32.const 9
          i32.eq
          i32.const 1
          global.get 1
          select
          if  ;; label = @4
            local.get 0
            local.get 3
            call $runtime.hashmapBucketAddrForHash
            local.set 5
            i32.const 9
            global.get 1
            i32.const 1
            i32.eq
            br_if 3 (;@1;)
            drop
            local.get 5
            local.set 6
          end
          global.get 1
          i32.eqz
          if  ;; label = @4
            local.get 4
            local.get 6
            i32.store offset=180
            i32.const 1
            local.get 3
            i32.const 24
            i32.shr_u
            local.tee 10
            local.get 3
            i32.const 16777216
            i32.lt_u
            select
            local.set 8
            i32.const 0
            local.set 7
            i32.const 0
            local.set 11
            i32.const 0
            local.set 9
            i32.const 0
            local.set 3
          end
          loop  ;; label = @4
            block  ;; label = @5
              global.get 1
              i32.eqz
              if  ;; label = @6
                local.get 4
                local.get 3
                i32.store offset=196
                local.get 6
                local.set 10
                local.get 4
                local.get 6
                i32.store offset=200
                local.get 4
                local.get 7
                i32.store offset=192
                local.get 4
                local.get 11
                i32.store offset=188
                local.get 4
                local.get 9
                i32.store offset=184
                local.get 6
                i32.eqz
                br_if 1 (;@5;)
                local.get 6
                i32.const 12
                i32.add
                local.set 16
                i32.const 0
                local.set 3
              end
              loop  ;; label = @6
                block  ;; label = @7
                  global.get 1
                  i32.eqz
                  if  ;; label = @8
                    local.get 4
                    local.get 11
                    i32.store offset=208
                    local.get 4
                    local.get 7
                    i32.store offset=212
                    local.get 4
                    local.get 9
                    i32.store offset=204
                    local.get 3
                    i32.const 8
                    i32.eq
                    local.tee 17
                    br_if 1 (;@7;)
                    local.get 4
                    local.get 0
                    i32.load offset=12
                    local.tee 13
                    local.get 3
                    i32.mul
                    local.get 16
                    i32.add
                    local.tee 18
                    i32.store offset=216
                    local.get 4
                    local.get 13
                    i32.const 3
                    i32.shl
                    local.get 16
                    i32.add
                    local.get 0
                    i32.load offset=16
                    local.get 3
                    i32.mul
                    i32.add
                    local.tee 17
                    i32.store offset=220
                    local.get 4
                    local.get 7
                    local.get 18
                    local.get 3
                    local.get 10
                    i32.add
                    local.tee 6
                    i32.load8_u
                    local.get 7
                    i32.or
                    local.tee 12
                    select
                    local.tee 7
                    i32.store offset=232
                    local.get 4
                    local.get 9
                    local.get 6
                    local.get 12
                    select
                    local.tee 9
                    i32.store offset=224
                    local.get 4
                    local.get 11
                    local.get 17
                    local.get 12
                    select
                    local.tee 11
                    i32.store offset=228
                    local.get 8
                    local.get 6
                    i32.load8_u
                    i32.ne
                    local.set 6
                  end
                  block  ;; label = @8
                    global.get 1
                    i32.eqz
                    if  ;; label = @9
                      local.get 6
                      br_if 1 (;@8;)
                      local.get 4
                      local.get 0
                      i32.load offset=24
                      local.tee 12
                      i32.store offset=236
                      local.get 4
                      local.get 0
                      i32.load offset=28
                      local.tee 6
                      i32.store offset=240
                      local.get 6
                      i32.eqz
                      br_if 6 (;@3;)
                    end
                    local.get 14
                    i32.const 10
                    i32.eq
                    i32.const 1
                    global.get 1
                    select
                    if  ;; label = @9
                      local.get 1
                      local.get 18
                      local.get 13
                      local.get 12
                      local.get 6
                      call_indirect (type 2)
                      local.set 5
                      i32.const 10
                      global.get 1
                      i32.const 1
                      i32.eq
                      br_if 8 (;@1;)
                      drop
                      local.get 5
                      local.set 13
                    end
                    global.get 1
                    i32.eqz
                    if  ;; label = @9
                      local.get 13
                      i32.const 1
                      i32.and
                      i32.eqz
                      local.tee 13
                      br_if 1 (;@8;)
                      local.get 17
                      local.get 2
                      local.get 0
                      i32.load offset=16
                      memory.copy
                      br 7 (;@2;)
                    end
                  end
                  global.get 1
                  i32.eqz
                  if  ;; label = @8
                    local.get 3
                    i32.const 1
                    i32.add
                    local.set 3
                    br 2 (;@6;)
                  end
                end
              end
              global.get 1
              i32.eqz
              if  ;; label = @6
                local.get 4
                local.get 10
                i32.load offset=8
                local.tee 6
                i32.store offset=244
                local.get 10
                local.set 3
                br 2 (;@4;)
              end
            end
          end
          block  ;; label = @4
            global.get 1
            i32.eqz
            if  ;; label = @5
              local.get 7
              br_if 1 (;@4;)
              local.get 0
              i32.load offset=12
              local.get 0
              i32.load offset=16
              i32.add
              i32.const 3
              i32.shl
              i32.const 12
              i32.add
              local.set 10
            end
            local.get 14
            i32.const 11
            i32.eq
            i32.const 1
            global.get 1
            select
            if  ;; label = @5
              local.get 10
              i32.const 0
              call $runtime.alloc
              local.set 5
              i32.const 11
              global.get 1
              i32.const 1
              i32.eq
              br_if 4 (;@1;)
              drop
              local.get 5
              local.set 7
            end
            global.get 1
            i32.eqz
            if  ;; label = @5
              local.get 0
              local.get 0
              i32.load offset=8
              i32.const 1
              i32.add
              i32.store offset=8
              local.get 4
              local.get 7
              i32.store offset=252
              local.get 4
              local.get 7
              i32.store offset=264
              local.get 4
              local.get 7
              i32.store offset=248
              local.get 4
              local.get 7
              i32.const 12
              i32.add
              local.tee 9
              i32.store offset=256
              local.get 4
              local.get 9
              local.get 0
              i32.load offset=12
              local.tee 11
              i32.const 3
              i32.shl
              i32.add
              local.tee 6
              i32.store offset=260
              local.get 9
              local.get 1
              local.get 11
              memory.copy
              local.get 6
              local.get 2
              local.get 0
              i32.load offset=16
              memory.copy
              local.get 7
              local.get 8
              i32.store8
              local.get 3
              i32.eqz
              br_if 2 (;@3;)
              local.get 3
              local.get 7
              i32.store offset=8
              br 3 (;@2;)
            end
          end
          global.get 1
          i32.eqz
          if  ;; label = @4
            local.get 0
            local.get 0
            i32.load offset=8
            i32.const 1
            i32.add
            i32.store offset=8
            local.get 7
            local.get 1
            local.get 0
            i32.load offset=12
            memory.copy
            local.get 11
            local.get 2
            local.get 0
            i32.load offset=16
            memory.copy
            local.get 9
            i32.eqz
            br_if 1 (;@3;)
            local.get 9
            local.get 8
            i32.store8
            br 2 (;@2;)
          end
        end
        local.get 14
        i32.const 12
        i32.eq
        i32.const 1
        global.get 1
        select
        if  ;; label = @3
          call $runtime.nilPanic
          i32.const 12
          global.get 1
          i32.const 1
          i32.eq
          br_if 2 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if  ;; label = @3
          unreachable
        end
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        i32.const 66556
        local.get 21
        i32.store
        local.get 4
        i32.const 272
        i32.add
        global.set $__stack_pointer
      end
      return
    end
    local.set 5
    global.get 2
    i32.load
    local.get 5
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 5
    local.get 0
    i32.store
    local.get 5
    local.get 1
    i32.store offset=4
    local.get 5
    local.get 2
    i32.store offset=8
    local.get 5
    local.get 3
    i32.store offset=12
    local.get 5
    local.get 4
    i32.store offset=16
    local.get 5
    local.get 6
    i32.store offset=20
    local.get 5
    local.get 7
    i32.store offset=24
    local.get 5
    local.get 8
    i32.store offset=28
    local.get 5
    local.get 9
    i32.store offset=32
    local.get 5
    local.get 10
    i32.store offset=36
    local.get 5
    local.get 11
    i32.store offset=40
    local.get 5
    local.get 12
    i32.store offset=44
    local.get 5
    local.get 13
    i32.store offset=48
    local.get 5
    local.get 15
    i32.store offset=52
    local.get 5
    local.get 16
    i32.store offset=56
    local.get 5
    local.get 17
    i32.store offset=60
    local.get 5
    local.get 18
    i32.store offset=64
    local.get 5
    local.get 19
    i32.store offset=68
    local.get 5
    local.get 20
    i32.store offset=72
    local.get 5
    local.get 21
    i32.store offset=76
    global.get 2
    global.get 2
    i32.load
    i32.const 80
    i32.add
    i32.store)
  (func $runtime.fastrand (type 5) (result i32)
    (local i32)
    i32.const 65752
    i32.const 65752
    i32.load
    local.tee 0
    i32.const 7
    i32.shl
    local.get 0
    i32.xor
    local.tee 0
    i32.const 1
    i32.shr_u
    local.get 0
    i32.xor
    local.tee 0
    i32.const 9
    i32.shl
    local.get 0
    i32.xor
    local.tee 0
    i32.store
    local.get 0)
  (func $malloc.command_export (type 6) (param i32) (result i32)
    (local i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.sub
      i32.store
      global.get 2
      i32.load
      i32.load
      local.set 0
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32)  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        i32.const 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        local.get 0
        call $malloc
        local.set 1
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 1
        local.set 0
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        call $__wasm_call_dtors
        local.get 0
        return
      end
      unreachable
    end
    local.set 1
    global.get 2
    i32.load
    local.get 1
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    i32.const 0)
  (func $free.command_export (type 0) (param i32)
    (local i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.sub
      i32.store
      global.get 2
      i32.load
      i32.load
      local.set 0
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32)  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        i32.const 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        local.get 0
        call $free
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        call $__wasm_call_dtors
      end
      return
    end
    local.set 1
    global.get 2
    i32.load
    local.get 1
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $calloc.command_export (type 3) (param i32 i32) (result i32)
    (local i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 8
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 1
      i32.load
      local.set 0
      local.get 1
      i32.load offset=4
      local.set 1
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32)  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        i32.const 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        local.get 0
        local.get 1
        call $calloc
        local.set 2
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 2
        local.set 0
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        call $__wasm_call_dtors
        local.get 0
        return
      end
      unreachable
    end
    local.set 2
    global.get 2
    i32.load
    local.get 2
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 2
    local.get 0
    i32.store
    local.get 2
    local.get 1
    i32.store offset=4
    global.get 2
    global.get 2
    i32.load
    i32.const 8
    i32.add
    i32.store
    i32.const 0)
  (func $realloc.command_export (type 3) (param i32 i32) (result i32)
    (local i32)
    global.get 1
    i32.const 2
    i32.eq
    if  ;; label = @1
      global.get 2
      global.get 2
      i32.load
      i32.const 8
      i32.sub
      i32.store
      global.get 2
      i32.load
      local.tee 1
      i32.load
      local.set 0
      local.get 1
      i32.load offset=4
      local.set 1
    end
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32)  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        i32.const 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        local.get 0
        local.get 1
        call $realloc
        local.set 2
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 2
        local.set 0
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        call $__wasm_call_dtors
        local.get 0
        return
      end
      unreachable
    end
    local.set 2
    global.get 2
    i32.load
    local.get 2
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store
    global.get 2
    i32.load
    local.tee 2
    local.get 0
    i32.store
    local.get 2
    local.get 1
    i32.store offset=4
    global.get 2
    global.get 2
    i32.load
    i32.const 8
    i32.add
    i32.store
    i32.const 0)
  (func $resume.command_export (type 1)
    (local i32)
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32)  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        i32.const 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        call $resume
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        call $__wasm_call_dtors
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $go_scheduler.command_export (type 1)
    (local i32)
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32)  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        i32.const 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        call $go_scheduler
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        call $__wasm_call_dtors
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $_start.command_export (type 1)
    (local i32)
    block (result i32)  ;; label = @1
      global.get 1
      i32.const 2
      i32.eq
      if (result i32)  ;; label = @2
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
      else
        i32.const 0
      end
      i32.const 0
      global.get 1
      select
      i32.eqz
      if  ;; label = @2
        call $_start
        i32.const 0
        global.get 1
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      global.get 1
      i32.eqz
      if  ;; label = @2
        call $__wasm_call_dtors
      end
      return
    end
    local.set 0
    global.get 2
    i32.load
    local.get 0
    i32.store
    global.get 2
    global.get 2
    i32.load
    i32.const 4
    i32.add
    i32.store)
  (func $asyncify_start_unwind (type 0) (param i32)
    i32.const 1
    global.set 1
    local.get 0
    global.set 2
    global.get 2
    i32.load
    global.get 2
    i32.load offset=4
    i32.gt_u
    if  ;; label = @1
      unreachable
    end)
  (func $asyncify_stop_unwind (type 1)
    i32.const 0
    global.set 1
    global.get 2
    i32.load
    global.get 2
    i32.load offset=4
    i32.gt_u
    if  ;; label = @1
      unreachable
    end)
  (func $asyncify_start_rewind (type 0) (param i32)
    i32.const 2
    global.set 1
    local.get 0
    global.set 2
    global.get 2
    i32.load
    global.get 2
    i32.load offset=4
    i32.gt_u
    if  ;; label = @1
      unreachable
    end)
  (func $asyncify_stop_rewind (type 1)
    i32.const 0
    global.set 1
    global.get 2
    i32.load
    global.get 2
    i32.load offset=4
    i32.gt_u
    if  ;; label = @1
      unreachable
    end)
  (func $asyncify_get_state (type 5) (result i32)
    global.get 1)
  (table (;0;) 5 5 funcref)
  (memory (;0;) 2)
  (global $__stack_pointer (mut i32) (i32.const 65536))
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (export "memory" (memory 0))
  (export "malloc" (func $malloc.command_export))
  (export "free" (func $free.command_export))
  (export "calloc" (func $calloc.command_export))
  (export "realloc" (func $realloc.command_export))
  (export "resume" (func $resume.command_export))
  (export "go_scheduler" (func $go_scheduler.command_export))
  (export "_start" (func $_start.command_export))
  (export "asyncify_start_unwind" (func $asyncify_start_unwind))
  (export "asyncify_stop_unwind" (func $asyncify_stop_unwind))
  (export "asyncify_start_rewind" (func $asyncify_start_rewind))
  (export "asyncify_stop_rewind" (func $asyncify_stop_rewind))
  (export "asyncify_get_state" (func $asyncify_get_state))
  (elem (;0;) (i32.const 1) func $runtime.resume$1$gowrapper $runtime.run$1$gowrapper $runtime.memequal $runtime.hash32)
  (data $.rodata (i32.const 65536) "expand 32-byte kstack overflowfree: invalid pointer\00\00\00\00\00\1e\00\01\00\15\00\00\00realloc: invalid pointer@\00\01\00\18\00\00\00out of memorypanic: panic: runtime error: nil pointer dereferenceindex out of rangeslice out of rangeunreachable\c5\00\01\00\0b")
  (data $.data (i32.const 65752) "\c1\82\01\00L\03\01\00\00\00\00\00\10\04\01\00\c1\82\01\00\00\00\00\00\04\00\00\00\0c\00\00\00\01\00\00\00\00\00\00\00\03\00\00\00\00\00\00\00\04"))
