def vector_add_kernel(thread_idx_x, thread_idx_y, thread_idx_z, block_idx_x, block_idx_y, block_idx_z, block_dim_x, block_dim_y, block_dim_z, a_ptr, b_ptr, c_ptr, n):
    tid_x = block_idx_x * block_dim_x + thread_idx_x
    if tid_x < n:
        c_ptr[tid_x] = a_ptr[tid_x] + b_ptr[tid_x]