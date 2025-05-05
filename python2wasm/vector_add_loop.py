def vector_add_loop_kernel(thread_idx_x, thread_idx_y, thread_idx_z, block_idx_x, block_idx_y, block_idx_z, block_dim_x, block_dim_y, block_dim_z, a_ptr, b_ptr, c_ptr, n):
    i = block_idx_x * block_dim_x + thread_idx_x
    stride = block_dim_x * block_dim_y * block_dim_z
    while i < n:
        c_ptr[i] = a_ptr[i] + b_ptr[i]
        i += stride