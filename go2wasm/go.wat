(module $main
  (type (;0;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32)))
  (type (;3;) (func (param i32 i32)))
  (type (;4;) (func (param i32) (result i32)))
  (type (;5;) (func (result i32)))
  (type (;6;) (func))
  (type (;7;) (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)))
  (type (;8;) (func (param i32 i32 i32 i32)))
  (type (;9;) (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)))
  (import "wasi_snapshot_preview1" "random_get" (func $__imported_wasi_snapshot_preview1_random_get (type 1)))
  (func $chacha20_rng (type 2) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const -64
    i32.add
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 56
    i32.add
    i64.const 0
    i64.store
    local.get 1
    i32.const 24
    i32.add
    i32.const 65620
    i64.load align=1
    i64.store
    local.get 1
    i32.const 32
    i32.add
    i32.const 65628
    i64.load align=1
    i64.store
    local.get 1
    i32.const 40
    i32.add
    i32.const 65636
    i64.load align=1
    i64.store
    local.get 1
    i64.const 0
    i64.store offset=48
    local.get 1
    i32.const 65544
    i64.load
    i64.store offset=8
    local.get 1
    i32.const 65536
    i64.load
    i64.store
    local.get 1
    i32.const 65612
    i64.load align=1
    i64.store offset=16
    local.get 0
    local.get 1
    call $chacha20_update
    i32.const 65636
    local.get 0
    i32.const 24
    i32.add
    i64.load align=1
    i64.store align=1
    i32.const 65628
    local.get 0
    i32.const 16
    i32.add
    i64.load align=1
    i64.store align=1
    i32.const 65620
    local.get 0
    i32.const 8
    i32.add
    i64.load align=1
    i64.store align=1
    i32.const 65612
    local.get 0
    i64.load align=1
    i64.store align=1
    local.get 0
    local.get 1
    call $chacha20_update
    local.get 0
    i32.const -64
    i32.sub
    local.get 1
    call $chacha20_update
    local.get 0
    i32.const 128
    i32.add
    local.get 1
    call $chacha20_update
    local.get 0
    i32.const 192
    i32.add
    local.get 1
    call $chacha20_update
    local.get 0
    i32.const 256
    i32.add
    local.get 1
    call $chacha20_update
    local.get 0
    i32.const 320
    i32.add
    local.get 1
    call $chacha20_update
    local.get 0
    i32.const 384
    i32.add
    local.get 1
    call $chacha20_update
    local.get 0
    i32.const 448
    i32.add
    local.get 1
    call $chacha20_update
    local.get 1
    i32.const -64
    i32.sub
    global.set $__stack_pointer)
  (func $chacha20_update (type 3) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    i32.const -2
    local.set 19
    local.get 1
    i32.load offset=16
    local.tee 20
    local.set 7
    local.get 1
    i32.load
    local.tee 21
    local.set 5
    local.get 1
    i32.load offset=48
    local.tee 22
    local.set 6
    local.get 1
    i32.load offset=32
    local.tee 23
    local.set 8
    local.get 1
    i32.load offset=20
    local.tee 24
    local.set 2
    local.get 1
    i32.load offset=4
    local.tee 25
    local.set 9
    local.get 1
    i32.load offset=52
    local.tee 26
    local.set 11
    local.get 1
    i32.load offset=36
    local.tee 27
    local.set 15
    local.get 1
    i32.load offset=24
    local.tee 28
    local.set 3
    local.get 1
    i32.load offset=8
    local.tee 29
    local.set 12
    local.get 1
    i32.load offset=56
    local.tee 30
    local.set 16
    local.get 1
    i32.load offset=40
    local.tee 31
    local.set 10
    local.get 1
    i32.load offset=28
    local.tee 32
    local.set 4
    local.get 1
    i32.load offset=12
    local.tee 33
    local.set 17
    local.get 1
    i32.load offset=60
    local.tee 34
    local.set 13
    local.get 1
    i32.load offset=44
    local.tee 35
    local.set 14
    loop  ;; label = @1
      local.get 4
      local.get 13
      local.get 4
      local.get 17
      i32.add
      local.tee 4
      i32.xor
      i32.const 16
      i32.rotl
      local.tee 13
      local.get 14
      i32.add
      local.tee 14
      i32.xor
      i32.const 12
      i32.rotl
      local.tee 18
      local.get 4
      i32.add
      local.tee 4
      local.get 7
      local.get 6
      local.get 5
      local.get 7
      i32.add
      local.tee 7
      i32.xor
      i32.const 16
      i32.rotl
      local.tee 5
      local.get 8
      i32.add
      local.tee 6
      i32.xor
      i32.const 12
      i32.rotl
      local.tee 8
      local.get 7
      i32.add
      local.tee 36
      local.get 5
      i32.xor
      i32.const 8
      i32.rotl
      local.tee 5
      local.get 6
      i32.add
      local.tee 6
      local.get 8
      i32.xor
      i32.const 7
      i32.rotl
      local.tee 7
      i32.add
      local.tee 8
      local.get 3
      local.get 16
      local.get 3
      local.get 12
      i32.add
      local.tee 3
      i32.xor
      i32.const 16
      i32.rotl
      local.tee 12
      local.get 10
      i32.add
      local.tee 10
      i32.xor
      i32.const 12
      i32.rotl
      local.tee 37
      local.get 3
      i32.add
      local.tee 3
      local.get 12
      i32.xor
      i32.const 8
      i32.rotl
      local.tee 38
      i32.xor
      i32.const 16
      i32.rotl
      local.tee 12
      local.get 2
      local.get 11
      local.get 2
      local.get 9
      i32.add
      local.tee 2
      i32.xor
      i32.const 16
      i32.rotl
      local.tee 9
      local.get 15
      i32.add
      local.tee 11
      i32.xor
      i32.const 12
      i32.rotl
      local.tee 39
      local.get 2
      i32.add
      local.tee 2
      local.get 9
      i32.xor
      i32.const 8
      i32.rotl
      local.tee 9
      local.get 11
      i32.add
      local.tee 40
      i32.add
      local.tee 11
      local.get 7
      i32.xor
      i32.const 12
      i32.rotl
      local.tee 7
      local.get 8
      i32.add
      local.tee 17
      local.get 12
      i32.xor
      i32.const 8
      i32.rotl
      local.tee 16
      local.get 11
      i32.add
      local.tee 15
      local.get 7
      i32.xor
      i32.const 7
      i32.rotl
      local.set 7
      local.get 6
      local.get 3
      local.get 4
      local.get 13
      i32.xor
      i32.const 8
      i32.rotl
      local.tee 13
      local.get 14
      i32.add
      local.tee 3
      local.get 18
      i32.xor
      i32.const 7
      i32.rotl
      local.tee 4
      i32.add
      local.tee 6
      local.get 9
      i32.xor
      i32.const 16
      i32.rotl
      local.tee 8
      i32.add
      local.tee 9
      local.get 4
      i32.xor
      i32.const 12
      i32.rotl
      local.tee 4
      local.get 6
      i32.add
      local.tee 12
      local.get 8
      i32.xor
      i32.const 8
      i32.rotl
      local.tee 11
      local.get 9
      i32.add
      local.tee 8
      local.get 4
      i32.xor
      i32.const 7
      i32.rotl
      local.set 4
      local.get 3
      local.get 5
      local.get 2
      local.get 10
      local.get 38
      i32.add
      local.tee 2
      local.get 37
      i32.xor
      i32.const 7
      i32.rotl
      local.tee 3
      i32.add
      local.tee 5
      i32.xor
      i32.const 16
      i32.rotl
      local.tee 6
      i32.add
      local.tee 10
      local.get 3
      i32.xor
      i32.const 12
      i32.rotl
      local.tee 3
      local.get 5
      i32.add
      local.tee 9
      local.get 6
      i32.xor
      i32.const 8
      i32.rotl
      local.tee 6
      local.get 10
      i32.add
      local.tee 14
      local.get 3
      i32.xor
      i32.const 7
      i32.rotl
      local.set 3
      local.get 2
      local.get 13
      local.get 39
      local.get 40
      i32.xor
      i32.const 7
      i32.rotl
      local.tee 2
      local.get 36
      i32.add
      local.tee 5
      i32.xor
      i32.const 16
      i32.rotl
      local.tee 10
      i32.add
      local.tee 18
      local.get 2
      i32.xor
      i32.const 12
      i32.rotl
      local.tee 2
      local.get 5
      i32.add
      local.tee 5
      local.get 10
      i32.xor
      i32.const 8
      i32.rotl
      local.tee 13
      local.get 18
      i32.add
      local.tee 10
      local.get 2
      i32.xor
      i32.const 7
      i32.rotl
      local.set 2
      local.get 19
      i32.const 2
      i32.add
      local.tee 19
      i32.const 18
      i32.lt_u
      br_if 0 (;@1;)
    end
    local.get 1
    local.get 6
    i32.store offset=48
    local.get 1
    local.get 5
    i32.store
    local.get 1
    local.get 7
    i32.store offset=16
    local.get 1
    local.get 8
    i32.store offset=32
    local.get 1
    local.get 2
    i32.store offset=20
    local.get 1
    local.get 11
    i32.store offset=52
    local.get 1
    local.get 9
    i32.store offset=4
    local.get 1
    local.get 15
    i32.store offset=36
    local.get 1
    local.get 3
    i32.store offset=24
    local.get 1
    local.get 16
    i32.store offset=56
    local.get 1
    local.get 12
    i32.store offset=8
    local.get 1
    local.get 10
    i32.store offset=40
    local.get 1
    local.get 4
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
    local.get 34
    i32.add
    i32.store offset=60 align=1
    local.get 0
    local.get 16
    local.get 30
    i32.add
    i32.store offset=56 align=1
    local.get 0
    local.get 11
    local.get 26
    i32.add
    i32.store offset=52 align=1
    local.get 0
    local.get 6
    local.get 22
    i32.add
    i32.store offset=48 align=1
    local.get 0
    local.get 14
    local.get 35
    i32.add
    i32.store offset=44 align=1
    local.get 0
    local.get 10
    local.get 31
    i32.add
    i32.store offset=40 align=1
    local.get 0
    local.get 15
    local.get 27
    i32.add
    i32.store offset=36 align=1
    local.get 0
    local.get 8
    local.get 23
    i32.add
    i32.store offset=32 align=1
    local.get 0
    local.get 4
    local.get 32
    i32.add
    i32.store offset=28 align=1
    local.get 0
    local.get 3
    local.get 28
    i32.add
    i32.store offset=24 align=1
    local.get 0
    local.get 2
    local.get 24
    i32.add
    i32.store offset=20 align=1
    local.get 0
    local.get 7
    local.get 20
    i32.add
    i32.store offset=16 align=1
    local.get 0
    local.get 17
    local.get 33
    i32.add
    i32.store offset=12 align=1
    local.get 0
    local.get 12
    local.get 29
    i32.add
    i32.store offset=8 align=1
    local.get 0
    local.get 9
    local.get 25
    i32.add
    i32.store offset=4 align=1
    local.get 0
    local.get 5
    local.get 21
    i32.add
    i32.store align=1
    local.get 1
    local.get 1
    i32.load offset=48
    i32.const 1
    i32.add
    i32.store offset=48)
  (func $arc4random (type 5) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 8
    global.set $__stack_pointer
    local.get 8
    i32.const 12
    i32.add
    local.set 10
    i32.const 4
    local.set 6
    i32.const 65604
    i32.load
    i32.eqz
    if  ;; label = @1
      i32.const 65612
      i32.const 32
      call $__imported_wasi_snapshot_preview1_random_get
      i32.const 65535
      i32.and
      local.tee 0
      if  ;; label = @2
        i32.const 65600
        local.get 0
        i32.store
      end
      i32.const 65604
      i64.const 2199023255553
      i64.store align=4
    end
    i32.const 65608
    i32.load
    local.set 0
    loop  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 512
        i32.eq
        if  ;; label = @3
          local.get 6
          i32.const 512
          i32.ge_u
          if  ;; label = @4
            loop  ;; label = @5
              local.get 7
              local.get 10
              i32.add
              call $chacha20_rng
              local.get 7
              i32.const 512
              i32.add
              local.set 7
              local.get 6
              i32.const 512
              i32.sub
              local.tee 6
              i32.const 511
              i32.gt_u
              br_if 0 (;@5;)
            end
          end
          local.get 6
          i32.eqz
          br_if 1 (;@2;)
          i32.const 65644
          call $chacha20_rng
          i32.const 65608
          i32.const 0
          i32.store
          i32.const 0
          local.set 0
        end
        local.get 7
        local.get 10
        i32.add
        local.set 4
        local.get 0
        i32.const 65644
        i32.add
        local.set 2
        block  ;; label = @3
          block (result i32)  ;; label = @4
            block  ;; label = @5
              local.get 6
              i32.const 512
              local.get 0
              i32.sub
              local.tee 0
              local.get 0
              local.get 6
              i32.gt_u
              select
              local.tee 5
              local.tee 3
              i32.const 32
              i32.le_u
              if  ;; label = @6
                local.get 2
                i32.const 3
                i32.and
                i32.eqz
                local.get 3
                i32.eqz
                i32.or
                br_if 1 (;@5;)
                local.get 4
                local.get 2
                i32.load8_u
                i32.store8
                local.get 4
                i32.const 1
                i32.add
                local.get 2
                i32.const 1
                i32.add
                local.tee 1
                i32.const 3
                i32.and
                i32.eqz
                local.get 3
                i32.const 1
                i32.sub
                local.tee 0
                i32.eqz
                i32.or
                br_if 2 (;@4;)
                drop
                local.get 4
                local.get 2
                i32.load8_u offset=1
                i32.store8 offset=1
                local.get 4
                i32.const 2
                i32.add
                local.get 2
                i32.const 2
                i32.add
                local.tee 1
                i32.const 3
                i32.and
                i32.eqz
                local.get 3
                i32.const 2
                i32.sub
                local.tee 0
                i32.eqz
                i32.or
                br_if 2 (;@4;)
                drop
                local.get 4
                local.get 2
                i32.load8_u offset=2
                i32.store8 offset=2
                local.get 4
                i32.const 3
                i32.add
                local.get 2
                i32.const 3
                i32.add
                local.tee 1
                i32.const 3
                i32.and
                i32.eqz
                local.get 3
                i32.const 3
                i32.sub
                local.tee 0
                i32.eqz
                i32.or
                br_if 2 (;@4;)
                drop
                local.get 4
                local.get 2
                i32.load8_u offset=3
                i32.store8 offset=3
                local.get 3
                i32.const 4
                i32.sub
                local.set 0
                local.get 2
                i32.const 4
                i32.add
                local.set 1
                local.get 4
                i32.const 4
                i32.add
                br 2 (;@4;)
              end
              local.get 4
              local.get 2
              local.get 3
              memory.copy
              br 2 (;@3;)
            end
            local.get 3
            local.set 0
            local.get 2
            local.set 1
            local.get 4
          end
          local.tee 3
          i32.const 3
          i32.and
          local.tee 2
          i32.eqz
          if  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const 16
              i32.lt_u
              if  ;; label = @6
                local.get 0
                local.set 2
                br 1 (;@5;)
              end
              local.get 0
              i32.const 16
              i32.sub
              local.tee 2
              i32.const 16
              i32.and
              i32.eqz
              if  ;; label = @6
                local.get 3
                local.get 1
                i64.load align=4
                i64.store align=4
                local.get 3
                local.get 1
                i64.load offset=8 align=4
                i64.store offset=8 align=4
                local.get 1
                i32.const 16
                i32.add
                local.set 1
                local.get 3
                i32.const 16
                i32.add
                local.set 3
                local.get 2
                local.set 0
              end
              local.get 2
              i32.const 16
              i32.lt_u
              br_if 0 (;@5;)
              local.get 0
              local.set 2
              loop  ;; label = @6
                local.get 3
                local.get 1
                i64.load align=4
                i64.store align=4
                local.get 3
                local.get 1
                i64.load offset=8 align=4
                i64.store offset=8 align=4
                local.get 3
                local.get 1
                i64.load offset=16 align=4
                i64.store offset=16 align=4
                local.get 3
                local.get 1
                i64.load offset=24 align=4
                i64.store offset=24 align=4
                local.get 3
                i32.const 32
                i32.add
                local.set 3
                local.get 1
                i32.const 32
                i32.add
                local.set 1
                local.get 2
                i32.const 32
                i32.sub
                local.tee 2
                i32.const 15
                i32.gt_u
                br_if 0 (;@6;)
              end
            end
            local.get 2
            i32.const 8
            i32.ge_u
            if  ;; label = @5
              local.get 3
              local.get 1
              i64.load align=4
              i64.store align=4
              local.get 3
              i32.const 8
              i32.add
              local.set 3
              local.get 1
              i32.const 8
              i32.add
              local.set 1
            end
            local.get 2
            i32.const 4
            i32.and
            if  ;; label = @5
              local.get 3
              local.get 1
              i32.load
              i32.store
              local.get 3
              i32.const 4
              i32.add
              local.set 3
              local.get 1
              i32.const 4
              i32.add
              local.set 1
            end
            local.get 2
            i32.const 2
            i32.and
            if  ;; label = @5
              local.get 3
              local.get 1
              i32.load16_u align=1
              i32.store16 align=1
              local.get 3
              i32.const 2
              i32.add
              local.set 3
              local.get 1
              i32.const 2
              i32.add
              local.set 1
            end
            local.get 2
            i32.const 1
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 3
            local.get 1
            i32.load8_u
            i32.store8
            br 1 (;@3;)
          end
          block  ;; label = @4
            block  ;; label = @5
              block (result i32)  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.const 32
                  i32.ge_u
                  if  ;; label = @8
                    local.get 3
                    local.get 1
                    i32.load
                    local.tee 0
                    i32.store8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 2
                        i32.const 2
                        i32.sub
                        br_table 0 (;@10;) 1 (;@9;) 3 (;@7;)
                      end
                      local.get 3
                      local.get 0
                      i32.const 8
                      i32.shr_u
                      i32.store8 offset=1
                      local.get 3
                      local.get 1
                      i32.const 6
                      i32.add
                      i64.load align=2
                      i64.store offset=6 align=4
                      local.get 3
                      local.get 1
                      i32.load offset=4
                      i32.const 16
                      i32.shl
                      local.get 0
                      i32.const 16
                      i32.shr_u
                      i32.or
                      i32.store offset=2
                      local.get 1
                      i32.const 18
                      i32.add
                      local.set 4
                      i32.const 14
                      local.set 9
                      local.get 1
                      i32.const 14
                      i32.add
                      i32.load align=2
                      local.set 1
                      i32.const 14
                      local.set 0
                      local.get 3
                      i32.const 18
                      i32.add
                      br 3 (;@6;)
                    end
                    local.get 3
                    local.get 1
                    i32.const 5
                    i32.add
                    i64.load align=1
                    i64.store offset=5 align=4
                    local.get 3
                    local.get 1
                    i32.load offset=4
                    i32.const 24
                    i32.shl
                    local.get 0
                    i32.const 8
                    i32.shr_u
                    i32.or
                    i32.store offset=1
                    local.get 1
                    i32.const 17
                    i32.add
                    local.set 4
                    i32.const 13
                    local.set 9
                    local.get 1
                    i32.const 13
                    i32.add
                    i32.load align=1
                    local.set 1
                    i32.const 15
                    local.set 0
                    local.get 3
                    i32.const 17
                    i32.add
                    br 2 (;@6;)
                  end
                  block (result i32)  ;; label = @8
                    local.get 0
                    i32.const 16
                    i32.lt_u
                    if  ;; label = @9
                      local.get 3
                      local.set 2
                      local.get 1
                      br 1 (;@8;)
                    end
                    local.get 3
                    local.get 1
                    i32.load8_u
                    i32.store8
                    local.get 3
                    local.get 1
                    i32.load offset=1 align=1
                    i32.store offset=1 align=1
                    local.get 3
                    local.get 1
                    i64.load offset=5 align=1
                    i64.store offset=5 align=1
                    local.get 3
                    local.get 1
                    i32.load16_u offset=13 align=1
                    i32.store16 offset=13 align=1
                    local.get 3
                    local.get 1
                    i32.load8_u offset=15
                    i32.store8 offset=15
                    local.get 3
                    i32.const 16
                    i32.add
                    local.set 2
                    local.get 1
                    i32.const 16
                    i32.add
                  end
                  local.set 4
                  local.get 0
                  i32.const 8
                  i32.and
                  br_if 2 (;@5;)
                  br 3 (;@4;)
                end
                local.get 3
                local.get 0
                i32.const 16
                i32.shr_u
                i32.store8 offset=2
                local.get 3
                local.get 0
                i32.const 8
                i32.shr_u
                i32.store8 offset=1
                local.get 3
                local.get 1
                i32.const 7
                i32.add
                i64.load align=1
                i64.store offset=7 align=4
                local.get 3
                local.get 1
                i32.load offset=4
                i32.const 8
                i32.shl
                local.get 0
                i32.const 24
                i32.shr_u
                i32.or
                i32.store offset=3
                local.get 1
                i32.const 19
                i32.add
                local.set 4
                i32.const 15
                local.set 9
                local.get 1
                i32.const 15
                i32.add
                i32.load align=1
                local.set 1
                i32.const 13
                local.set 0
                local.get 3
                i32.const 19
                i32.add
              end
              local.set 2
              local.get 3
              local.get 9
              i32.add
              local.get 1
              i32.store
            end
            local.get 2
            local.get 4
            i64.load align=1
            i64.store align=1
            local.get 2
            i32.const 8
            i32.add
            local.set 2
            local.get 4
            i32.const 8
            i32.add
            local.set 4
          end
          local.get 0
          i32.const 4
          i32.and
          if  ;; label = @4
            local.get 2
            local.get 4
            i32.load align=1
            i32.store align=1
            local.get 4
            i32.const 4
            i32.add
            local.set 4
            local.get 2
            i32.const 4
            i32.add
            local.set 2
          end
          local.get 0
          i32.const 2
          i32.and
          if  ;; label = @4
            local.get 2
            local.get 4
            i32.load16_u align=1
            i32.store16 align=1
            local.get 4
            i32.const 2
            i32.add
            local.set 4
            local.get 2
            i32.const 2
            i32.add
            local.set 2
          end
          local.get 0
          i32.const 1
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 4
          i32.load8_u
          i32.store8
        end
        i32.const 65608
        i32.load
        i32.const 65644
        i32.add
        local.set 0
        block  ;; label = @3
          local.get 5
          i32.const 33
          i32.ge_u
          if  ;; label = @4
            local.get 0
            i32.const 0
            local.get 5
            memory.fill
            br 1 (;@3;)
          end
          block  ;; label = @4
            local.get 5
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.const 0
            i32.store8
            local.get 0
            local.get 5
            i32.add
            local.tee 2
            i32.const 1
            i32.sub
            i32.const 0
            i32.store8
            local.get 5
            i32.const 3
            i32.lt_u
            br_if 0 (;@4;)
            local.get 0
            i32.const 0
            i32.store8 offset=2
            local.get 0
            i32.const 0
            i32.store8 offset=1
            local.get 2
            i32.const 3
            i32.sub
            i32.const 0
            i32.store8
            local.get 2
            i32.const 2
            i32.sub
            i32.const 0
            i32.store8
            local.get 5
            i32.const 7
            i32.lt_u
            br_if 0 (;@4;)
            local.get 0
            i32.const 0
            i32.store8 offset=3
            local.get 2
            i32.const 4
            i32.sub
            i32.const 0
            i32.store8
            local.get 5
            i32.const 9
            i32.lt_u
            br_if 0 (;@4;)
            local.get 0
            i32.const 0
            local.get 0
            i32.sub
            i32.const 3
            i32.and
            local.tee 2
            i32.add
            local.tee 0
            i32.const 0
            i32.store
            local.get 0
            local.get 5
            local.get 2
            i32.sub
            i32.const 60
            i32.and
            local.tee 1
            i32.add
            local.tee 2
            i32.const 4
            i32.sub
            i32.const 0
            i32.store
            local.get 1
            i32.const 9
            i32.lt_u
            br_if 0 (;@4;)
            local.get 0
            i32.const 0
            i32.store offset=8
            local.get 0
            i32.const 0
            i32.store offset=4
            local.get 2
            i32.const 8
            i32.sub
            i32.const 0
            i32.store
            local.get 2
            i32.const 12
            i32.sub
            i32.const 0
            i32.store
            local.get 1
            i32.const 25
            i32.lt_u
            br_if 0 (;@4;)
            local.get 0
            i32.const 0
            i32.store offset=24
            local.get 0
            i32.const 0
            i32.store offset=20
            local.get 0
            i32.const 0
            i32.store offset=16
            local.get 0
            i32.const 0
            i32.store offset=12
            local.get 2
            i32.const 16
            i32.sub
            i32.const 0
            i32.store
            local.get 2
            i32.const 20
            i32.sub
            i32.const 0
            i32.store
            local.get 2
            i32.const 24
            i32.sub
            i32.const 0
            i32.store
            local.get 2
            i32.const 28
            i32.sub
            i32.const 0
            i32.store
            local.get 1
            local.get 0
            i32.const 4
            i32.and
            i32.const 24
            i32.or
            local.tee 1
            i32.sub
            local.tee 2
            i32.const 32
            i32.lt_u
            br_if 0 (;@4;)
            local.get 0
            local.get 1
            i32.add
            local.set 0
            loop  ;; label = @5
              local.get 0
              i64.const 0
              i64.store offset=24
              local.get 0
              i64.const 0
              i64.store offset=16
              local.get 0
              i64.const 0
              i64.store offset=8
              local.get 0
              i64.const 0
              i64.store
              local.get 0
              i32.const 32
              i32.add
              local.set 0
              local.get 2
              i32.const 32
              i32.sub
              local.tee 2
              i32.const 31
              i32.gt_u
              br_if 0 (;@5;)
            end
          end
        end
        i32.const 65608
        i32.const 65608
        i32.load
        local.get 5
        i32.add
        local.tee 0
        i32.store
        local.get 5
        local.get 7
        i32.add
        local.set 7
        local.get 6
        local.get 5
        i32.sub
        local.tee 6
        br_if 1 (;@1;)
      end
    end
    local.get 8
    i32.load offset=12
    local.get 8
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $runtime.memequal (type 0) (param i32 i32 i32 i32) (result i32)
    (local i32 i32)
    i32.const 0
    local.set 3
    block (result i32)  ;; label = @1
      loop  ;; label = @2
        local.get 2
        local.get 2
        local.get 3
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 1
        local.get 3
        i32.add
        local.set 4
        local.get 0
        local.get 3
        i32.add
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        i32.load8_u
        local.get 4
        i32.load8_u
        i32.eq
        br_if 0 (;@2;)
      end
      local.get 3
      i32.const 1
      i32.sub
    end
    local.get 2
    i32.ge_u)
  (func $runtime.hash32 (type 0) (param i32 i32 i32 i32) (result i32)
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
  (func $malloc (type 4) (param i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 2
    i32.store offset=20
    i32.const 66220
    i32.load
    local.set 3
    i32.const 66220
    local.get 1
    i32.const 16
    i32.add
    i32.store
    local.get 1
    local.get 3
    i32.store offset=16
    block  ;; label = @1
      local.get 0
      if  ;; label = @2
        local.get 0
        i32.const 0
        i32.lt_s
        br_if 1 (;@1;)
        local.get 1
        local.get 0
        i32.const 3
        call $runtime.alloc
        local.tee 2
        i32.store offset=24
        local.get 1
        local.get 2
        i32.store offset=28
        local.get 1
        local.get 0
        i32.store offset=8
        local.get 1
        local.get 0
        i32.store offset=4
        local.get 1
        local.get 2
        i32.store
        local.get 1
        local.get 2
        i32.store offset=12
        local.get 1
        i32.const 12
        i32.add
        local.get 1
        call $runtime.hashmapBinarySet
      end
      i32.const 66220
      local.get 3
      i32.store
      local.get 1
      i32.const 32
      i32.add
      global.set $__stack_pointer
      local.get 2
      return
    end
    unreachable)
  (func $runtime.alloc (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i64)
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 66216
      return
    end
    i32.const 66192
    i32.const 66192
    i64.load
    i64.const 1
    i64.add
    i64.store
    i32.const 66176
    i32.const 66176
    i64.load
    local.get 0
    i32.const 16
    i32.add
    i64.extend_i32_u
    i64.add
    i64.store
    i32.const 66184
    i32.const 66184
    i64.load
    local.get 0
    i32.const 31
    i32.add
    i32.const 4
    i32.shr_u
    local.tee 5
    i64.extend_i32_u
    i64.add
    i64.store
    i32.const 66164
    i32.load
    local.tee 2
    local.set 4
    loop  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            local.get 4
            i32.ne
            br_if 0 (;@4;)
            local.get 3
            i32.const 255
            i32.and
            local.set 2
            i32.const 1
            local.set 3
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                br_table 2 (;@4;) 0 (;@6;) 1 (;@5;)
              end
              i32.const 66220
              i32.load
              drop
              global.get $__stack_pointer
              i32.const 65536
              call $runtime.markRoots
              i32.const 65536
              i32.const 66512
              call $runtime.markRoots
              loop  ;; label = @6
                i32.const 66217
                i32.load8_u
                i32.eqz
                if  ;; label = @7
                  i64.const 0
                  local.set 9
                  i32.const 0
                  local.set 6
                  i32.const 0
                  local.set 3
                  i32.const 0
                  local.set 2
                  loop  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        i32.const 66168
                        i32.load
                        local.get 2
                        i32.gt_u
                        if  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 2
                                  call $_runtime.gcBlock_.state
                                  i32.const 255
                                  i32.and
                                  i32.const 1
                                  i32.sub
                                  br_table 0 (;@15;) 1 (;@14;) 2 (;@13;) 3 (;@12;)
                                end
                                local.get 2
                                call $_runtime.gcBlock_.markFree
                                i32.const 66200
                                i32.const 66200
                                i64.load
                                i64.const 1
                                i64.add
                                i64.store
                                br 4 (;@10;)
                              end
                              local.get 3
                              i32.const 1
                              i32.and
                              i32.const 0
                              local.set 3
                              i32.eqz
                              br_if 4 (;@9;)
                              local.get 2
                              call $_runtime.gcBlock_.markFree
                              br 3 (;@10;)
                            end
                            i32.const 0
                            local.set 3
                            i32.const 66160
                            i32.load
                            local.get 2
                            i32.const 2
                            i32.shr_u
                            i32.add
                            local.tee 7
                            local.get 7
                            i32.load8_u
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
                            br 3 (;@9;)
                          end
                          local.get 6
                          i32.const 16
                          i32.add
                          local.set 6
                          br 2 (;@9;)
                        end
                        i32.const 66208
                        i32.const 66208
                        i64.load
                        local.get 9
                        i64.add
                        i64.store
                        i32.const 2
                        local.set 3
                        local.get 9
                        i32.wrap_i64
                        i32.const 4
                        i32.shl
                        local.get 6
                        i32.add
                        i32.const 66160
                        i32.load
                        i32.const 66512
                        i32.sub
                        i32.const 3
                        i32.div_u
                        i32.ge_u
                        br_if 6 (;@4;)
                        call $runtime.growHeap
                        drop
                        br 6 (;@4;)
                      end
                      local.get 9
                      i64.const 1
                      i64.add
                      local.set 9
                      i32.const 1
                      local.set 3
                    end
                    local.get 2
                    i32.const 1
                    i32.add
                    local.set 2
                    br 0 (;@8;)
                  end
                  unreachable
                end
                i32.const 0
                local.set 2
                i32.const 66217
                i32.const 0
                i32.store8
                i32.const 66168
                i32.load
                local.set 3
                loop  ;; label = @7
                  local.get 2
                  local.get 3
                  i32.ge_u
                  br_if 1 (;@6;)
                  local.get 2
                  call $_runtime.gcBlock_.state
                  i32.const 255
                  i32.and
                  i32.const 3
                  i32.eq
                  if  ;; label = @8
                    local.get 2
                    call $runtime.startMark
                    i32.const 66168
                    i32.load
                    local.set 3
                  end
                  local.get 2
                  i32.const 1
                  i32.add
                  local.set 2
                  br 0 (;@7;)
                end
                unreachable
              end
              unreachable
            end
            call $runtime.growHeap
            i32.const 1
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            i32.const 2
            local.set 3
          end
          block  ;; label = @4
            i32.const 66168
            i32.load
            local.get 4
            i32.eq
            if (result i32)  ;; label = @5
              i32.const 0
            else
              local.get 4
              call $_runtime.gcBlock_.state
              i32.const 255
              i32.and
              i32.eqz
              br_if 1 (;@4;)
              local.get 4
              i32.const 1
              i32.add
            end
            local.set 4
            i32.const 0
            local.set 8
            br 2 (;@2;)
          end
          local.get 4
          i32.const 1
          i32.add
          local.set 2
          local.get 5
          local.get 8
          i32.const 1
          i32.add
          local.tee 8
          i32.ne
          if  ;; label = @4
            local.get 2
            local.set 4
            br 2 (;@2;)
          end
          i32.const 66164
          local.get 2
          i32.store
          local.get 2
          local.get 5
          i32.sub
          local.tee 3
          i32.const 1
          call $_runtime.gcBlock_.setState
          local.get 4
          local.get 5
          i32.sub
          i32.const 2
          i32.add
          local.set 2
          loop  ;; label = @4
            i32.const 66164
            i32.load
            local.get 2
            i32.ne
            if  ;; label = @5
              local.get 2
              i32.const 2
              call $_runtime.gcBlock_.setState
              local.get 2
              i32.const 1
              i32.add
              local.set 2
              br 1 (;@4;)
            end
          end
          local.get 3
          i32.const 4
          i32.shl
          i32.const 66512
          i32.add
          local.tee 4
          local.get 1
          i32.store
          local.get 4
          i32.const 16
          i32.add
          local.tee 1
          i32.const 0
          local.get 0
          memory.fill
          local.get 1
          return
        end
        unreachable
      end
      i32.const 66164
      i32.load
      local.set 2
      br 0 (;@1;)
    end
    unreachable)
  (func $runtime.hashmapBinarySet (type 3) (param i32 i32)
    i32.const 65556
    local.get 0
    local.get 1
    local.get 0
    i32.const 65568
    i32.load
    i32.const 65560
    i32.load
    local.get 0
    call $runtime.hash32
    call $runtime.hashmapSet)
  (func $free (type 2) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      if  ;; label = @2
        local.get 1
        local.get 0
        i32.store offset=12
        local.get 1
        i32.const 12
        i32.add
        local.get 1
        call $runtime.hashmapBinaryGet
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 0
        i32.store
        local.get 1
        call $runtime.hashmapBinaryDelete
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
      return
    end
    unreachable)
  (func $runtime.hashmapBinaryGet (type 1) (param i32 i32) (result i32)
    i32.const 65556
    local.get 0
    local.get 1
    local.get 0
    i32.const 65568
    i32.load
    i32.const 65560
    i32.load
    local.get 0
    call $runtime.hash32
    call $runtime.hashmapGet)
  (func $runtime.hashmapBinaryDelete (type 2) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 24
    i32.add
    i64.const 0
    i64.store
    local.get 1
    i64.const 0
    i64.store offset=16
    local.get 1
    i32.const 6
    i32.store offset=4
    i32.const 66220
    i32.load
    local.set 4
    i32.const 66220
    local.get 1
    i32.store
    local.get 1
    local.get 4
    i32.store
    i32.const 1
    local.get 0
    i32.const 65568
    i32.load
    i32.const 65560
    i32.load
    i32.const 0
    call $runtime.hash32
    local.tee 2
    i32.const 24
    i32.shr_u
    local.get 2
    i32.const 16777216
    i32.lt_u
    select
    local.set 7
    i32.const 65556
    local.get 2
    call $runtime.hashmapBucketAddrForHash
    local.set 2
    block  ;; label = @1
      loop  ;; label = @2
        local.get 1
        local.get 2
        i32.store offset=8
        local.get 1
        local.get 2
        i32.store offset=12
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        i32.const 12
        i32.add
        local.set 8
        i32.const 0
        local.set 3
        block  ;; label = @3
          loop  ;; label = @4
            local.get 3
            i32.const 8
            i32.ne
            if  ;; label = @5
              local.get 1
              local.get 8
              i32.const 65568
              i32.load
              local.tee 9
              local.get 3
              i32.mul
              i32.add
              local.tee 5
              i32.store offset=16
              block  ;; label = @6
                local.get 2
                local.get 3
                i32.add
                local.tee 10
                i32.load8_u
                local.get 7
                i32.ne
                br_if 0 (;@6;)
                local.get 1
                i32.const 65580
                i32.load
                local.tee 11
                i32.store offset=20
                local.get 1
                i32.const 65584
                i32.load
                local.tee 6
                i32.store offset=24
                local.get 6
                i32.eqz
                br_if 3 (;@3;)
                local.get 0
                local.get 5
                local.get 9
                local.get 11
                local.get 6
                call_indirect (type 0)
                i32.const 1
                i32.and
                i32.eqz
                br_if 0 (;@6;)
                local.get 10
                i32.const 0
                i32.store8
                local.get 5
                i32.const 0
                i32.const 65568
                i32.load
                memory.fill
                local.get 2
                i32.const 65568
                i32.load
                i32.const 3
                i32.shl
                i32.add
                i32.const 65572
                i32.load
                local.tee 0
                local.get 3
                i32.mul
                i32.add
                i32.const 12
                i32.add
                i32.const 0
                local.get 0
                memory.fill
                i32.const 65564
                i32.const 65564
                i32.load
                i32.const 1
                i32.sub
                i32.store
                br 5 (;@1;)
              end
              local.get 3
              i32.const 1
              i32.add
              local.set 3
              br 1 (;@4;)
            end
          end
          local.get 2
          i32.load offset=8
          local.set 2
          br 1 (;@2;)
        end
      end
      unreachable
    end
    i32.const 66220
    local.get 4
    i32.store
    local.get 1
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $runtime.calculateHeapAddresses (type 6)
    (local i32)
    i32.const 66160
    i32.const 66156
    i32.load
    local.tee 0
    local.get 0
    i32.const 66448
    i32.sub
    i32.const 65
    i32.div_u
    i32.sub
    local.tee 0
    i32.store
    i32.const 66168
    local.get 0
    i32.const 66512
    i32.sub
    i32.const 4
    i32.shr_u
    i32.store)
  (func $runtime.markRoots (type 3) (param i32 i32)
    (local i32)
    loop  ;; label = @1
      local.get 0
      local.get 1
      i32.ge_u
      i32.eqz
      if  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load
          local.tee 2
          i32.const 66512
          i32.lt_u
          br_if 0 (;@3;)
          local.get 2
          i32.const 66160
          i32.load
          i32.ge_u
          br_if 0 (;@3;)
          local.get 2
          i32.const 66512
          i32.sub
          i32.const 4
          i32.shr_u
          local.tee 2
          call $_runtime.gcBlock_.state
          i32.const 255
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          call $_runtime.gcBlock_.findHead
          local.tee 2
          call $_runtime.gcBlock_.state
          i32.const 255
          i32.and
          i32.const 3
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          call $runtime.startMark
        end
        local.get 0
        i32.const 4
        i32.add
        local.set 0
        br 1 (;@1;)
      end
    end)
  (func $_runtime.gcBlock_.state (type 4) (param i32) (result i32)
    i32.const 66160
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
  (func $_runtime.gcBlock_.markFree (type 2) (param i32)
    (local i32)
    i32.const 66160
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
      i32.const 66156
      i32.load
      local.set 2
      i32.const 66156
      local.get 0
      i32.const 16
      i32.shl
      i32.store
      i32.const 66160
      i32.load
      local.set 0
      call $runtime.calculateHeapAddresses
      i32.const 66160
      i32.load
      local.get 0
      local.get 2
      local.get 0
      i32.sub
      memory.copy
    end
    local.get 1)
  (func $runtime.startMark (type 2) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
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
    local.set 3
    block  ;; label = @1
      loop  ;; label = @2
        local.get 3
        i32.const 0
        i32.gt_s
        if  ;; label = @3
          local.get 3
          i32.const 1
          i32.sub
          local.tee 3
          i32.const 31
          i32.gt_u
          br_if 2 (;@1;)
          block  ;; label = @4
            local.get 5
            local.get 3
            i32.const 2
            i32.shl
            i32.add
            i32.load
            local.tee 2
            i32.const 4
            i32.shl
            local.tee 1
            i32.const 66512
            i32.add
            local.tee 10
            i32.load
            local.tee 0
            i32.eqz
            if  ;; label = @5
              i32.const 0
              local.set 7
              i32.const 1
              local.set 9
              i32.const 1
              local.set 8
              i32.const 1
              local.set 6
              br 1 (;@4;)
            end
            block (result i32)  ;; label = @5
              local.get 0
              i32.const 1
              i32.and
              if  ;; label = @6
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
                br 1 (;@5;)
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
            local.set 9
            local.get 7
            br_if 0 (;@4;)
            local.get 6
            i32.eqz
            br_if 2 (;@2;)
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              call $_runtime.gcBlock_.state
              i32.const 255
              i32.and
              i32.const 1
              i32.sub
              br_table 0 (;@5;) 1 (;@4;) 0 (;@5;) 1 (;@4;)
            end
            local.get 2
            i32.const 1
            i32.add
            local.set 2
          end
          local.get 2
          i32.const 4
          i32.shl
          local.tee 0
          i32.const 66512
          i32.add
          local.set 4
          local.get 0
          local.get 1
          i32.sub
          i32.const 16
          i32.sub
          local.set 1
          i32.const 66160
          i32.load
          local.set 11
          loop  ;; label = @4
            block  ;; label = @5
              local.get 1
              local.set 0
              local.get 4
              local.get 11
              i32.ge_u
              br_if 0 (;@5;)
              local.get 0
              i32.const 16
              i32.add
              local.set 1
              local.get 4
              i32.const 16
              i32.add
              local.set 4
              local.get 2
              call $_runtime.gcBlock_.state
              local.get 2
              i32.const 1
              i32.add
              local.set 2
              i32.const 255
              i32.and
              i32.const 2
              i32.eq
              br_if 1 (;@4;)
            end
          end
          local.get 10
          i32.const 16
          i32.add
          local.set 2
          i32.const 0
          local.set 4
          loop  ;; label = @4
            local.get 0
            i32.eqz
            br_if 2 (;@2;)
            block  ;; label = @5
              local.get 2
              i32.load
              local.tee 1
              i32.const 66512
              i32.lt_u
              br_if 0 (;@5;)
              local.get 1
              i32.const 66160
              i32.load
              i32.ge_u
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 9
                i32.eqz
                if  ;; label = @7
                  local.get 7
                  local.get 4
                  i32.const 3
                  i32.shr_u
                  i32.add
                  i32.load8_u
                  local.get 4
                  i32.const 7
                  i32.and
                  i32.shr_u
                  i32.const 1
                  i32.and
                  br_if 1 (;@6;)
                  br 2 (;@5;)
                end
                i32.const 1
                local.get 4
                i32.shl
                local.get 6
                i32.and
                i32.eqz
                local.get 4
                i32.const 31
                i32.gt_u
                i32.or
                br_if 1 (;@5;)
              end
              local.get 1
              i32.const 66512
              i32.sub
              i32.const 4
              i32.shr_u
              local.tee 1
              call $_runtime.gcBlock_.state
              i32.const 255
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              call $_runtime.gcBlock_.findHead
              local.tee 1
              call $_runtime.gcBlock_.state
              i32.const 255
              i32.and
              i32.const 3
              i32.eq
              br_if 0 (;@5;)
              local.get 1
              i32.const 3
              call $_runtime.gcBlock_.setState
              local.get 3
              i32.const 32
              i32.eq
              if  ;; label = @6
                i32.const 66217
                i32.const 1
                i32.store8
                i32.const 32
                local.set 3
                br 1 (;@5;)
              end
              local.get 3
              i32.const 31
              i32.gt_u
              br_if 4 (;@1;)
              local.get 5
              local.get 3
              i32.const 2
              i32.shl
              i32.add
              local.get 1
              i32.store
              local.get 3
              i32.const 1
              i32.add
              local.set 3
            end
            local.get 4
            i32.const 1
            i32.add
            local.tee 1
            i32.const 0
            local.get 1
            local.get 8
            i32.ne
            select
            local.set 4
            local.get 0
            i32.const 4
            i32.sub
            local.set 0
            local.get 2
            i32.const 4
            i32.add
            local.set 2
            br 0 (;@4;)
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
    unreachable)
  (func $_runtime.gcBlock_.setState (type 3) (param i32 i32)
    (local i32)
    i32.const 66160
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
  (func $runtime.hashmapGet (type 0) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    i32.const 32
    i32.add
    i64.const 0
    i64.store
    local.get 4
    i32.const 40
    i32.add
    i32.const 0
    i32.store
    local.get 4
    i64.const 0
    i64.store offset=24
    local.get 4
    i32.const 7
    i32.store offset=12
    i32.const 66220
    i32.load
    local.set 6
    i32.const 66220
    local.get 4
    i32.const 8
    i32.add
    i32.store
    local.get 4
    local.get 6
    i32.store offset=8
    local.get 4
    local.get 0
    local.get 3
    call $runtime.hashmapBucketAddrForHash
    local.tee 5
    i32.store offset=16
    i32.const 1
    local.get 3
    i32.const 24
    i32.shr_u
    local.get 3
    i32.const 16777216
    i32.lt_u
    select
    local.set 10
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 4
            local.get 5
            i32.store offset=20
            local.get 5
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            i32.const 12
            i32.add
            local.set 7
            i32.const 0
            local.set 3
            loop  ;; label = @5
              local.get 3
              i32.const 8
              i32.ne
              if  ;; label = @6
                local.get 4
                local.get 7
                local.get 0
                i32.load offset=12
                local.tee 8
                local.get 3
                i32.mul
                i32.add
                local.tee 11
                i32.store offset=24
                local.get 4
                local.get 7
                local.get 8
                i32.const 3
                i32.shl
                i32.add
                local.get 0
                i32.load offset=16
                local.get 3
                i32.mul
                i32.add
                local.tee 12
                i32.store offset=28
                block  ;; label = @7
                  local.get 3
                  local.get 5
                  i32.add
                  i32.load8_u
                  local.get 10
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 4
                  local.get 0
                  i32.load offset=24
                  local.tee 13
                  i32.store offset=32
                  local.get 4
                  local.get 0
                  i32.load offset=28
                  local.tee 9
                  i32.store offset=36
                  local.get 9
                  i32.eqz
                  br_if 6 (;@1;)
                  local.get 1
                  local.get 11
                  local.get 8
                  local.get 13
                  local.get 9
                  call_indirect (type 0)
                  i32.const 1
                  i32.and
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 2
                  local.get 12
                  local.get 0
                  i32.load offset=16
                  memory.copy
                  br 5 (;@2;)
                end
                local.get 3
                i32.const 1
                i32.add
                local.set 3
                br 1 (;@5;)
              end
            end
            local.get 4
            local.get 5
            i32.load offset=8
            local.tee 5
            i32.store offset=40
            br 1 (;@3;)
          end
        end
        local.get 2
        i32.const 0
        local.get 0
        i32.load offset=16
        memory.fill
      end
      i32.const 66220
      local.get 6
      i32.store
      local.get 4
      i32.const 48
      i32.add
      global.set $__stack_pointer
      local.get 5
      i32.const 0
      i32.ne
      return
    end
    unreachable)
  (func $runtime.hashmapBucketAddrForHash (type 1) (param i32 i32) (result i32)
    local.get 0
    if  ;; label = @1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=16
      local.get 0
      i32.load offset=12
      i32.add
      i32.const 3
      i32.shl
      i32.const 12
      i32.add
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
      local.get 1
      i32.and
      i32.mul
      i32.add
      return
    end
    unreachable)
  (func $runtime.hashmapSet (type 8) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64)
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
    i32.const 66220
    i32.load
    local.tee 18
    i32.store offset=8
    i32.const 66220
    local.get 4
    i32.const 8
    i32.add
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 0
          i32.load8_u offset=20
          local.tee 6
          i32.const 29
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          i32.load offset=8
          i32.const 6
          local.get 6
          i32.shl
          i32.le_u
          br_if 0 (;@3;)
          i32.const 40
          i32.const 61525
          call $runtime.alloc
          local.tee 5
          local.get 0
          i32.load
          local.tee 3
          i32.store
          local.get 5
          local.get 0
          i64.load offset=4 align=4
          i64.store offset=4 align=4
          local.get 5
          local.get 0
          i64.load offset=12 align=4
          i64.store offset=12 align=4
          local.get 5
          local.get 0
          i32.load8_u offset=20
          i32.store8 offset=20
          local.get 5
          local.get 0
          i32.load offset=24
          local.tee 9
          i32.store offset=24
          local.get 5
          local.get 0
          i32.load offset=28
          local.tee 7
          i32.store offset=28
          local.get 5
          local.get 0
          i32.load offset=32
          local.tee 8
          i32.store offset=32
          local.get 5
          local.get 0
          i32.load offset=36
          local.tee 11
          i32.store offset=36
          local.get 4
          local.get 5
          i32.store offset=16
          local.get 4
          local.get 11
          i32.store offset=36
          local.get 4
          local.get 8
          i32.store offset=32
          local.get 4
          local.get 7
          i32.store offset=28
          local.get 4
          local.get 9
          i32.store offset=24
          local.get 4
          local.get 3
          i32.store offset=20
          local.get 5
          i32.const 0
          i32.store offset=8
          call $runtime.fastrand
          local.set 3
          local.get 5
          local.get 6
          i32.const 1
          i32.add
          local.tee 6
          i32.store8 offset=20
          local.get 5
          local.get 3
          i32.store offset=4
          local.get 5
          local.get 0
          i32.load offset=16
          local.get 0
          i32.load offset=12
          i32.add
          i32.const 3
          i32.shl
          i32.const 12
          i32.add
          local.get 6
          i32.shl
          i32.const 0
          call $runtime.alloc
          local.tee 3
          i32.store
          local.get 4
          local.get 3
          i32.store offset=40
          local.get 4
          local.get 0
          i32.load offset=12
          i32.const 0
          call $runtime.alloc
          local.tee 11
          i32.store offset=44
          local.get 4
          local.get 0
          i32.load offset=16
          i32.const 0
          call $runtime.alloc
          local.tee 15
          i32.store offset=48
          i32.const 0
          local.set 7
          i32.const 0
          local.set 3
          i32.const 0
          local.set 6
          i32.const 0
          local.set 9
          i32.const 0
          local.set 8
          loop  ;; label = @4
            local.get 4
            local.get 8
            i32.store offset=52
            local.get 8
            i32.eqz
            if  ;; label = @5
              local.get 4
              local.get 0
              i32.load
              local.tee 8
              i32.store offset=60
              local.get 4
              local.get 8
              i32.store offset=56
              local.get 0
              i32.load8_u offset=20
              local.set 3
              call $runtime.fastrand
              local.set 6
              call $runtime.fastrand
              local.get 4
              local.get 8
              local.get 6
              i32.const 1
              local.get 3
              i32.shl
              i32.const 0
              local.get 3
              i32.const 31
              i32.le_u
              select
              local.tee 14
              i32.const 1
              i32.sub
              i32.and
              local.tee 6
              local.get 0
              i32.load offset=16
              local.get 0
              i32.load offset=12
              i32.add
              i32.const 3
              i32.shl
              i32.const 12
              i32.add
              i32.mul
              i32.add
              local.tee 3
              i32.store offset=64
              i32.const 7
              i32.and
              local.tee 7
              local.set 13
              local.get 6
              local.set 9
            end
            local.get 4
            local.get 8
            i32.store offset=80
            local.get 4
            local.get 8
            i32.store offset=100
            block  ;; label = @5
              loop  ;; label = @6
                local.get 4
                local.get 3
                i32.store offset=68
                local.get 16
                local.get 6
                local.get 9
                i32.eq
                local.get 7
                i32.const 255
                i32.and
                local.tee 10
                local.get 13
                i32.eq
                i32.and
                i32.and
                br_if 1 (;@5;)
                local.get 10
                i32.const 8
                i32.ge_u
                if  ;; label = @7
                  local.get 3
                  i32.eqz
                  br_if 5 (;@2;)
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
                if  ;; label = @7
                  local.get 4
                  local.get 8
                  i32.const 0
                  local.get 6
                  i32.const 1
                  i32.add
                  local.tee 3
                  local.get 3
                  local.get 14
                  i32.ge_u
                  local.tee 10
                  select
                  local.tee 6
                  local.get 0
                  i32.load offset=16
                  local.get 0
                  i32.load offset=12
                  i32.add
                  i32.const 3
                  i32.shl
                  i32.const 12
                  i32.add
                  i32.mul
                  i32.add
                  local.tee 3
                  i32.store offset=84
                  local.get 10
                  local.get 16
                  i32.or
                  local.set 16
                  br 1 (;@6;)
                end
                local.get 3
                local.get 7
                i32.const 255
                i32.and
                local.tee 12
                i32.add
                i32.load8_u
                i32.eqz
                if  ;; label = @7
                  local.get 7
                  i32.const 1
                  i32.add
                  local.set 7
                  br 1 (;@6;)
                end
                local.get 4
                local.get 3
                local.get 0
                i32.load offset=12
                local.tee 10
                local.get 12
                i32.mul
                i32.add
                i32.const 12
                i32.add
                local.tee 17
                i32.store offset=96
                local.get 11
                local.get 17
                local.get 10
                memory.copy
                local.get 4
                local.get 0
                i32.load
                local.tee 17
                i32.store offset=104
                block  ;; label = @7
                  local.get 8
                  local.get 17
                  i32.eq
                  if  ;; label = @8
                    local.get 4
                    local.get 3
                    local.get 10
                    i32.const 3
                    i32.shl
                    i32.add
                    local.get 0
                    i32.load offset=16
                    local.tee 10
                    local.get 12
                    i32.mul
                    i32.add
                    i32.const 12
                    i32.add
                    local.tee 12
                    i32.store offset=112
                    local.get 15
                    local.get 12
                    local.get 10
                    memory.copy
                    local.get 7
                    i32.const 1
                    i32.add
                    local.set 7
                    br 1 (;@7;)
                  end
                  local.get 4
                  local.get 0
                  i32.load offset=32
                  local.tee 17
                  i32.store offset=116
                  local.get 4
                  local.get 0
                  i32.load offset=36
                  local.tee 12
                  i32.store offset=120
                  local.get 12
                  i32.eqz
                  br_if 5 (;@2;)
                  local.get 7
                  i32.const 1
                  i32.add
                  local.set 7
                  local.get 0
                  local.get 11
                  local.get 15
                  local.get 11
                  local.get 10
                  local.get 0
                  i32.load offset=4
                  local.get 17
                  local.get 12
                  call_indirect (type 0)
                  call $runtime.hashmapGet
                  i32.const 1
                  i32.and
                  i32.eqz
                  br_if 1 (;@6;)
                end
              end
              local.get 4
              local.get 5
              i32.load offset=32
              local.tee 12
              i32.store offset=124
              local.get 4
              local.get 5
              i32.load offset=36
              local.tee 10
              i32.store offset=128
              local.get 10
              i32.eqz
              br_if 3 (;@2;)
              local.get 5
              local.get 11
              local.get 15
              local.get 11
              local.get 5
              i32.load offset=12
              local.get 5
              i32.load offset=4
              local.get 12
              local.get 10
              call_indirect (type 0)
              call $runtime.hashmapSet
              br 1 (;@4;)
            end
          end
          local.get 4
          local.get 5
          i32.load
          local.tee 9
          i32.store offset=152
          local.get 4
          local.get 5
          i32.load offset=24
          local.tee 7
          i32.store offset=156
          local.get 4
          local.get 9
          i32.store offset=132
          local.get 4
          local.get 5
          i32.load offset=28
          local.tee 8
          i32.store offset=160
          local.get 4
          local.get 7
          i32.store offset=136
          local.get 4
          local.get 5
          i32.load offset=32
          local.tee 6
          i32.store offset=164
          local.get 4
          local.get 8
          i32.store offset=140
          local.get 4
          local.get 5
          i32.load offset=36
          local.tee 3
          i32.store offset=168
          local.get 4
          local.get 6
          i32.store offset=144
          local.get 5
          i64.load offset=4 align=4
          local.set 19
          local.get 5
          i64.load offset=12 align=4
          local.set 20
          local.get 5
          i32.load8_u offset=20
          local.set 5
          local.get 0
          local.get 3
          i32.store offset=36
          local.get 0
          local.get 6
          i32.store offset=32
          local.get 0
          local.get 8
          i32.store offset=28
          local.get 0
          local.get 7
          i32.store offset=24
          local.get 0
          local.get 5
          i32.store8 offset=20
          local.get 0
          local.get 20
          i64.store offset=12 align=4
          local.get 0
          local.get 19
          i64.store offset=4 align=4
          local.get 0
          local.get 9
          i32.store
          local.get 4
          local.get 3
          i32.store offset=148
          local.get 4
          local.get 6
          i32.store offset=172
          local.get 4
          local.get 3
          i32.store offset=176
          local.get 3
          i32.eqz
          br_if 1 (;@2;)
          local.get 1
          local.get 0
          i32.load offset=12
          local.get 0
          i32.load offset=4
          local.get 6
          local.get 3
          call_indirect (type 0)
          local.set 3
        end
        local.get 4
        local.get 0
        local.get 3
        call $runtime.hashmapBucketAddrForHash
        local.tee 9
        i32.store offset=180
        i32.const 1
        local.get 3
        i32.const 24
        i32.shr_u
        local.get 3
        i32.const 16777216
        i32.lt_u
        select
        local.set 11
        i32.const 0
        local.set 3
        i32.const 0
        local.set 7
        i32.const 0
        local.set 8
        i32.const 0
        local.set 5
        loop  ;; label = @3
          block  ;; label = @4
            local.get 4
            local.get 3
            i32.store offset=196
            local.get 4
            local.get 9
            local.tee 6
            i32.store offset=200
            local.get 4
            local.get 7
            i32.store offset=192
            local.get 4
            local.get 8
            i32.store offset=188
            local.get 4
            local.get 5
            i32.store offset=184
            local.get 6
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i32.const 12
            i32.add
            local.set 9
            i32.const 0
            local.set 3
            loop  ;; label = @5
              block  ;; label = @6
                local.get 4
                local.get 8
                i32.store offset=208
                local.get 4
                local.get 7
                i32.store offset=212
                local.get 4
                local.get 5
                i32.store offset=204
                local.get 3
                i32.const 8
                i32.eq
                br_if 0 (;@6;)
                local.get 4
                local.get 9
                local.get 0
                i32.load offset=12
                local.tee 15
                local.get 3
                i32.mul
                i32.add
                local.tee 16
                i32.store offset=216
                local.get 4
                local.get 9
                local.get 15
                i32.const 3
                i32.shl
                i32.add
                local.get 0
                i32.load offset=16
                local.get 3
                i32.mul
                i32.add
                local.tee 10
                i32.store offset=220
                local.get 4
                local.get 7
                local.get 16
                local.get 3
                local.get 6
                i32.add
                local.tee 13
                i32.load8_u
                local.get 7
                i32.or
                local.tee 14
                select
                local.tee 7
                i32.store offset=232
                local.get 4
                local.get 5
                local.get 13
                local.get 14
                select
                local.tee 5
                i32.store offset=224
                local.get 4
                local.get 8
                local.get 10
                local.get 14
                select
                local.tee 8
                i32.store offset=228
                block  ;; label = @7
                  local.get 13
                  i32.load8_u
                  local.get 11
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 4
                  local.get 0
                  i32.load offset=24
                  local.tee 14
                  i32.store offset=236
                  local.get 4
                  local.get 0
                  i32.load offset=28
                  local.tee 13
                  i32.store offset=240
                  local.get 13
                  i32.eqz
                  br_if 5 (;@2;)
                  local.get 1
                  local.get 16
                  local.get 15
                  local.get 14
                  local.get 13
                  call_indirect (type 0)
                  i32.const 1
                  i32.and
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 10
                  local.get 2
                  local.get 0
                  i32.load offset=16
                  memory.copy
                  br 6 (;@1;)
                end
                local.get 3
                i32.const 1
                i32.add
                local.set 3
                br 1 (;@5;)
              end
            end
            local.get 4
            local.get 6
            i32.load offset=8
            local.tee 9
            i32.store offset=244
            local.get 6
            local.set 3
            br 1 (;@3;)
          end
        end
        local.get 7
        i32.eqz
        if  ;; label = @3
          local.get 0
          i32.load offset=16
          local.get 0
          i32.load offset=12
          i32.add
          i32.const 3
          i32.shl
          i32.const 12
          i32.add
          i32.const 0
          call $runtime.alloc
          local.set 6
          local.get 0
          local.get 0
          i32.load offset=8
          i32.const 1
          i32.add
          i32.store offset=8
          local.get 6
          i32.const 12
          i32.add
          local.tee 9
          local.get 1
          local.get 0
          i32.load offset=12
          local.tee 1
          memory.copy
          local.get 9
          local.get 1
          i32.const 3
          i32.shl
          i32.add
          local.get 2
          local.get 0
          i32.load offset=16
          memory.copy
          local.get 6
          local.get 11
          i32.store8
          local.get 3
          i32.eqz
          br_if 1 (;@2;)
          local.get 3
          local.get 6
          i32.store offset=8
          br 2 (;@1;)
        end
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
        local.get 8
        local.get 2
        local.get 0
        i32.load offset=16
        memory.copy
        local.get 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        local.get 11
        i32.store8
        br 1 (;@1;)
      end
      unreachable
    end
    i32.const 66220
    local.get 18
    i32.store
    local.get 4
    i32.const 272
    i32.add
    global.set $__stack_pointer)
  (func $runtime.fastrand (type 5) (result i32)
    (local i32)
    i32.const 65552
    i32.const 65552
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
  (func $_runtime.gcBlock_.findHead (type 4) (param i32) (result i32)
    (local i32 i32 i32)
    i32.const 66160
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
  (func $malloc.command_export (type 4) (param i32) (result i32)
    local.get 0
    call $malloc)
  (func $free.command_export (type 2) (param i32)
    local.get 0
    call $free)
  (func $calloc.command_export (type 1) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 66220
    i32.load
    local.set 3
    i32.const 66220
    local.get 2
    i32.store
    local.get 0
    local.get 1
    i32.mul
    call $malloc
    i32.const 66220
    local.get 3
    i32.store
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $realloc.command_export (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    block (result i32)  ;; label = @1
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 2
      i32.const 2
      i32.store offset=20
      i32.const 66220
      i32.load
      local.set 4
      i32.const 66220
      local.get 2
      i32.const 16
      i32.add
      i32.store
      local.get 2
      local.get 4
      i32.store offset=16
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.eqz
          if  ;; label = @4
            local.get 0
            call $free
            br 1 (;@3;)
          end
          local.get 1
          i32.const 0
          i32.lt_s
          br_if 1 (;@2;)
          local.get 2
          local.get 1
          i32.const 3
          call $runtime.alloc
          local.tee 3
          i32.store offset=24
          local.get 2
          local.get 3
          i32.store offset=28
          local.get 0
          if  ;; label = @4
            local.get 2
            local.get 0
            i32.store offset=12
            local.get 2
            i32.const 12
            i32.add
            local.get 2
            call $runtime.hashmapBinaryGet
            i32.const 1
            i32.and
            i32.eqz
            br_if 2 (;@2;)
            local.get 3
            local.get 2
            i32.load
            local.get 2
            i32.load offset=4
            local.tee 5
            local.get 1
            local.get 1
            local.get 5
            i32.gt_u
            select
            memory.copy
            local.get 2
            local.get 0
            i32.store
            local.get 2
            call $runtime.hashmapBinaryDelete
          end
          local.get 2
          local.get 1
          i32.store offset=8
          local.get 2
          local.get 1
          i32.store offset=4
          local.get 2
          local.get 3
          i32.store
          local.get 2
          local.get 3
          i32.store offset=12
          local.get 2
          i32.const 12
          i32.add
          local.get 2
          call $runtime.hashmapBinarySet
        end
        i32.const 66220
        local.get 4
        i32.store
        local.get 2
        i32.const 32
        i32.add
        global.set $__stack_pointer
        local.get 3
        br 1 (;@1;)
      end
      unreachable
    end)
  (func $_initialize.command_export (type 6)
    (local i32 i32)
    i32.const 66156
    memory.size
    i32.const 16
    i32.shl
    local.tee 0
    i32.store
    call $runtime.calculateHeapAddresses
    i32.const 66160
    i32.load
    local.tee 1
    i32.const 0
    local.get 0
    local.get 1
    i32.sub
    memory.fill
    call $arc4random
    local.set 0
    call $arc4random
    drop
    i32.const 65552
    local.get 0
    i32.const 1
    i32.or
    i32.store
    i32.const 66156
    memory.size
    i32.const 16
    i32.shl
    i32.store)
  (func $vector_add_kernel.command_export (type 7) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 12
        local.get 3
        local.get 6
        i32.mul
        local.get 0
        i32.add
        local.tee 0
        i32.gt_u
        if  ;; label = @3
          local.get 0
          i32.const 1073741823
          i32.gt_u
          br_if 1 (;@2;)
          local.get 11
          local.get 0
          i32.const 2
          i32.shl
          local.tee 0
          i32.add
          local.get 0
          local.get 10
          i32.add
          i32.load
          local.get 0
          local.get 9
          i32.add
          i32.load
          i32.add
          i32.store
        end
        br 1 (;@1;)
      end
      unreachable
    end)
  (func $vector_add_loop_kernel.command_export (type 7) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 6
    local.get 7
    i32.mul
    local.get 8
    i32.mul
    local.set 2
    local.get 7
    local.get 8
    i32.mul
    local.get 6
    i32.mul
    i32.const 2
    i32.shl
    local.set 4
    local.get 3
    local.get 6
    i32.mul
    local.get 0
    i32.add
    local.tee 1
    i32.const 2
    i32.shl
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          local.get 1
          local.get 12
          i32.lt_u
          if  ;; label = @4
            local.get 1
            i32.const 1073741823
            i32.gt_u
            br_if 2 (;@2;)
            local.get 0
            local.get 11
            i32.add
            local.get 0
            local.get 10
            i32.add
            i32.load
            local.get 0
            local.get 9
            i32.add
            i32.load
            i32.add
            i32.store
            local.get 0
            local.get 4
            i32.add
            local.set 0
            local.get 1
            local.get 2
            i32.add
            local.set 1
            br 1 (;@3;)
          end
        end
        br 1 (;@1;)
      end
      unreachable
    end)
  (func $matrix_mul_kernel.command_export (type 9) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 4
      local.get 7
      i32.mul
      local.get 1
      i32.add
      local.tee 7
      local.get 12
      i32.ge_u
      br_if 0 (;@1;)
      local.get 3
      local.get 6
      i32.mul
      local.get 0
      i32.add
      local.tee 0
      local.get 14
      i32.ge_u
      br_if 0 (;@1;)
      local.get 14
      i32.const 2
      i32.shl
      local.set 6
      local.get 10
      local.get 0
      i32.const 2
      i32.shl
      i32.add
      local.set 2
      local.get 9
      local.get 7
      local.get 13
      i32.mul
      local.tee 3
      i32.const 2
      i32.shl
      i32.add
      local.set 4
      i32.const 0
      local.set 5
      local.get 0
      local.set 1
      block  ;; label = @2
        loop  ;; label = @3
          local.get 13
          if  ;; label = @4
            local.get 3
            i32.const 1073741823
            i32.gt_u
            local.get 1
            i32.const 1073741823
            i32.gt_u
            i32.or
            br_if 2 (;@2;)
            local.get 13
            i32.const 1
            i32.sub
            local.set 13
            local.get 1
            local.get 14
            i32.add
            local.set 1
            local.get 3
            i32.const 1
            i32.add
            local.set 3
            local.get 2
            i32.load
            local.get 4
            i32.load
            i32.mul
            local.get 5
            i32.add
            local.set 5
            local.get 2
            local.get 6
            i32.add
            local.set 2
            local.get 4
            i32.const 4
            i32.add
            local.set 4
            br 1 (;@3;)
          end
        end
        local.get 7
        local.get 14
        i32.mul
        local.get 0
        i32.add
        local.tee 0
        i32.const 1073741823
        i32.gt_u
        br_if 0 (;@2;)
        local.get 11
        local.get 0
        i32.const 2
        i32.shl
        i32.add
        local.get 5
        i32.store
        br 1 (;@1;)
      end
      unreachable
    end)
  (table (;0;) 3 3 funcref)
  (memory (;0;) 2)
  (global $__stack_pointer (mut i32) (i32.const 65536))
  (export "memory" (memory 0))
  (export "malloc" (func $malloc.command_export))
  (export "free" (func $free.command_export))
  (export "calloc" (func $calloc.command_export))
  (export "realloc" (func $realloc.command_export))
  (export "_initialize" (func $_initialize.command_export))
  (export "vector_add_kernel" (func $vector_add_kernel.command_export))
  (export "vector_add_loop_kernel" (func $vector_add_loop_kernel.command_export))
  (export "matrix_mul_kernel" (func $matrix_mul_kernel.command_export))
  (elem (;0;) (i32.const 1) func $runtime.memequal $runtime.hash32)
  (data $.rodata (i32.const 65536) "expand 32-byte k")
  (data $.data (i32.const 65552) "\c1\82\01\00\b0\02\01\00\c1\82\01\00\00\00\00\00\04\00\00\00\0c\00\00\00\01\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\02"))
