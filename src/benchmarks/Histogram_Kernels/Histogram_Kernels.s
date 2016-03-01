.global	histogram256_vector
.text

histogram256_vector:                    // @histogram256_vector
// BB#0:                                 // %entry
	s_buffer_load_dword s14, s[8:11], 0x0
	s_buffer_load_dword s13, s[8:11], 0x4
	s_buffer_load_dword s8, s[8:11], 0x8
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[20:23], s[2:3], 0x50
	s_buffer_load_dword s0, s[4:7], 0x4
	v_lshlrev_b32 v1, 2, v0
	s_mov_b64 s[4:5], 0
	v_and_b32 v1, 0x7c, v1
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s0, 0xffff
	v_mov_b32 v2, 0
	s_mov_b32 m0, -1
BB0_2:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_or_b32 v3, 1, v2
	v_or_b32 v4, 2, v2
	v_or_b32 v5, 3, v2
	v_or_b32 v6, 4, v2
	v_or_b32 v7, 5, v2
	v_or_b32 v8, 6, v2
	v_or_b32 v9, 7, v2
	v_or_b32 v10, 8, v2
	v_or_b32 v11, 9, v2
	v_or_b32 v12, 10, v2
	v_or_b32 v13, 11, v2
	v_or_b32 v14, 12, v2
	v_or_b32 v15, 13, v2
	v_or_b32 v16, 14, v2
	v_or_b32 v17, 15, v2
	v_mul_lo_i32 v18, v2, s2
	v_mov_b32 v19, 0
	v_add_i32 v18, vcc, v18, v0
	v_lshlrev_b32 v18, 2, v18
	v_add_i32 v18, vcc, s13, v18
	ds_write_b8 v18, v19
	v_add_i32 v20, vcc, 3, v18
	ds_write_b8 v20, v19
	v_mul_lo_i32 v3, v3, s2
	v_add_i32 v20, vcc, 2, v18
	ds_write_b8 v20, v19
	v_add_i32 v18, vcc, 1, v18
	ds_write_b8 v18, v19
	v_add_i32 v3, vcc, v3, v0
	v_lshlrev_b32 v3, 2, v3
	v_add_i32 v3, vcc, s13, v3
	v_add_i32 v18, vcc, 3, v3
	ds_write_b8 v18, v19
	v_add_i32 v18, vcc, 2, v3
	ds_write_b8 v18, v19
	v_add_i32 v18, vcc, 1, v3
	ds_write_b8 v18, v19
	v_add_i32 v2, vcc, 16, v2
	v_mul_lo_i32 v4, v4, s2
	v_mul_lo_i32 v5, v5, s2
	v_mul_lo_i32 v6, v6, s2
	v_mul_lo_i32 v7, v7, s2
	v_mul_lo_i32 v8, v8, s2
	v_mul_lo_i32 v9, v9, s2
	v_mul_lo_i32 v10, v10, s2
	v_mul_lo_i32 v11, v11, s2
	v_mul_lo_i32 v12, v12, s2
	v_mul_lo_i32 v13, v13, s2
	v_mul_lo_i32 v14, v14, s2
	v_mul_lo_i32 v15, v15, s2
	v_mul_lo_i32 v16, v16, s2
	v_mul_lo_i32 v17, v17, s2
	v_add_i32 v4, vcc, v4, v0
	v_add_i32 v5, vcc, v5, v0
	v_lshlrev_b32 v4, 2, v4
	v_lshlrev_b32 v5, 2, v5
	v_add_i32 v4, vcc, s13, v4
	v_add_i32 v5, vcc, s13, v5
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 3, v4
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 2, v4
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 1, v4
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 3, v5
	ds_write_b8 v4, v19
	v_add_i32 v4, vcc, 2, v5
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 1, v5
	ds_write_b8 v4, v19
	ds_write_b8 v3, v19
	v_cmp_eq_i32 s[0:1], 64, v2
	v_add_i32 v3, vcc, v6, v0
	v_add_i32 v4, vcc, v7, v0
	v_add_i32 v6, vcc, v8, v0
	v_add_i32 v7, vcc, v9, v0
	v_add_i32 v8, vcc, v10, v0
	v_add_i32 v9, vcc, v11, v0
	v_add_i32 v10, vcc, v12, v0
	v_add_i32 v11, vcc, v13, v0
	v_add_i32 v12, vcc, v14, v0
	v_add_i32 v13, vcc, v15, v0
	v_add_i32 v14, vcc, v16, v0
	v_add_i32 v15, vcc, v17, v0
	v_lshlrev_b32 v3, 2, v3
	v_lshlrev_b32 v4, 2, v4
	v_lshlrev_b32 v6, 2, v6
	v_lshlrev_b32 v7, 2, v7
	v_lshlrev_b32 v8, 2, v8
	v_lshlrev_b32 v9, 2, v9
	v_lshlrev_b32 v10, 2, v10
	v_lshlrev_b32 v11, 2, v11
	v_lshlrev_b32 v12, 2, v12
	v_lshlrev_b32 v13, 2, v13
	v_lshlrev_b32 v14, 2, v14
	v_lshlrev_b32 v15, 2, v15
	v_add_i32 v3, vcc, s13, v3
	v_add_i32 v4, vcc, s13, v4
	v_add_i32 v6, vcc, s13, v6
	v_add_i32 v7, vcc, s13, v7
	v_add_i32 v8, vcc, s13, v8
	v_add_i32 v9, vcc, s13, v9
	v_add_i32 v10, vcc, s13, v10
	v_add_i32 v11, vcc, s13, v11
	v_add_i32 v12, vcc, s13, v12
	v_add_i32 v13, vcc, s13, v13
	v_add_i32 v14, vcc, s13, v14
	v_add_i32 v15, vcc, s13, v15
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 3, v3
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 2, v3
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 1, v3
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 3, v4
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 2, v4
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 1, v4
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 3, v6
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 2, v6
	ds_write_b8 v4, v19
	v_add_i32 v4, vcc, 1, v6
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 3, v7
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 2, v7
	ds_write_b8 v4, v19
	v_add_i32 v4, vcc, 1, v7
	ds_write_b8 v6, v19
	v_add_i32 v6, vcc, 3, v8
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 2, v8
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 1, v8
	ds_write_b8 v4, v19
	v_add_i32 v4, vcc, 3, v9
	ds_write_b8 v7, v19
	v_add_i32 v7, vcc, 2, v9
	ds_write_b8 v6, v19
	v_add_i32 v6, vcc, 1, v9
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 3, v10
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 2, v10
	ds_write_b8 v8, v19
	v_add_i32 v8, vcc, 1, v10
	ds_write_b8 v4, v19
	v_add_i32 v4, vcc, 3, v11
	ds_write_b8 v7, v19
	v_add_i32 v7, vcc, 2, v11
	ds_write_b8 v6, v19
	v_add_i32 v6, vcc, 1, v11
	ds_write_b8 v9, v19
	v_add_i32 v9, vcc, 3, v12
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 2, v12
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 1, v12
	ds_write_b8 v8, v19
	v_add_i32 v8, vcc, 3, v13
	ds_write_b8 v10, v19
	v_add_i32 v10, vcc, 2, v13
	ds_write_b8 v4, v19
	v_add_i32 v4, vcc, 1, v13
	ds_write_b8 v7, v19
	v_add_i32 v7, vcc, 3, v14
	ds_write_b8 v6, v19
	v_add_i32 v6, vcc, 2, v14
	ds_write_b8 v11, v19
	v_add_i32 v11, vcc, 1, v14
	ds_write_b8 v9, v19
	v_add_i32 v9, vcc, 3, v15
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 2, v15
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 1, v15
	ds_write_b8 v12, v19
	ds_write_b8 v8, v19
	ds_write_b8 v10, v19
	ds_write_b8 v4, v19
	ds_write_b8 v13, v19
	ds_write_b8 v7, v19
	ds_write_b8 v6, v19
	ds_write_b8 v11, v19
	ds_write_b8 v14, v19
	ds_write_b8 v9, v19
	ds_write_b8 v3, v19
	ds_write_b8 v5, v19
	ds_write_b8 v15, v19
	s_or_b64 s[4:5], s[0:1], s[4:5]
	s_waitcnt lgkmcnt(0)
	s_andn2_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB0_2
