.global	mmmKernel
.text



mmmKernel:                              // @mmmKernel
// BB#0:                                 // %entry
	s_buffer_load_dword s1, s[8:11], 0x0
	s_buffer_load_dword s14, s[8:11], 0x4
	s_buffer_load_dword s0, s[8:11], 0x8
	s_buffer_load_dword s15, s[8:11], 0xc
	s_buffer_load_dword s20, s[8:11], 0x10
	s_buffer_load_dword s21, s[4:7], 0x4
	s_buffer_load_dword s22, s[4:7], 0x5
	s_mov_b32 s23, 0xffff
	s_load_dwordx4 s[4:7], s[2:3], 0x60
	s_load_dwordx4 s[8:11], s[2:3], 0x58
	s_load_dwordx4 s[16:19], s[2:3], 0x50
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s21, s23
	s_min_u32 s3, s22, s23
	s_mul_i32 s2, s2, s12
	v_add_i32 v0, vcc, s2, v0
	s_mul_i32 s2, s3, s13
	v_add_i32 v1, vcc, s2, v1
	s_lshr_b32 s2, s20, 2
	v_lshlrev_b32 v1, 2, v1
                                        // implicit-def: VGPR8
                                        // implicit-def: VGPR3
                                        // implicit-def: VGPR2
	v_cmp_ne_i32 s[12:13], 0, s15
                                        // implicit-def: VGPR9_VGPR10_VGPR11_VGPR12
                                        // implicit-def: VGPR13_VGPR14_VGPR15_VGPR16
                                        // implicit-def: VGPR17_VGPR18_VGPR19_VGPR20
                                        // implicit-def: VGPR4_VGPR5_VGPR6_VGPR7
	s_and_saveexec_b64 s[12:13], s[12:13]
	s_xor_b64 s[12:13], exec, s[12:13]
	s_cbranch_execz BB0_5
// BB#2:                                 // %for.body.lr.ph
	v_mov_b32 v4, 0
	s_lshr_b32 s3, s15, 2
	v_or_b32 v3, 2, v1
	v_or_b32 v2, 3, v1
	v_mul_lo_i32 v21, v2, s3
	v_mul_lo_i32 v22, v3, s3
	v_or_b32 v8, 1, v1
	v_mul_lo_i32 v23, v1, s3
	v_mul_lo_i32 v24, v8, s3
	v_mov_b32 v5, v4
	v_mov_b32 v6, v4
	s_mov_b64 s[20:21], 0
	v_mov_b32 v7, v4
	v_mov_b32 v17, v4
	v_mov_b32 v18, v5
	v_mov_b32 v19, v6
	v_mov_b32 v20, v7
	v_mov_b32 v25, v4
	v_mov_b32 v13, v4
	v_mov_b32 v14, v5
	v_mov_b32 v15, v6
	v_mov_b32 v16, v7
	v_mov_b32 v9, v4
	v_mov_b32 v10, v5
	v_mov_b32 v11, v6
	v_mov_b32 v12, v7
