.global	QuasiRandomSequence_Vector
.text

QuasiRandomSequence_Vector:             // @QuasiRandomSequence_Vector
// BB#0:                                 // %entry
	s_buffer_load_dword s14, s[8:11], 0x0
	s_buffer_load_dword s15, s[8:11], 0x4
	s_buffer_load_dword s13, s[8:11], 0x8
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[8:11], s[2:3], 0x50
	s_buffer_load_dword s0, s[4:7], 0x4
	v_cmp_gt_i32 vcc, 8, v0
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s0, 0xffff
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execz BB0_4
// BB#1:                                 // %for.body.lr.ph
	s_lshl_b32 s3, s2, 4
	s_lshl_b32 s0, s12, 7
	s_add_i32 s20, s15, s0
	s_mov_b64 s[6:7], 0
	v_lshlrev_b32 v1, 4, v0
	v_mov_b32 v2, v0
	s_mov_b32 m0, -1
BB0_5:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_add_i32 v3, vcc, s20, v1
	tbuffer_load_format_xyzw v[3:6], v3, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v7, vcc, s13, v1
	v_add_i32 v2, vcc, s2, v2
	v_add_i32 v1, vcc, s3, v1
	v_cmp_lt_i32 s[0:1], 7, v2
	v_add_i32 v8, vcc, 12, v7
	v_add_i32 v9, vcc, 8, v7
	v_add_i32 v10, vcc, 4, v7
	s_waitcnt vmcnt(0)
	ds_write_b32 v8, v6
	ds_write_b32 v9, v5
	ds_write_b32 v10, v4
	ds_write_b32 v7, v3
	s_or_b64 s[6:7], s[0:1], s[6:7]
	s_waitcnt lgkmcnt(0)
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB0_5
// BB#2:                                 // %Flow
	s_or_b64 exec, exec, s[6:7]
BB0_4:                                  // %Flow7
	s_or_b64 exec, exec, s[4:5]
	v_lshlrev_b32 v1, 2, v0
	v_or_b32 v2, 1, v1
	v_or_b32 v3, 2, v1
	s_mul_i32 s0, s2, s12
	v_add_i32 v0, vcc, s0, v0
	v_or_b32 v4, 3, v1
