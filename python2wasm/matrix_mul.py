def matrix_mul_kernel(thread_idx_y, thread_idx_x, block_idx_y, block_idx_x, block_dim_y, block_dim_x, a_ptr, b_ptr, c_ptr, m, n, p):
    row = block_idx_y * block_dim_y + thread_idx_y
    col = block_idx_x * block_dim_x + thread_idx_x
    if row < m and col < p:
        sum = 0
        for k in range(n):
            a_idx = row * n + k
            b_idx = k * p + col
            sum += a_ptr[a_idx] * b_ptr[b_idx]
        c_idx = row * p + col
        c_ptr[c_idx] = sum