BB0_6:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_or_b32 v26, 1, v25
	v_mul_lo_i32 v26, v26, s2
	v_ashrrev_i32 v27, 31, v25
	v_lshrrev_b32 v27, 30, v27
	v_add_i32 v27, vcc, v27, v25
	v_ashrrev_i32 v27, 2, v27
	v_add_i32 v26, vcc, v26, v0
	v_lshlrev_b32 v26, 4, v26
	v_add_i32 v26, vcc, s14, v26
	v_or_b32 v28, 2, v25
	v_mul_lo_i32 v28, v28, s2
	v_mul_lo_i32 v29, v25, s2
	v_or_b32 v30, 3, v25
	v_mul_lo_i32 v30, v30, s2
	v_add_i32 v28, vcc, v28, v0
	v_add_i32 v29, vcc, v29, v0
	v_lshlrev_b32 v29, 4, v29
	v_add_i32 v31, vcc, v27, v21
	v_add_i32 v32, vcc, v27, v22
	v_add_i32 v33, vcc, v27, v24
	v_add_i32 v27, vcc, v27, v23
	v_lshlrev_b32 v33, 4, v33
	v_lshlrev_b32 v32, 4, v32
	v_lshlrev_b32 v31, 4, v31
	v_lshlrev_b32 v27, 4, v27
	v_add_i32 v31, vcc, s1, v31
	v_add_i32 v32, vcc, s1, v32
	v_add_i32 v33, vcc, s1, v33
	v_add_i32 v27, vcc, s1, v27
	tbuffer_load_format_xyzw v[34:37], v31, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_xyzw v[38:41], v26, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_xyzw v[42:45], v32, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_xyzw v[46:49], v33, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_xyzw v[50:53], v27, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v26, vcc, s14, v29
	tbuffer_load_format_xyzw v[54:57], v26, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v26, 4, v28
	v_add_i32 v26, vcc, s14, v26
	tbuffer_load_format_xyzw v[26:29], v26, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v30, vcc, v30, v0
	v_lshlrev_b32 v30, 4, v30
	v_add_i32 v30, vcc, s14, v30
	tbuffer_load_format_xyzw v[30:33], v30, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(6)
	v_mul_f32 v58, v41, v35
	v_mul_f32 v59, v40, v35
	v_mul_f32 v60, v39, v35
	v_mul_f32 v35, v38, v35
	s_waitcnt vmcnt(5)
	v_mul_f32 v61, v41, v43
	v_mul_f32 v62, v40, v43
	v_mul_f32 v63, v39, v43
	v_mul_f32 v43, v38, v43
	s_waitcnt vmcnt(4)
	v_mul_f32 v64, v41, v47
	v_mul_f32 v65, v40, v47
	v_mul_f32 v66, v39, v47
	v_mul_f32 v47, v38, v47
	s_waitcnt vmcnt(3)
	v_mul_f32 v38, v38, v51
	v_mul_f32 v39, v39, v51
	v_mul_f32 v40, v40, v51
	v_mul_f32 v41, v41, v51
	s_waitcnt vmcnt(2)
	v_mac_f32 v58, v57, v34
	v_mac_f32 v59, v56, v34
	v_mac_f32 v60, v55, v34
	v_mac_f32 v35, v54, v34
	v_mac_f32 v61, v57, v42
	v_mac_f32 v62, v56, v42
	v_mac_f32 v63, v55, v42
	v_mac_f32 v43, v54, v42
	v_mac_f32 v64, v57, v46
	v_mac_f32 v65, v56, v46
	v_mac_f32 v66, v55, v46
	v_mac_f32 v47, v54, v46
	v_mac_f32 v38, v54, v50
	v_mac_f32 v39, v55, v50
	v_mac_f32 v40, v56, v50
	v_mac_f32 v41, v57, v50
	s_waitcnt vmcnt(1)
	v_mac_f32 v58, v29, v36
	v_mac_f32 v59, v28, v36
	v_mac_f32 v60, v27, v36
	v_mac_f32 v35, v26, v36
	v_mac_f32 v61, v29, v44
	v_mac_f32 v62, v28, v44
	v_mac_f32 v63, v27, v44
	v_mac_f32 v43, v26, v44
	v_mac_f32 v64, v29, v48
	v_mac_f32 v65, v28, v48
	v_mac_f32 v66, v27, v48
	v_mac_f32 v47, v26, v48
	v_mac_f32 v41, v29, v52
	v_mac_f32 v40, v28, v52
	v_mac_f32 v39, v27, v52
	v_mac_f32 v38, v26, v52
	s_waitcnt vmcnt(0)
	v_mac_f32 v58, v33, v37
	v_mac_f32 v59, v32, v37
	v_mac_f32 v60, v31, v37
	v_mac_f32 v35, v30, v37
	v_mac_f32 v61, v33, v45
	v_mac_f32 v62, v32, v45
	v_mac_f32 v63, v31, v45
	v_mac_f32 v43, v30, v45
	v_mac_f32 v64, v33, v49
	v_mac_f32 v65, v32, v49
	v_mac_f32 v66, v31, v49
	v_mac_f32 v47, v30, v49
	v_mac_f32 v38, v30, v53
	v_mac_f32 v39, v31, v53
	v_mac_f32 v40, v32, v53
	v_mac_f32 v41, v33, v53
	v_add_f32 v12, v58, v12
	v_add_f32 v16, v61, v16
	v_add_f32 v20, v64, v20
	v_add_f32 v7, v41, v7
	v_add_f32 v11, v59, v11
	v_add_f32 v15, v62, v15
	v_add_f32 v19, v65, v19
	v_add_f32 v6, v40, v6
	v_add_f32 v10, v60, v10
	v_add_f32 v14, v63, v14
	v_add_f32 v18, v66, v18
	v_add_f32 v5, v39, v5
	v_add_f32 v9, v35, v9
	v_add_f32 v13, v43, v13
	v_add_f32 v17, v47, v17
	v_add_f32 v4, v38, v4
	v_add_i32 v25, vcc, 4, v25
	v_cmp_le_u32 vcc, s15, v25
	s_or_b64 s[20:21], vcc, s[20:21]
	s_andn2_b64 exec, exec, s[20:21]
	s_cbranch_execnz BB0_6