// BB#1:                                 // %for.cond.cleanup
	s_or_b64 exec, exec, s[4:5]
	s_barrier
	s_lshl_b32 s0, s2, 5
	s_and_b32 s0, s0, 0x1fffffe0
	s_mul_i32 s0, s0, s12
	v_lshrrev_b32 v2, 5, v0
	v_add_i32 v3, vcc, s0, v0
	s_mov_b64 s[0:1], 0
	v_mov_b32 v4, 0
	s_mov_b32 m0, -1
BB0_5:                                  // %for.body.9
                                        // =>This Inner Loop Header: Depth=1
	v_mul_lo_i32 v5, v4, s2
	v_add_i32 v5, vcc, v5, v3
	v_lshlrev_b32 v5, 4, v5
	v_add_i32 v5, vcc, s14, v5
	tbuffer_load_format_xyzw v[5:8], v5, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v9, 1, v4
	v_mul_lo_i32 v9, v9, s2
	v_add_i32 v9, vcc, v9, v3
	v_lshlrev_b32 v9, 4, v9
	v_add_i32 v9, vcc, s14, v9
	tbuffer_load_format_xyzw v[9:12], v9, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v13, 2, v4
	v_mul_lo_i32 v13, v13, s2
	v_add_i32 v13, vcc, v13, v3
	v_lshlrev_b32 v13, 4, v13
	v_add_i32 v13, vcc, s14, v13
	tbuffer_load_format_xyzw v[13:16], v13, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v17, 3, v4
	v_mul_lo_i32 v17, v17, s2
	v_add_i32 v17, vcc, v17, v3
	v_lshlrev_b32 v17, 4, v17
	v_add_i32 v17, vcc, s14, v17
	tbuffer_load_format_xyzw v[17:20], v17, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(3)
	v_lshlrev_b32 v5, 7, v5
	v_or_b32 v5, v5, v1
	v_add_i32 v5, vcc, v5, v2
	v_add_i32 v5, vcc, s13, v5
	ds_read_u8 v21, v5
	s_waitcnt lgkmcnt(0)
	v_add_i32 v21, vcc, 1, v21
	ds_write_b8 v5, v21
	v_lshlrev_b32 v5, 7, v6
	v_or_b32 v5, v5, v1
	v_add_i32 v5, vcc, v5, v2
	v_add_i32 v5, vcc, s13, v5
	ds_read_u8 v6, v5
	s_waitcnt lgkmcnt(0)
	v_add_i32 v6, vcc, 1, v6
	ds_write_b8 v5, v6
	v_lshlrev_b32 v5, 7, v7
	v_or_b32 v5, v5, v1
	v_add_i32 v5, vcc, v5, v2
	v_add_i32 v5, vcc, s13, v5
	s_waitcnt lgkmcnt(0)
	ds_read_u8 v6, v5
	v_lshlrev_b32 v7, 7, v8
	v_or_b32 v7, v7, v1
	v_add_i32 v7, vcc, v7, v2
	v_add_i32 v7, vcc, s13, v7
	s_waitcnt lgkmcnt(0)
	v_add_i32 v6, vcc, 1, v6
	ds_write_b8 v5, v6
	ds_read_u8 v5, v7
	s_waitcnt vmcnt(2) & lgkmcnt(0)
	v_lshlrev_b32 v6, 7, v9
	v_or_b32 v6, v6, v1
	v_add_i32 v6, vcc, v6, v2
	v_add_i32 v6, vcc, s13, v6
	v_add_i32 v5, vcc, 1, v5
	ds_write_b8 v7, v5
	s_waitcnt lgkmcnt(0)
	ds_read_u8 v5, v6
	v_lshlrev_b32 v7, 7, v10
	v_or_b32 v7, v7, v1
	v_add_i32 v7, vcc, v7, v2
	v_add_i32 v7, vcc, s13, v7
	s_waitcnt lgkmcnt(0)
	v_add_i32 v5, vcc, 1, v5
	ds_write_b8 v6, v5
	s_waitcnt lgkmcnt(0)
	ds_read_u8 v5, v7
	s_waitcnt lgkmcnt(0)
	v_add_i32 v5, vcc, 1, v5
	ds_write_b8 v7, v5
	s_waitcnt lgkmcnt(0)
	v_lshlrev_b32 v5, 7, v11
	v_or_b32 v5, v5, v1
	v_add_i32 v5, vcc, v5, v2
	v_add_i32 v5, vcc, s13, v5
	ds_read_u8 v6, v5
	v_lshlrev_b32 v7, 7, v12
	v_or_b32 v7, v7, v1
	v_add_i32 v7, vcc, v7, v2
	v_add_i32 v7, vcc, s13, v7
	s_waitcnt lgkmcnt(0)
	v_add_i32 v6, vcc, 1, v6
	ds_write_b8 v5, v6
	ds_read_u8 v5, v7
	s_waitcnt vmcnt(1) & lgkmcnt(0)
	v_lshlrev_b32 v6, 7, v13
	v_or_b32 v6, v6, v1
	v_add_i32 v6, vcc, v6, v2
	v_add_i32 v6, vcc, s13, v6
	v_add_i32 v5, vcc, 1, v5
	ds_write_b8 v7, v5
	s_waitcnt lgkmcnt(0)
	ds_read_u8 v5, v6
	v_lshlrev_b32 v7, 7, v14
	v_or_b32 v7, v7, v1
	v_add_i32 v7, vcc, v7, v2
	v_add_i32 v7, vcc, s13, v7
	s_waitcnt lgkmcnt(0)
	v_add_i32 v5, vcc, 1, v5
	ds_write_b8 v6, v5
	s_waitcnt lgkmcnt(0)
	ds_read_u8 v5, v7
	s_waitcnt lgkmcnt(0)
	v_add_i32 v5, vcc, 1, v5
	ds_write_b8 v7, v5
	s_waitcnt lgkmcnt(0)
	v_lshlrev_b32 v5, 7, v15
	v_or_b32 v5, v5, v1
	v_add_i32 v5, vcc, v5, v2
	v_add_i32 v5, vcc, s13, v5
	ds_read_u8 v6, v5
	v_lshlrev_b32 v7, 7, v16
	v_or_b32 v7, v7, v1
	v_add_i32 v7, vcc, v7, v2
	v_add_i32 v7, vcc, s13, v7
	s_waitcnt lgkmcnt(0)
	v_add_i32 v6, vcc, 1, v6
	ds_write_b8 v5, v6
	ds_read_u8 v5, v7
	s_waitcnt vmcnt(0) & lgkmcnt(0)
	v_lshlrev_b32 v6, 7, v17
	v_or_b32 v6, v6, v1
	v_add_i32 v6, vcc, v6, v2
	v_add_i32 v6, vcc, s13, v6
	v_add_i32 v5, vcc, 1, v5
	ds_write_b8 v7, v5
	s_waitcnt lgkmcnt(0)
	ds_read_u8 v5, v6
	v_lshlrev_b32 v7, 7, v18
	v_or_b32 v7, v7, v1
	v_add_i32 v7, vcc, v7, v2
	v_add_i32 v7, vcc, s13, v7
	s_waitcnt lgkmcnt(0)
	v_add_i32 v5, vcc, 1, v5
	ds_write_b8 v6, v5
	s_waitcnt lgkmcnt(0)
	ds_read_u8 v5, v7
	s_waitcnt lgkmcnt(0)
	v_add_i32 v5, vcc, 1, v5
	ds_write_b8 v7, v5
	s_waitcnt lgkmcnt(0)
	v_lshlrev_b32 v5, 7, v19
	v_or_b32 v5, v5, v1
	v_add_i32 v5, vcc, v5, v2
	v_add_i32 v5, vcc, s13, v5
	ds_read_u8 v6, v5
	v_lshlrev_b32 v7, 7, v20
	v_or_b32 v7, v7, v1
	v_add_i32 v7, vcc, v7, v2
	v_add_i32 v7, vcc, s13, v7
	s_waitcnt lgkmcnt(0)
	v_add_i32 v6, vcc, 1, v6
	ds_write_b8 v5, v6
	ds_read_u8 v5, v7
	s_waitcnt lgkmcnt(0)
	v_add_i32 v5, vcc, 1, v5
	ds_write_b8 v7, v5
	v_add_i32 v4, vcc, 4, v4
	v_cmp_eq_i32 vcc, 32, v4
	s_or_b64 s[0:1], vcc, s[0:1]
	s_waitcnt lgkmcnt(0)
	s_andn2_b64 exec, exec, s[0:1]
	s_cbranch_execnz BB0_5