// BB#3:                                 // %for.cond.cleanup
	s_barrier
	s_mov_b32 m0, -1
	s_add_i32 s0, s13, 4
	s_add_i32 s1, s13, 8
	s_add_i32 s2, s13, 12
	s_add_i32 s3, s13, 16
	s_add_i32 s4, s13, 20
	s_add_i32 s5, s13, 24
	s_add_i32 s6, s13, 28
	s_add_i32 s7, s13, 32
	s_add_i32 s12, s13, 36
	s_add_i32 s15, s13, 40
	s_add_i32 s16, s13, 44
	v_bfe_u32 v5, v1, 11, 1
	v_lshlrev_b32 v0, 4, v0
	v_add_i32 v0, vcc, s14, v0
	v_and_b32 v6, 1, v4
	v_and_b32 v7, 1, v3
	v_and_b32 v8, 1, v2
	v_and_b32 v9, 1, v1
	v_mov_b32 v10, s13
	ds_read_b32 v10, v10
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v9, v10, v9
	v_mul_lo_i32 v8, v10, v8
	v_mul_lo_i32 v7, v10, v7
	v_mul_lo_i32 v6, v10, v6
	v_bfe_u32 v10, v4, 1, 1
	v_bfe_u32 v11, v3, 1, 1
	v_bfe_u32 v12, v2, 1, 1
	v_bfe_u32 v13, v1, 1, 1
	v_mov_b32 v14, s0
	ds_read_b32 v14, v14
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v13, v14, v13
	v_xor_b32 v9, v13, v9
	v_mul_lo_i32 v12, v14, v12
	v_xor_b32 v8, v12, v8
	v_mul_lo_i32 v11, v14, v11
	v_xor_b32 v7, v11, v7
	v_mul_lo_i32 v10, v14, v10
	v_xor_b32 v6, v10, v6
	v_bfe_u32 v10, v1, 2, 1
	v_bfe_u32 v11, v2, 2, 1
	v_bfe_u32 v12, v3, 2, 1
	v_bfe_u32 v13, v4, 2, 1
	v_mov_b32 v14, s1
	ds_read_b32 v14, v14
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v13, v14, v13
	v_xor_b32 v6, v13, v6
	v_mul_lo_i32 v12, v14, v12
	v_xor_b32 v7, v12, v7
	v_mul_lo_i32 v11, v14, v11
	v_xor_b32 v8, v11, v8
	v_mul_lo_i32 v10, v14, v10
	v_xor_b32 v9, v10, v9
	v_bfe_u32 v10, v4, 3, 1
	v_bfe_u32 v11, v3, 3, 1
	v_bfe_u32 v12, v2, 3, 1
	v_bfe_u32 v13, v1, 3, 1
	v_mov_b32 v14, s2
	ds_read_b32 v14, v14
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v13, v14, v13
	v_xor_b32 v9, v13, v9
	v_mul_lo_i32 v12, v14, v12
	v_xor_b32 v8, v12, v8
	v_mul_lo_i32 v11, v14, v11
	v_xor_b32 v7, v11, v7
	v_mul_lo_i32 v10, v14, v10
	v_xor_b32 v6, v10, v6
	v_bfe_u32 v10, v1, 4, 1
	v_bfe_u32 v11, v2, 4, 1
	v_bfe_u32 v12, v3, 4, 1
	v_bfe_u32 v13, v4, 4, 1
	v_mov_b32 v14, s3
	ds_read_b32 v14, v14
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v13, v14, v13
	v_xor_b32 v6, v13, v6
	v_mul_lo_i32 v12, v14, v12
	v_xor_b32 v7, v12, v7
	v_mul_lo_i32 v11, v14, v11
	v_xor_b32 v8, v11, v8
	v_mul_lo_i32 v10, v14, v10
	v_xor_b32 v9, v10, v9
	v_bfe_u32 v10, v4, 5, 1
	v_bfe_u32 v11, v3, 5, 1
	v_bfe_u32 v12, v2, 5, 1
	v_bfe_u32 v13, v1, 5, 1
	v_mov_b32 v14, s4
	ds_read_b32 v14, v14
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v13, v14, v13
	v_xor_b32 v9, v13, v9
	v_mul_lo_i32 v12, v14, v12
	v_xor_b32 v8, v12, v8
	v_mul_lo_i32 v11, v14, v11
	v_xor_b32 v7, v11, v7
	v_mul_lo_i32 v10, v14, v10
	v_xor_b32 v6, v10, v6
	v_bfe_u32 v10, v1, 6, 1
	v_bfe_u32 v11, v2, 6, 1
	v_bfe_u32 v12, v3, 6, 1
	v_bfe_u32 v13, v4, 6, 1
	v_mov_b32 v14, s5
	ds_read_b32 v14, v14
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v13, v14, v13
	v_xor_b32 v6, v13, v6
	v_mul_lo_i32 v12, v14, v12
	v_xor_b32 v7, v12, v7
	v_mul_lo_i32 v11, v14, v11
	v_xor_b32 v8, v11, v8
	v_mul_lo_i32 v10, v14, v10
	v_xor_b32 v9, v10, v9
	v_bfe_u32 v10, v4, 7, 1
	v_bfe_u32 v11, v3, 7, 1
	v_bfe_u32 v12, v2, 7, 1
	v_bfe_u32 v13, v1, 7, 1
	v_mov_b32 v14, s6
	ds_read_b32 v14, v14
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v13, v14, v13
	v_xor_b32 v9, v13, v9
	v_mul_lo_i32 v12, v14, v12
	v_xor_b32 v8, v12, v8
	v_mul_lo_i32 v11, v14, v11
	v_xor_b32 v7, v11, v7
	v_mul_lo_i32 v10, v14, v10
	v_xor_b32 v6, v10, v6
	v_bfe_u32 v10, v1, 8, 1
	v_bfe_u32 v11, v2, 8, 1
	v_bfe_u32 v12, v3, 8, 1
	v_bfe_u32 v13, v4, 8, 1
	v_mov_b32 v14, s7
	ds_read_b32 v14, v14
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v13, v14, v13
	v_xor_b32 v6, v13, v6
	v_mul_lo_i32 v12, v14, v12
	v_xor_b32 v7, v12, v7
	v_mul_lo_i32 v11, v14, v11
	v_xor_b32 v8, v11, v8
	v_mul_lo_i32 v10, v14, v10
	v_xor_b32 v9, v10, v9
	v_bfe_u32 v10, v4, 9, 1
	v_bfe_u32 v11, v3, 9, 1
	v_bfe_u32 v12, v2, 9, 1
	v_bfe_u32 v13, v1, 9, 1
	v_mov_b32 v14, s12
	ds_read_b32 v14, v14
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v13, v14, v13
	v_xor_b32 v9, v13, v9
	v_mul_lo_i32 v12, v14, v12
	v_xor_b32 v8, v12, v8
	v_mul_lo_i32 v11, v14, v11
	v_xor_b32 v7, v11, v7
	v_mul_lo_i32 v10, v14, v10
	v_xor_b32 v6, v10, v6
	v_bfe_u32 v1, v1, 10, 1
	v_bfe_u32 v10, v2, 10, 1
	v_bfe_u32 v11, v3, 10, 1
	v_bfe_u32 v12, v4, 10, 1
	v_mov_b32 v13, s15
	ds_read_b32 v13, v13
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v12, v13, v12
	v_xor_b32 v6, v12, v6
	v_mul_lo_i32 v11, v13, v11
	v_xor_b32 v7, v11, v7
	v_mul_lo_i32 v10, v13, v10
	v_xor_b32 v8, v10, v8
	v_mul_lo_i32 v1, v13, v1
	v_xor_b32 v1, v1, v9
	v_bfe_u32 v4, v4, 11, 1
	v_bfe_u32 v3, v3, 11, 1
	v_bfe_u32 v2, v2, 11, 1
	v_mov_b32 v9, s16
	ds_read_b32 v9, v9
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v5, v9, v5
	v_mul_lo_i32 v2, v9, v2
	v_mul_lo_i32 v3, v9, v3
	v_mul_lo_i32 v4, v9, v4
	v_rcp_f32 v9, 0x4f800000
	v_xor_b32 v13, v4, v6
	v_xor_b32 v12, v3, v7
	v_xor_b32 v11, v2, v8
	v_xor_b32 v10, v5, v1
	v_cvt_f32_u32 v1, v10
	v_cvt_f32_u32 v2, v11
	v_cvt_f32_u32 v3, v12
	v_cvt_f32_u32 v4, v13
	v_mul_f32 v7, v9, v4
	v_mul_f32 v6, v9, v3
	v_mul_f32 v5, v9, v2
	v_mul_f32 v4, v9, v1
	tbuffer_store_format_xyzw v[4:7], v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
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
	// NumVgprs = 15
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
	s_buffer_load_dword s13, s[8:11], 0x0
	s_buffer_load_dword s14, s[8:11], 0x4
	s_buffer_load_dword s8, s[8:11], 0x8
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[0:3], s[2:3], 0x50
	s_buffer_load_dword s4, s[4:7], 0x4
	v_cmp_gt_i32 vcc, 32, v0
	s_waitcnt lgkmcnt(0)
	s_min_u32 s4, s4, 0xffff
	s_and_saveexec_b64 s[6:7], vcc
	s_xor_b64 s[6:7], exec, s[6:7]
	s_cbranch_execz BB1_4
