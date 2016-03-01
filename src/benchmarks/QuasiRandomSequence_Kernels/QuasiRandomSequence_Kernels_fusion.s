.global	QuasiRandomSequence_Vector

.text

QuasiRandomSequence_Vector:             // @QuasiRandomSequence_Vector
// BB#0:                                 // %entry
	s_buffer_load_dword s0, s[8:11], 0x0
	s_buffer_load_dword s13, s[8:11], 0x4
	s_buffer_load_dword s1, s[8:11], 0x8
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[8:11], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x4
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s2, 0xffff
	v_cmp_gt_i32 vcc, 8, v0
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execz BB0_4
// BB#1:                                 // %for.body.lr.ph
	v_lshlrev_b32 v1, 4, v0
	s_lshl_b32 s3, s2, 4
	s_lshl_b32 s6, s12, 7
	s_add_i32 s14, s13, s6
	s_mov_b64 s[6:7], 0
	v_mov_b32 v2, v0
	s_mov_b32 m0, -1
BB0_5:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_add_i32 v3, vcc, s14, v1
	tbuffer_load_format_xyzw v[3:6], v3, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v7, vcc, s1, v1
	v_add_i32 v8, vcc, 12, v7
	v_add_i32 v9, vcc, 8, v7
	s_waitcnt vmcnt(0)
	ds_write_b32 v8, v6
	ds_write_b32 v9, v5
	s_waitcnt lgkmcnt(0)
	v_add_i32 v5, vcc, 4, v7
	ds_write_b32 v5, v4
	ds_write_b32 v7, v3
	v_add_i32 v2, vcc, s2, v2
	v_add_i32 v1, vcc, s3, v1
	v_cmp_lt_i32 vcc, 7, v2
	s_or_b64 s[6:7], vcc, s[6:7]
	s_waitcnt lgkmcnt(0)
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB0_5
// BB#2:                                 // %Flow
	s_or_b64 exec, exec, s[6:7]
BB0_4:                                  // %Flow7
	s_or_b64 exec, exec, s[4:5]
	s_mul_i32 s2, s2, s12
	v_add_i32 v1, vcc, s2, v0
	v_lshlrev_b32 v2, 2, v0
	v_or_b32 v3, 1, v2
	v_or_b32 v4, 2, v2
	v_or_b32 v5, 3, v2