// BB#3:                                 // %for.cond.cleanup.8
	s_or_b64 exec, exec, s[0:1]
	s_barrier
	v_cvt_f32_u32 v1, s2
	s_movk_i32 s3, 0x100
	v_mov_b32 v2, 0x101
	v_rcp_f32 v1, v1
	v_mul_f32 v1, 0x4f800000, v1
	v_cvt_u32_f32 v1, v1
	v_mul_hi_u32 v3, v1, s2
	v_mul_lo_i32 v4, v1, s2
	v_cmp_eq_i32 s[0:1], 0, v3
	v_sub_i32 v3, vcc, 0, v4
	v_cndmask_b32 v3, v4, v3, s[0:1]
	v_mul_hi_u32 v3, v3, v1
	v_add_i32 v4, vcc, v3, v1
	v_subrev_i32 v1, vcc, v3, v1
	v_cndmask_b32 v1, v1, v4, s[0:1]
	v_mul_hi_u32 v1, v1, s3
	v_mul_lo_i32 v3, v1, s2
	v_cmp_gt_u32 vcc, v2, v3
	v_cndmask_b32 v2, 0, -1, vcc
	v_sub_i32 v3, vcc, s3, v3
	v_cmp_le_u32 vcc, s2, v3
	v_cndmask_b32 v3, 0, -1, vcc
	v_and_b32 v3, v2, v3
	v_cmp_eq_i32 s[0:1], 0, v3
	v_add_i32 v3, vcc, 1, v1
	v_cndmask_b32 v3, v3, v1, s[0:1]
	v_add_i32 v1, vcc, -1, v1
	v_cmp_eq_i32 vcc, 0, v2
	v_cndmask_b32 v1, v3, v1, vcc
	v_cmp_ne_i32 vcc, 0, v1
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz BB0_8
// BB#4:                                 // %for.body.44.lr.ph
	v_lshlrev_b32 v2, 5, v0
	s_lshl_b32 s3, s12, 8
	v_add_i32 v3, vcc, s3, v0
	s_mov_b64 s[4:5], 0
	v_mov_b32 v4, 0
	s_mov_b64 s[6:7], 0
	s_mov_b32 m0, -1