// BB#3:                                 // %Flow
	s_or_b64 exec, exec, s[20:21]
BB0_5:                                  // %Flow1
	s_or_saveexec_b64 s[12:13], s[12:13]
	s_xor_b64 exec, exec, s[12:13]
	s_cbranch_execz BB0_4
// BB#1:                                 // %entry.for.cond.cleanup_crit_edge
	v_or_b32 v2, 3, v1
	v_or_b32 v3, 2, v1
	v_or_b32 v8, 1, v1
	v_mov_b32 v4, 0
	v_mov_b32 v5, v4
	v_mov_b32 v6, v4
	v_mov_b32 v7, v4
	v_mov_b32 v17, v4
	v_mov_b32 v18, v5
	v_mov_b32 v19, v6
	v_mov_b32 v20, v7
	v_mov_b32 v13, v4
	v_mov_b32 v14, v5
	v_mov_b32 v15, v6
	v_mov_b32 v16, v7
	v_mov_b32 v9, v4
	v_mov_b32 v10, v5
	v_mov_b32 v11, v6
	v_mov_b32 v12, v7
BB0_4:                                  // %for.cond.cleanup
	s_or_b64 exec, exec, s[12:13]
	v_mul_lo_i32 v1, v1, s2
	v_add_i32 v1, vcc, v1, v0
	v_mul_lo_i32 v8, v8, s2
	v_lshlrev_b32 v1, 4, v1
	v_add_i32 v1, vcc, s0, v1
	tbuffer_store_format_xyzw v[4:7], v1, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v1, vcc, v8, v0
	v_mul_lo_i32 v3, v3, s2
	v_lshlrev_b32 v1, 4, v1
	v_add_i32 v1, vcc, s0, v1
	tbuffer_store_format_xyzw v[17:20], v1, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v1, vcc, v3, v0
	v_mul_lo_i32 v2, v2, s2
	v_lshlrev_b32 v1, 4, v1
	v_add_i32 v1, vcc, s0, v1
	tbuffer_store_format_xyzw v[13:16], v1, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v0, vcc, v2, v0
	v_lshlrev_b32 v0, 4, v0
	v_add_i32 v0, vcc, s0, v0
	tbuffer_store_format_xyzw v[9:12], v0, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

.args
	float[4]* matrixA 0 uav10 
	float[4]* matrixB 16 uav11 
	float[4]* matrixC 32 uav12 
	i32 widthA 48 
	i32 widthB 64 

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 868
	// NumVgprs = 67
	// NumSgprs = 26
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1
.global	mmmKernel_local
.text



