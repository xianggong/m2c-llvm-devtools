.global	mmmKernel
.text



mmmKernel:                              // @mmmKernel
// BB#0:                                 // %entry
	s_buffer_load_dword s1, s[8:11], 0x0
	s_buffer_load_dword s14, s[8:11], 0x4
	s_buffer_load_dword s0, s[8:11], 0x8
	s_buffer_load_dword s15, s[8:11], 0xc
	s_buffer_load_dword s20, s[8:11], 0x10
	s_load_dwordx4 s[8:11], s[2:3], 0x60
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_buffer_load_dword s21, s[4:7], 0x4
	s_buffer_load_dword s4, s[4:7], 0x5
	s_mov_b32 s5, 0xffff
	s_waitcnt lgkmcnt(0)
	s_min_u32 s22, s4, s5
	s_min_u32 s21, s21, s5
	s_load_dwordx4 s[4:7], s[2:3], 0x50
	s_mul_i32 s2, s22, s13
	s_mul_i32 s3, s21, s12
	v_add_i32 v1, vcc, s2, v1
	s_lshr_b32 s2, s20, 2
	v_add_i32 v0, vcc, s3, v0
	v_lshlrev_b32 v2, 2, v1
	v_cmp_ne_i32 s[12:13], 0, s15
                                        // implicit-def: VGPR12
                                        // implicit-def: VGPR7
                                        // implicit-def: VGPR1
                                        // implicit-def: VGPR8_VGPR9_VGPR10_VGPR11
                                        // implicit-def: VGPR13_VGPR14_VGPR15_VGPR16
                                        // implicit-def: VGPR17_VGPR18_VGPR19_VGPR20
                                        // implicit-def: VGPR3_VGPR4_VGPR5_VGPR6
	s_waitcnt lgkmcnt(0)
	s_and_saveexec_b64 s[12:13], s[12:13]
	s_xor_b64 s[12:13], exec, s[12:13]
	s_cbranch_execz BB0_5
// BB#2:                                 // %for.body.lr.ph
	v_mov_b32 v3, 0
	v_mov_b32 v4, v3
	v_mov_b32 v5, v3
	v_mov_b32 v6, v3
	s_lshr_b32 s3, s15, 2
	s_mov_b64 s[20:21], 0
	v_or_b32 v1, 3, v2
	v_mul_lo_i32 v21, v1, s3
	v_or_b32 v7, 2, v2
	v_mul_lo_i32 v22, v7, s3
	v_or_b32 v12, 1, v2
	v_mul_lo_i32 v23, v12, s3
	v_mul_lo_i32 v24, v2, s3
	v_mov_b32 v25, v3
	v_mov_b32 v17, v3
	v_mov_b32 v18, v4
	v_mov_b32 v19, v5
	v_mov_b32 v20, v6
	v_mov_b32 v13, v3
	v_mov_b32 v14, v4
	v_mov_b32 v15, v5
	v_mov_b32 v16, v6
	v_mov_b32 v8, v3
	v_mov_b32 v9, v4
	v_mov_b32 v10, v5
	v_mov_b32 v11, v6
BB0_6:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_ashrrev_i32 v26, 31, v25
	v_lshrrev_b32 v26, 30, v26
	v_add_i32 v26, vcc, v26, v25
	v_ashrrev_i32 v26, 2, v26
	v_add_i32 v27, vcc, v26, v21
	v_lshlrev_b32 v27, 4, v27
	v_add_i32 v27, vcc, s1, v27
	tbuffer_load_format_xyzw v[27:30], v27, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v31, vcc, v26, v22
	v_lshlrev_b32 v31, 4, v31
	v_add_i32 v31, vcc, s1, v31
	tbuffer_load_format_xyzw v[31:34], v31, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v35, vcc, v26, v23
	v_lshlrev_b32 v35, 4, v35
	v_add_i32 v35, vcc, s1, v35
	tbuffer_load_format_xyzw v[35:38], v35, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v26, vcc, v26, v24
	v_lshlrev_b32 v26, 4, v26
	v_add_i32 v26, vcc, s1, v26
	tbuffer_load_format_xyzw v[39:42], v26, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v26, 1, v25
	v_mul_lo_i32 v26, v26, s2
	v_add_i32 v26, vcc, v26, v0
	v_lshlrev_b32 v26, 4, v26
	v_add_i32 v26, vcc, s14, v26
	tbuffer_load_format_xyzw v[43:46], v26, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_mul_lo_i32 v26, v25, s2
	v_add_i32 v26, vcc, v26, v0
	v_lshlrev_b32 v26, 4, v26
	v_add_i32 v26, vcc, s14, v26
	tbuffer_load_format_xyzw v[47:50], v26, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v26, 2, v25
	v_mul_lo_i32 v26, v26, s2
	v_add_i32 v26, vcc, v26, v0
	v_lshlrev_b32 v26, 4, v26
	v_add_i32 v26, vcc, s14, v26
	tbuffer_load_format_xyzw v[51:54], v26, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v26, 3, v25
	v_mul_lo_i32 v26, v26, s2
	v_add_i32 v26, vcc, v26, v0
	v_lshlrev_b32 v26, 4, v26
	v_add_i32 v26, vcc, s14, v26
	tbuffer_load_format_xyzw v[55:58], v26, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v25, vcc, 4, v25
	v_cmp_le_u32 vcc, s15, v25
	s_waitcnt vmcnt(3)
	v_mul_f32 v26, v46, v40
	v_mul_f32 v59, v45, v40
	v_mul_f32 v60, v44, v40
	v_mul_f32 v40, v43, v40
	v_mul_f32 v61, v46, v36
	v_mul_f32 v62, v45, v36
	v_mul_f32 v63, v44, v36
	v_mul_f32 v36, v43, v36
	v_mul_f32 v64, v46, v32
	v_mul_f32 v65, v45, v32
	v_mul_f32 v66, v44, v32
	v_mul_f32 v32, v43, v32
	v_mul_f32 v46, v46, v28
	v_mul_f32 v45, v45, v28
	v_mul_f32 v44, v44, v28
	v_mul_f32 v28, v43, v28
	s_waitcnt vmcnt(2)
	v_mac_f32 v26, v50, v39
	v_mac_f32 v59, v49, v39
	v_mac_f32 v60, v48, v39
	v_mac_f32 v40, v47, v39
	v_mac_f32 v61, v50, v35
	v_mac_f32 v62, v49, v35
	v_mac_f32 v63, v48, v35
	v_mac_f32 v36, v47, v35
	v_mac_f32 v64, v50, v31
	v_mac_f32 v65, v49, v31
	v_mac_f32 v66, v48, v31
	v_mac_f32 v32, v47, v31
	v_mac_f32 v46, v50, v27
	v_mac_f32 v45, v49, v27
	v_mac_f32 v44, v48, v27
	v_mac_f32 v28, v47, v27
	s_waitcnt vmcnt(1)
	v_mac_f32 v26, v54, v41
	v_mac_f32 v59, v53, v41
	v_mac_f32 v60, v52, v41
	v_mac_f32 v40, v51, v41
	v_mac_f32 v61, v54, v37
	v_mac_f32 v62, v53, v37
	v_mac_f32 v63, v52, v37
	v_mac_f32 v36, v51, v37
	v_mac_f32 v64, v54, v33
	v_mac_f32 v65, v53, v33
	v_mac_f32 v66, v52, v33
	v_mac_f32 v32, v51, v33
	v_mac_f32 v46, v54, v29
	v_mac_f32 v45, v53, v29
	v_mac_f32 v44, v52, v29
	v_mac_f32 v28, v51, v29
	s_waitcnt vmcnt(0)
	v_mac_f32 v26, v58, v42
	v_add_f32 v6, v26, v6
	v_mac_f32 v40, v55, v42
	v_mac_f32 v59, v57, v42
	v_mac_f32 v60, v56, v42
	v_add_f32 v5, v59, v5
	v_add_f32 v4, v60, v4
	v_add_f32 v3, v40, v3
	v_mac_f32 v61, v58, v38
	v_add_f32 v20, v61, v20
	v_mac_f32 v36, v55, v38
	v_mac_f32 v62, v57, v38
	v_mac_f32 v63, v56, v38
	v_add_f32 v19, v62, v19
	v_add_f32 v18, v63, v18
	v_add_f32 v17, v36, v17
	v_mac_f32 v64, v58, v34
	v_add_f32 v16, v64, v16
	v_mac_f32 v32, v55, v34
	v_mac_f32 v65, v57, v34
	v_mac_f32 v66, v56, v34
	v_add_f32 v15, v65, v15
	v_add_f32 v14, v66, v14
	v_add_f32 v13, v32, v13
	v_mac_f32 v46, v58, v30
	v_add_f32 v11, v46, v11
	v_mac_f32 v28, v55, v30
	v_mac_f32 v45, v57, v30
	v_mac_f32 v44, v56, v30
	v_add_f32 v10, v45, v10
	v_add_f32 v9, v44, v9
	v_add_f32 v8, v28, v8
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
	v_mov_b32 v3, 0
	v_mov_b32 v4, v3
	v_mov_b32 v5, v3
	v_mov_b32 v6, v3
	v_or_b32 v1, 3, v2
	v_or_b32 v7, 2, v2
	v_or_b32 v12, 1, v2
	v_mov_b32 v17, v3
	v_mov_b32 v18, v4
	v_mov_b32 v19, v5
	v_mov_b32 v20, v6
	v_mov_b32 v13, v3
	v_mov_b32 v14, v4
	v_mov_b32 v15, v5
	v_mov_b32 v16, v6
	v_mov_b32 v8, v3
	v_mov_b32 v9, v4
	v_mov_b32 v10, v5
	v_mov_b32 v11, v6
