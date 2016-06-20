.global	QuasiRandomSequence_Vector
.text


QuasiRandomSequence_Vector:             // @QuasiRandomSequence_Vector
// BB#0:                                 // %entry
	s_buffer_load_dword s13, s[8:11], 0x0
	s_buffer_load_dword s15, s[8:11], 0x4
	s_buffer_load_dword s14, s[8:11], 0x8
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[8:11], s[2:3], 0x50
	s_buffer_load_dword s0, s[4:7], 0x4
	v_cmp_gt_i32 vcc, 8, v0
	s_waitcnt lgkmcnt(0)
	s_min_u32 s4, s0, 0xffff
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz BB0_4
// BB#1:                                 // %for.body.lr.ph
	s_lshl_b32 s5, s4, 4
	s_lshl_b32 s0, s12, 7
	s_add_i32 s20, s15, s0
	s_mov_b64 s[6:7], 0
	v_lshlrev_b32 v2, 4, v0
	v_mov_b32 v1, v0
	s_mov_b32 m0, -1
BB0_5:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_add_i32 v1, vcc, s4, v1
	v_cmp_lt_i32 s[0:1], 7, v1
	v_add_i32 v3, vcc, s20, v2
	tbuffer_load_format_xyzw v[3:6], v3, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v7, vcc, s14, v2
	v_add_i32 v8, vcc, 4, v7
	v_add_i32 v9, vcc, 8, v7
	v_add_i32 v10, vcc, 12, v7
	s_waitcnt vmcnt(0)
	ds_write_b32 v7, v3
	ds_write_b32 v8, v4
	ds_write_b32 v9, v5
	ds_write_b32 v10, v6
	v_add_i32 v2, vcc, s5, v2
	s_or_b64 s[6:7], s[0:1], s[6:7]
	s_waitcnt lgkmcnt(0)
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB0_5
// BB#2:                                 // %Flow
	s_or_b64 exec, exec, s[6:7]
BB0_4:                                  // %Flow7
	s_or_b64 exec, exec, s[2:3]
	v_lshlrev_b32 v1, 2, v0
	v_or_b32 v2, 1, v1
	v_or_b32 v3, 2, v1
	s_mul_i32 s0, s4, s12
	v_add_i32 v0, vcc, s0, v0
	v_or_b32 v4, 3, v1