mmmKernel_local:                        // @mmmKernel_local
// BB#0:                                 // %entry
	s_buffer_load_dword s15, s[8:11], 0x0
	s_buffer_load_dword s16, s[8:11], 0x4
	s_buffer_load_dword s14, s[8:11], 0x8
	s_buffer_load_dword s17, s[8:11], 0xc
	s_buffer_load_dword s9, s[8:11], 0x10
	s_buffer_load_dword s8, s[4:7], 0x0
	s_buffer_load_dword s0, s[4:7], 0x4
	s_mov_b32 s11, 0xffff
	s_waitcnt lgkmcnt(0)
	s_min_u32 s10, s0, s11
	v_cvt_f32_u32 v2, s10
	v_rcp_f32 v2, v2
	v_mul_f32 v2, 0x4f800000, v2
	v_cvt_u32_f32 v2, v2
	v_mul_hi_u32 v3, v2, s10
	v_mul_lo_i32 v4, v2, s10
	v_cmp_eq_i32 s[0:1], 0, v3
	v_sub_i32 v3, vcc, 0, v4
	v_cndmask_b32 v3, v4, v3, s[0:1]
	v_mul_hi_u32 v3, v3, v2
	v_add_i32 v4, vcc, v3, v2
	v_subrev_i32 v2, vcc, v3, v2
	v_cndmask_b32 v2, v2, v4, s[0:1]
	s_ashr_i32 s0, s17, 31
	s_lshr_b32 s0, s0, 30
	s_add_i32 s0, s17, s0
	s_ashr_i32 s0, s0, 2
	v_mul_hi_u32 v2, v2, s0
	v_mul_lo_i32 v3, v2, s10
	s_buffer_load_dword s1, s[4:7], 0x5
	v_cmp_ge_u32 vcc, s0, v3
	v_cndmask_b32 v4, 0, -1, vcc
	v_sub_i32 v3, vcc, s0, v3
	v_cmp_le_u32 vcc, s10, v3
	v_cndmask_b32 v3, 0, -1, vcc
	v_and_b32 v3, v4, v3
	v_add_i32 v5, vcc, 1, v2
	v_cmp_eq_i32 vcc, 0, v3
	v_cndmask_b32 v3, v5, v2, vcc
	v_add_i32 v2, vcc, -1, v2
	v_cmp_eq_i32 vcc, 0, v4
	s_load_dwordx4 s[4:7], s[2:3], 0x60
	s_load_dwordx4 s[20:23], s[2:3], 0x58
	s_load_dwordx4 s[24:27], s[2:3], 0x50
	v_cndmask_b32 v4, v3, v2, vcc
	v_mov_b32 v5, 0
	s_waitcnt lgkmcnt(0)
	s_min_u32 s1, s1, s11
	v_mov_b32 v6, v5
	s_mul_i32 s1, s1, s13
	v_mov_b32 v7, v5
	s_mul_i32 s2, s12, s10
	v_add_i32 v2, vcc, s1, v1
	v_lshlrev_b32 v3, 2, v2
	v_add_i32 v2, vcc, s2, v0
	v_mov_b32 v8, v5
	v_cmp_ne_i32 vcc, 0, v4
	v_mov_b32 v13, v5
	v_mov_b32 v14, v6
	v_mov_b32 v15, v7
	v_mov_b32 v16, v8
	v_mov_b32 v17, v5
	v_mov_b32 v18, v6
	v_mov_b32 v19, v7
	v_mov_b32 v20, v8
	v_mov_b32 v9, v5
	v_mov_b32 v10, v6
	v_mov_b32 v11, v7
	v_mov_b32 v12, v8
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz BB1_4
// BB#1:                                 // %for.body.lr.ph
	v_lshlrev_b32 v5, 2, v1
	v_mul_lo_i32 v1, v5, s10
	s_mul_i32 s1, s10, 3
	s_lshl_b32 s11, s10, 1
	v_add_i32 v6, vcc, v0, v1
	v_add_i32 v7, vcc, s1, v6
	v_add_i32 v8, vcc, s11, v6
	v_lshlrev_b32 v8, 4, v8
	v_lshlrev_b32 v7, 4, v7
	v_mul_lo_i32 v9, v3, s0
	v_add_i32 v10, vcc, s10, v6
	v_lshlrev_b32 v12, 4, v10
	v_lshlrev_b32 v6, 4, v6
	v_add_i32 v0, vcc, v0, v9
	v_or_b32 v9, 1, v5
	s_lshl_b32 s1, s0, 1
	s_mul_i32 s11, s0, 3
	v_or_b32 v10, 3, v5
	v_or_b32 v5, 2, v5
	s_lshl_b32 s12, s8, 2
	s_lshl_b32 s13, s10, 2
	v_mul_lo_i32 v21, v10, s10
	v_mul_lo_i32 v22, v5, s10
	v_mul_lo_i32 v23, v9, s10
	v_add_i32 v24, vcc, s9, v7
	v_mov_b32 v9, 0
	v_add_i32 v25, vcc, s9, v8
	v_mov_b32 v10, v9
	v_add_i32 v26, vcc, s9, v6
	v_mov_b32 v11, v9
	v_add_i32 v27, vcc, s9, v12
	v_mov_b32 v12, v9
	v_mov_b32 v28, v9
	s_mov_b64 s[28:29], 0
	s_mov_b64 s[18:19], 0
	v_mov_b32 v17, v9
	v_mov_b32 v18, v10
	v_mov_b32 v19, v11
	v_mov_b32 v20, v12
	v_mov_b32 v13, v9
	v_mov_b32 v14, v10
	v_mov_b32 v15, v11
	v_mov_b32 v16, v12
	v_mov_b32 v5, v9
	v_mov_b32 v6, v10
	v_mov_b32 v7, v11
	v_mov_b32 v8, v12