BB0_9:                                  // %for.body.44
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_11 Depth 2
	v_mov_b32 v5, 0
	v_mov_b32 v6, v5
	v_lshlrev_b32 v8, 12, v4
	v_mov_b32 v7, v5
	v_add_i32 v10, vcc, v8, v2
	v_mov_b32 v8, v5
	s_mov_b64 s[10:11], 0
	v_mov_b32 v6, v5
	v_mov_b32 v7, v6
	v_mov_b32 v8, v7
	v_mov_b32 v9, v8
BB0_11:                                 // %for.body.51
                                        //   Parent Loop BB0_9 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	v_add_i32 v11, vcc, v5, v0
	v_or_b32 v12, 1, v5
	v_and_b32 v11, 31, v11
	v_add_i32 v12, vcc, v12, v0
	v_or_b32 v13, 2, v5
	v_or_b32 v14, 3, v5
	v_add_i32 v13, vcc, v13, v0
	v_add_i32 v14, vcc, v14, v0
	v_or_b32 v11, v10, v11
	v_and_b32 v12, 31, v12
	v_and_b32 v13, 31, v13
	v_and_b32 v14, 31, v14
	v_lshlrev_b32 v11, 2, v11
	v_or_b32 v12, v10, v12
	v_or_b32 v13, v10, v13
	v_or_b32 v14, v10, v14
	v_add_i32 v11, vcc, s13, v11
	v_lshlrev_b32 v12, 2, v12
	v_lshlrev_b32 v13, 2, v13
	v_lshlrev_b32 v14, 2, v14
	ds_read_u8 v15, v11
	v_add_i32 v16, vcc, 3, v11
	v_add_i32 v17, vcc, 2, v11
	v_add_i32 v11, vcc, 1, v11
	v_add_i32 v12, vcc, s13, v12
	v_add_i32 v13, vcc, s13, v13
	v_add_i32 v14, vcc, s13, v14
	ds_read_u8 v16, v16
	ds_read_u8 v17, v17
	ds_read_u8 v11, v11
	v_add_i32 v18, vcc, 1, v12
	v_add_i32 v19, vcc, 2, v12
	v_add_i32 v20, vcc, 3, v12
	ds_read_u8 v12, v12
	ds_read_u8 v21, v13
	v_add_i32 v22, vcc, 3, v13
	ds_read_u8 v18, v18
	ds_read_u8 v19, v19
	ds_read_u8 v20, v20
	ds_read_u8 v22, v22
	v_add_i32 v23, vcc, 3, v14
	ds_read_u8 v23, v23
	ds_read_u8 v24, v14
	v_add_i32 v25, vcc, 2, v13
	ds_read_u8 v25, v25
	v_add_i32 v13, vcc, 1, v13
	ds_read_u8 v13, v13
	v_add_i32 v26, vcc, 2, v14
	ds_read_u8 v26, v26
	v_add_i32 v14, vcc, 1, v14
	ds_read_u8 v14, v14
	s_waitcnt lgkmcnt(0)
	v_add_i32 v6, vcc, v15, v6
	v_add_i32 v7, vcc, v11, v7
	v_add_i32 v8, vcc, v17, v8
	v_add_i32 v9, vcc, v16, v9
	v_add_i32 v6, vcc, v12, v6
	v_add_i32 v9, vcc, v20, v9
	v_add_i32 v6, vcc, v21, v6
	v_add_i32 v9, vcc, v22, v9
	v_add_i32 v6, vcc, v24, v6
	v_add_i32 v9, vcc, v23, v9
	v_add_i32 v8, vcc, v19, v8
	v_add_i32 v7, vcc, v18, v7
	v_add_i32 v7, vcc, v13, v7
	v_add_i32 v8, vcc, v25, v8
	v_add_i32 v8, vcc, v26, v8
	v_add_i32 v5, vcc, 4, v5
	v_add_i32 v7, vcc, v14, v7
	v_cmp_eq_i32 vcc, 32, v5
	s_or_b64 s[10:11], vcc, s[10:11]
	s_andn2_b64 exec, exec, s[10:11]
	s_cbranch_execnz BB0_11
// BB#10:                                // %for.cond.cleanup.50
                                        //   in Loop: Header=BB0_9 Depth=1
	s_or_b64 exec, exec, s[10:11]
	v_mul_lo_i32 v5, v4, s2
	v_add_i32 v6, vcc, v6, v7
	v_add_i32 v6, vcc, v6, v8
	v_add_i32 v6, vcc, v6, v9
	v_add_i32 v5, vcc, v5, v3
	v_lshlrev_b32 v5, 2, v5
	v_add_i32 v5, vcc, s8, v5
	tbuffer_store_format_x v6, v5, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v4, vcc, 1, v4
	v_cmp_ge_u32 vcc, v4, v1
	s_or_b64 s[6:7], vcc, s[6:7]
	s_waitcnt vmcnt(0) & expcnt(0)
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB0_9
// BB#6:                                 // %Flow
	s_or_b64 exec, exec, s[6:7]