BB0_4:                                  // %for.cond.cleanup
	s_or_b64 exec, exec, s[12:13]
	v_mul_lo_i32 v2, v2, s2
	v_add_i32 v2, vcc, v2, v0
	v_lshlrev_b32 v2, 4, v2
	v_add_i32 v2, vcc, s0, v2
	tbuffer_store_format_xyzw v[3:6], v2, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_mul_lo_i32 v2, v12, s2
	v_add_i32 v2, vcc, v2, v0
	v_lshlrev_b32 v2, 4, v2
	v_add_i32 v2, vcc, s0, v2
	tbuffer_store_format_xyzw v[17:20], v2, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_mul_lo_i32 v2, v7, s2
	v_add_i32 v2, vcc, v2, v0
	v_lshlrev_b32 v2, 4, v2
	v_add_i32 v2, vcc, s0, v2
	tbuffer_store_format_xyzw v[13:16], v2, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_mul_lo_i32 v1, v1, s2
	v_add_i32 v0, vcc, v1, v0
	v_lshlrev_b32 v0, 4, v0
	v_add_i32 v0, vcc, s0, v0
	tbuffer_store_format_xyzw v[8:11], v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

// SKBB#0:                                 // %entry
	s_buffer_load_dword s1, s[8:11], 0x0
	s_buffer_load_dword s14, s[8:11], 0x4
	s_buffer_load_dword s0, s[8:11], 0x8
	s_buffer_load_dword s15, s[8:11], 0xc
	s_buffer_load_dword s20, s[8:11], 0x10
	s_buffer_load_dword s8, s[4:7], 0x4
	s_buffer_load_dword s4, s[4:7], 0x5
	s_mov_b32 s5, 0xffff
	s_waitcnt lgkmcnt(0)
	s_min_u32 s4, s4, s5
	s_min_u32 s5, s8, s5
	s_mul_i32 s4, s4, s13
	s_mul_i32 s12, s5, s12
	v_add_i32 v1, vcc, s4, v1
	v_cmp_ne_i32 s[22:23], 0, s15
	s_load_dwordx4 s[4:7], s[2:3], 0x60
	s_load_dwordx4 s[8:11], s[2:3], 0x58
	s_load_dwordx4 s[16:19], s[2:3], 0x50
	s_lshr_b32 s2, s20, 2
	v_add_i32 v0, vcc, s12, v0
	v_lshlrev_b32 v5, 2, v1
                                        // implicit-def: VGPR12
                                        // implicit-def: VGPR7
                                        // implicit-def: VGPR6
                                        // implicit-def: VGPR8_VGPR9_VGPR10_VGPR11
                                        // implicit-def: VGPR13_VGPR14_VGPR15_VGPR16
                                        // implicit-def: VGPR17_VGPR18_VGPR19_VGPR20
                                        // implicit-def: VGPR1_VGPR2_VGPR3_VGPR4
	s_waitcnt lgkmcnt(0)
	s_and_saveexec_b64 s[12:13], s[22:23]
	s_xor_b64 s[12:13], exec, s[12:13]
	s_cbranch_execz SKBB0_5
// SKBB#2:                                 // %for.body.lr.ph
	v_mov_b32 v1, 0
	v_mov_b32 v2, v1
	v_mov_b32 v3, v1
	v_mov_b32 v4, v1
	s_mov_b64 s[20:21], 0
	s_lshr_b32 s3, s15, 2
	v_or_b32 v7, 2, v5
	v_or_b32 v6, 3, v5
	v_mul_lo_i32 v21, v6, s3
	v_mul_lo_i32 v22, v7, s3
	v_or_b32 v12, 1, v5
	v_mul_lo_i32 v23, v5, s3
	v_mul_lo_i32 v24, v12, s3
	v_mov_b32 v25, v1
	v_mov_b32 v17, v1
	v_mov_b32 v18, v2
	v_mov_b32 v19, v3
	v_mov_b32 v20, v4
	v_mov_b32 v13, v1
	v_mov_b32 v14, v2
	v_mov_b32 v15, v3
	v_mov_b32 v16, v4
	v_mov_b32 v8, v1
	v_mov_b32 v9, v2
	v_mov_b32 v10, v3
	v_mov_b32 v11, v4