BB1_5:                                  // %for.body
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_8 Depth 2
	v_mul_lo_i32 v30, v28, s10
	s_mov_b32 m0, -1
	v_mov_b32 v29, 0
	v_cmp_ne_i32 s[30:31], 0, s13
	v_mul_lo_i32 v31, s12, v30
	v_add_i32 v30, vcc, v30, v0
	v_lshlrev_b32 v32, 4, v30
	v_add_i32 v32, vcc, s15, v32
	tbuffer_load_format_xyzw v[32:35], v32, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v36, vcc, s0, v30
	v_lshlrev_b32 v36, 4, v36
	v_add_i32 v36, vcc, s15, v36
	tbuffer_load_format_xyzw v[36:39], v36, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v40, vcc, s1, v30
	v_lshlrev_b32 v40, 4, v40
	v_add_i32 v40, vcc, s15, v40
	tbuffer_load_format_xyzw v[40:43], v40, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v30, vcc, s11, v30
	v_lshlrev_b32 v30, 4, v30
	v_add_i32 v30, vcc, s15, v30
	tbuffer_load_format_xyzw v[44:47], v30, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v30, vcc, 12, v26
	s_waitcnt vmcnt(3)
	ds_write_b32 v30, v35
	v_add_i32 v30, vcc, 8, v26
	ds_write_b32 v30, v34
	v_add_i32 v30, vcc, 4, v26
	ds_write_b32 v30, v33
	ds_write_b32 v26, v32
	v_add_i32 v30, vcc, 12, v27
	s_waitcnt vmcnt(2)
	ds_write_b32 v30, v39
	v_add_i32 v30, vcc, 8, v27
	ds_write_b32 v30, v38
	v_add_i32 v30, vcc, 4, v27
	ds_write_b32 v30, v37
	ds_write_b32 v27, v36
	v_add_i32 v30, vcc, 12, v25
	s_waitcnt vmcnt(1)
	ds_write_b32 v30, v43
	v_add_i32 v30, vcc, 8, v25
	ds_write_b32 v30, v42
	v_add_i32 v30, vcc, 4, v25
	ds_write_b32 v30, v41
	ds_write_b32 v25, v40
	v_add_i32 v30, vcc, 12, v24
	s_waitcnt vmcnt(0)
	ds_write_b32 v30, v47
	v_add_i32 v30, vcc, 8, v24
	ds_write_b32 v30, v46
	v_add_i32 v30, vcc, 4, v24
	ds_write_b32 v30, v45
	ds_write_b32 v24, v44
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_add_i32 v30, vcc, v31, v2
	s_mov_b64 s[32:33], 0
	s_and_saveexec_b64 s[30:31], s[30:31]
	s_xor_b64 s[30:31], exec, s[30:31]
	s_cbranch_execz BB1_7