BB0_8:                                  // %Flow1
	s_or_b64 exec, exec, s[0:1]
// BB#7:                                 // %for.cond.cleanup.43
	s_endpgm

.args
	i32[4]* data 0 uav10 
	i8* sharedArray 16 hl
	i32* binResult 32 uav11 

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 1740
	// NumVgprs = 27
	// NumSgprs = 26
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1
.global	histogram256_scalar
.text

histogram256_scalar:                    // @histogram256_scalar
// BB#0:                                 // %entry
	s_buffer_load_dword s14, s[8:11], 0x0
	s_buffer_load_dword s13, s[8:11], 0x4
	s_buffer_load_dword s8, s[8:11], 0x8
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[20:23], s[2:3], 0x50
	s_buffer_load_dword s0, s[4:7], 0x4
	v_lshlrev_b32 v1, 2, v0
	s_mov_b64 s[4:5], 0
	v_and_b32 v1, 0x7c, v1
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s0, 0xffff
	v_mov_b32 v2, 0
	s_mov_b32 m0, -1
BB1_2:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_or_b32 v3, 1, v2
	v_or_b32 v4, 2, v2
	v_or_b32 v5, 3, v2
	v_or_b32 v6, 4, v2
	v_or_b32 v7, 5, v2
	v_or_b32 v8, 6, v2
	v_or_b32 v9, 7, v2
	v_or_b32 v10, 8, v2
	v_or_b32 v11, 9, v2
	v_or_b32 v12, 10, v2
	v_or_b32 v13, 11, v2
	v_or_b32 v14, 12, v2
	v_or_b32 v15, 13, v2
	v_or_b32 v16, 14, v2
	v_or_b32 v17, 15, v2
	v_mul_lo_i32 v18, v2, s2
	v_mov_b32 v19, 0
	v_add_i32 v18, vcc, v18, v0
	v_lshlrev_b32 v18, 2, v18
	v_add_i32 v18, vcc, s13, v18
	ds_write_b8 v18, v19
	v_add_i32 v20, vcc, 3, v18
	ds_write_b8 v20, v19
	v_mul_lo_i32 v3, v3, s2
	v_add_i32 v20, vcc, 2, v18
	ds_write_b8 v20, v19
	v_add_i32 v18, vcc, 1, v18
	ds_write_b8 v18, v19
	v_add_i32 v3, vcc, v3, v0
	v_lshlrev_b32 v3, 2, v3
	v_add_i32 v3, vcc, s13, v3
	v_add_i32 v18, vcc, 3, v3
	ds_write_b8 v18, v19
	v_add_i32 v18, vcc, 2, v3
	ds_write_b8 v18, v19
	v_add_i32 v18, vcc, 1, v3
	ds_write_b8 v18, v19
	v_add_i32 v2, vcc, 16, v2
	v_mul_lo_i32 v4, v4, s2
	v_mul_lo_i32 v5, v5, s2
	v_mul_lo_i32 v6, v6, s2
	v_mul_lo_i32 v7, v7, s2
	v_mul_lo_i32 v8, v8, s2
	v_mul_lo_i32 v9, v9, s2
	v_mul_lo_i32 v10, v10, s2
	v_mul_lo_i32 v11, v11, s2
	v_mul_lo_i32 v12, v12, s2
	v_mul_lo_i32 v13, v13, s2
	v_mul_lo_i32 v14, v14, s2
	v_mul_lo_i32 v15, v15, s2
	v_mul_lo_i32 v16, v16, s2
	v_mul_lo_i32 v17, v17, s2
	v_add_i32 v4, vcc, v4, v0
	v_add_i32 v5, vcc, v5, v0
	v_lshlrev_b32 v4, 2, v4
	v_lshlrev_b32 v5, 2, v5
	v_add_i32 v4, vcc, s13, v4
	v_add_i32 v5, vcc, s13, v5
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 3, v4
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 2, v4
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 1, v4
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 3, v5
	ds_write_b8 v4, v19
	v_add_i32 v4, vcc, 2, v5
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 1, v5
	ds_write_b8 v4, v19
	ds_write_b8 v3, v19
	v_cmp_eq_i32 s[0:1], 64, v2
	v_add_i32 v3, vcc, v6, v0
	v_add_i32 v4, vcc, v7, v0
	v_add_i32 v6, vcc, v8, v0
	v_add_i32 v7, vcc, v9, v0
	v_add_i32 v8, vcc, v10, v0
	v_add_i32 v9, vcc, v11, v0
	v_add_i32 v10, vcc, v12, v0
	v_add_i32 v11, vcc, v13, v0
	v_add_i32 v12, vcc, v14, v0
	v_add_i32 v13, vcc, v15, v0
	v_add_i32 v14, vcc, v16, v0
	v_add_i32 v15, vcc, v17, v0
	v_lshlrev_b32 v3, 2, v3
	v_lshlrev_b32 v4, 2, v4
	v_lshlrev_b32 v6, 2, v6
	v_lshlrev_b32 v7, 2, v7
	v_lshlrev_b32 v8, 2, v8
	v_lshlrev_b32 v9, 2, v9
	v_lshlrev_b32 v10, 2, v10
	v_lshlrev_b32 v11, 2, v11
	v_lshlrev_b32 v12, 2, v12
	v_lshlrev_b32 v13, 2, v13
	v_lshlrev_b32 v14, 2, v14
	v_lshlrev_b32 v15, 2, v15
	v_add_i32 v3, vcc, s13, v3
	v_add_i32 v4, vcc, s13, v4
	v_add_i32 v6, vcc, s13, v6
	v_add_i32 v7, vcc, s13, v7
	v_add_i32 v8, vcc, s13, v8
	v_add_i32 v9, vcc, s13, v9
	v_add_i32 v10, vcc, s13, v10
	v_add_i32 v11, vcc, s13, v11
	v_add_i32 v12, vcc, s13, v12
	v_add_i32 v13, vcc, s13, v13
	v_add_i32 v14, vcc, s13, v14
	v_add_i32 v15, vcc, s13, v15
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 3, v3
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 2, v3
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 1, v3
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 3, v4
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 2, v4
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 1, v4
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 3, v6
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 2, v6
	ds_write_b8 v4, v19
	v_add_i32 v4, vcc, 1, v6
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 3, v7
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 2, v7
	ds_write_b8 v4, v19
	v_add_i32 v4, vcc, 1, v7
	ds_write_b8 v6, v19
	v_add_i32 v6, vcc, 3, v8
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 2, v8
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 1, v8
	ds_write_b8 v4, v19
	v_add_i32 v4, vcc, 3, v9
	ds_write_b8 v7, v19
	v_add_i32 v7, vcc, 2, v9
	ds_write_b8 v6, v19
	v_add_i32 v6, vcc, 1, v9
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 3, v10
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 2, v10
	ds_write_b8 v8, v19
	v_add_i32 v8, vcc, 1, v10
	ds_write_b8 v4, v19
	v_add_i32 v4, vcc, 3, v11
	ds_write_b8 v7, v19
	v_add_i32 v7, vcc, 2, v11
	ds_write_b8 v6, v19
	v_add_i32 v6, vcc, 1, v11
	ds_write_b8 v9, v19
	v_add_i32 v9, vcc, 3, v12
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 2, v12
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 1, v12
	ds_write_b8 v8, v19
	v_add_i32 v8, vcc, 3, v13
	ds_write_b8 v10, v19
	v_add_i32 v10, vcc, 2, v13
	ds_write_b8 v4, v19
	v_add_i32 v4, vcc, 1, v13
	ds_write_b8 v7, v19
	v_add_i32 v7, vcc, 3, v14
	ds_write_b8 v6, v19
	v_add_i32 v6, vcc, 2, v14
	ds_write_b8 v11, v19
	v_add_i32 v11, vcc, 1, v14
	ds_write_b8 v9, v19
	v_add_i32 v9, vcc, 3, v15
	ds_write_b8 v3, v19
	v_add_i32 v3, vcc, 2, v15
	ds_write_b8 v5, v19
	v_add_i32 v5, vcc, 1, v15
	ds_write_b8 v12, v19
	ds_write_b8 v8, v19
	ds_write_b8 v10, v19
	ds_write_b8 v4, v19
	ds_write_b8 v13, v19
	ds_write_b8 v7, v19
	ds_write_b8 v6, v19
	ds_write_b8 v11, v19
	ds_write_b8 v14, v19
	ds_write_b8 v9, v19
	ds_write_b8 v3, v19
	ds_write_b8 v5, v19
	ds_write_b8 v15, v19
	s_or_b64 s[4:5], s[0:1], s[4:5]
	s_waitcnt lgkmcnt(0)
	s_andn2_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB1_2
