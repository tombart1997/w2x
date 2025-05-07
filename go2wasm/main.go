package main

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

func main() {
}

func vector_add_kernel(
    threadIdx ThreadIdx,
    blockIdx BlockIdx,
    blockDim BlockDim,
    a []int32,
    b []int32,
    c []int32,
    n uint32,
) {
    tid_x := blockIdx.X*blockDim.X + threadIdx.X
    if tid_x < n {
        c[tid_x] = a[tid_x] + b[tid_x]
    }
}

func vector_add_loop_kernel(
    threadIdx ThreadIdx,
    blockIdx BlockIdx,
    blockDim BlockDim,
    a []int32,
    b []int32,
    c []int32,
    n uint32,
) {
    i := blockIdx.X*blockDim.X + threadIdx.X
    stride := blockDim.X * blockDim.Y * blockDim.Z
    for i < n {
        c[i] = a[i] + b[i]
        i += stride
    }
}

func matrix_mul_kernel(
    threadIdx ThreadIdx,
    blockIdx BlockIdx,
    blockDim BlockDim,
    a []int32,
    b []int32,
    c []int32,
    m uint32,
    n uint32,
    p uint32,
) {
    row := blockIdx.Y*blockDim.Y + threadIdx.Y
    col := blockIdx.X*blockDim.X + threadIdx.X

    if row < m && col < p {
        sum := int32(0)
        for k := uint32(0); k < n; k++ {
            a_idx := row*n + k
            b_idx := k*p + col
            sum += a[a_idx] * b[b_idx]
        }
        c_idx := row*p + col
        c[c_idx] = sum
    }
}