// BB#3:                                 // %for.cond.cleanup
	s_barrier
	s_mov_b32 m0, -1
	s_add_i32 s0, s14, 4
	s_add_i32 s1, s14, 8
	s_add_i32 s2, s14, 12
	s_add_i32 s3, s14, 16
	s_add_i32 s4, s14, 20
	s_add_i32 s5, s14, 24
	s_add_i32 s6, s14, 28
	s_add_i32 s7, s14, 32
	s_add_i32 s12, s14, 36
	s_add_i32 s15, s14, 40
	s_add_i32 s16, s14, 44
	v_lshlrev_b32 v0, 4, v0
	v_bfe_u32 v5, v4, 11, 1
	v_add_i32 v0, vcc, s13, v0
	v_mov_b32 v6, s14
	ds_read_b32 v6, v6
	v_and_b32 v7, 1, v1
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v7, v6, v7
	v_mov_b32 v8, s0
	ds_read_b32 v8, v8
	v_bfe_u32 v9, v1, 1, 1
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v9, v8, v9
	v_xor_b32 v7, v9, v7
	v_mov_b32 v9, s1
	ds_read_b32 v9, v9
	v_bfe_u32 v10, v1, 2, 1
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v10, v9, v10
	v_xor_b32 v7, v10, v7
	v_mov_b32 v10, s2
	ds_read_b32 v10, v10
	v_bfe_u32 v11, v1, 3, 1
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v11, v10, v11
	v_xor_b32 v7, v11, v7
	v_mov_b32 v11, s3
	ds_read_b32 v11, v11
	v_bfe_u32 v12, v1, 4, 1
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v12, v11, v12
	v_xor_b32 v7, v12, v7
	v_mov_b32 v12, s4
	ds_read_b32 v12, v12
	v_bfe_u32 v13, v1, 5, 1
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v13, v12, v13
	v_xor_b32 v7, v13, v7
	v_mov_b32 v13, s5
	ds_read_b32 v13, v13
	v_bfe_u32 v14, v1, 6, 1
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v14, v13, v14
	v_xor_b32 v7, v14, v7
	v_mov_b32 v14, s6
	ds_read_b32 v14, v14
	v_bfe_u32 v15, v1, 7, 1
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v15, v14, v15
	v_xor_b32 v7, v15, v7
	v_mov_b32 v15, s7
	ds_read_b32 v15, v15
	v_bfe_u32 v16, v1, 8, 1
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v16, v15, v16
	v_xor_b32 v7, v16, v7
	v_mov_b32 v16, s12
	ds_read_b32 v16, v16
	v_bfe_u32 v17, v1, 9, 1
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v17, v16, v17
	v_xor_b32 v7, v17, v7
	v_mov_b32 v17, s15
	ds_read_b32 v17, v17
	v_bfe_u32 v18, v1, 10, 1
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v18, v17, v18
	v_xor_b32 v7, v18, v7
	v_mov_b32 v18, s16
	ds_read_b32 v18, v18
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v5, v18, v5
	v_bfe_u32 v1, v1, 11, 1
	v_mul_lo_i32 v1, v18, v1
	v_and_b32 v19, 1, v2
	v_mul_lo_i32 v19, v6, v19
	v_bfe_u32 v20, v2, 1, 1
	v_mul_lo_i32 v20, v8, v20
	v_xor_b32 v19, v20, v19
	v_bfe_u32 v20, v2, 2, 1
	v_mul_lo_i32 v20, v9, v20
	v_xor_b32 v19, v20, v19
	v_bfe_u32 v20, v2, 3, 1
	v_mul_lo_i32 v20, v10, v20
	v_xor_b32 v19, v20, v19
	v_bfe_u32 v20, v2, 4, 1
	v_mul_lo_i32 v20, v11, v20
	v_xor_b32 v19, v20, v19
	v_bfe_u32 v20, v2, 5, 1
	v_mul_lo_i32 v20, v12, v20
	v_xor_b32 v19, v20, v19
	v_bfe_u32 v20, v2, 6, 1
	v_mul_lo_i32 v20, v13, v20
	v_xor_b32 v19, v20, v19
	v_bfe_u32 v20, v2, 7, 1
	v_mul_lo_i32 v20, v14, v20
	v_xor_b32 v19, v20, v19
	v_bfe_u32 v20, v2, 8, 1
	v_mul_lo_i32 v20, v15, v20
	v_xor_b32 v19, v20, v19
	v_bfe_u32 v20, v2, 9, 1
	v_mul_lo_i32 v20, v16, v20
	v_xor_b32 v19, v20, v19
	v_bfe_u32 v20, v2, 10, 1
	v_mul_lo_i32 v20, v17, v20
	v_xor_b32 v19, v20, v19
	v_bfe_u32 v2, v2, 11, 1
	v_mul_lo_i32 v2, v18, v2
	v_and_b32 v20, 1, v3
	v_mul_lo_i32 v20, v6, v20
	v_bfe_u32 v21, v3, 1, 1
	v_mul_lo_i32 v21, v8, v21
	v_xor_b32 v20, v21, v20
	v_bfe_u32 v21, v3, 2, 1
	v_mul_lo_i32 v21, v9, v21
	v_xor_b32 v20, v21, v20
	v_bfe_u32 v21, v3, 3, 1
	v_mul_lo_i32 v21, v10, v21
	v_xor_b32 v20, v21, v20
	v_bfe_u32 v21, v3, 4, 1
	v_mul_lo_i32 v21, v11, v21
	v_xor_b32 v20, v21, v20
	v_bfe_u32 v21, v3, 5, 1
	v_mul_lo_i32 v21, v12, v21
	v_xor_b32 v20, v21, v20
	v_bfe_u32 v21, v3, 6, 1
	v_mul_lo_i32 v21, v13, v21
	v_xor_b32 v20, v21, v20
	v_bfe_u32 v21, v3, 7, 1
	v_mul_lo_i32 v21, v14, v21
	v_xor_b32 v20, v21, v20
	v_bfe_u32 v21, v3, 8, 1
	v_mul_lo_i32 v21, v15, v21
	v_xor_b32 v20, v21, v20
	v_bfe_u32 v21, v3, 9, 1
	v_mul_lo_i32 v21, v16, v21
	v_xor_b32 v20, v21, v20
	v_bfe_u32 v21, v3, 10, 1
	v_mul_lo_i32 v21, v17, v21
	v_xor_b32 v20, v21, v20
	v_bfe_u32 v3, v3, 11, 1
	v_mul_lo_i32 v3, v18, v3
	v_and_b32 v18, 1, v4
	v_mul_lo_i32 v6, v6, v18
	v_bfe_u32 v18, v4, 1, 1
	v_mul_lo_i32 v8, v8, v18
	v_xor_b32 v6, v8, v6
	v_bfe_u32 v8, v4, 2, 1
	v_mul_lo_i32 v8, v9, v8
	v_xor_b32 v6, v8, v6
	v_bfe_u32 v8, v4, 3, 1
	v_mul_lo_i32 v8, v10, v8
	v_xor_b32 v6, v8, v6
	v_bfe_u32 v8, v4, 4, 1
	v_mul_lo_i32 v8, v11, v8
	v_xor_b32 v6, v8, v6
	v_bfe_u32 v8, v4, 5, 1
	v_mul_lo_i32 v8, v12, v8
	v_xor_b32 v6, v8, v6
	v_bfe_u32 v8, v4, 6, 1
	v_mul_lo_i32 v8, v13, v8
	v_xor_b32 v6, v8, v6
	v_bfe_u32 v8, v4, 7, 1
	v_mul_lo_i32 v8, v14, v8
	v_xor_b32 v6, v8, v6
	v_bfe_u32 v8, v4, 8, 1
	v_mul_lo_i32 v8, v15, v8
	v_xor_b32 v6, v8, v6
	v_bfe_u32 v8, v4, 9, 1
	v_mul_lo_i32 v8, v16, v8
	v_xor_b32 v6, v8, v6
	v_bfe_u32 v4, v4, 10, 1
	v_mul_lo_i32 v4, v17, v4
	v_xor_b32 v4, v4, v6
	v_rcp_f32 v6, 0x4f800000
	v_xor_b32 v7, v1, v7
	v_xor_b32 v8, v2, v19
	v_xor_b32 v9, v3, v20
	v_xor_b32 v10, v5, v4
	v_cvt_f32_u32 v1, v7
	v_cvt_f32_u32 v2, v8
	v_cvt_f32_u32 v3, v9
	v_cvt_f32_u32 v4, v10
	v_mul_f32 v7, v6, v1
	v_mul_f32 v8, v6, v2
	v_mul_f32 v9, v6, v3
	v_mul_f32 v10, v6, v4
	tbuffer_store_format_xyzw v[7:10], v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