SKBB0_6:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_ashrrev_i32 v26, 31, v25
	v_lshrrev_b32 v26, 30, v26
	v_add_i32 v26, vcc, v26, v25
	v_ashrrev_i32 v26, 2, v26
	v_add_i32 v27, vcc, v26, v23
	v_lshlrev_b32 v27, 4, v27
	v_add_i32 v27, vcc, s1, v27
	tbuffer_load_format_xyzw v[27:30], v27, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v31, vcc, v26, v24
	v_lshlrev_b32 v31, 4, v31
	v_add_i32 v31, vcc, s1, v31
	tbuffer_load_format_xyzw v[31:34], v31, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v35, vcc, v26, v22
	v_lshlrev_b32 v35, 4, v35
	v_add_i32 v35, vcc, s1, v35
	tbuffer_load_format_xyzw v[35:38], v35, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v26, vcc, v26, v21
	v_lshlrev_b32 v26, 4, v26
	v_add_i32 v26, vcc, s1, v26
	tbuffer_load_format_xyzw v[39:42], v26, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v26, 1, v25
	v_mul_lo_i32 v26, v26, s2
	v_add_i32 v26, vcc, v26, v0
	v_lshlrev_b32 v26, 4, v26
	v_add_i32 v26, vcc, s14, v26
	tbuffer_load_format_xyzw v[43:46], v26, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_mul_lo_i32 v26, v25, s2
	v_add_i32 v26, vcc, v26, v0
	v_lshlrev_b32 v26, 4, v26
	v_add_i32 v26, vcc, s14, v26
	tbuffer_load_format_xyzw v[47:50], v26, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v26, 2, v25
	v_mul_lo_i32 v26, v26, s2
	v_add_i32 v26, vcc, v26, v0
	v_lshlrev_b32 v26, 4, v26
	v_add_i32 v26, vcc, s14, v26
	tbuffer_load_format_xyzw v[51:54], v26, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v26, 3, v25
	v_mul_lo_i32 v26, v26, s2
	v_add_i32 v26, vcc, v26, v0
	v_lshlrev_b32 v26, 4, v26
	v_add_i32 v26, vcc, s14, v26
	tbuffer_load_format_xyzw v[55:58], v26, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v25, vcc, 4, v25
	v_cmp_le_u32 vcc, s15, v25
	s_waitcnt vmcnt(3)
	v_mul_f32 v26, v43, v28
	v_mul_f32 v59, v44, v28
	v_mul_f32 v60, v45, v28
	v_mul_f32 v28, v46, v28
	v_mul_f32 v61, v46, v32
	v_mul_f32 v62, v45, v32
	v_mul_f32 v63, v44, v32
	v_mul_f32 v32, v43, v32
	v_mul_f32 v64, v46, v36
	v_mul_f32 v65, v45, v36
	v_mul_f32 v66, v44, v36
	v_mul_f32 v36, v43, v36
	v_mul_f32 v46, v46, v40
	v_mul_f32 v45, v45, v40
	v_mul_f32 v44, v44, v40
	v_mul_f32 v40, v43, v40
	s_waitcnt vmcnt(2)
	v_mac_f32 v26, v47, v27
	v_mac_f32 v59, v48, v27
	v_mac_f32 v60, v49, v27
	v_mac_f32 v28, v50, v27
	v_mac_f32 v61, v50, v31
	v_mac_f32 v62, v49, v31
	v_mac_f32 v63, v48, v31
	v_mac_f32 v32, v47, v31
	v_mac_f32 v64, v50, v35
	v_mac_f32 v65, v49, v35
	v_mac_f32 v66, v48, v35
	v_mac_f32 v36, v47, v35
	v_mac_f32 v46, v50, v39
	v_mac_f32 v45, v49, v39
	v_mac_f32 v44, v48, v39
	v_mac_f32 v40, v47, v39
	s_waitcnt vmcnt(1)
	v_mac_f32 v28, v54, v29
	v_mac_f32 v60, v53, v29
	v_mac_f32 v59, v52, v29
	v_mac_f32 v26, v51, v29
	v_mac_f32 v61, v54, v33
	v_mac_f32 v62, v53, v33
	v_mac_f32 v63, v52, v33
	v_mac_f32 v32, v51, v33
	v_mac_f32 v64, v54, v37
	v_mac_f32 v65, v53, v37
	v_mac_f32 v66, v52, v37
	v_mac_f32 v36, v51, v37
	v_mac_f32 v46, v54, v41
	v_mac_f32 v45, v53, v41
	v_mac_f32 v44, v52, v41
	v_mac_f32 v40, v51, v41
	s_waitcnt vmcnt(0)
	v_mac_f32 v26, v55, v30
	v_mac_f32 v59, v56, v30
	v_mac_f32 v60, v57, v30
	v_mac_f32 v28, v58, v30
	v_add_f32 v4, v28, v4
	v_add_f32 v3, v60, v3
	v_add_f32 v2, v59, v2
	v_add_f32 v1, v26, v1
	v_mac_f32 v61, v58, v34
	v_add_f32 v20, v61, v20
	v_mac_f32 v32, v55, v34
	v_mac_f32 v62, v57, v34
	v_mac_f32 v63, v56, v34
	v_add_f32 v19, v62, v19
	v_add_f32 v18, v63, v18
	v_add_f32 v17, v32, v17
	v_mac_f32 v64, v58, v38
	v_add_f32 v16, v64, v16
	v_mac_f32 v36, v55, v38
	v_mac_f32 v65, v57, v38
	v_mac_f32 v66, v56, v38
	v_add_f32 v15, v65, v15
	v_add_f32 v14, v66, v14
	v_add_f32 v13, v36, v13
	v_mac_f32 v46, v58, v42
	v_add_f32 v11, v46, v11
	v_mac_f32 v40, v55, v42
	v_mac_f32 v45, v57, v42
	v_mac_f32 v44, v56, v42
	v_add_f32 v10, v45, v10
	v_add_f32 v9, v44, v9
	v_add_f32 v8, v40, v8
	s_or_b64 s[20:21], vcc, s[20:21]
	s_andn2_b64 exec, exec, s[20:21]
	s_cbranch_execnz SKBB0_6
// SKBB#3:                                 // %Flow
	s_or_b64 exec, exec, s[20:21]
SKBB0_5:                                  // %Flow1
	s_or_saveexec_b64 s[12:13], s[12:13]
	s_xor_b64 exec, exec, s[12:13]
	s_cbranch_execz SKBB0_4
// SKBB#1:                                 // %entry.for.cond.cleanup_crit_edge
	v_mov_b32 v1, 0
	v_mov_b32 v2, v1
	v_mov_b32 v3, v1
	v_mov_b32 v4, v1
	v_or_b32 v6, 3, v5
	v_or_b32 v7, 2, v5
	v_or_b32 v12, 1, v5
	v_mov_b32 v17, v1
	v_mov_b32 v18, v2
	v_mov_b32 v19, v3
	v_mov_b32 v20, v4
	v_mov_b32 v13, v1
	v_mov_b32 v14, v2
	v_mov_b32 v15, v3
	v_mov_b32 v16, v4
	v_mov_b32 v8, v1
	v_mov_b32 v9, v2
	v_mov_b32 v10, v3
	v_mov_b32 v11, v4
SKBB0_4:                                  // %for.cond.cleanup
	s_or_b64 exec, exec, s[12:13]
	v_mul_lo_i32 v5, v5, s2
	v_add_i32 v5, vcc, v5, v0
	v_lshlrev_b32 v5, 4, v5
	v_add_i32 v5, vcc, s0, v5
	tbuffer_store_format_xyzw v[1:4], v5, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
	v_mul_lo_i32 v1, v12, s2
	v_add_i32 v1, vcc, v1, v0
	v_lshlrev_b32 v1, 4, v1
	v_add_i32 v1, vcc, s0, v1
	tbuffer_store_format_xyzw v[17:20], v1, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_mul_lo_i32 v1, v7, s2
	v_add_i32 v1, vcc, v1, v0
	v_lshlrev_b32 v1, 4, v1
	v_add_i32 v1, vcc, s0, v1
	tbuffer_store_format_xyzw v[13:16], v1, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_mul_lo_i32 v1, v6, s2
	v_add_i32 v0, vcc, v1, v0
	v_lshlrev_b32 v0, 4, v0
	v_add_i32 v0, vcc, s0, v0
	tbuffer_store_format_xyzw v[8:11], v0, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