// BB#1:                                 // %for.body.lr.ph
	s_lshl_b32 s5, s4, 2
	s_lshl_b32 s9, s12, 7
	s_add_i32 s9, s14, s9
	s_mov_b64 s[10:11], 0
	v_lshlrev_b32 v1, 2, v0
	v_mov_b32 v2, v0
	s_mov_b32 m0, -1
BB1_5:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_add_i32 v3, vcc, s9, v1
	tbuffer_load_format_x v3, v3, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v4, vcc, s8, v1
	v_add_i32 v2, vcc, s4, v2
	v_add_i32 v1, vcc, s5, v1
	v_cmp_lt_i32 vcc, 31, v2
	s_waitcnt vmcnt(0)
	ds_write_b32 v4, v3
	s_or_b64 s[10:11], vcc, s[10:11]
	s_waitcnt lgkmcnt(0)
	s_andn2_b64 exec, exec, s[10:11]
	s_cbranch_execnz BB1_5
// BB#2:                                 // %Flow
	s_or_b64 exec, exec, s[10:11]
BB1_4:                                  // %Flow6
	s_or_b64 exec, exec, s[6:7]
	s_mul_i32 s4, s4, s12
	v_add_i32 v1, vcc, s4, v0
// BB#3:                                 // %for.cond.cleanup
	s_barrier
	s_mov_b32 m0, -1
	s_add_i32 s4, s8, 4
	s_add_i32 s5, s8, 8
	s_add_i32 s6, s8, 12
	s_add_i32 s7, s8, 16
	s_add_i32 s9, s8, 20
	s_add_i32 s10, s8, 24
	s_add_i32 s11, s8, 28
	s_add_i32 s12, s8, 32
	v_bfe_u32 v2, v0, 9, 1
	s_add_i32 s14, s8, 36
	v_sub_i32 v2, vcc, 0, v2
	v_lshlrev_b32 v1, 2, v1
	v_add_i32 v1, vcc, s13, v1
	v_and_b32 v3, 1, v0
	v_sub_i32 v3, vcc, 0, v3
	v_mov_b32 v4, s8
	ds_read_b32 v4, v4
	s_waitcnt lgkmcnt(0)
	v_and_b32 v3, v4, v3
	v_bfe_u32 v4, v0, 1, 1
	v_sub_i32 v4, vcc, 0, v4
	v_mov_b32 v5, s4
	ds_read_b32 v5, v5
	s_waitcnt lgkmcnt(0)
	v_and_b32 v4, v5, v4
	v_xor_b32 v3, v3, v4
	v_bfe_u32 v4, v0, 2, 1
	v_sub_i32 v4, vcc, 0, v4
	v_mov_b32 v5, s5
	ds_read_b32 v5, v5
	s_waitcnt lgkmcnt(0)
	v_and_b32 v4, v5, v4
	v_xor_b32 v3, v3, v4
	v_bfe_u32 v4, v0, 3, 1
	v_sub_i32 v4, vcc, 0, v4
	v_mov_b32 v5, s6
	ds_read_b32 v5, v5
	s_waitcnt lgkmcnt(0)
	v_and_b32 v4, v5, v4
	v_xor_b32 v3, v3, v4
	v_bfe_u32 v4, v0, 4, 1
	v_sub_i32 v4, vcc, 0, v4
	v_mov_b32 v5, s7
	ds_read_b32 v5, v5
	s_waitcnt lgkmcnt(0)
	v_and_b32 v4, v5, v4
	v_xor_b32 v3, v3, v4
	v_bfe_u32 v4, v0, 5, 1
	v_sub_i32 v4, vcc, 0, v4
	v_mov_b32 v5, s9
	ds_read_b32 v5, v5
	s_waitcnt lgkmcnt(0)
	v_and_b32 v4, v5, v4
	v_xor_b32 v3, v3, v4
	v_bfe_u32 v4, v0, 6, 1
	v_sub_i32 v4, vcc, 0, v4
	v_mov_b32 v5, s10
	ds_read_b32 v5, v5
	s_waitcnt lgkmcnt(0)
	v_and_b32 v4, v5, v4
	v_xor_b32 v3, v3, v4
	v_bfe_u32 v4, v0, 7, 1
	v_sub_i32 v4, vcc, 0, v4
	v_mov_b32 v5, s11
	ds_read_b32 v5, v5
	s_waitcnt lgkmcnt(0)
	v_and_b32 v4, v5, v4
	v_xor_b32 v3, v3, v4
	v_bfe_u32 v0, v0, 8, 1
	v_sub_i32 v0, vcc, 0, v0
	v_mov_b32 v4, s12
	ds_read_b32 v4, v4
	s_waitcnt lgkmcnt(0)
	v_and_b32 v0, v4, v0
	v_xor_b32 v0, v3, v0
	v_mov_b32 v3, s14
	ds_read_b32 v3, v3
	s_waitcnt lgkmcnt(0)
	v_and_b32 v2, v3, v2
	v_xor_b32 v0, v0, v2
	v_cvt_f32_u32 v0, v0
	v_mul_f32 v0, 0x2f800000, v0
	tbuffer_store_format_x v0, v1, s[0:3], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

.args
	float* output 0 uav10 
	i32* input 16 uav11 
	i32* shared 32 hl

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 428
	// NumVgprs = 6
	// NumSgprs = 22
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