// BB#3:                                 // %for.cond.cleanup
	s_barrier
	v_and_b32 v0, 1, v5
	s_mov_b32 m0, -1
	v_mov_b32 v6, s1
	s_add_i32 s2, s1, 4
	ds_read_b32 v6, v6
	v_mov_b32 v7, s2
	s_add_i32 s2, s1, 8
	ds_read_b32 v7, v7
	v_mov_b32 v8, s2
	s_add_i32 s2, s1, 12
	ds_read_b32 v8, v8
	v_mov_b32 v9, s2
	ds_read_b32 v9, v9
	v_and_b32 v10, 1, v4
	v_and_b32 v11, 1, v3
	v_and_b32 v12, 1, v2
	v_bfe_u32 v13, v5, 1, 1
	v_bfe_u32 v14, v4, 1, 1
	v_bfe_u32 v15, v3, 1, 1
	v_bfe_u32 v16, v2, 1, 1
	v_bfe_u32 v17, v2, 2, 1
	v_bfe_u32 v18, v3, 2, 1
	v_bfe_u32 v19, v4, 2, 1
	v_bfe_u32 v20, v5, 2, 1
	v_bfe_u32 v21, v5, 3, 1
	v_bfe_u32 v22, v4, 3, 1
	v_bfe_u32 v23, v3, 3, 1
	v_bfe_u32 v24, v2, 3, 1
	v_bfe_u32 v25, v2, 4, 1
	v_bfe_u32 v26, v3, 4, 1
	v_bfe_u32 v27, v4, 4, 1
	v_bfe_u32 v28, v5, 4, 1
	v_bfe_u32 v29, v5, 5, 1
	v_bfe_u32 v30, v4, 5, 1
	v_bfe_u32 v31, v3, 5, 1
	v_bfe_u32 v32, v2, 5, 1
	v_bfe_u32 v33, v2, 6, 1
	v_bfe_u32 v34, v3, 6, 1
	v_bfe_u32 v35, v4, 6, 1
	v_bfe_u32 v36, v5, 6, 1
	v_bfe_u32 v37, v5, 7, 1
	v_bfe_u32 v38, v4, 7, 1
	v_bfe_u32 v39, v3, 7, 1
	v_bfe_u32 v40, v2, 7, 1
	v_bfe_u32 v41, v2, 8, 1
	v_bfe_u32 v42, v3, 8, 1
	v_bfe_u32 v43, v4, 8, 1
	v_bfe_u32 v44, v5, 8, 1
	v_bfe_u32 v45, v5, 9, 1
	v_bfe_u32 v46, v4, 9, 1
	v_bfe_u32 v47, v3, 9, 1
	v_bfe_u32 v48, v2, 9, 1
	v_bfe_u32 v49, v2, 10, 1
	v_bfe_u32 v50, v3, 10, 1
	v_bfe_u32 v51, v4, 10, 1
	v_bfe_u32 v52, v5, 10, 1
	v_bfe_u32 v5, v5, 11, 1
	v_bfe_u32 v4, v4, 11, 1
	v_bfe_u32 v3, v3, 11, 1
	v_bfe_u32 v2, v2, 11, 1
	s_add_i32 s2, s1, 16
	s_add_i32 s3, s1, 20
	v_mov_b32 v53, s2
	ds_read_b32 v53, v53
	v_mov_b32 v54, s3
	ds_read_b32 v54, v54
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v12, v6, v12
	v_mul_lo_i32 v11, v6, v11
	v_mul_lo_i32 v10, v6, v10
	v_mul_lo_i32 v0, v6, v0
	s_add_i32 s2, s1, 24
	s_add_i32 s3, s1, 28
	v_mov_b32 v6, s2
	ds_read_b32 v6, v6
	v_mov_b32 v55, s3
	ds_read_b32 v55, v55
	v_mul_lo_i32 v16, v7, v16
	v_mul_lo_i32 v15, v7, v15
	v_mul_lo_i32 v13, v7, v13
	s_add_i32 s2, s1, 32
	v_mul_lo_i32 v7, v7, v14
	v_mov_b32 v14, s2
	ds_read_b32 v14, v14
	s_add_i32 s2, s1, 36
	v_xor_b32 v0, v13, v0
	v_mov_b32 v13, s2
	ds_read_b32 v13, v13
	v_xor_b32 v7, v7, v10
	s_add_i32 s2, s1, 40
	s_add_i32 s1, s1, 44
	v_mov_b32 v10, s2
	ds_read_b32 v10, v10
	v_mov_b32 v56, s1
	ds_read_b32 v56, v56
	v_mul_lo_i32 v19, v8, v19
	v_mul_lo_i32 v20, v8, v20
	v_mul_lo_i32 v21, v9, v21
	v_mul_lo_i32 v22, v9, v22
	v_xor_b32 v7, v19, v7
	v_xor_b32 v0, v20, v0
	v_xor_b32 v0, v21, v0
	v_xor_b32 v7, v22, v7
	v_mul_lo_i32 v19, v53, v27
	v_mul_lo_i32 v20, v53, v28
	v_mul_lo_i32 v21, v54, v29
	v_mul_lo_i32 v22, v54, v30
	v_xor_b32 v7, v19, v7
	v_xor_b32 v0, v20, v0
	v_xor_b32 v0, v21, v0
	v_xor_b32 v7, v22, v7
	s_waitcnt lgkmcnt(0)
	v_mul_lo_i32 v19, v6, v35
	v_mul_lo_i32 v20, v6, v36
	v_mul_lo_i32 v21, v55, v37
	v_mul_lo_i32 v22, v55, v38
	v_xor_b32 v7, v19, v7
	v_xor_b32 v0, v20, v0
	v_xor_b32 v0, v21, v0
	v_xor_b32 v7, v22, v7
	v_mul_lo_i32 v19, v14, v43
	v_mul_lo_i32 v20, v14, v44
	v_mul_lo_i32 v21, v13, v45
	v_mul_lo_i32 v22, v13, v46
	v_xor_b32 v7, v19, v7
	v_xor_b32 v0, v20, v0
	v_xor_b32 v0, v21, v0
	v_xor_b32 v7, v22, v7
	v_mul_lo_i32 v19, v10, v51
	v_mul_lo_i32 v20, v10, v52
	v_mul_lo_i32 v5, v56, v5
	v_mul_lo_i32 v4, v56, v4
	v_xor_b32 v7, v19, v7
	v_xor_b32 v0, v20, v0
	v_xor_b32 v22, v5, v0
	v_xor_b32 v21, v4, v7
	v_xor_b32 v0, v15, v11
	v_xor_b32 v4, v16, v12
	v_mul_lo_i32 v5, v8, v17
	v_mul_lo_i32 v7, v8, v18
	v_mul_lo_i32 v8, v9, v23
	v_mul_lo_i32 v9, v9, v24
	v_xor_b32 v4, v5, v4
	v_xor_b32 v0, v7, v0
	v_xor_b32 v0, v8, v0
	v_xor_b32 v4, v9, v4
	v_mul_lo_i32 v5, v53, v25
	v_mul_lo_i32 v7, v53, v26
	v_mul_lo_i32 v8, v54, v31
	v_mul_lo_i32 v9, v54, v32
	v_xor_b32 v4, v5, v4
	v_xor_b32 v0, v7, v0
	v_xor_b32 v0, v8, v0
	v_xor_b32 v4, v9, v4
	v_mul_lo_i32 v5, v6, v33
	v_mul_lo_i32 v6, v6, v34
	v_mul_lo_i32 v7, v55, v39
	v_mul_lo_i32 v8, v55, v40
	v_xor_b32 v4, v5, v4
	v_xor_b32 v0, v6, v0
	v_xor_b32 v0, v7, v0
	v_xor_b32 v4, v8, v4
	v_mul_lo_i32 v5, v14, v41
	v_mul_lo_i32 v6, v14, v42
	v_mul_lo_i32 v7, v13, v47
	v_mul_lo_i32 v8, v13, v48
	v_xor_b32 v4, v5, v4
	v_xor_b32 v0, v6, v0
	v_xor_b32 v0, v7, v0
	v_xor_b32 v4, v8, v4
	v_mul_lo_i32 v5, v10, v49
	v_mul_lo_i32 v6, v10, v50
	v_mul_lo_i32 v3, v56, v3
	v_mul_lo_i32 v2, v56, v2
	v_xor_b32 v4, v5, v4
	v_xor_b32 v0, v6, v0
	v_xor_b32 v20, v3, v0
	v_xor_b32 v19, v2, v4
	v_cvt_f32_u32 v0, v22
	v_rcp_f32 v2, 0x4f800000
	v_cvt_f32_u32 v3, v21
	v_cvt_f32_u32 v4, v20
	v_cvt_f32_u32 v5, v19
	v_mul_f32 v9, v2, v0
	v_mul_f32 v8, v2, v3
	v_mul_f32 v7, v2, v4
	v_mul_f32 v6, v2, v5
	v_lshlrev_b32 v0, 4, v1
	v_add_i32 v0, vcc, s0, v0
	tbuffer_store_format_xyzw v[6:9], v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