.args
	float[4]* matrixA 0 uav10 
	float[4]* matrixB 16 uav11 
	float[4]* matrixC 32 uav12 
	i32 widthA 48 
	i32 widthB 64 

// Merge warning: sections do not match
.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 860
	// NumVgprs = 67
	// NumSgprs = 25
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1
// Merged MatrixMultiplication_Kernels_miburr.s MatrixMultiplication_Kernels_miilp.s

.global	mmmKernel_local
.text



mmmKernel_local:                        // @mmmKernel_local
// BB#0:                                 // %entry
	s_buffer_load_dword s14, s[4:7], 0x0
	s_buffer_load_dword s0, s[4:7], 0x4
	s_mov_b32 s1, 0xffff
	s_buffer_load_dword s16, s[4:7], 0x5
	s_buffer_load_dword s5, s[8:11], 0x0
	s_buffer_load_dword s6, s[8:11], 0x4
	s_buffer_load_dword s4, s[8:11], 0x8
	s_buffer_load_dword s15, s[8:11], 0xc
	s_waitcnt lgkmcnt(0)
	s_min_u32 s7, s0, s1
	s_ashr_i32 s0, s15, 31
	s_lshr_b32 s0, s0, 30
	s_add_i32 s0, s15, s0
	s_ashr_i32 s15, s0, 2
	s_min_u32 s0, s16, s1
	s_buffer_load_dword s16, s[8:11], 0x10
	s_load_dwordx4 s[8:11], s[2:3], 0x60
	s_load_dwordx4 s[20:23], s[2:3], 0x58
	s_load_dwordx4 s[24:27], s[2:3], 0x50
	s_mul_i32 s13, s0, s13
	s_mul_i32 s12, s12, s7
	v_cvt_f32_u32 v2, s7
	v_rcp_f32 v2, v2
	v_mul_f32 v2, 0x4f800000, v2
	v_cvt_u32_f32 v2, v2
	v_mul_lo_i32 v3, v2, s7
	v_mul_hi_u32 v4, v2, s7
	v_cmp_eq_i32 s[0:1], 0, v4
	v_sub_i32 v4, vcc, 0, v3
	v_cndmask_b32 v3, v3, v4, s[0:1]
	v_mul_hi_u32 v3, v3, v2
	v_subrev_i32 v4, vcc, v3, v2
	v_add_i32 v2, vcc, v3, v2
	v_cndmask_b32 v2, v4, v2, s[0:1]
	v_mul_hi_u32 v2, v2, s15
	v_mul_lo_i32 v3, v2, s7
	v_cmp_ge_u32 s[0:1], s15, v3
	v_sub_i32 v3, vcc, s15, v3
	v_cmp_le_u32 vcc, s7, v3
	v_cndmask_b32 v3, 0, -1, s[0:1]
	v_cmp_eq_i32 s[0:1], 0, v3
	v_cndmask_b32 v4, 0, -1, vcc
	v_and_b32 v3, v3, v4
	v_cmp_eq_i32 s[2:3], 0, v3
	v_add_i32 v3, vcc, 1, v2
	v_cndmask_b32 v3, v3, v2, s[2:3]
	v_add_i32 v2, vcc, -1, v2
	v_cndmask_b32 v2, v3, v2, s[0:1]
	v_mov_b32 v3, 0
	v_mov_b32 v4, v3
	v_mov_b32 v5, v3
	v_mov_b32 v6, v3
	v_add_i32 v7, vcc, s13, v1
	v_cmp_ne_i32 s[0:1], 0, v2
	v_lshlrev_b32 v8, 2, v7
	v_add_i32 v7, vcc, s12, v0
	v_mov_b32 v13, v3
	v_mov_b32 v14, v4
	v_mov_b32 v15, v5
	v_mov_b32 v16, v6
	v_mov_b32 v17, v3
	v_mov_b32 v18, v4
	v_mov_b32 v19, v5
	v_mov_b32 v20, v6
	v_mov_b32 v9, v3
	v_mov_b32 v10, v4
	v_mov_b32 v11, v5
	v_mov_b32 v12, v6
	s_waitcnt lgkmcnt(0)
	s_and_saveexec_b64 s[0:1], s[0:1]
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz BB1_4
// BB#1:                                 // %for.body.lr.ph
	v_lshlrev_b32 v3, 2, v1
	v_mul_lo_i32 v1, v3, s7
	v_add_i32 v4, vcc, v0, v1
	v_mov_b32 v9, 0
	v_mov_b32 v10, v9
	v_mov_b32 v11, v9
	v_mov_b32 v12, v9
	v_add_i32 v5, vcc, s7, v4
	v_lshlrev_b32 v5, 4, v5
	s_lshl_b32 s2, s7, 1
	v_add_i32 v6, vcc, s2, v4
	v_lshlrev_b32 v6, 4, v6
	s_mul_i32 s2, s7, 3
	v_add_i32 v13, vcc, s2, v4
	v_lshlrev_b32 v4, 4, v4
	v_lshlrev_b32 v13, 4, v13
	v_or_b32 v14, 1, v3
	v_or_b32 v15, 2, v3
	v_or_b32 v3, 3, v3
	v_add_i32 v21, vcc, s16, v13
	v_add_i32 v22, vcc, s16, v6
	s_lshl_b32 s2, s7, 2
	s_lshl_b32 s3, s14, 2
	s_mul_i32 s12, s15, 3
	s_lshl_b32 s13, s15, 1
	v_mul_lo_i32 v23, v3, s7
	v_mul_lo_i32 v24, v15, s7
	v_mul_lo_i32 v25, v14, s7
	v_add_i32 v26, vcc, s16, v4
	v_add_i32 v27, vcc, s16, v5
	s_mov_b64 s[28:29], 0
	s_mov_b64 s[18:19], 0
	v_mul_lo_i32 v3, v8, s15
	v_add_i32 v0, vcc, v0, v3
	v_mov_b32 v28, v9
	v_mov_b32 v17, v9
	v_mov_b32 v18, v10
	v_mov_b32 v19, v11
	v_mov_b32 v20, v12
	v_mov_b32 v13, v9
	v_mov_b32 v14, v10
	v_mov_b32 v15, v11
	v_mov_b32 v16, v12
	v_mov_b32 v3, v9
	v_mov_b32 v4, v10
	v_mov_b32 v5, v11
	v_mov_b32 v6, v12