BB1_8:                                  // %for.body.51
                                        //   Parent Loop BB1_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	s_mov_b32 m0, -1
	v_or_b32 v31, 1, v29
	v_mul_lo_i32 v31, v31, s8
	v_or_b32 v32, 2, v29
	v_mul_lo_i32 v32, v32, s8
	v_mul_lo_i32 v33, v29, s8
	v_add_i32 v31, vcc, v31, v30
	v_lshlrev_b32 v31, 4, v31
	v_or_b32 v34, 3, v29
	v_mul_lo_i32 v34, v34, s8
	v_add_i32 v33, vcc, v33, v30
	v_add_i32 v32, vcc, v32, v30
	v_add_i32 v31, vcc, s16, v31
	v_lshlrev_b32 v33, 4, v33
	v_add_i32 v34, vcc, v34, v30
	v_lshlrev_b32 v32, 4, v32
	v_add_i32 v33, vcc, s16, v33
	tbuffer_load_format_xyzw v[35:38], v31, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_xyzw v[39:42], v33, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v31, vcc, s16, v32
	tbuffer_load_format_xyzw v[43:46], v31, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v31, 4, v34
	v_add_i32 v31, vcc, s16, v31
	tbuffer_load_format_xyzw v[31:34], v31, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_ashrrev_i32 v47, 2, v29
	v_add_i32 v48, vcc, v47, v21
	v_lshlrev_b32 v48, 4, v48
	v_add_i32 v48, vcc, s9, v48
	v_add_i32 v49, vcc, 12, v48
	v_add_i32 v50, vcc, 8, v48
	ds_read_b32 v54, v49
	ds_read_b32 v53, v50
	v_add_i32 v49, vcc, v47, v22
	v_lshlrev_b32 v49, 4, v49
	v_add_i32 v49, vcc, s9, v49
	v_add_i32 v50, vcc, 12, v49
	v_add_i32 v51, vcc, 8, v49
	ds_read_b32 v58, v50
	ds_read_b32 v57, v51
	v_add_i32 v50, vcc, v47, v23
	v_lshlrev_b32 v50, 4, v50
	v_add_i32 v50, vcc, s9, v50
	v_add_i32 v51, vcc, 12, v50
	v_add_i32 v52, vcc, 8, v50
	ds_read_b32 v62, v51
	ds_read_b32 v61, v52
	ds_read_b32 v51, v48
	v_add_i32 v48, vcc, 4, v48
	ds_read_b32 v52, v48
	ds_read_b32 v55, v49
	v_add_i32 v48, vcc, 4, v49
	ds_read_b32 v56, v48
	ds_read_b32 v59, v50
	v_add_i32 v48, vcc, 4, v50
	ds_read_b32 v60, v48
	v_add_i32 v47, vcc, v47, v1
	v_lshlrev_b32 v47, 4, v47
	v_add_i32 v47, vcc, s9, v47
	v_add_i32 v48, vcc, 12, v47
	v_add_i32 v49, vcc, 8, v47
	ds_read_b32 v66, v48
	ds_read_b32 v65, v49
	ds_read_b32 v63, v47
	v_add_i32 v47, vcc, 4, v47
	ds_read_b32 v64, v47
	s_waitcnt vmcnt(3) & lgkmcnt(0)
	v_mul_f32 v47, v38, v52
	v_mul_f32 v48, v37, v52
	v_mul_f32 v49, v36, v52
	v_mul_f32 v50, v35, v52
	v_mul_f32 v52, v38, v56
	v_mul_f32 v67, v37, v56
	v_mul_f32 v68, v36, v56
	v_mul_f32 v56, v35, v56
	v_mul_f32 v69, v38, v60
	v_mul_f32 v70, v37, v60
	v_mul_f32 v71, v36, v60
	v_mul_f32 v60, v35, v60
	v_mul_f32 v35, v35, v64
	v_mul_f32 v36, v36, v64
	v_mul_f32 v37, v37, v64
	v_mul_f32 v38, v38, v64
	s_waitcnt vmcnt(2)
	v_mac_f32 v47, v42, v51
	v_mac_f32 v48, v41, v51
	v_mac_f32 v49, v40, v51
	v_mac_f32 v50, v39, v51
	v_mac_f32 v52, v42, v55
	v_mac_f32 v67, v41, v55
	v_mac_f32 v68, v40, v55
	v_mac_f32 v56, v39, v55
	v_mac_f32 v69, v42, v59
	v_mac_f32 v70, v41, v59
	v_mac_f32 v71, v40, v59
	v_mac_f32 v60, v39, v59
	v_mac_f32 v35, v39, v63
	v_mac_f32 v36, v40, v63
	v_mac_f32 v37, v41, v63
	v_mac_f32 v38, v42, v63
	s_waitcnt vmcnt(1)
	v_mac_f32 v47, v46, v53
	v_mac_f32 v48, v45, v53
	v_mac_f32 v49, v44, v53
	v_mac_f32 v50, v43, v53
	v_mac_f32 v52, v46, v57
	v_mac_f32 v67, v45, v57
	v_mac_f32 v68, v44, v57
	v_mac_f32 v56, v43, v57
	v_mac_f32 v69, v46, v61
	v_mac_f32 v70, v45, v61
	v_mac_f32 v71, v44, v61
	v_mac_f32 v60, v43, v61
	v_mac_f32 v38, v46, v65
	v_mac_f32 v37, v45, v65
	v_mac_f32 v36, v44, v65
	v_mac_f32 v35, v43, v65
	s_waitcnt vmcnt(0)
	v_mac_f32 v47, v34, v54
	v_mac_f32 v48, v33, v54
	v_mac_f32 v49, v32, v54
	v_mac_f32 v50, v31, v54
	v_mac_f32 v52, v34, v58
	v_mac_f32 v67, v33, v58
	v_mac_f32 v68, v32, v58
	v_mac_f32 v56, v31, v58
	v_mac_f32 v69, v34, v62
	v_mac_f32 v70, v33, v62
	v_mac_f32 v71, v32, v62
	v_mac_f32 v60, v31, v62
	v_mac_f32 v35, v31, v66
	v_mac_f32 v36, v32, v66
	v_mac_f32 v37, v33, v66
	v_mac_f32 v38, v34, v66
	v_add_f32 v8, v47, v8
	v_add_f32 v16, v52, v16
	v_add_f32 v20, v69, v20
	v_add_f32 v12, v38, v12
	v_add_f32 v7, v48, v7
	v_add_f32 v15, v67, v15
	v_add_f32 v19, v70, v19
	v_add_f32 v11, v37, v11
	v_add_f32 v6, v49, v6
	v_add_f32 v14, v68, v14
	v_add_f32 v18, v71, v18
	v_add_f32 v10, v36, v10
	v_add_f32 v5, v50, v5
	v_add_f32 v13, v56, v13
	v_add_f32 v17, v60, v17
	v_add_f32 v9, v35, v9
	v_add_i32 v29, vcc, 4, v29
	v_cmp_le_u32 vcc, s13, v29
	s_or_b64 s[32:33], vcc, s[32:33]
	s_andn2_b64 exec, exec, s[32:33]
	s_cbranch_execnz BB1_8