// ********************* Second kernel starts
// SKBB#0:                                 // %entry

.args
	float[4]* output 0 uav10 
	i32[4]* input 16 uav11 
	i32[4]* shared 32 hl


// Merge warning: sections do not match
.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 1208
	// NumVgprs = 57
	// NumSgprs = 22
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
	s_buffer_load_dword s0, s[8:11], 0x0
	s_buffer_load_dword s13, s[8:11], 0x4
	s_buffer_load_dword s1, s[8:11], 0x8
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[8:11], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x4
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s2, 0xffff
	v_cmp_gt_i32 vcc, 32, v0
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execz BB1_4
// BB#1:                                 // %for.body.lr.ph
	v_lshlrev_b32 v1, 2, v0
	s_lshl_b32 s3, s2, 2
	s_lshl_b32 s6, s12, 7
	s_add_i32 s14, s13, s6
	s_mov_b64 s[6:7], 0
	v_mov_b32 v2, v0
	s_mov_b32 m0, -1
BB1_5:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_add_i32 v3, vcc, s14, v1
	tbuffer_load_format_x v3, v3, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v4, vcc, s1, v1
	v_add_i32 v2, vcc, s2, v2
	v_add_i32 v1, vcc, s3, v1
	v_cmp_lt_i32 vcc, 31, v2
	s_waitcnt vmcnt(0)
	ds_write_b32 v4, v3
	s_or_b64 s[6:7], vcc, s[6:7]
	s_waitcnt lgkmcnt(0)
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB1_5
// BB#2:                                 // %Flow
	s_or_b64 exec, exec, s[6:7]