.args
	float[4]* output 0 uav10 
	i32[4]* input 16 uav11 
	i32[4]* shared 32 hl

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 1248
	// NumVgprs = 22
	// NumSgprs = 23
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1
.global	QuasiRandomSequence_Scalar
.text


QuasiRandomSequence_Scalar:             // @QuasiRandomSequence_Scalar
// BB#0:                                 // %entry
	s_buffer_load_dword s14, s[8:11], 0x0
	s_buffer_load_dword s15, s[8:11], 0x4
	s_buffer_load_dword s13, s[8:11], 0x8
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[8:11], s[2:3], 0x50
	s_buffer_load_dword s0, s[4:7], 0x4
	v_cmp_gt_i32 vcc, 32, v0
	s_waitcnt lgkmcnt(0)
	s_min_u32 s4, s0, 0xffff
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz BB1_4
// BB#1:                                 // %for.body.lr.ph
	s_lshl_b32 s5, s4, 2
	s_lshl_b32 s0, s12, 7
	s_add_i32 s20, s15, s0
	s_mov_b64 s[6:7], 0
	v_lshlrev_b32 v2, 2, v0
	v_mov_b32 v1, v0
	s_mov_b32 m0, -1
BB1_5:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_add_i32 v1, vcc, s4, v1
	v_cmp_lt_i32 s[0:1], 31, v1
	v_add_i32 v3, vcc, s20, v2
	tbuffer_load_format_x v3, v3, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v4, vcc, s13, v2
	s_waitcnt vmcnt(0)
	ds_write_b32 v4, v3
	v_add_i32 v2, vcc, s5, v2
	s_or_b64 s[6:7], s[0:1], s[6:7]
	s_waitcnt lgkmcnt(0)
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB1_5
// BB#2:                                 // %Flow
	s_or_b64 exec, exec, s[6:7]
