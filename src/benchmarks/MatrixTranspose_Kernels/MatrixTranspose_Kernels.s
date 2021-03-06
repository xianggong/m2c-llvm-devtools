.global	matrixTranspose
.text

matrixTranspose:                        // @matrixTranspose
// BB#0:                                 // %entry
	s_buffer_load_dword s14, s[8:11], 0x0
	s_buffer_load_dword s15, s[8:11], 0x4
	s_buffer_load_dword s20, s[8:11], 0x8
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[8:11], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x0
	s_buffer_load_dword s3, s[4:7], 0x4
	s_buffer_load_dword s4, s[4:7], 0x8
	s_waitcnt lgkmcnt(0)
	v_cvt_f32_u32 v2, s4
	v_rcp_f32 v2, v2
	v_mul_f32 v2, 0x4f800000, v2
	v_cvt_u32_f32 v2, v2
	v_mul_hi_u32 v3, v2, s4
	v_mul_lo_i32 v4, v2, s4
	v_cmp_eq_i32 s[0:1], 0, v3
	v_sub_i32 v3, vcc, 0, v4
	v_cndmask_b32 v3, v4, v3, s[0:1]
	v_mul_hi_u32 v3, v3, v2
	v_add_i32 v4, vcc, v3, v2
	v_subrev_i32 v2, vcc, v3, v2
	v_cndmask_b32 v2, v2, v4, s[0:1]
	s_add_i32 s0, s13, s12
	v_mul_hi_u32 v2, v2, s0
	v_mul_lo_i32 v2, v2, s4
	v_sub_i32 v3, vcc, s0, v2
	v_cmp_ge_u32 vcc, s0, v2
	v_cndmask_b32 v2, 0, -1, vcc
	v_cmp_le_u32 vcc, s4, v3
	v_cndmask_b32 v4, 0, -1, vcc
	v_and_b32 v4, v2, v4
	v_subrev_i32 v5, vcc, s4, v3
	v_cmp_eq_i32 vcc, 0, v4
	v_cndmask_b32 v4, v5, v3, vcc
	v_add_i32 v3, vcc, s4, v3
	v_cmp_eq_i32 vcc, 0, v2
	v_cndmask_b32 v2, v4, v3, vcc
	s_min_u32 s0, s3, 0xffff
	s_lshl_b32 s1, s2, 2
	s_mul_i32 s3, s0, s12
	v_mul_lo_i32 v2, s0, v2
	v_add_i32 v3, vcc, s3, v1
	v_mul_lo_i32 v3, s1, v3
	v_add_i32 v4, vcc, v0, v2
	v_add_i32 v3, vcc, v3, v4
	v_lshlrev_b32 v4, 4, v3
	v_add_i32 v4, vcc, s15, v4
	tbuffer_load_format_xyzw v[4:7], v4, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v8, vcc, s2, v3
	v_lshlrev_b32 v8, 4, v8
	v_add_i32 v8, vcc, s15, v8
	tbuffer_load_format_xyzw v[8:11], v8, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_lshl_b32 s4, s2, 1
	v_add_i32 v12, vcc, s4, v3
	v_lshlrev_b32 v12, 4, v12
	v_add_i32 v12, vcc, s15, v12
	tbuffer_load_format_xyzw v[12:15], v12, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_mul_i32 s5, s2, 3
	v_add_i32 v3, vcc, s5, v3
	v_lshlrev_b32 v3, 4, v3
	v_add_i32 v3, vcc, s15, v3
	tbuffer_load_format_xyzw v[16:19], v3, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_mul_lo_i32 v3, v1, s0
	v_lshlrev_b32 v3, 2, v3
	v_add_i32 v3, vcc, v0, v3
	v_lshlrev_b32 v20, 4, v3
	v_add_i32 v20, vcc, s20, v20
	s_mov_b32 m0, -1
	v_add_i32 v21, vcc, 12, v20
	s_waitcnt vmcnt(3)
	ds_write_b32 v21, v7
	s_waitcnt lgkmcnt(0)
	v_add_i32 v7, vcc, 8, v20
	ds_write_b32 v7, v6
	s_waitcnt lgkmcnt(0)
	v_add_i32 v6, vcc, 4, v20
	ds_write_b32 v6, v5
	ds_write_b32 v20, v4
	s_waitcnt lgkmcnt(0)
	v_add_i32 v4, vcc, s0, v3
	v_lshlrev_b32 v4, 4, v4
	v_add_i32 v4, vcc, s20, v4
	v_add_i32 v5, vcc, 12, v4
	s_waitcnt vmcnt(2)
	ds_write_b32 v5, v11
	v_add_i32 v5, vcc, 8, v4
	ds_write_b32 v5, v10
	v_add_i32 v5, vcc, 4, v4
	ds_write_b32 v5, v9
	ds_write_b32 v4, v8
	s_lshl_b32 s6, s0, 1
	v_add_i32 v4, vcc, s6, v3
	v_lshlrev_b32 v4, 4, v4
	v_add_i32 v4, vcc, s20, v4
	v_add_i32 v5, vcc, 12, v4
	s_waitcnt vmcnt(1)
	ds_write_b32 v5, v15
	v_add_i32 v5, vcc, 8, v4
	ds_write_b32 v5, v14
	v_add_i32 v5, vcc, 4, v4
	ds_write_b32 v5, v13
	ds_write_b32 v4, v12
	s_mul_i32 s7, s0, 3
	v_add_i32 v3, vcc, s7, v3
	v_lshlrev_b32 v3, 4, v3
	v_add_i32 v3, vcc, s20, v3
	v_add_i32 v4, vcc, 12, v3
	s_waitcnt vmcnt(0)
	ds_write_b32 v4, v19
	v_add_i32 v4, vcc, 8, v3
	ds_write_b32 v4, v18
	v_add_i32 v4, vcc, 4, v3
	ds_write_b32 v4, v17
	ds_write_b32 v3, v16
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_mul_lo_i32 v3, v0, s0
	v_lshlrev_b32 v3, 2, v3
	v_add_i32 v3, vcc, v1, v3
	v_lshlrev_b32 v4, 4, v3
	v_add_i32 v4, vcc, s20, v4
	v_add_i32 v5, vcc, 12, v4
	v_add_i32 v6, vcc, 8, v4
	ds_read_b32 v10, v5
	ds_read_b32 v9, v6
	v_add_i32 v5, vcc, 4, v4
	ds_read_b32 v8, v5
	ds_read_b32 v7, v4
	v_add_i32 v4, vcc, s0, v3
	v_lshlrev_b32 v4, 4, v4
	v_add_i32 v4, vcc, s20, v4
	v_add_i32 v5, vcc, 12, v4
	v_add_i32 v6, vcc, 8, v4
	ds_read_b32 v18, v5
	ds_read_b32 v17, v6
	v_add_i32 v5, vcc, 4, v4
	ds_read_b32 v16, v5
	ds_read_b32 v15, v4
	v_add_i32 v4, vcc, s6, v3
	v_lshlrev_b32 v4, 4, v4
	v_add_i32 v4, vcc, s20, v4
	v_add_i32 v5, vcc, 12, v4
	v_add_i32 v6, vcc, 8, v4
	ds_read_b32 v26, v5
	ds_read_b32 v25, v6
	v_add_i32 v5, vcc, 4, v4
	ds_read_b32 v24, v5
	ds_read_b32 v23, v4
	v_add_i32 v3, vcc, s7, v3
	v_lshlrev_b32 v3, 4, v3
	v_add_i32 v3, vcc, s20, v3
	v_add_i32 v4, vcc, 12, v3
	v_add_i32 v5, vcc, 8, v3
	ds_read_b32 v34, v4
	ds_read_b32 v33, v5
	v_add_i32 v4, vcc, 4, v3
	ds_read_b32 v32, v4
	ds_read_b32 v31, v3
	v_add_i32 v1, vcc, v1, v2
	v_mul_lo_i32 v1, s1, v1
	s_waitcnt lgkmcnt(0)
	v_mov_b32 v14, v7
	v_mov_b32 v21, v14
	v_mov_b32 v22, v15
	v_mov_b32 v28, v21
	v_add_i32 v0, vcc, s3, v0
	v_mov_b32 v29, v22
	v_add_i32 v0, vcc, v0, v1
	v_mov_b32 v30, v23
	v_lshlrev_b32 v1, 4, v0
	v_add_i32 v1, vcc, s14, v1
	v_mov_b32 v15, v8
	v_mov_b32 v22, v15
	tbuffer_store_format_xyzw v[28:31], v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_mov_b32 v23, v16
	s_waitcnt vmcnt(0) & expcnt(0)
	v_mov_b32 v29, v22
	v_mov_b32 v30, v23
	v_mov_b32 v31, v24
	v_add_i32 v1, vcc, s2, v0
	v_lshlrev_b32 v1, 4, v1
	v_add_i32 v1, vcc, s14, v1
	v_mov_b32 v16, v9
	v_mov_b32 v23, v16
	tbuffer_store_format_xyzw v[29:32], v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_mov_b32 v24, v17
	s_waitcnt vmcnt(0) & expcnt(0)
	v_mov_b32 v30, v23
	v_mov_b32 v11, v18
	v_mov_b32 v31, v24
	v_mov_b32 v32, v25
	v_mov_b32 v12, v26
	v_add_i32 v1, vcc, s4, v0
	v_lshlrev_b32 v1, 4, v1
	v_add_i32 v1, vcc, s14, v1
	tbuffer_store_format_xyzw v[30:33], v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_mov_b32 v13, v34
	v_add_i32 v0, vcc, s5, v0
	v_lshlrev_b32 v0, 4, v0
	v_add_i32 v0, vcc, s14, v0
	tbuffer_store_format_xyzw v[10:13], v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

.args
	float[4]* output 0 uav10 
	float[4]* input 16 uav11 
	float[4]* block 32 hl

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 680
	// NumVgprs = 35
	// NumSgprs = 23
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