// BB#1:                                 // %for.cond.cleanup
	s_or_b64 exec, exec, s[4:5]
	s_barrier
	v_lshrrev_b32 v2, 5, v0
	s_lshl_b32 s3, s12, 7
	s_mov_b64 s[0:1], 0
	v_mov_b32 v3, 0
	s_mov_b32 m0, -1
BB1_5:                                  // %for.body.9
                                        // =>This Inner Loop Header: Depth=1
	v_add_i32 v4, vcc, s3, v3
	v_mul_lo_i32 v4, v4, s2
	v_add_i32 v4, vcc, v4, v0
	v_lshlrev_b32 v4, 2, v4
	v_add_i32 v4, vcc, s14, v4
	tbuffer_load_format_x v4, v4, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v5, 1, v3
	v_add_i32 v5, vcc, s3, v5
	v_mul_lo_i32 v5, v5, s2
	v_add_i32 v5, vcc, v5, v0
	v_lshlrev_b32 v5, 2, v5
	v_add_i32 v5, vcc, s14, v5
	tbuffer_load_format_x v5, v5, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v6, 2, v3
	v_add_i32 v6, vcc, s3, v6
	v_mul_lo_i32 v6, v6, s2
	v_add_i32 v6, vcc, v6, v0
	v_lshlrev_b32 v6, 2, v6
	v_add_i32 v6, vcc, s14, v6
	tbuffer_load_format_x v6, v6, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v7, 3, v3
	v_add_i32 v7, vcc, s3, v7
	v_mul_lo_i32 v7, v7, s2
	v_add_i32 v7, vcc, v7, v0
	v_lshlrev_b32 v7, 2, v7
	v_add_i32 v7, vcc, s14, v7
	tbuffer_load_format_x v7, v7, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v8, 4, v3
	v_add_i32 v8, vcc, s3, v8
	v_mul_lo_i32 v8, v8, s2
	v_add_i32 v8, vcc, v8, v0
	v_lshlrev_b32 v8, 2, v8
	v_add_i32 v8, vcc, s14, v8
	tbuffer_load_format_x v8, v8, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v9, 5, v3
	v_add_i32 v9, vcc, s3, v9
	v_mul_lo_i32 v9, v9, s2
	v_add_i32 v9, vcc, v9, v0
	v_lshlrev_b32 v9, 2, v9
	v_add_i32 v9, vcc, s14, v9
	tbuffer_load_format_x v9, v9, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v10, 6, v3
	v_add_i32 v10, vcc, s3, v10
	v_mul_lo_i32 v10, v10, s2
	v_add_i32 v10, vcc, v10, v0
	v_lshlrev_b32 v10, 2, v10
	v_add_i32 v10, vcc, s14, v10
	tbuffer_load_format_x v10, v10, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v11, 7, v3
	v_add_i32 v11, vcc, s3, v11
	v_mul_lo_i32 v11, v11, s2
	v_add_i32 v11, vcc, v11, v0
	v_lshlrev_b32 v11, 2, v11
	v_add_i32 v11, vcc, s14, v11
	tbuffer_load_format_x v11, v11, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(7)
	v_lshlrev_b32 v4, 7, v4
	v_or_b32 v4, v4, v1
	v_add_i32 v4, vcc, v4, v2
	v_add_i32 v4, vcc, s13, v4
	ds_read_u8 v12, v4
	s_waitcnt vmcnt(6)
	v_lshlrev_b32 v5, 7, v5
	v_or_b32 v5, v5, v1
	v_add_i32 v5, vcc, v5, v2
	v_add_i32 v5, vcc, s13, v5
	s_waitcnt lgkmcnt(0)
	v_add_i32 v12, vcc, 1, v12
	ds_write_b8 v4, v12
	ds_read_u8 v4, v5
	s_waitcnt vmcnt(5)
	v_lshlrev_b32 v6, 7, v6
	v_or_b32 v6, v6, v1
	v_add_i32 v6, vcc, v6, v2
	v_add_i32 v6, vcc, s13, v6
	s_waitcnt lgkmcnt(0)
	v_add_i32 v4, vcc, 1, v4
	ds_write_b8 v5, v4
	s_waitcnt lgkmcnt(0)
	ds_read_u8 v4, v6
	s_waitcnt vmcnt(4)
	v_lshlrev_b32 v5, 7, v7
	v_or_b32 v5, v5, v1
	v_add_i32 v5, vcc, v5, v2
	v_add_i32 v5, vcc, s13, v5
	s_waitcnt lgkmcnt(0)
	v_add_i32 v4, vcc, 1, v4
	ds_write_b8 v6, v4
	s_waitcnt lgkmcnt(0)
	ds_read_u8 v4, v5
	s_waitcnt vmcnt(3)
	v_lshlrev_b32 v6, 7, v8
	v_or_b32 v6, v6, v1
	v_add_i32 v6, vcc, v6, v2
	v_add_i32 v6, vcc, s13, v6
	s_waitcnt lgkmcnt(0)
	v_add_i32 v4, vcc, 1, v4
	ds_write_b8 v5, v4
	s_waitcnt lgkmcnt(0)
	ds_read_u8 v4, v6
	s_waitcnt vmcnt(2)
	v_lshlrev_b32 v5, 7, v9
	v_or_b32 v5, v5, v1
	v_add_i32 v5, vcc, v5, v2
	v_add_i32 v5, vcc, s13, v5
	s_waitcnt lgkmcnt(0)
	v_add_i32 v4, vcc, 1, v4
	ds_write_b8 v6, v4
	s_waitcnt lgkmcnt(0)
	ds_read_u8 v4, v5
	s_waitcnt vmcnt(1)
	v_lshlrev_b32 v6, 7, v10
	v_or_b32 v6, v6, v1
	v_add_i32 v6, vcc, v6, v2
	v_add_i32 v6, vcc, s13, v6
	s_waitcnt lgkmcnt(0)
	v_add_i32 v4, vcc, 1, v4
	ds_write_b8 v5, v4
	s_waitcnt lgkmcnt(0)
	ds_read_u8 v4, v6
	s_waitcnt vmcnt(0)
	v_lshlrev_b32 v5, 7, v11
	v_or_b32 v5, v5, v1
	v_add_i32 v5, vcc, v5, v2
	v_add_i32 v5, vcc, s13, v5
	s_waitcnt lgkmcnt(0)
	v_add_i32 v4, vcc, 1, v4
	ds_write_b8 v6, v4
	s_waitcnt lgkmcnt(0)
	ds_read_u8 v4, v5
	s_waitcnt lgkmcnt(0)
	v_add_i32 v4, vcc, 1, v4
	ds_write_b8 v5, v4
	v_add_i32 v3, vcc, 8, v3
	s_waitcnt lgkmcnt(0)
	v_mov_b32 v4, 0x80
	v_cmp_eq_i32 vcc, v4, v3
	s_or_b64 s[0:1], vcc, s[0:1]
	s_andn2_b64 exec, exec, s[0:1]
	s_cbranch_execnz BB1_5