BB1_5:                                  // %for.body
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_8 Depth 2
	v_mul_lo_i32 v29, v28, s7
	v_add_i32 v30, vcc, v29, v0
	v_lshlrev_b32 v31, 4, v30
	v_add_i32 v31, vcc, s5, v31
	tbuffer_load_format_xyzw v[31:34], v31, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_mov_b32 m0, -1
	v_mul_lo_i32 v29, s3, v29
	v_add_i32 v35, vcc, s15, v30
	v_lshlrev_b32 v35, 4, v35
	v_add_i32 v35, vcc, s5, v35
	tbuffer_load_format_xyzw v[35:38], v35, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v39, vcc, 12, v26
	s_waitcnt vmcnt(1)
	ds_write_b32 v39, v34
	s_waitcnt lgkmcnt(0)
	v_add_i32 v34, vcc, 8, v26
	ds_write_b32 v34, v33
	s_waitcnt lgkmcnt(0)
	v_add_i32 v33, vcc, 4, v26
	ds_write_b32 v33, v32
	ds_write_b32 v26, v31
	s_waitcnt lgkmcnt(0)
	v_add_i32 v31, vcc, s13, v30
	v_lshlrev_b32 v31, 4, v31
	v_add_i32 v31, vcc, s5, v31
	tbuffer_load_format_xyzw v[31:34], v31, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v39, vcc, 12, v27
	s_waitcnt vmcnt(1)
	ds_write_b32 v39, v38
	s_waitcnt lgkmcnt(0)
	v_add_i32 v38, vcc, 8, v27
	ds_write_b32 v38, v37
	s_waitcnt lgkmcnt(0)
	v_add_i32 v37, vcc, 4, v27
	ds_write_b32 v37, v36
	ds_write_b32 v27, v35
	v_add_i32 v30, vcc, s12, v30
	v_lshlrev_b32 v30, 4, v30
	v_add_i32 v30, vcc, s5, v30
	s_waitcnt lgkmcnt(0)
	tbuffer_load_format_xyzw v[35:38], v30, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v30, vcc, 12, v22
	s_waitcnt vmcnt(1)
	ds_write_b32 v30, v34
	v_add_i32 v30, vcc, 8, v22
	ds_write_b32 v30, v33
	v_add_i32 v30, vcc, 4, v22
	ds_write_b32 v30, v32
	ds_write_b32 v22, v31
	v_add_i32 v30, vcc, 12, v21
	s_waitcnt vmcnt(0)
	ds_write_b32 v30, v38
	v_add_i32 v30, vcc, 8, v21
	ds_write_b32 v30, v37
	v_add_i32 v30, vcc, 4, v21
	ds_write_b32 v30, v36
	ds_write_b32 v21, v35
	v_add_i32 v29, vcc, v29, v7
	v_cmp_ne_i32 s[32:33], 0, s2
	s_waitcnt lgkmcnt(0)
	s_barrier
	s_mov_b64 s[30:31], 0
	v_mov_b32 v30, 0
	s_and_saveexec_b64 s[32:33], s[32:33]
	s_xor_b64 s[32:33], exec, s[32:33]
	s_cbranch_execz BB1_7
BB1_8:                                  // %for.body.51
                                        //   Parent Loop BB1_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	s_mov_b32 m0, -1
	v_ashrrev_i32 v31, 2, v30
	v_add_i32 v32, vcc, v31, v23
	v_add_i32 v33, vcc, v31, v24
	v_add_i32 v34, vcc, v31, v25
	v_add_i32 v31, vcc, v31, v1
	v_lshlrev_b32 v32, 4, v32
	v_lshlrev_b32 v33, 4, v33
	v_lshlrev_b32 v34, 4, v34
	v_lshlrev_b32 v31, 4, v31
	v_add_i32 v32, vcc, s16, v32
	v_add_i32 v33, vcc, s16, v33
	v_add_i32 v34, vcc, s16, v34
	v_add_i32 v31, vcc, s16, v31
	v_add_i32 v35, vcc, 12, v32
	v_add_i32 v36, vcc, 12, v33
	v_add_i32 v37, vcc, 12, v34
	v_add_i32 v38, vcc, 12, v31
	ds_read_b32 v39, v32
	ds_read_b32 v42, v35
	ds_read_b32 v43, v33
	ds_read_b32 v46, v36
	ds_read_b32 v47, v34
	ds_read_b32 v50, v37
	ds_read_b32 v51, v31
	ds_read_b32 v54, v38
	v_add_i32 v35, vcc, 8, v32
	ds_read_b32 v41, v35
	v_add_i32 v32, vcc, 4, v32
	ds_read_b32 v40, v32
	v_add_i32 v32, vcc, 8, v33
	ds_read_b32 v45, v32
	v_add_i32 v32, vcc, 4, v33
	ds_read_b32 v44, v32
	v_add_i32 v32, vcc, 8, v34
	ds_read_b32 v49, v32
	v_add_i32 v32, vcc, 4, v34
	ds_read_b32 v48, v32
	v_add_i32 v32, vcc, 8, v31
	ds_read_b32 v53, v32
	v_add_i32 v31, vcc, 4, v31
	ds_read_b32 v52, v31
	v_or_b32 v31, 1, v30
	v_mul_lo_i32 v31, v31, s14
	v_add_i32 v31, vcc, v31, v29
	v_lshlrev_b32 v31, 4, v31
	v_add_i32 v31, vcc, s6, v31
	tbuffer_load_format_xyzw v[31:34], v31, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_mul_lo_i32 v35, v30, s14
	v_add_i32 v35, vcc, v35, v29
	v_lshlrev_b32 v35, 4, v35
	v_add_i32 v35, vcc, s6, v35
	tbuffer_load_format_xyzw v[35:38], v35, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v55, 2, v30
	v_mul_lo_i32 v55, v55, s14
	v_add_i32 v55, vcc, v55, v29
	v_lshlrev_b32 v55, 4, v55
	v_add_i32 v55, vcc, s6, v55
	tbuffer_load_format_xyzw v[55:58], v55, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v59, 3, v30
	v_mul_lo_i32 v59, v59, s14
	v_add_i32 v59, vcc, v59, v29
	v_lshlrev_b32 v59, 4, v59
	v_add_i32 v59, vcc, s6, v59
	tbuffer_load_format_xyzw v[59:62], v59, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v30, vcc, 4, v30
	v_cmp_le_u32 vcc, s2, v30
	s_waitcnt vmcnt(3) & lgkmcnt(0)
	v_mul_f32 v63, v34, v40
	v_mul_f32 v64, v33, v40
	v_mul_f32 v65, v32, v40
	v_mul_f32 v40, v31, v40
	v_mul_f32 v66, v34, v44
	v_mul_f32 v67, v33, v44
	v_mul_f32 v68, v32, v44
	v_mul_f32 v44, v31, v44
	v_mul_f32 v69, v34, v48
	v_mul_f32 v70, v33, v48
	v_mul_f32 v71, v32, v48
	v_mul_f32 v48, v31, v48
	v_mul_f32 v34, v34, v52
	v_mul_f32 v33, v33, v52
	v_mul_f32 v32, v32, v52
	v_mul_f32 v31, v31, v52
	s_waitcnt vmcnt(2)
	v_mac_f32 v63, v38, v39
	v_mac_f32 v64, v37, v39
	v_mac_f32 v65, v36, v39
	v_mac_f32 v40, v35, v39
	v_mac_f32 v66, v38, v43
	v_mac_f32 v67, v37, v43
	v_mac_f32 v68, v36, v43
	v_mac_f32 v44, v35, v43
	v_mac_f32 v69, v38, v47
	v_mac_f32 v70, v37, v47
	v_mac_f32 v71, v36, v47
	v_mac_f32 v48, v35, v47
	v_mac_f32 v34, v38, v51
	v_mac_f32 v33, v37, v51
	v_mac_f32 v32, v36, v51
	v_mac_f32 v31, v35, v51
	s_waitcnt vmcnt(1)
	v_mac_f32 v63, v58, v41
	v_mac_f32 v64, v57, v41
	v_mac_f32 v65, v56, v41
	v_mac_f32 v40, v55, v41
	v_mac_f32 v66, v58, v45
	v_mac_f32 v67, v57, v45
	v_mac_f32 v68, v56, v45
	v_mac_f32 v44, v55, v45
	v_mac_f32 v69, v58, v49
	v_mac_f32 v70, v57, v49
	v_mac_f32 v71, v56, v49
	v_mac_f32 v48, v55, v49
	v_mac_f32 v34, v58, v53
	v_mac_f32 v33, v57, v53
	v_mac_f32 v32, v56, v53
	v_mac_f32 v31, v55, v53
	s_waitcnt vmcnt(0)
	v_mac_f32 v63, v62, v42
	v_add_f32 v6, v63, v6
	v_mac_f32 v31, v59, v54
	v_mac_f32 v40, v59, v42
	v_mac_f32 v64, v61, v42
	v_mac_f32 v65, v60, v42
	v_mac_f32 v66, v62, v46
	v_add_f32 v16, v66, v16
	v_mac_f32 v44, v59, v46
	v_mac_f32 v67, v61, v46
	v_mac_f32 v68, v60, v46
	v_mac_f32 v69, v62, v50
	v_add_f32 v20, v69, v20
	v_mac_f32 v48, v59, v50
	v_mac_f32 v70, v61, v50
	v_mac_f32 v71, v60, v50
	v_mac_f32 v34, v62, v54
	v_add_f32 v12, v34, v12
	v_add_f32 v5, v64, v5
	v_add_f32 v4, v65, v4
	v_add_f32 v3, v40, v3
	v_add_f32 v15, v67, v15
	v_add_f32 v14, v68, v14
	v_add_f32 v13, v44, v13
	v_add_f32 v19, v70, v19
	v_add_f32 v18, v71, v18
	v_add_f32 v17, v48, v17
	v_mac_f32 v33, v61, v54
	v_mac_f32 v32, v60, v54
	v_add_f32 v11, v33, v11
	v_add_f32 v10, v32, v10
	v_add_f32 v9, v31, v9
	s_or_b64 s[30:31], vcc, s[30:31]
	s_andn2_b64 exec, exec, s[30:31]
	s_cbranch_execnz BB1_8