BB1_4:                                  // %Flow6
	s_or_b64 exec, exec, s[4:5]
	s_mul_i32 s2, s2, s12
	v_add_i32 v1, vcc, s2, v0
// BB#3:                                 // %for.cond.cleanup
	s_barrier
	s_mov_b32 m0, -1
	v_mov_b32 v2, s1
	ds_read_b32 v2, v2
	s_add_i32 s2, s1, 4
	v_mov_b32 v3, s2
	ds_read_b32 v3, v3
	s_add_i32 s2, s1, 8
	v_mov_b32 v4, s2
	ds_read_b32 v4, v4
	s_add_i32 s2, s1, 12
	v_mov_b32 v5, s2
	ds_read_b32 v5, v5
	s_add_i32 s2, s1, 16
	v_mov_b32 v6, s2
	ds_read_b32 v6, v6
	s_add_i32 s2, s1, 20
	v_mov_b32 v7, s2
	ds_read_b32 v7, v7
	s_add_i32 s2, s1, 24
	v_mov_b32 v8, s2
	ds_read_b32 v8, v8
	s_add_i32 s2, s1, 28
	v_mov_b32 v9, s2
	ds_read_b32 v9, v9
	v_and_b32 v10, 1, v0
	v_sub_i32 v10, vcc, 0, v10
	s_add_i32 s2, s1, 32
	s_waitcnt lgkmcnt(0)
	v_and_b32 v2, v2, v10
	v_mov_b32 v10, s2
	ds_read_b32 v10, v10
	v_bfe_u32 v11, v0, 1, 1
	v_sub_i32 v11, vcc, 0, v11
	s_add_i32 s1, s1, 36
	v_and_b32 v3, v3, v11
	v_mov_b32 v11, s1
	ds_read_b32 v11, v11
	v_xor_b32 v2, v2, v3
	v_bfe_u32 v3, v0, 2, 1
	v_sub_i32 v3, vcc, 0, v3
	v_and_b32 v3, v4, v3
	v_xor_b32 v2, v2, v3
	v_bfe_u32 v3, v0, 3, 1
	v_sub_i32 v3, vcc, 0, v3
	v_and_b32 v3, v5, v3
	v_xor_b32 v2, v2, v3
	v_bfe_u32 v3, v0, 4, 1
	v_sub_i32 v3, vcc, 0, v3
	v_and_b32 v3, v6, v3
	v_xor_b32 v2, v2, v3
	v_bfe_u32 v3, v0, 5, 1
	v_sub_i32 v3, vcc, 0, v3
	v_and_b32 v3, v7, v3
	v_xor_b32 v2, v2, v3
	v_bfe_u32 v3, v0, 6, 1
	v_sub_i32 v3, vcc, 0, v3
	v_and_b32 v3, v8, v3
	v_xor_b32 v2, v2, v3
	v_bfe_u32 v3, v0, 7, 1
	v_sub_i32 v3, vcc, 0, v3
	v_and_b32 v3, v9, v3
	v_xor_b32 v2, v2, v3
	v_bfe_u32 v3, v0, 8, 1
	v_sub_i32 v3, vcc, 0, v3
	s_waitcnt lgkmcnt(0)
	v_and_b32 v3, v10, v3
	v_xor_b32 v2, v2, v3
	v_bfe_u32 v0, v0, 9, 1
	v_sub_i32 v0, vcc, 0, v0
	v_and_b32 v0, v11, v0
	v_xor_b32 v0, v2, v0
	v_cvt_f32_u32 v0, v0
	v_mul_f32 v0, 0x2f800000, v0
	v_lshlrev_b32 v1, 2, v1
	v_add_i32 v1, vcc, s0, v1
	tbuffer_store_format_x v0, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

// ********************* Second kernel starts
// SKBB#0:                                 // %entry

.args
	float* output 0 uav10 
	i32* input 16 uav11 
	i32* shared 32 hl


// Merge warning: sections do not match
.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 396
	// NumVgprs = 12
	// NumSgprs = 22
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

