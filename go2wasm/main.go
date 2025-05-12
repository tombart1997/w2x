//go:build tinygo.wasm
// +build tinygo.wasm

package main

import "unsafe"

type ThreadIdx struct {
	X uint32
	Y uint32
	Z uint32
}

type BlockIdx struct {
	X uint32
	Y uint32
	Z uint32
}

type BlockDim struct {
	X uint32
	Y uint32
	Z uint32
}

//export vector_add_kernel
func vector_add_kernel(
	threadIdx ThreadIdx,
	blockIdx BlockIdx,
	blockDim BlockDim,
	a *int32,
	b *int32,
	c *int32,
	n uint32,
) {
	tid := blockIdx.X*blockDim.X + threadIdx.X
	if tid < n {
		pa := (*[1 << 30]int32)(unsafe.Pointer(a))
		pb := (*[1 << 30]int32)(unsafe.Pointer(b))
		pc := (*[1 << 30]int32)(unsafe.Pointer(c))
		pc[tid] = pa[tid] + pb[tid]
	}
}


//export vector_add_loop_kernel
func vector_add_loop_kernel(
    threadIdx ThreadIdx,
    blockIdx BlockIdx,
    blockDim BlockDim,
    a *int32,
    b *int32,
    c *int32,
    n uint32,
) {
    i := blockIdx.X*blockDim.X + threadIdx.X
    stride := blockDim.X * blockDim.Y * blockDim.Z
    pa := (*[1 << 30]int32)(unsafe.Pointer(a))
    pb := (*[1 << 30]int32)(unsafe.Pointer(b))
    pc := (*[1 << 30]int32)(unsafe.Pointer(c))
    for i < n {
        pc[i] = pa[i] + pb[i]
        i += stride
    }
}

//export matrix_mul_kernel
func matrix_mul_kernel(
    threadIdx ThreadIdx,
    blockIdx BlockIdx,
    blockDim BlockDim,
    a *int32,
    b *int32,
    c *int32,
    m uint32,
    n uint32,
    p uint32,
) {
    row := blockIdx.Y*blockDim.Y + threadIdx.Y
    col := blockIdx.X*blockDim.X + threadIdx.X
    if row < m && col < p {
        sum := int32(0)
        pa := (*[1 << 30]int32)(unsafe.Pointer(a))
        pb := (*[1 << 30]int32)(unsafe.Pointer(b))
        pc := (*[1 << 30]int32)(unsafe.Pointer(c))
        for k := uint32(0); k < n; k++ {
            a_idx := row*n + k
            b_idx := k*p + col
            sum += pa[a_idx] * pb[b_idx]
        }
        c_idx := row*p + col
        pc[c_idx] = sum
    }
}