// BB#6:                                 // %Flow
                                        //   in Loop: Header=BB1_5 Depth=1
	s_or_b64 exec, exec, s[30:31]
BB1_7:                                  // %for.cond.cleanup.50
                                        //   in Loop: Header=BB1_5 Depth=1
	s_or_b64 exec, exec, s[32:33]
	v_add_i32 v28, vcc, 1, v28
	v_cmp_ge_u32 vcc, v28, v2
	s_barrier
	s_or_b64 s[18:19], vcc, s[18:19]
	s_andn2_b64 exec, exec, s[18:19]
	s_cbranch_execnz BB1_5
// BB#2:                                 // %Flow1
	s_or_b64 exec, exec, s[18:19]
BB1_4:                                  // %Flow2
	s_or_b64 exec, exec, s[0:1]
	v_mul_lo_i32 v0, v8, s14
	v_add_i32 v0, vcc, v0, v7
// BB#3:                                 // %for.cond.cleanup
	v_lshlrev_b32 v1, 4, v0
	v_add_i32 v1, vcc, s4, v1
	tbuffer_store_format_xyzw v[9:12], v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v1, vcc, s14, v0
	v_lshlrev_b32 v1, 4, v1
	v_add_i32 v1, vcc, s4, v1
	tbuffer_store_format_xyzw v[17:20], v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_lshl_b32 s0, s14, 1
	v_add_i32 v1, vcc, s0, v0
	v_lshlrev_b32 v1, 4, v1
	v_add_i32 v1, vcc, s4, v1
	tbuffer_store_format_xyzw v[13:16], v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_mul_i32 s0, s14, 3
	v_add_i32 v0, vcc, s0, v0
	v_lshlrev_b32 v0, 4, v0
	v_add_i32 v0, vcc, s4, v0
	tbuffer_store_format_xyzw v[3:6], v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

// SKBB#0:                                 // %entry
	s_buffer_load_dword s15, s[8:11], 0x0
	s_buffer_load_dword s16, s[8:11], 0x4
	s_buffer_load_dword s14, s[8:11], 0x8
	s_buffer_load_dword s0, s[8:11], 0xc
	s_buffer_load_dword s9, s[8:11], 0x10
	s_buffer_load_dword s8, s[4:7], 0x0
	s_buffer_load_dword s1, s[4:7], 0x4
	s_mov_b32 s17, 0xffff
	s_waitcnt lgkmcnt(0)
	s_min_u32 s10, s1, s17
	s_ashr_i32 s1, s0, 31
	s_lshr_b32 s1, s1, 30
	s_add_i32 s0, s0, s1
	s_buffer_load_dword s1, s[4:7], 0x5
	s_ashr_i32 s11, s0, 2
	s_load_dwordx4 s[4:7], s[2:3], 0x60
	s_load_dwordx4 s[20:23], s[2:3], 0x58
	s_load_dwordx4 s[24:27], s[2:3], 0x50
	s_waitcnt lgkmcnt(0)
	s_min_u32 s0, s1, s17
	s_mul_i32 s13, s0, s13
	s_mul_i32 s12, s12, s10
	v_cvt_f32_u32 v2, s10
	v_rcp_f32 v2, v2
	v_mul_f32 v2, 0x4f800000, v2
	v_cvt_u32_f32 v2, v2
	v_mul_lo_i32 v3, v2, s10
	v_mul_hi_u32 v4, v2, s10
	v_cmp_eq_i32 s[0:1], 0, v4
	v_sub_i32 v4, vcc, 0, v3
	v_cndmask_b32 v3, v3, v4, s[0:1]
	v_mul_hi_u32 v3, v3, v2
	v_subrev_i32 v4, vcc, v3, v2
	v_add_i32 v2, vcc, v3, v2
	v_cndmask_b32 v2, v4, v2, s[0:1]
	v_mul_hi_u32 v2, v2, s11
	v_mul_lo_i32 v3, v2, s10
	v_cmp_ge_u32 s[0:1], s11, v3
	v_sub_i32 v3, vcc, s11, v3
	v_cmp_le_u32 vcc, s10, v3
	v_cndmask_b32 v3, 0, -1, s[0:1]
	v_cmp_eq_i32 s[0:1], 0, v3
	v_cndmask_b32 v4, 0, -1, vcc
	v_and_b32 v3, v3, v4
	v_cmp_eq_i32 s[2:3], 0, v3
	v_add_i32 v3, vcc, 1, v2
	v_cndmask_b32 v3, v3, v2, s[2:3]
	v_add_i32 v2, vcc, -1, v2
	v_cndmask_b32 v2, v3, v2, s[0:1]
	v_mov_b32 v3, 0
	v_mov_b32 v4, v3
	v_mov_b32 v5, v3
	v_mov_b32 v6, v3
	v_add_i32 v7, vcc, s13, v1
	v_lshlrev_b32 v7, 2, v7
	v_cmp_ne_i32 s[0:1], 0, v2
	v_add_i32 v8, vcc, s12, v0
	v_mov_b32 v14, v3
	v_mov_b32 v15, v4
	v_mov_b32 v16, v5
	v_mov_b32 v17, v6
	v_mov_b32 v24, v3
	v_mov_b32 v25, v4
	v_mov_b32 v26, v5
	v_mov_b32 v27, v6
	v_mov_b32 v9, v3
	v_mov_b32 v10, v4
	v_mov_b32 v11, v5
	v_mov_b32 v12, v6
	s_and_saveexec_b64 s[0:1], s[0:1]
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz SKBB1_4
// SKBB#1:                                 // %for.body.lr.ph
	v_lshlrev_b32 v3, 2, v1
	v_mul_lo_i32 v1, v3, s10
	v_add_i32 v4, vcc, v0, v1
	v_mov_b32 v9, 0
	v_mov_b32 v10, v9
	v_mov_b32 v11, v9
	v_mov_b32 v12, v9
	v_add_i32 v5, vcc, s10, v4
	v_lshlrev_b32 v5, 4, v5
	s_lshl_b32 s2, s10, 1
	v_add_i32 v6, vcc, s2, v4
	v_lshlrev_b32 v6, 4, v6
	s_mul_i32 s2, s10, 3
	v_add_i32 v13, vcc, s2, v4
	v_lshlrev_b32 v4, 4, v4
	v_lshlrev_b32 v14, 4, v13
	v_or_b32 v15, 2, v3
	v_or_b32 v13, 3, v3
	v_or_b32 v3, 1, v3
	s_lshl_b32 s2, s11, 1
	s_mul_i32 s3, s11, 3
	s_lshl_b32 s12, s8, 2
	s_lshl_b32 s13, s10, 2
	v_mul_lo_i32 v13, v13, s10
	v_mul_lo_i32 v18, v15, s10
	v_mul_lo_i32 v19, v3, s10
	v_add_i32 v20, vcc, s9, v14
	v_add_i32 v21, vcc, s9, v6
	v_add_i32 v22, vcc, s9, v4
	v_add_i32 v23, vcc, s9, v5
	s_mov_b64 s[28:29], 0
	s_mov_b64 s[18:19], 0
	v_mul_lo_i32 v3, v7, s11
	v_add_i32 v0, vcc, v0, v3
	v_mov_b32 v28, v9
	v_mov_b32 v24, v9
	v_mov_b32 v25, v10
	v_mov_b32 v26, v11
	v_mov_b32 v27, v12
	v_mov_b32 v14, v9
	v_mov_b32 v15, v10
	v_mov_b32 v16, v11
	v_mov_b32 v17, v12
	v_mov_b32 v3, v9
	v_mov_b32 v4, v10
	v_mov_b32 v5, v11
	v_mov_b32 v6, v12
