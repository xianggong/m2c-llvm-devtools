.global	matrixTranspose
.text


matrixTranspose:                        // @matrixTranspose
// BB#0:                                 // %entry
	s_buffer_load_dword s14, s[8:11], 0x0
	s_buffer_load_dword s15, s[8:11], 0x4
	s_buffer_load_dword s11, s[8:11], 0x8
	s_buffer_load_dword s9, s[4:7], 0x0
	s_buffer_load_dword s0, s[4:7], 0x4
	s_waitcnt lgkmcnt(0)
	s_min_u32 s20, s0, 0xffff
	s_buffer_load_dword s21, s[4:7], 0x8
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[4:7], s[2:3], 0x50
	s_lshl_b32 s22, s20, 1
	s_mul_i32 s23, s20, 3
	s_mov_b32 m0, -1
	s_lshl_b32 s10, s9, 1
	s_mul_i32 s8, s9, 3
	s_add_i32 s2, s13, s12
	s_lshl_b32 s13, s9, 2
	s_mul_i32 s12, s20, s12
	s_waitcnt lgkmcnt(0)
	v_cvt_f32_u32 v2, s21
	v_rcp_f32 v2, v2
	v_mul_f32 v2, 0x4f800000, v2
	v_cvt_u32_f32 v2, v2
	v_mul_lo_i32 v3, v2, s21
	v_sub_i32 v4, vcc, 0, v3
	v_mul_hi_u32 v5, v2, s21
	v_cmp_eq_i32 s[0:1], 0, v5
	v_cndmask_b32 v3, v3, v4, s[0:1]
	v_mul_hi_u32 v3, v3, v2
	v_subrev_i32 v4, vcc, v3, v2
	v_add_i32 v2, vcc, v3, v2
	v_cndmask_b32 v2, v4, v2, s[0:1]
	v_mul_hi_u32 v2, v2, s2
	v_mul_lo_i32 v2, v2, s21
	v_cmp_ge_u32 s[0:1], s2, v2
	v_sub_i32 v2, vcc, s2, v2
	v_cmp_le_u32 s[2:3], s21, v2
	v_subrev_i32 v3, vcc, s21, v2
	v_cndmask_b32 v4, 0, -1, s[2:3]
	v_cndmask_b32 v5, 0, -1, s[0:1]
	v_and_b32 v4, v5, v4
	v_cmp_eq_i32 vcc, 0, v4
	v_cndmask_b32 v3, v3, v2, vcc
	v_cmp_eq_i32 s[0:1], 0, v5
	v_add_i32 v2, vcc, s21, v2
	v_cndmask_b32 v2, v3, v2, s[0:1]
	v_mul_lo_i32 v2, s20, v2
	v_add_i32 v3, vcc, v0, v2
	v_add_i32 v4, vcc, s12, v1
	v_mul_lo_i32 v4, s13, v4
	v_add_i32 v3, vcc, v4, v3
	v_lshlrev_b32 v4, 4, v3
	v_add_i32 v4, vcc, s15, v4
	tbuffer_load_format_xyzw v[4:7], v4, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v8, vcc, s12, v0
	v_add_i32 v2, vcc, v1, v2
	v_mul_lo_i32 v2, s13, v2
	v_add_i32 v2, vcc, v8, v2
	v_mul_lo_i32 v8, v1, s20
	v_lshlrev_b32 v8, 2, v8
	v_add_i32 v8, vcc, v0, v8
	v_add_i32 v9, vcc, s23, v8
	v_lshlrev_b32 v9, 4, v9
	v_add_i32 v9, vcc, s11, v9
	v_add_i32 v10, vcc, s22, v8
	v_lshlrev_b32 v10, 4, v10
	v_add_i32 v10, vcc, s11, v10
	v_add_i32 v11, vcc, s20, v8
	v_lshlrev_b32 v11, 4, v11
	v_add_i32 v11, vcc, s11, v11
	v_lshlrev_b32 v8, 4, v8
	v_add_i32 v8, vcc, s11, v8
	v_add_i32 v12, vcc, 4, v8
	v_add_i32 v13, vcc, 8, v8
	v_add_i32 v14, vcc, 12, v8
	v_add_i32 v15, vcc, 4, v11
	v_add_i32 v16, vcc, 8, v11
	v_add_i32 v17, vcc, 12, v11
	v_add_i32 v18, vcc, 4, v10
	v_add_i32 v19, vcc, 8, v10
	v_add_i32 v20, vcc, 12, v10
	v_add_i32 v21, vcc, 4, v9
	v_add_i32 v22, vcc, 8, v9
	v_add_i32 v23, vcc, 12, v9
	v_mul_lo_i32 v0, v0, s20
	v_lshlrev_b32 v0, 2, v0
	v_add_i32 v0, vcc, v1, v0
	v_add_i32 v1, vcc, s23, v0
	v_lshlrev_b32 v1, 4, v1
	v_add_i32 v1, vcc, s11, v1
	v_add_i32 v24, vcc, 4, v1
	v_add_i32 v25, vcc, 8, v1
	v_add_i32 v26, vcc, 12, v1
	v_add_i32 v27, vcc, s22, v0
	v_lshlrev_b32 v27, 4, v27
	v_add_i32 v27, vcc, s11, v27
	v_add_i32 v28, vcc, 4, v27
	v_add_i32 v29, vcc, 8, v27
	v_add_i32 v30, vcc, 12, v27
	v_add_i32 v31, vcc, s20, v0
	v_lshlrev_b32 v31, 4, v31
	v_add_i32 v31, vcc, s11, v31
	v_add_i32 v32, vcc, 4, v31
	v_add_i32 v33, vcc, 8, v31
	v_add_i32 v34, vcc, 12, v31
	v_lshlrev_b32 v0, 4, v0
	v_add_i32 v0, vcc, s11, v0
	v_add_i32 v35, vcc, 4, v0
	v_add_i32 v36, vcc, 8, v0
	v_add_i32 v37, vcc, 12, v0
	v_add_i32 v38, vcc, s9, v3
	v_lshlrev_b32 v38, 4, v38
	v_add_i32 v38, vcc, s15, v38
	tbuffer_load_format_xyzw v[38:41], v38, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	ds_write_b32 v8, v4
	ds_write_b32 v12, v5
	ds_write_b32 v13, v6
	ds_write_b32 v14, v7
	s_waitcnt lgkmcnt(0)
	v_add_i32 v4, vcc, s10, v3
	v_lshlrev_b32 v4, 4, v4
	v_add_i32 v4, vcc, s15, v4
	tbuffer_load_format_xyzw v[4:7], v4, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	ds_write_b32 v11, v38
	ds_write_b32 v15, v39
	ds_write_b32 v16, v40
	ds_write_b32 v17, v41
	v_add_i32 v3, vcc, s8, v3
	v_lshlrev_b32 v3, 4, v3
	v_add_i32 v3, vcc, s15, v3
	tbuffer_load_format_xyzw v[11:14], v3, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	ds_write_b32 v10, v4
	ds_write_b32 v18, v5
	ds_write_b32 v19, v6
	ds_write_b32 v20, v7
	s_waitcnt vmcnt(0)
	ds_write_b32 v9, v11
	ds_write_b32 v21, v12
	ds_write_b32 v22, v13
	ds_write_b32 v23, v14
	s_waitcnt lgkmcnt(0)
	s_barrier
	ds_read_b32 v3, v27
	ds_read_b32 v4, v28
	ds_read_b32 v5, v29
	ds_read_b32 v6, v30
	ds_read_b32 v7, v31
	ds_read_b32 v8, v32
	ds_read_b32 v9, v33
	ds_read_b32 v10, v34
	ds_read_b32 v15, v1
	ds_read_b32 v16, v24
	ds_read_b32 v17, v25
	ds_read_b32 v18, v26
	ds_read_b32 v19, v0
	ds_read_b32 v20, v35
	ds_read_b32 v21, v36
	ds_read_b32 v22, v37
	s_waitcnt lgkmcnt(0)
	v_mov_b32 v23, v10
	v_mov_b32 v24, v6
	v_mov_b32 v25, v18
	v_mov_b32 v26, v21
	v_mov_b32 v21, v8
	v_mov_b32 v27, v9
	v_mov_b32 v28, v5
	v_mov_b32 v29, v17
	v_mov_b32 v8, v20
	v_mov_b32 v9, v21
	v_mov_b32 v20, v7
	v_mov_b32 v21, v3
	v_mov_b32 v10, v4
	v_mov_b32 v11, v16
	v_lshlrev_b32 v0, 4, v2
	v_mov_b32 v12, v19
	v_mov_b32 v13, v20
	v_mov_b32 v14, v21
	v_add_i32 v0, vcc, s14, v0
	tbuffer_store_format_xyzw v[12:15], v0, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v0, vcc, s9, v2
	v_lshlrev_b32 v0, 4, v0
	v_add_i32 v0, vcc, s14, v0
	tbuffer_store_format_xyzw v[8:11], v0, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v0, vcc, s10, v2
	v_lshlrev_b32 v0, 4, v0
	v_add_i32 v0, vcc, s14, v0
	tbuffer_store_format_xyzw v[26:29], v0, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v0, vcc, s8, v2
	v_lshlrev_b32 v0, 4, v0
	v_add_i32 v0, vcc, s14, v0
	tbuffer_store_format_xyzw v[22:25], v0, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

.args
	float[4]* output 0 uav10 
	float[4]* input 16 uav11 
	float[4]* block 32 hl

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 664
	// NumVgprs = 42
	// NumSgprs = 26
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