BB1_4:                                  // %Flow6
	s_or_b64 exec, exec, s[2:3]
	s_mul_i32 s0, s4, s12
	v_add_i32 v1, vcc, s0, v0
// BB#3:                                 // %for.cond.cleanup
	s_add_i32 s0, s13, 36
	s_barrier
	s_mov_b32 m0, -1
	s_add_i32 s1, s13, 32
	s_add_i32 s2, s13, 28
	s_add_i32 s3, s13, 24
	s_add_i32 s4, s13, 20
	s_add_i32 s5, s13, 16
	s_add_i32 s6, s13, 12
	s_add_i32 s7, s13, 8
	s_add_i32 s12, s13, 4
	v_lshlrev_b32 v1, 2, v1
	v_and_b32 v2, 1, v0
	v_sub_i32 v2, vcc, 0, v2
	v_add_i32 v1, vcc, s14, v1
	v_mov_b32 v3, s0
	ds_read_b32 v3, v3
	v_bfe_u32 v4, v0, 9, 1
	v_sub_i32 v4, vcc, 0, v4
	s_waitcnt lgkmcnt(0)
	v_and_b32 v3, v3, v4
	v_mov_b32 v4, s1
	ds_read_b32 v4, v4
	v_bfe_u32 v5, v0, 8, 1
	v_sub_i32 v5, vcc, 0, v5
	s_waitcnt lgkmcnt(0)
	v_and_b32 v4, v4, v5
	v_mov_b32 v5, s2
	ds_read_b32 v5, v5
	v_bfe_u32 v6, v0, 7, 1
	v_sub_i32 v6, vcc, 0, v6
	s_waitcnt lgkmcnt(0)
	v_and_b32 v5, v5, v6
	v_mov_b32 v6, s3
	ds_read_b32 v6, v6
	v_bfe_u32 v7, v0, 6, 1
	v_sub_i32 v7, vcc, 0, v7
	s_waitcnt lgkmcnt(0)
	v_and_b32 v6, v6, v7
	v_mov_b32 v7, s4
	ds_read_b32 v7, v7
	v_bfe_u32 v8, v0, 5, 1
	v_sub_i32 v8, vcc, 0, v8
	s_waitcnt lgkmcnt(0)
	v_and_b32 v7, v7, v8
	v_mov_b32 v8, s5
	ds_read_b32 v8, v8
	v_bfe_u32 v9, v0, 4, 1
	v_sub_i32 v9, vcc, 0, v9
	s_waitcnt lgkmcnt(0)
	v_and_b32 v8, v8, v9
	v_mov_b32 v9, s6
	ds_read_b32 v9, v9
	v_bfe_u32 v10, v0, 3, 1
	v_sub_i32 v10, vcc, 0, v10
	s_waitcnt lgkmcnt(0)
	v_and_b32 v9, v9, v10
	v_mov_b32 v10, s7
	ds_read_b32 v10, v10
	v_bfe_u32 v11, v0, 2, 1
	v_sub_i32 v11, vcc, 0, v11
	s_waitcnt lgkmcnt(0)
	v_and_b32 v10, v10, v11
	v_mov_b32 v11, s12
	ds_read_b32 v11, v11
	v_bfe_u32 v0, v0, 1, 1
	v_sub_i32 v0, vcc, 0, v0
	s_waitcnt lgkmcnt(0)
	v_and_b32 v0, v11, v0
	v_mov_b32 v11, s13
	ds_read_b32 v11, v11
	s_waitcnt lgkmcnt(0)
	v_and_b32 v2, v11, v2
	v_xor_b32 v0, v0, v2
	v_xor_b32 v0, v10, v0
	v_xor_b32 v0, v9, v0
	v_xor_b32 v0, v8, v0
	v_xor_b32 v0, v7, v0
	v_xor_b32 v0, v6, v0
	v_xor_b32 v0, v5, v0
	v_xor_b32 v0, v4, v0
	v_xor_b32 v0, v3, v0
	v_cvt_f32_u32 v0, v0
	v_mul_f32 v0, 0x2f800000, v0
	tbuffer_store_format_x v0, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

.args
	float* output 0 uav10 
	i32* input 16 uav11 
	i32* shared 32 hl

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 432
	// NumVgprs = 12
	// NumSgprs = 23
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