SKBB1_5:                                  // %for.body
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop SKBB1_8 Depth 2
	v_mul_lo_i32 v29, v28, s10
	v_add_i32 v30, vcc, v29, v0
	v_lshlrev_b32 v31, 4, v30
	v_add_i32 v31, vcc, s15, v31
	tbuffer_load_format_xyzw v[31:34], v31, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_mov_b32 m0, -1
	v_mul_lo_i32 v29, s12, v29
	v_add_i32 v35, vcc, s11, v30
	v_lshlrev_b32 v35, 4, v35
	v_add_i32 v35, vcc, s15, v35
	tbuffer_load_format_xyzw v[35:38], v35, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v39, vcc, 12, v22
	s_waitcnt vmcnt(1)
	ds_write_b32 v39, v34
	s_waitcnt lgkmcnt(0)
	v_add_i32 v34, vcc, 8, v22
	ds_write_b32 v34, v33
	s_waitcnt lgkmcnt(0)
	v_add_i32 v33, vcc, 4, v22
	ds_write_b32 v33, v32
	ds_write_b32 v22, v31
	s_waitcnt lgkmcnt(0)
	v_add_i32 v31, vcc, s2, v30
	v_lshlrev_b32 v31, 4, v31
	v_add_i32 v31, vcc, s15, v31
	tbuffer_load_format_xyzw v[31:34], v31, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v39, vcc, 12, v23
	s_waitcnt vmcnt(1)
	ds_write_b32 v39, v38
	s_waitcnt lgkmcnt(0)
	v_add_i32 v38, vcc, 8, v23
	ds_write_b32 v38, v37
	s_waitcnt lgkmcnt(0)
	v_add_i32 v37, vcc, 4, v23
	ds_write_b32 v37, v36
	ds_write_b32 v23, v35
	v_add_i32 v30, vcc, s3, v30
	v_lshlrev_b32 v30, 4, v30
	v_add_i32 v30, vcc, s15, v30
	s_waitcnt lgkmcnt(0)
	tbuffer_load_format_xyzw v[35:38], v30, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v30, vcc, 12, v21
	s_waitcnt vmcnt(1)
	ds_write_b32 v30, v34
	v_add_i32 v30, vcc, 8, v21
	ds_write_b32 v30, v33
	v_add_i32 v30, vcc, 4, v21
	ds_write_b32 v30, v32
	ds_write_b32 v21, v31
	v_add_i32 v30, vcc, 12, v20
	s_waitcnt vmcnt(0)
	ds_write_b32 v30, v38
	v_add_i32 v30, vcc, 8, v20
	ds_write_b32 v30, v37
	v_add_i32 v30, vcc, 4, v20
	ds_write_b32 v30, v36
	ds_write_b32 v20, v35
	v_add_i32 v29, vcc, v29, v8
	v_cmp_ne_i32 s[32:33], 0, s13
	s_waitcnt lgkmcnt(0)
	s_barrier
	s_mov_b64 s[30:31], 0
	v_mov_b32 v30, 0
	s_and_saveexec_b64 s[32:33], s[32:33]
	s_xor_b64 s[32:33], exec, s[32:33]
	s_cbranch_execz SKBB1_7