// BB#3:                                 // %for.cond.cleanup.8
	s_or_b64 exec, exec, s[0:1]
	s_barrier
	v_cvt_f32_u32 v1, s2
	s_movk_i32 s3, 0x100
	v_mov_b32 v2, 0x101
	v_rcp_f32 v1, v1
	v_mul_f32 v1, 0x4f800000, v1
	v_cvt_u32_f32 v1, v1
	v_mul_hi_u32 v3, v1, s2
	v_mul_lo_i32 v4, v1, s2
	v_cmp_eq_i32 s[0:1], 0, v3
	v_sub_i32 v3, vcc, 0, v4
	v_cndmask_b32 v3, v4, v3, s[0:1]
	v_mul_hi_u32 v3, v3, v1
	v_add_i32 v4, vcc, v3, v1
	v_subrev_i32 v1, vcc, v3, v1
	v_cndmask_b32 v1, v1, v4, s[0:1]
	v_mul_hi_u32 v1, v1, s3
	v_mul_lo_i32 v3, v1, s2
	v_cmp_gt_u32 vcc, v2, v3
	v_cndmask_b32 v2, 0, -1, vcc
	v_sub_i32 v3, vcc, s3, v3
	v_cmp_le_u32 vcc, s2, v3
	v_cndmask_b32 v3, 0, -1, vcc
	v_and_b32 v3, v2, v3
	v_cmp_eq_i32 s[0:1], 0, v3
	v_add_i32 v3, vcc, 1, v1
	v_cndmask_b32 v3, v3, v1, s[0:1]
	v_add_i32 v1, vcc, -1, v1
	v_cmp_eq_i32 vcc, 0, v2
	v_cndmask_b32 v1, v3, v1, vcc
	v_cmp_ne_i32 vcc, 0, v1
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz BB1_8
// BB#4:                                 // %for.body.28.lr.ph
	v_lshlrev_b32 v2, 5, v0
	s_lshl_b32 s3, s12, 8
	v_add_i32 v3, vcc, s3, v0
	s_mov_b64 s[4:5], 0
	v_mov_b32 v4, 0
	s_mov_b64 s[6:7], 0
	s_mov_b32 m0, -1