// BB#6:                                 // %Flow
                                        //   in Loop: Header=BB1_5 Depth=1
	s_or_b64 exec, exec, s[32:33]
BB1_7:                                  // %for.cond.cleanup.50
                                        //   in Loop: Header=BB1_5 Depth=1
	s_or_b64 exec, exec, s[30:31]
	s_barrier
	v_add_i32 v28, vcc, 1, v28
	v_cmp_ge_u32 vcc, v28, v4
	s_or_b64 s[18:19], vcc, s[18:19]
	s_andn2_b64 exec, exec, s[18:19]
	s_cbranch_execnz BB1_5
// BB#2:                                 // %Flow1
	s_or_b64 exec, exec, s[18:19]
BB1_4:                                  // %Flow2
	s_or_b64 exec, exec, s[2:3]
	v_mul_lo_i32 v0, v3, s8
	v_add_i32 v0, vcc, v2, v0
// BB#3:                                 // %for.cond.cleanup
	v_lshlrev_b32 v1, 4, v0
	v_add_i32 v1, vcc, s14, v1
	tbuffer_store_format_xyzw v[9:12], v1, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v1, vcc, s8, v0
	v_lshlrev_b32 v1, 4, v1
	v_add_i32 v1, vcc, s14, v1
	tbuffer_store_format_xyzw v[17:20], v1, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_lshl_b32 s0, s8, 1
	v_add_i32 v1, vcc, s0, v0
	v_lshlrev_b32 v1, 4, v1
	v_add_i32 v1, vcc, s14, v1
	tbuffer_store_format_xyzw v[13:16], v1, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_mul_i32 s0, s8, 3
	v_add_i32 v0, vcc, s0, v0
	v_lshlrev_b32 v0, 4, v0
	v_add_i32 v0, vcc, s14, v0
	tbuffer_store_format_xyzw v[5:8], v0, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

.args
	float[4]* matrixA 0 uav10 
	float[4]* matrixB 16 uav11 
	float[4]* matrixC 32 uav12 
	i32 widthA 48 
	float[4]* blockA 64 hl

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 1300
	// NumVgprs = 72
	// NumSgprs = 36
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