SKBB1_8:                                  // %for.body.51
                                        //   Parent Loop SKBB1_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	s_mov_b32 m0, -1
	v_ashrrev_i32 v31, 2, v30
	v_add_i32 v32, vcc, v31, v1
	v_add_i32 v33, vcc, v31, v19
	v_add_i32 v34, vcc, v31, v18
	v_add_i32 v31, vcc, v31, v13
	v_lshlrev_b32 v32, 4, v32
	v_lshlrev_b32 v33, 4, v33
	v_lshlrev_b32 v34, 4, v34
	v_lshlrev_b32 v31, 4, v31
	v_add_i32 v32, vcc, s9, v32
	v_add_i32 v33, vcc, s9, v33
	v_add_i32 v34, vcc, s9, v34
	v_add_i32 v31, vcc, s9, v31
	v_add_i32 v35, vcc, 12, v32
	v_add_i32 v36, vcc, 12, v33
	v_add_i32 v37, vcc, 12, v34
	v_add_i32 v38, vcc, 12, v31
	v_add_i32 v39, vcc, 8, v32
	v_add_i32 v40, vcc, 8, v33
	v_add_i32 v41, vcc, 8, v34
	v_add_i32 v42, vcc, 8, v31
	ds_read_b32 v46, v35
	ds_read_b32 v45, v39
	ds_read_b32 v43, v32
	v_add_i32 v32, vcc, 4, v32
	ds_read_b32 v44, v32
	ds_read_b32 v50, v36
	ds_read_b32 v49, v40
	ds_read_b32 v47, v33
	v_add_i32 v32, vcc, 4, v33
	ds_read_b32 v48, v32
	ds_read_b32 v54, v37
	ds_read_b32 v53, v41
	ds_read_b32 v51, v34
	v_add_i32 v32, vcc, 4, v34
	ds_read_b32 v52, v32
	ds_read_b32 v35, v38
	ds_read_b32 v34, v42
	ds_read_b32 v32, v31
	v_add_i32 v31, vcc, 4, v31
	ds_read_b32 v33, v31
	v_or_b32 v31, 1, v30
	v_mul_lo_i32 v31, v31, s8
	v_add_i32 v31, vcc, v31, v29
	v_lshlrev_b32 v31, 4, v31
	v_add_i32 v31, vcc, s16, v31
	tbuffer_load_format_xyzw v[36:39], v31, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_mul_lo_i32 v31, v30, s8
	v_add_i32 v31, vcc, v31, v29
	v_lshlrev_b32 v31, 4, v31
	v_add_i32 v31, vcc, s16, v31
	tbuffer_load_format_xyzw v[55:58], v31, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v31, 2, v30
	v_mul_lo_i32 v31, v31, s8
	v_add_i32 v31, vcc, v31, v29
	v_lshlrev_b32 v31, 4, v31
	v_add_i32 v31, vcc, s16, v31
	tbuffer_load_format_xyzw v[59:62], v31, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v31, 3, v30
	v_mul_lo_i32 v31, v31, s8
	v_add_i32 v31, vcc, v31, v29
	v_lshlrev_b32 v31, 4, v31
	v_add_i32 v31, vcc, s16, v31
	tbuffer_load_format_xyzw v[63:66], v31, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v30, vcc, 4, v30
	v_cmp_le_u32 vcc, s13, v30
	s_waitcnt vmcnt(3) & lgkmcnt(0)
	v_mul_f32 v31, v39, v33
	v_mul_f32 v40, v38, v33
	v_mul_f32 v41, v37, v33
	v_mul_f32 v33, v36, v33
	v_mul_f32 v42, v39, v52
	v_mul_f32 v67, v38, v52
	v_mul_f32 v68, v37, v52
	v_mul_f32 v52, v36, v52
	v_mul_f32 v69, v39, v48
	v_mul_f32 v70, v38, v48
	v_mul_f32 v71, v37, v48
	v_mul_f32 v48, v36, v48
	v_mul_f32 v36, v36, v44
	v_mul_f32 v37, v37, v44
	v_mul_f32 v38, v38, v44
	v_mul_f32 v39, v39, v44
	s_waitcnt vmcnt(2)
	v_mac_f32 v31, v58, v32
	v_mac_f32 v40, v57, v32
	v_mac_f32 v41, v56, v32
	v_mac_f32 v33, v55, v32
	v_mac_f32 v42, v58, v51
	v_mac_f32 v67, v57, v51
	v_mac_f32 v68, v56, v51
	v_mac_f32 v52, v55, v51
	v_mac_f32 v69, v58, v47
	v_mac_f32 v70, v57, v47
	v_mac_f32 v71, v56, v47
	v_mac_f32 v48, v55, v47
	v_mac_f32 v36, v55, v43
	v_mac_f32 v37, v56, v43
	v_mac_f32 v38, v57, v43
	v_mac_f32 v39, v58, v43
	s_waitcnt vmcnt(1)
	v_mac_f32 v31, v62, v34
	v_mac_f32 v40, v61, v34
	v_mac_f32 v41, v60, v34
	v_mac_f32 v33, v59, v34
	v_mac_f32 v42, v62, v53
	v_mac_f32 v67, v61, v53
	v_mac_f32 v68, v60, v53
	v_mac_f32 v52, v59, v53
	v_mac_f32 v69, v62, v49
	v_mac_f32 v70, v61, v49
	v_mac_f32 v71, v60, v49
	v_mac_f32 v48, v59, v49
	v_mac_f32 v39, v62, v45
	v_mac_f32 v38, v61, v45
	v_mac_f32 v37, v60, v45
	v_mac_f32 v36, v59, v45
	s_waitcnt vmcnt(0)
	v_mac_f32 v31, v66, v35
	v_add_f32 v6, v31, v6
	v_mac_f32 v39, v66, v46
	v_mac_f32 v33, v63, v35
	v_mac_f32 v40, v65, v35
	v_mac_f32 v41, v64, v35
	v_mac_f32 v42, v66, v54
	v_add_f32 v17, v42, v17
	v_mac_f32 v52, v63, v54
	v_mac_f32 v67, v65, v54
	v_mac_f32 v68, v64, v54
	v_mac_f32 v69, v66, v50
	v_add_f32 v27, v69, v27
	v_mac_f32 v48, v63, v50
	v_mac_f32 v70, v65, v50
	v_mac_f32 v71, v64, v50
	v_mac_f32 v36, v63, v46
	v_mac_f32 v37, v64, v46
	v_mac_f32 v38, v65, v46
	v_add_f32 v12, v39, v12
	v_add_f32 v5, v40, v5
	v_add_f32 v4, v41, v4
	v_add_f32 v3, v33, v3
	v_add_f32 v16, v67, v16
	v_add_f32 v15, v68, v15
	v_add_f32 v14, v52, v14
	v_add_f32 v26, v70, v26
	v_add_f32 v25, v71, v25
	v_add_f32 v24, v48, v24
	v_add_f32 v11, v38, v11
	v_add_f32 v10, v37, v10
	v_add_f32 v9, v36, v9
	s_or_b64 s[30:31], vcc, s[30:31]
	s_andn2_b64 exec, exec, s[30:31]
	s_cbranch_execnz SKBB1_8
// SKBB#6:                                 // %Flow
                                        //   in Loop: Header=SKBB1_5 Depth=1
	s_or_b64 exec, exec, s[30:31]
SKBB1_7:                                  // %for.cond.cleanup.50
                                        //   in Loop: Header=SKBB1_5 Depth=1
	s_or_b64 exec, exec, s[32:33]
	v_add_i32 v28, vcc, 1, v28
	v_cmp_ge_u32 vcc, v28, v2
	s_barrier
	s_or_b64 s[18:19], vcc, s[18:19]
	s_andn2_b64 exec, exec, s[18:19]
	s_cbranch_execnz SKBB1_5
// SKBB#2:                                 // %Flow1
	s_or_b64 exec, exec, s[18:19]
SKBB1_4:                                  // %Flow2
	s_or_b64 exec, exec, s[0:1]
	v_mul_lo_i32 v0, v7, s8
	v_add_i32 v0, vcc, v8, v0
// SKBB#3:                                 // %for.cond.cleanup
	v_lshlrev_b32 v1, 4, v0
	v_add_i32 v1, vcc, s14, v1
	tbuffer_store_format_xyzw v[9:12], v1, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v1, vcc, s8, v0
	v_lshlrev_b32 v1, 4, v1
	v_add_i32 v1, vcc, s14, v1
	tbuffer_store_format_xyzw v[24:27], v1, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_lshl_b32 s0, s8, 1
	v_add_i32 v1, vcc, s0, v0
	v_lshlrev_b32 v1, 4, v1
	v_add_i32 v1, vcc, s14, v1
	tbuffer_store_format_xyzw v[14:17], v1, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_mul_i32 s0, s8, 3
	v_add_i32 v0, vcc, s0, v0
	v_lshlrev_b32 v0, 4, v0
	v_add_i32 v0, vcc, s14, v0
	tbuffer_store_format_xyzw v[3:6], v0, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
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

	// CodeLenInByte = 1340
	// NumVgprs = 72
	// NumSgprs = 36
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1
// Merged MatrixMultiplication_Kernels_miburr.s MatrixMultiplication_Kernels_miilp.s