BB1_9:                                  // %for.body.28
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_11 Depth 2
	v_mov_b32 v9, 0
	v_mov_b32 v10, v9
	v_lshlrev_b32 v5, 12, v4
	v_mov_b32 v11, v9
	v_add_i32 v13, vcc, v5, v2
	v_mov_b32 v12, v9
	s_mov_b64 s[10:11], 0
	v_mov_b32 v5, v9
	v_mov_b32 v6, v10
	v_mov_b32 v7, v11
	v_mov_b32 v8, v12
BB1_11:                                 // %for.body.35
                                        //   Parent Loop BB1_9 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	v_add_i32 v10, vcc, v9, v0
	v_or_b32 v11, 1, v9
	v_and_b32 v10, 31, v10
	v_add_i32 v11, vcc, v11, v0
	v_or_b32 v12, 2, v9
	v_or_b32 v14, 3, v9
	v_add_i32 v12, vcc, v12, v0
	v_add_i32 v14, vcc, v14, v0
	v_or_b32 v10, v13, v10
	v_and_b32 v11, 31, v11
	v_and_b32 v12, 31, v12
	v_and_b32 v14, 31, v14
	v_lshlrev_b32 v10, 2, v10
	v_or_b32 v11, v13, v11
	v_or_b32 v12, v13, v12
	v_or_b32 v14, v13, v14
	v_add_i32 v10, vcc, s13, v10
	v_lshlrev_b32 v11, 2, v11
	v_lshlrev_b32 v12, 2, v12
	v_lshlrev_b32 v14, 2, v14
	ds_read_u8 v15, v10
	v_add_i32 v16, vcc, 3, v10
	v_add_i32 v17, vcc, 2, v10
	v_add_i32 v10, vcc, 1, v10
	v_add_i32 v11, vcc, s13, v11
	v_add_i32 v12, vcc, s13, v12
	v_add_i32 v14, vcc, s13, v14
	ds_read_u8 v16, v16
	ds_read_u8 v17, v17
	ds_read_u8 v10, v10
	v_add_i32 v18, vcc, 1, v11
	v_add_i32 v19, vcc, 2, v11
	v_add_i32 v20, vcc, 3, v11
	ds_read_u8 v11, v11
	ds_read_u8 v21, v12
	v_add_i32 v22, vcc, 3, v12
	ds_read_u8 v18, v18
	ds_read_u8 v19, v19
	ds_read_u8 v20, v20
	ds_read_u8 v22, v22
	v_add_i32 v23, vcc, 3, v14
	ds_read_u8 v23, v23
	ds_read_u8 v24, v14
	v_add_i32 v25, vcc, 2, v12
	ds_read_u8 v25, v25
	v_add_i32 v12, vcc, 1, v12
	ds_read_u8 v12, v12
	v_add_i32 v26, vcc, 2, v14
	ds_read_u8 v26, v26
	v_add_i32 v14, vcc, 1, v14
	ds_read_u8 v14, v14
	s_waitcnt lgkmcnt(0)
	v_add_i32 v5, vcc, v15, v5
	v_add_i32 v6, vcc, v10, v6
	v_add_i32 v7, vcc, v17, v7
	v_add_i32 v8, vcc, v16, v8
	v_add_i32 v5, vcc, v11, v5
	v_add_i32 v8, vcc, v20, v8
	v_add_i32 v5, vcc, v21, v5
	v_add_i32 v8, vcc, v22, v8
	v_add_i32 v5, vcc, v24, v5
	v_add_i32 v8, vcc, v23, v8
	v_add_i32 v7, vcc, v19, v7
	v_add_i32 v6, vcc, v18, v6
	v_add_i32 v6, vcc, v12, v6
	v_add_i32 v7, vcc, v25, v7
	v_add_i32 v7, vcc, v26, v7
	v_add_i32 v9, vcc, 4, v9
	v_add_i32 v6, vcc, v14, v6
	v_cmp_eq_i32 vcc, 32, v9
	s_or_b64 s[10:11], vcc, s[10:11]
	s_andn2_b64 exec, exec, s[10:11]
	s_cbranch_execnz BB1_11
// BB#10:                                // %for.cond.cleanup.34
                                        //   in Loop: Header=BB1_9 Depth=1
	s_or_b64 exec, exec, s[10:11]
	v_mul_lo_i32 v9, v4, s2
	v_add_i32 v5, vcc, v5, v6
	v_add_i32 v5, vcc, v5, v7
	v_add_i32 v5, vcc, v5, v8
	v_add_i32 v6, vcc, v9, v3
	v_lshlrev_b32 v6, 2, v6
	v_add_i32 v6, vcc, s8, v6
	tbuffer_store_format_x v5, v6, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v4, vcc, 1, v4
	v_cmp_ge_u32 vcc, v4, v1
	s_or_b64 s[6:7], vcc, s[6:7]
	s_waitcnt vmcnt(0) & expcnt(0)
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB1_9
// BB#6:                                 // %Flow
	s_or_b64 exec, exec, s[6:7]
BB1_8:                                  // %Flow1
	s_or_b64 exec, exec, s[0:1]
// BB#7:                                 // %for.cond.cleanup.27
	s_endpgm

.args
	i32* data 0 uav10 
	i8* sharedArray 16 hl
	i32* binResult 32 uav11 

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 1680
	// NumVgprs = 27
	// NumSgprs = 26
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

