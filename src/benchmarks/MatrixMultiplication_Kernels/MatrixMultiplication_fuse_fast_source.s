.global	mmmKernel
.text



mmmKernel:                              // @mmmKernel
// BB#0:                                 // %entry
	s_buffer_load_dword s1, s[8:11], 0x0
	s_buffer_load_dword s14, s[8:11], 0x4
	s_buffer_load_dword s0, s[8:11], 0x8
	s_buffer_load_dword s15, s[8:11], 0xc
	s_buffer_load_dword s24, s[8:11], 0x10
	s_load_dwordx4 s[8:11], s[2:3], 0x60
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[20:23], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x4
	s_buffer_load_dword s3, s[4:7], 0x5
	s_mov_b32 s4, 0xffff
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s2, s4
	s_mul_i32 s2, s2, s12
	v_add_i32 v0, vcc, s2, v0
	s_min_u32 s2, s3, s4
	s_mul_i32 s2, s2, s13
	v_add_i32 v1, vcc, s2, v1
	s_lshr_b32 s2, s24, 2
	v_lshlrev_b32 v1, 2, v1
                                        // implicit-def: VGPR2
                                        // implicit-def: VGPR7
                                        // implicit-def: VGPR8
	v_cmp_ne_i32 s[4:5], 0, s15
                                        // implicit-def: VGPR17_VGPR18_VGPR19_VGPR20
                                        // implicit-def: VGPR13_VGPR14_VGPR15_VGPR16
                                        // implicit-def: VGPR9_VGPR10_VGPR11_VGPR12
                                        // implicit-def: VGPR3_VGPR4_VGPR5_VGPR6
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execz BB0_5
// BB#2:                                 // %for.body.lr.ph
	s_lshr_b32 s3, s15, 2
	v_mul_lo_i32 v21, v1, s3
	v_or_b32 v2, 1, v1
	v_mul_lo_i32 v22, v2, s3
	v_or_b32 v7, 2, v1
	v_mul_lo_i32 v23, v7, s3
	v_or_b32 v8, 3, v1
	v_mul_lo_i32 v24, v8, s3
	v_mov_b32 v3, 0
	v_mov_b32 v4, v3
	v_mov_b32 v5, v3
	s_mov_b64 s[6:7], 0
	v_mov_b32 v6, v3
	v_mov_b32 v9, v3
	v_mov_b32 v10, v4
	v_mov_b32 v11, v5
	v_mov_b32 v12, v6
	v_mov_b32 v25, v3
	v_mov_b32 v13, v3
	v_mov_b32 v14, v4
	v_mov_b32 v15, v5
	v_mov_b32 v16, v6
	v_mov_b32 v17, v3
	v_mov_b32 v18, v4
	v_mov_b32 v19, v5
	v_mov_b32 v20, v6
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
	v_add_i32 v32, vcc, v27, v24
	v_add_i32 v33, vcc, v27, v23
	v_add_i32 v27, vcc, v27, v22
	v_lshlrev_b32 v31, 4, v31
	v_lshlrev_b32 v32, 4, v32
	v_lshlrev_b32 v33, 4, v33
	v_lshlrev_b32 v27, 4, v27
	v_add_i32 v31, vcc, s1, v31
	v_add_i32 v32, vcc, s1, v32
	v_add_i32 v33, vcc, s1, v33
	v_add_i32 v27, vcc, s1, v27
	tbuffer_load_format_xyzw v[34:37], v31, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_xyzw v[38:41], v26, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_xyzw v[42:45], v27, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_xyzw v[46:49], v33, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_xyzw v[50:53], v32, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v26, vcc, s14, v29
	tbuffer_load_format_xyzw v[54:57], v26, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v26, 4, v28
	v_add_i32 v26, vcc, s14, v26
	tbuffer_load_format_xyzw v[26:29], v26, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v30, vcc, v30, v0
	v_lshlrev_b32 v30, 4, v30
	v_add_i32 v30, vcc, s14, v30
	tbuffer_load_format_xyzw v[30:33], v30, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(6)
	v_mul_f32 v58, v38, v35
	v_mul_f32 v59, v39, v35
	v_mul_f32 v60, v40, v35
	v_mul_f32 v35, v41, v35
	s_waitcnt vmcnt(5)
	v_mul_f32 v61, v38, v43
	v_mul_f32 v62, v39, v43
	v_mul_f32 v63, v40, v43
	v_mul_f32 v43, v41, v43
	s_waitcnt vmcnt(4)
	v_mul_f32 v64, v38, v47
	v_mul_f32 v65, v39, v47
	v_mul_f32 v66, v40, v47
	v_mul_f32 v47, v41, v47
	s_waitcnt vmcnt(3)
	v_mul_f32 v38, v38, v51
	v_mul_f32 v39, v39, v51
	v_mul_f32 v40, v40, v51
	v_mul_f32 v41, v41, v51
	s_waitcnt vmcnt(2)
	v_mac_f32 v58, v54, v34
	v_mac_f32 v59, v55, v34
	v_mac_f32 v60, v56, v34
	v_mac_f32 v35, v57, v34
	v_mac_f32 v61, v54, v42
	v_mac_f32 v62, v55, v42
	v_mac_f32 v63, v56, v42
	v_mac_f32 v43, v57, v42
	v_mac_f32 v64, v54, v46
	v_mac_f32 v65, v55, v46
	v_mac_f32 v66, v56, v46
	v_mac_f32 v47, v57, v46
	v_mac_f32 v38, v54, v50
	v_mac_f32 v39, v55, v50
	v_mac_f32 v40, v56, v50
	v_mac_f32 v41, v57, v50
	s_waitcnt vmcnt(1)
	v_mac_f32 v58, v26, v36
	v_mac_f32 v59, v27, v36
	v_mac_f32 v60, v28, v36
	v_mac_f32 v35, v29, v36
	v_mac_f32 v61, v26, v44
	v_mac_f32 v62, v27, v44
	v_mac_f32 v63, v28, v44
	v_mac_f32 v43, v29, v44
	v_mac_f32 v64, v26, v48
	v_mac_f32 v65, v27, v48
	v_mac_f32 v66, v28, v48
	v_mac_f32 v47, v29, v48
	v_mac_f32 v38, v26, v52
	v_mac_f32 v39, v27, v52
	v_mac_f32 v40, v28, v52
	v_mac_f32 v41, v29, v52
	s_waitcnt vmcnt(0)
	v_mac_f32 v58, v30, v37
	v_mac_f32 v59, v31, v37
	v_mac_f32 v60, v32, v37
	v_mac_f32 v35, v33, v37
	v_mac_f32 v61, v30, v45
	v_mac_f32 v62, v31, v45
	v_mac_f32 v63, v32, v45
	v_mac_f32 v43, v33, v45
	v_mac_f32 v64, v30, v49
	v_mac_f32 v65, v31, v49
	v_mac_f32 v66, v32, v49
	v_mac_f32 v47, v33, v49
	v_mac_f32 v38, v30, v53
	v_mac_f32 v39, v31, v53
	v_mac_f32 v40, v32, v53
	v_mac_f32 v41, v33, v53
	v_add_f32 v3, v58, v3
	v_add_f32 v9, v61, v9
	v_add_f32 v13, v64, v13
	v_add_f32 v17, v38, v17
	v_add_f32 v4, v59, v4
	v_add_f32 v10, v62, v10
	v_add_f32 v14, v65, v14
	v_add_f32 v18, v39, v18
	v_add_f32 v5, v60, v5
	v_add_f32 v11, v63, v11
	v_add_f32 v15, v66, v15
	v_add_f32 v19, v40, v19
	v_add_f32 v6, v35, v6
	v_add_f32 v12, v43, v12
	v_add_f32 v16, v47, v16
	v_add_f32 v20, v41, v20
	v_add_i32 v25, vcc, 4, v25
	v_cmp_le_u32 vcc, s15, v25
	s_or_b64 s[6:7], vcc, s[6:7]
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB0_6
// BB#3:                                 // %Flow
	s_or_b64 exec, exec, s[6:7]
BB0_5:                                  // %Flow1
	s_or_saveexec_b64 s[4:5], s[4:5]
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execz BB0_4
// BB#1:                                 // %entry.for.cond.cleanup_crit_edge
	v_or_b32 v2, 1, v1
	v_or_b32 v7, 2, v1
	v_or_b32 v8, 3, v1
	v_mov_b32 v3, 0
	v_mov_b32 v4, v3
	v_mov_b32 v5, v3
	v_mov_b32 v6, v3
	v_mov_b32 v9, v3
	v_mov_b32 v10, v4
	v_mov_b32 v11, v5
	v_mov_b32 v12, v6
	v_mov_b32 v13, v3
	v_mov_b32 v14, v4
	v_mov_b32 v15, v5
	v_mov_b32 v16, v6
	v_mov_b32 v17, v3
	v_mov_b32 v18, v4
	v_mov_b32 v19, v5
	v_mov_b32 v20, v6
BB0_4:                                  // %for.cond.cleanup
	s_or_b64 exec, exec, s[4:5]
	v_mul_lo_i32 v8, v8, s2
	v_mul_lo_i32 v7, v7, s2
	v_mul_lo_i32 v2, v2, s2
	v_mul_lo_i32 v1, v1, s2
	v_add_i32 v8, vcc, v8, v0
	v_add_i32 v7, vcc, v7, v0
	v_add_i32 v2, vcc, v2, v0
	v_add_i32 v0, vcc, v1, v0
	v_lshlrev_b32 v1, 4, v8
	v_add_i32 v1, vcc, s0, v1
	v_lshlrev_b32 v7, 4, v7
	v_add_i32 v7, vcc, s0, v7
	v_lshlrev_b32 v2, 4, v2
	v_add_i32 v2, vcc, s0, v2
	v_lshlrev_b32 v0, 4, v0
	v_add_i32 v0, vcc, s0, v0
	tbuffer_store_format_xyzw v[3:6], v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_store_format_xyzw v[9:12], v2, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_store_format_xyzw v[13:16], v7, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_store_format_xyzw v[17:20], v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

// SKBB#0:                                 // %entry
	s_buffer_load_dword s1, s[8:11], 0x0
	s_buffer_load_dword s14, s[8:11], 0x4
	s_buffer_load_dword s0, s[8:11], 0x8
	s_buffer_load_dword s15, s[8:11], 0xc
	s_buffer_load_dword s24, s[8:11], 0x10
	s_load_dwordx4 s[8:11], s[2:3], 0x60
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[20:23], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x4
	s_buffer_load_dword s3, s[4:7], 0x5
	s_mov_b32 s4, 0xffff
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s2, s4
	s_mul_i32 s2, s2, s12
	v_add_i32 v0, vcc, s2, v0
	s_min_u32 s2, s3, s4
	s_mul_i32 s2, s2, s13
	v_add_i32 v1, vcc, s2, v1
	s_lshr_b32 s2, s24, 2
	v_lshlrev_b32 v1, 2, v1
                                        // implicit-def: VGPR4
                                        // implicit-def: VGPR3
                                        // implicit-def: VGPR2
	v_cmp_ne_i32 s[4:5], 0, s15
                                        // implicit-def: VGPR9_VGPR10_VGPR11_VGPR12
                                        // implicit-def: VGPR13_VGPR14_VGPR15_VGPR16
                                        // implicit-def: VGPR17_VGPR18_VGPR19_VGPR20
                                        // implicit-def: VGPR5_VGPR6_VGPR7_VGPR8
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execz SKBB0_5
// SKBB#2:                                 // %for.body.lr.ph
	s_lshr_b32 s3, s15, 2
	v_mul_lo_i32 v21, v1, s3
	v_or_b32 v4, 1, v1
	v_mul_lo_i32 v22, v4, s3
	v_or_b32 v3, 2, v1
	v_mul_lo_i32 v23, v3, s3
	v_or_b32 v2, 3, v1
	v_mov_b32 v5, 0
	v_mul_lo_i32 v24, v2, s3
	v_mov_b32 v6, v5
	v_mov_b32 v7, v5
	v_mov_b32 v8, v5
	s_mov_b64 s[6:7], 0
	v_mov_b32 v17, v5
	v_mov_b32 v18, v6
	v_mov_b32 v19, v7
	v_mov_b32 v20, v8
	v_mov_b32 v25, v5
	v_mov_b32 v13, v5
	v_mov_b32 v14, v6
	v_mov_b32 v15, v7
	v_mov_b32 v16, v8
	v_mov_b32 v9, v5
	v_mov_b32 v10, v6
	v_mov_b32 v11, v7
	v_mov_b32 v12, v8
SKBB0_6:                                  // %for.body
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
	v_mul_lo_i32 v28, v25, s2
	v_or_b32 v29, 2, v25
	v_mul_lo_i32 v29, v29, s2
	v_or_b32 v30, 3, v25
	v_mul_lo_i32 v30, v30, s2
	v_add_i32 v28, vcc, v28, v0
	v_lshlrev_b32 v28, 4, v28
	v_add_i32 v29, vcc, v29, v0
	v_add_i32 v28, vcc, s14, v28
	v_lshlrev_b32 v29, 4, v29
	v_add_i32 v30, vcc, v30, v0
	v_add_i32 v29, vcc, s14, v29
	v_lshlrev_b32 v30, 4, v30
	v_add_i32 v30, vcc, s14, v30
	v_add_i32 v31, vcc, v27, v21
	v_lshlrev_b32 v31, 4, v31
	v_add_i32 v31, vcc, s1, v31
	v_add_i32 v32, vcc, v27, v22
	v_lshlrev_b32 v32, 4, v32
	v_add_i32 v32, vcc, s1, v32
	v_add_i32 v33, vcc, v27, v23
	v_add_i32 v27, vcc, v27, v24
	v_lshlrev_b32 v33, 4, v33
	v_lshlrev_b32 v27, 4, v27
	v_add_i32 v33, vcc, s1, v33
	v_add_i32 v27, vcc, s1, v27
	tbuffer_load_format_xyzw v[34:37], v31, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_xyzw v[38:41], v32, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_xyzw v[42:45], v33, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_xyzw v[46:49], v27, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_xyzw v[50:53], v26, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_xyzw v[54:57], v28, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_xyzw v[26:29], v29, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_xyzw v[30:33], v30, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(3)
	v_mul_f32 v58, v50, v35
	s_waitcnt vmcnt(2)
	v_mac_f32 v58, v54, v34
	s_waitcnt vmcnt(1)
	v_mac_f32 v58, v26, v36
	s_waitcnt vmcnt(0)
	v_mac_f32 v58, v30, v37
	v_add_f32 v5, v58, v5
	v_mul_f32 v58, v50, v39
	v_mac_f32 v58, v54, v38
	v_mac_f32 v58, v26, v40
	v_mac_f32 v58, v30, v41
	v_add_f32 v17, v58, v17
	v_mul_f32 v58, v50, v43
	v_mac_f32 v58, v54, v42
	v_mac_f32 v58, v26, v44
	v_mac_f32 v58, v30, v45
	v_add_f32 v13, v58, v13
	v_mul_f32 v50, v50, v47
	v_mac_f32 v50, v54, v46
	v_mac_f32 v50, v26, v48
	v_mac_f32 v50, v30, v49
	v_add_f32 v9, v50, v9
	v_mul_f32 v26, v51, v35
	v_mac_f32 v26, v55, v34
	v_mac_f32 v26, v27, v36
	v_mac_f32 v26, v31, v37
	v_add_f32 v6, v26, v6
	v_mul_f32 v26, v51, v39
	v_mac_f32 v26, v55, v38
	v_mac_f32 v26, v27, v40
	v_mac_f32 v26, v31, v41
	v_add_f32 v18, v26, v18
	v_mul_f32 v26, v51, v43
	v_mac_f32 v26, v55, v42
	v_mac_f32 v26, v27, v44
	v_mac_f32 v26, v31, v45
	v_add_f32 v14, v26, v14
	v_mul_f32 v26, v51, v47
	v_mac_f32 v26, v55, v46
	v_mac_f32 v26, v27, v48
	v_mac_f32 v26, v31, v49
	v_add_f32 v10, v26, v10
	v_mul_f32 v26, v52, v35
	v_mac_f32 v26, v56, v34
	v_mac_f32 v26, v28, v36
	v_mac_f32 v26, v32, v37
	v_add_f32 v7, v26, v7
	v_mul_f32 v26, v52, v39
	v_mac_f32 v26, v56, v38
	v_mac_f32 v26, v28, v40
	v_mac_f32 v26, v32, v41
	v_add_f32 v19, v26, v19
	v_mul_f32 v26, v52, v43
	v_mac_f32 v26, v56, v42
	v_mac_f32 v26, v28, v44
	v_mac_f32 v26, v32, v45
	v_add_f32 v15, v26, v15
	v_mul_f32 v26, v52, v47
	v_mac_f32 v26, v56, v46
	v_mac_f32 v26, v28, v48
	v_mac_f32 v26, v32, v49
	v_add_f32 v11, v26, v11
	v_mul_f32 v26, v53, v35
	v_mul_f32 v27, v53, v39
	v_mul_f32 v28, v53, v43
	v_mul_f32 v30, v53, v47
	v_mac_f32 v26, v57, v34
	v_mac_f32 v27, v57, v38
	v_mac_f32 v28, v57, v42
	v_mac_f32 v30, v57, v46
	v_mac_f32 v26, v29, v36
	v_mac_f32 v27, v29, v40
	v_mac_f32 v28, v29, v44
	v_mac_f32 v30, v29, v48
	v_mac_f32 v26, v33, v37
	v_mac_f32 v27, v33, v41
	v_mac_f32 v28, v33, v45
	v_mac_f32 v30, v33, v49
	v_add_f32 v8, v26, v8
	v_add_f32 v20, v27, v20
	v_add_f32 v16, v28, v16
	v_add_f32 v12, v30, v12
	v_add_i32 v25, vcc, 4, v25
	v_cmp_le_u32 vcc, s15, v25
	s_or_b64 s[6:7], vcc, s[6:7]
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz SKBB0_6
// SKBB#3:                                 // %Flow
	s_or_b64 exec, exec, s[6:7]
SKBB0_5:                                  // %Flow1
	s_or_saveexec_b64 s[4:5], s[4:5]
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execz SKBB0_4
// SKBB#1:                                 // %entry.for.cond.cleanup_crit_edge
	v_or_b32 v4, 1, v1
	v_or_b32 v3, 2, v1
	v_or_b32 v2, 3, v1
	v_mov_b32 v5, 0
	v_mov_b32 v6, v5
	v_mov_b32 v7, v5
	v_mov_b32 v8, v5
	v_mov_b32 v17, v5
	v_mov_b32 v18, v6
	v_mov_b32 v19, v7
	v_mov_b32 v20, v8
	v_mov_b32 v13, v5
	v_mov_b32 v14, v6
	v_mov_b32 v15, v7
	v_mov_b32 v16, v8
	v_mov_b32 v9, v5
	v_mov_b32 v10, v6
	v_mov_b32 v11, v7
	v_mov_b32 v12, v8
SKBB0_4:                                  // %for.cond.cleanup
	s_or_b64 exec, exec, s[4:5]
	v_mul_lo_i32 v1, v1, s2
	v_add_i32 v1, vcc, v1, v0
	v_mul_lo_i32 v4, v4, s2
	v_lshlrev_b32 v1, 4, v1
	v_add_i32 v1, vcc, s0, v1
	tbuffer_store_format_xyzw v[5:8], v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v1, vcc, v4, v0
	v_mul_lo_i32 v3, v3, s2
	v_lshlrev_b32 v1, 4, v1
	v_add_i32 v1, vcc, s0, v1
	tbuffer_store_format_xyzw v[17:20], v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v1, vcc, v3, v0
	v_mul_lo_i32 v2, v2, s2
	v_lshlrev_b32 v1, 4, v1
	v_add_i32 v1, vcc, s0, v1
	tbuffer_store_format_xyzw v[13:16], v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v0, vcc, v2, v0
	v_lshlrev_b32 v0, 4, v0
	v_add_i32 v0, vcc, s0, v0
	tbuffer_store_format_xyzw v[9:12], v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
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

	// CodeLenInByte = 868
	// NumVgprs = 67
	// NumSgprs = 27
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1
// Merged MatrixMultiplication_Kernels_fast.s MatrixMultiplication_Kernels_source.s

.global	mmmKernel_local
.text



mmmKernel_local:                        // @mmmKernel_local
// BB#0:                                 // %entry
	s_buffer_load_dword s14, s[4:7], 0x0
	s_buffer_load_dword s0, s[4:7], 0x4
	s_mov_b32 s24, 0xffff
	s_waitcnt lgkmcnt(0)
	s_min_u32 s15, s0, s24
	v_cvt_f32_u32 v2, s15
	v_rcp_f32 v2, v2
	v_mul_f32 v2, 0x4f800000, v2
	v_cvt_u32_f32 v2, v2
	s_buffer_load_dword s7, s[4:7], 0x5
	s_buffer_load_dword s5, s[8:11], 0x0
	s_buffer_load_dword s6, s[8:11], 0x4
	v_mul_lo_i32 v3, v2, s15
	v_mul_hi_u32 v4, v2, s15
	s_buffer_load_dword s4, s[8:11], 0x8
	s_buffer_load_dword s16, s[8:11], 0xc
	v_sub_i32 v5, vcc, 0, v3
	v_cmp_eq_i32 s[0:1], 0, v4
	v_cndmask_b32 v3, v3, v5, s[0:1]
	v_mul_hi_u32 v3, v3, v2
	v_subrev_i32 v4, vcc, v3, v2
	v_add_i32 v2, vcc, v3, v2
	v_cndmask_b32 v2, v4, v2, s[0:1]
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s0, s16, 31
	s_lshr_b32 s0, s0, 30
	s_add_i32 s0, s16, s0
	s_ashr_i32 s0, s0, 2
	v_mul_hi_u32 v2, v2, s0
	v_mul_lo_i32 v3, v2, s15
	s_buffer_load_dword s1, s[8:11], 0x10
	v_cmp_ge_u32 vcc, s0, v3
	v_cndmask_b32 v4, 0, -1, vcc
	v_sub_i32 v3, vcc, s0, v3
	v_cmp_le_u32 vcc, s15, v3
	v_cndmask_b32 v3, 0, -1, vcc
	v_and_b32 v3, v4, v3
	v_add_i32 v5, vcc, 1, v2
	v_cmp_eq_i32 vcc, 0, v3
	v_cndmask_b32 v3, v5, v2, vcc
	v_add_i32 v2, vcc, -1, v2
	v_cmp_eq_i32 vcc, 0, v4
	s_load_dwordx4 s[8:11], s[2:3], 0x60
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[20:23], s[2:3], 0x50
	v_cndmask_b32 v4, v3, v2, vcc
	v_mov_b32 v5, 0
	s_min_u32 s2, s7, s24
	v_mov_b32 v6, v5
	s_mul_i32 s2, s2, s13
	v_mov_b32 v7, v5
	s_mul_i32 s3, s12, s15
	v_add_i32 v2, vcc, s3, v0
	v_add_i32 v3, vcc, s2, v1
	v_lshlrev_b32 v3, 2, v3
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
	s_waitcnt lgkmcnt(0)
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz BB1_4
// BB#1:                                 // %for.body.lr.ph
	v_lshlrev_b32 v5, 2, v1
	v_mul_lo_i32 v6, v3, s0
	v_mul_lo_i32 v1, v5, s15
	v_add_i32 v21, vcc, v6, v0
	v_add_i32 v6, vcc, v1, v0
	v_lshlrev_b32 v0, 4, v6
	v_add_i32 v7, vcc, s15, v6
	v_add_i32 v0, vcc, s1, v0
	v_lshlrev_b32 v7, 4, v7
	v_add_i32 v22, vcc, s1, v7
	s_lshl_b32 s7, s0, 1
	s_lshl_b32 s12, s15, 1
	v_add_i32 v7, vcc, s12, v6
	v_lshlrev_b32 v7, 4, v7
	v_add_i32 v23, vcc, s1, v7
	s_mul_i32 s12, s0, 3
	s_mul_i32 s13, s15, 3
	v_add_i32 v6, vcc, s13, v6
	v_lshlrev_b32 v6, 4, v6
	v_add_i32 v24, vcc, s1, v6
	s_lshl_b32 s13, s14, 2
	v_or_b32 v6, 1, v5
	v_mul_lo_i32 v25, v6, s15
	v_or_b32 v6, 2, v5
	v_mul_lo_i32 v26, v6, s15
	v_mov_b32 v9, 0
	v_or_b32 v5, 3, v5
	v_mov_b32 v10, v9
	v_mul_lo_i32 v27, v5, s15
	v_mov_b32 v11, v9
	s_lshl_b32 s24, s15, 2
	v_mov_b32 v12, v9
	v_mov_b32 v28, v9
	s_mov_b64 s[28:29], 0
	s_mov_b64 s[26:27], 0
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
	v_mul_lo_i32 v30, v28, s15
	s_mov_b32 m0, -1
	v_mov_b32 v29, 0
	v_cmp_ne_i32 s[30:31], 0, s24
	v_mul_lo_i32 v31, s13, v30
	v_add_i32 v30, vcc, v30, v21
	v_lshlrev_b32 v32, 4, v30
	v_add_i32 v32, vcc, s5, v32
	tbuffer_load_format_xyzw v[32:35], v32, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v36, vcc, s0, v30
	v_lshlrev_b32 v36, 4, v36
	v_add_i32 v36, vcc, s5, v36
	tbuffer_load_format_xyzw v[36:39], v36, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v40, vcc, s7, v30
	v_lshlrev_b32 v40, 4, v40
	v_add_i32 v40, vcc, s5, v40
	tbuffer_load_format_xyzw v[40:43], v40, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v30, vcc, s12, v30
	v_lshlrev_b32 v30, 4, v30
	v_add_i32 v30, vcc, s5, v30
	tbuffer_load_format_xyzw v[44:47], v30, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(3)
	ds_write_b32 v0, v32
	v_add_i32 v30, vcc, 4, v0
	ds_write_b32 v30, v33
	v_add_i32 v30, vcc, 8, v0
	ds_write_b32 v30, v34
	v_add_i32 v30, vcc, 12, v0
	ds_write_b32 v30, v35
	s_waitcnt vmcnt(2)
	ds_write_b32 v22, v36
	v_add_i32 v30, vcc, 4, v22
	ds_write_b32 v30, v37
	v_add_i32 v30, vcc, 8, v22
	ds_write_b32 v30, v38
	v_add_i32 v30, vcc, 12, v22
	ds_write_b32 v30, v39
	v_add_i32 v30, vcc, 4, v23
	s_waitcnt vmcnt(1)
	ds_write_b32 v23, v40
	ds_write_b32 v30, v41
	v_add_i32 v30, vcc, 8, v23
	ds_write_b32 v30, v42
	v_add_i32 v30, vcc, 12, v23
	ds_write_b32 v30, v43
	v_add_i32 v30, vcc, 4, v24
	s_waitcnt lgkmcnt(0)
	v_add_i32 v32, vcc, 8, v24
	s_waitcnt vmcnt(0)
	ds_write_b32 v24, v44
	ds_write_b32 v30, v45
	ds_write_b32 v32, v46
	v_add_i32 v30, vcc, 12, v24
	ds_write_b32 v30, v47
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
	v_mul_lo_i32 v31, v31, s14
	v_add_i32 v31, vcc, v31, v30
	v_lshlrev_b32 v31, 4, v31
	v_add_i32 v31, vcc, s6, v31
	tbuffer_load_format_xyzw v[31:34], v31, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_mul_lo_i32 v35, v29, s14
	v_add_i32 v35, vcc, v35, v30
	v_lshlrev_b32 v35, 4, v35
	v_add_i32 v35, vcc, s6, v35
	tbuffer_load_format_xyzw v[35:38], v35, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v39, 2, v29
	v_mul_lo_i32 v39, v39, s14
	v_add_i32 v39, vcc, v39, v30
	v_lshlrev_b32 v39, 4, v39
	v_add_i32 v39, vcc, s6, v39
	tbuffer_load_format_xyzw v[39:42], v39, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_or_b32 v43, 3, v29
	v_mul_lo_i32 v43, v43, s14
	v_add_i32 v43, vcc, v43, v30
	v_lshlrev_b32 v43, 4, v43
	v_add_i32 v43, vcc, s6, v43
	tbuffer_load_format_xyzw v[43:46], v43, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_ashrrev_i32 v47, 2, v29
	v_add_i32 v48, vcc, v47, v1
	v_lshlrev_b32 v48, 4, v48
	v_add_i32 v48, vcc, s1, v48
	ds_read_b32 v49, v48
	v_add_i32 v50, vcc, 4, v48
	ds_read_b32 v50, v50
	v_add_i32 v51, vcc, v47, v25
	v_lshlrev_b32 v51, 4, v51
	v_add_i32 v53, vcc, s1, v51
	v_add_i32 v51, vcc, 4, v53
	ds_read_b32 v54, v53
	ds_read_b32 v55, v51
	v_add_i32 v51, vcc, v47, v26
	v_lshlrev_b32 v51, 4, v51
	v_add_i32 v58, vcc, s1, v51
	v_add_i32 v51, vcc, 4, v58
	ds_read_b32 v59, v58
	ds_read_b32 v60, v51
	v_add_i32 v47, vcc, v47, v27
	v_lshlrev_b32 v47, 4, v47
	v_add_i32 v47, vcc, s1, v47
	v_add_i32 v51, vcc, 4, v47
	ds_read_b32 v63, v47
	ds_read_b32 v64, v51
	v_add_i32 v51, vcc, 8, v48
	ds_read_b32 v51, v51
	v_add_i32 v48, vcc, 12, v48
	ds_read_b32 v52, v48
	v_add_i32 v48, vcc, 8, v53
	ds_read_b32 v56, v48
	v_add_i32 v48, vcc, 12, v53
	ds_read_b32 v57, v48
	v_add_i32 v48, vcc, 8, v58
	ds_read_b32 v61, v48
	v_add_i32 v48, vcc, 12, v58
	ds_read_b32 v62, v48
	v_add_i32 v48, vcc, 8, v47
	ds_read_b32 v65, v48
	v_add_i32 v47, vcc, 12, v47
	ds_read_b32 v66, v47
	s_waitcnt vmcnt(3) & lgkmcnt(0)
	v_mul_f32 v47, v31, v50
	v_mul_f32 v48, v32, v50
	v_mul_f32 v53, v33, v50
	v_mul_f32 v50, v34, v50
	v_mul_f32 v58, v31, v55
	v_mul_f32 v67, v32, v55
	v_mul_f32 v68, v33, v55
	v_mul_f32 v55, v34, v55
	v_mul_f32 v69, v31, v60
	v_mul_f32 v70, v32, v60
	v_mul_f32 v71, v33, v60
	v_mul_f32 v60, v34, v60
	v_mul_f32 v31, v31, v64
	v_mul_f32 v32, v32, v64
	v_mul_f32 v33, v33, v64
	v_mul_f32 v34, v34, v64
	s_waitcnt vmcnt(2)
	v_mac_f32 v47, v35, v49
	v_mac_f32 v48, v36, v49
	v_mac_f32 v53, v37, v49
	v_mac_f32 v50, v38, v49
	v_mac_f32 v58, v35, v54
	v_mac_f32 v67, v36, v54
	v_mac_f32 v68, v37, v54
	v_mac_f32 v55, v38, v54
	v_mac_f32 v69, v35, v59
	v_mac_f32 v70, v36, v59
	v_mac_f32 v71, v37, v59
	v_mac_f32 v60, v38, v59
	v_mac_f32 v31, v35, v63
	v_mac_f32 v32, v36, v63
	v_mac_f32 v33, v37, v63
	v_mac_f32 v34, v38, v63
	s_waitcnt vmcnt(1)
	v_mac_f32 v47, v39, v51
	v_mac_f32 v48, v40, v51
	v_mac_f32 v53, v41, v51
	v_mac_f32 v50, v42, v51
	v_mac_f32 v58, v39, v56
	v_mac_f32 v67, v40, v56
	v_mac_f32 v68, v41, v56
	v_mac_f32 v55, v42, v56
	v_mac_f32 v69, v39, v61
	v_mac_f32 v70, v40, v61
	v_mac_f32 v71, v41, v61
	v_mac_f32 v60, v42, v61
	v_mac_f32 v31, v39, v65
	v_mac_f32 v32, v40, v65
	v_mac_f32 v33, v41, v65
	v_mac_f32 v34, v42, v65
	s_waitcnt vmcnt(0)
	v_mac_f32 v47, v43, v52
	v_mac_f32 v48, v44, v52
	v_mac_f32 v53, v45, v52
	v_mac_f32 v50, v46, v52
	v_mac_f32 v58, v43, v57
	v_mac_f32 v67, v44, v57
	v_mac_f32 v68, v45, v57
	v_mac_f32 v55, v46, v57
	v_mac_f32 v69, v43, v62
	v_mac_f32 v70, v44, v62
	v_mac_f32 v71, v45, v62
	v_mac_f32 v60, v46, v62
	v_mac_f32 v31, v43, v66
	v_mac_f32 v32, v44, v66
	v_mac_f32 v33, v45, v66
	v_mac_f32 v34, v46, v66
	v_add_f32 v9, v47, v9
	v_add_f32 v17, v58, v17
	v_add_f32 v13, v69, v13
	v_add_f32 v5, v31, v5
	v_add_f32 v10, v48, v10
	v_add_f32 v18, v67, v18
	v_add_f32 v14, v70, v14
	v_add_f32 v6, v32, v6
	v_add_f32 v11, v53, v11
	v_add_f32 v19, v68, v19
	v_add_f32 v15, v71, v15
	v_add_f32 v7, v33, v7
	v_add_f32 v12, v50, v12
	v_add_f32 v20, v55, v20
	v_add_f32 v16, v60, v16
	v_add_f32 v8, v34, v8
	v_add_i32 v29, vcc, 4, v29
	v_cmp_le_u32 vcc, s24, v29
	s_or_b64 s[32:33], vcc, s[32:33]
	s_andn2_b64 exec, exec, s[32:33]
	s_cbranch_execnz BB1_8
// BB#6:                                 // %Flow
                                        //   in Loop: Header=BB1_5 Depth=1
	s_or_b64 exec, exec, s[32:33]
BB1_7:                                  // %for.cond.cleanup.50
                                        //   in Loop: Header=BB1_5 Depth=1
	s_or_b64 exec, exec, s[30:31]
	v_add_i32 v28, vcc, 1, v28
	v_cmp_ge_u32 vcc, v28, v4
	s_barrier
	s_or_b64 s[26:27], vcc, s[26:27]
	s_andn2_b64 exec, exec, s[26:27]
	s_cbranch_execnz BB1_5
// BB#2:                                 // %Flow1
	s_or_b64 exec, exec, s[26:27]
BB1_4:                                  // %Flow2
	s_or_b64 exec, exec, s[2:3]
	v_mul_lo_i32 v0, v3, s14
	v_add_i32 v0, vcc, v0, v2
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
	tbuffer_store_format_xyzw v[5:8], v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

// SKBB#0:                                 // %entry
	s_buffer_load_dword s15, s[8:11], 0x0
	s_buffer_load_dword s16, s[8:11], 0x4
	s_buffer_load_dword s14, s[8:11], 0x8
	s_buffer_load_dword s18, s[8:11], 0xc
	s_buffer_load_dword s17, s[8:11], 0x10
	s_load_dwordx4 s[8:11], s[2:3], 0x60
	s_load_dwordx4 s[20:23], s[2:3], 0x58
	s_load_dwordx4 s[24:27], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x0
	s_buffer_load_dword s0, s[4:7], 0x4
	s_mov_b32 s19, 0xffff
	s_waitcnt lgkmcnt(0)
	s_min_u32 s3, s0, s19
	v_cvt_f32_u32 v2, s3
	v_rcp_f32 v2, v2
	v_mul_f32 v2, 0x4f800000, v2
	v_cvt_u32_f32 v2, v2
	v_mul_hi_u32 v3, v2, s3
	v_mul_lo_i32 v4, v2, s3
	v_cmp_eq_i32 s[0:1], 0, v3
	v_sub_i32 v3, vcc, 0, v4
	v_cndmask_b32 v3, v4, v3, s[0:1]
	v_mul_hi_u32 v3, v3, v2
	v_add_i32 v4, vcc, v3, v2
	v_subrev_i32 v2, vcc, v3, v2
	v_cndmask_b32 v2, v2, v4, s[0:1]
	s_ashr_i32 s0, s18, 31
	s_lshr_b32 s0, s0, 30
	s_add_i32 s0, s18, s0
	s_ashr_i32 s0, s0, 2
	v_mul_hi_u32 v2, v2, s0
	v_mul_lo_i32 v3, v2, s3
	s_buffer_load_dword s1, s[4:7], 0x5
	v_cmp_ge_u32 vcc, s0, v3
	v_cndmask_b32 v4, 0, -1, vcc
	v_sub_i32 v3, vcc, s0, v3
	v_cmp_le_u32 vcc, s3, v3
	v_cndmask_b32 v3, 0, -1, vcc
	v_and_b32 v3, v4, v3
	v_add_i32 v5, vcc, 1, v2
	v_cmp_eq_i32 vcc, 0, v3
	v_cndmask_b32 v3, v5, v2, vcc
	v_add_i32 v2, vcc, -1, v2
	v_cmp_eq_i32 vcc, 0, v4
	v_cndmask_b32 v4, v3, v2, vcc
	v_mov_b32 v5, 0
	s_waitcnt lgkmcnt(0)
	s_min_u32 s1, s1, s19
	v_mov_b32 v6, v5
	s_mul_i32 s1, s1, s13
	v_mov_b32 v7, v5
	s_mul_i32 s4, s12, s3
	v_add_i32 v2, vcc, s4, v0
	v_add_i32 v3, vcc, s1, v1
	v_lshlrev_b32 v3, 2, v3
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
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execz SKBB1_4
// SKBB#1:                                 // %for.body.lr.ph
	v_lshlrev_b32 v5, 2, v1
	v_mul_lo_i32 v6, v3, s0
	v_mul_lo_i32 v1, v5, s3
	v_add_i32 v21, vcc, v6, v0
	v_add_i32 v6, vcc, v1, v0
	v_lshlrev_b32 v0, 4, v6
	v_add_i32 v7, vcc, s3, v6
	v_add_i32 v0, vcc, s17, v0
	v_lshlrev_b32 v7, 4, v7
	v_add_i32 v22, vcc, s17, v7
	s_lshl_b32 s1, s0, 1
	s_lshl_b32 s6, s3, 1
	v_add_i32 v7, vcc, s6, v6
	v_lshlrev_b32 v7, 4, v7
	v_add_i32 v23, vcc, s17, v7
	s_mul_i32 s6, s0, 3
	s_mul_i32 s7, s3, 3
	v_add_i32 v6, vcc, s7, v6
	v_lshlrev_b32 v6, 4, v6
	v_add_i32 v24, vcc, s17, v6
	s_lshl_b32 s7, s2, 2
	v_or_b32 v6, 1, v5
	v_mul_lo_i32 v25, v6, s3
	v_or_b32 v6, 2, v5
	v_mul_lo_i32 v26, v6, s3
	v_mov_b32 v9, 0
	v_or_b32 v5, 3, v5
	v_mov_b32 v10, v9
	v_mul_lo_i32 v27, v5, s3
	v_mov_b32 v11, v9
	s_lshl_b32 s12, s3, 2
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
SKBB1_5:                                  // %for.body
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop SKBB1_8 Depth 2
	v_mul_lo_i32 v30, v28, s3
	s_mov_b32 m0, -1
	v_mov_b32 v29, 0
	v_cmp_ne_i32 s[30:31], 0, s12
	v_mul_lo_i32 v31, s7, v30
	v_add_i32 v30, vcc, v30, v21
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
	v_add_i32 v30, vcc, s6, v30
	v_lshlrev_b32 v30, 4, v30
	v_add_i32 v30, vcc, s15, v30
	tbuffer_load_format_xyzw v[44:47], v30, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v30, vcc, 12, v0
	s_waitcnt vmcnt(3)
	ds_write_b32 v30, v35
	v_add_i32 v30, vcc, 8, v0
	ds_write_b32 v30, v34
	v_add_i32 v30, vcc, 4, v0
	ds_write_b32 v30, v33
	ds_write_b32 v0, v32
	v_add_i32 v30, vcc, 12, v22
	s_waitcnt vmcnt(2)
	ds_write_b32 v30, v39
	v_add_i32 v30, vcc, 8, v22
	ds_write_b32 v30, v38
	v_add_i32 v30, vcc, 4, v22
	ds_write_b32 v30, v37
	ds_write_b32 v22, v36
	v_add_i32 v30, vcc, 12, v23
	s_waitcnt vmcnt(1)
	ds_write_b32 v30, v43
	v_add_i32 v30, vcc, 8, v23
	ds_write_b32 v30, v42
	v_add_i32 v30, vcc, 4, v23
	ds_write_b32 v30, v41
	ds_write_b32 v23, v40
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
	s_cbranch_execz SKBB1_7
SKBB1_8:                                  // %for.body.51
                                        //   Parent Loop SKBB1_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	s_mov_b32 m0, -1
	v_or_b32 v31, 1, v29
	v_mul_lo_i32 v31, v31, s2
	v_mul_lo_i32 v32, v29, s2
	v_or_b32 v33, 2, v29
	v_mul_lo_i32 v33, v33, s2
	v_add_i32 v31, vcc, v31, v30
	v_or_b32 v34, 3, v29
	v_mul_lo_i32 v34, v34, s2
	v_add_i32 v32, vcc, v32, v30
	v_lshlrev_b32 v31, 4, v31
	v_add_i32 v31, vcc, s16, v31
	tbuffer_load_format_xyzw v[35:38], v31, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v31, 4, v32
	v_add_i32 v31, vcc, s16, v31
	tbuffer_load_format_xyzw v[39:42], v31, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v31, vcc, v33, v30
	v_lshlrev_b32 v31, 4, v31
	v_add_i32 v31, vcc, s16, v31
	tbuffer_load_format_xyzw v[43:46], v31, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v31, vcc, v34, v30
	v_lshlrev_b32 v31, 4, v31
	v_add_i32 v31, vcc, s16, v31
	tbuffer_load_format_xyzw v[31:34], v31, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_ashrrev_i32 v47, 2, v29
	v_add_i32 v48, vcc, v47, v1
	v_lshlrev_b32 v48, 4, v48
	v_add_i32 v48, vcc, s17, v48
	ds_read_b32 v49, v48
	v_add_i32 v50, vcc, 12, v48
	ds_read_b32 v52, v50
	v_add_i32 v50, vcc, v47, v25
	v_lshlrev_b32 v50, 4, v50
	v_add_i32 v53, vcc, s17, v50
	v_add_i32 v50, vcc, 12, v53
	ds_read_b32 v54, v53
	ds_read_b32 v57, v50
	v_add_i32 v50, vcc, v47, v26
	v_lshlrev_b32 v50, 4, v50
	v_add_i32 v58, vcc, s17, v50
	v_add_i32 v50, vcc, 12, v58
	ds_read_b32 v59, v58
	ds_read_b32 v62, v50
	v_add_i32 v47, vcc, v47, v27
	v_lshlrev_b32 v47, 4, v47
	v_add_i32 v47, vcc, s17, v47
	v_add_i32 v50, vcc, 12, v47
	ds_read_b32 v63, v47
	ds_read_b32 v66, v50
	v_add_i32 v50, vcc, 8, v48
	ds_read_b32 v51, v50
	v_add_i32 v48, vcc, 4, v48
	ds_read_b32 v50, v48
	v_add_i32 v48, vcc, 8, v53
	ds_read_b32 v56, v48
	v_add_i32 v48, vcc, 4, v53
	ds_read_b32 v55, v48
	v_add_i32 v48, vcc, 8, v58
	ds_read_b32 v61, v48
	v_add_i32 v48, vcc, 4, v58
	ds_read_b32 v60, v48
	v_add_i32 v48, vcc, 8, v47
	ds_read_b32 v65, v48
	v_add_i32 v47, vcc, 4, v47
	ds_read_b32 v64, v47
	s_waitcnt vmcnt(3) & lgkmcnt(0)
	v_mul_f32 v47, v35, v50
	v_mul_f32 v48, v36, v50
	v_mul_f32 v53, v37, v50
	v_mul_f32 v50, v38, v50
	v_mul_f32 v58, v35, v55
	v_mul_f32 v67, v36, v55
	v_mul_f32 v68, v37, v55
	v_mul_f32 v55, v38, v55
	v_mul_f32 v69, v35, v60
	v_mul_f32 v70, v36, v60
	v_mul_f32 v71, v37, v60
	v_mul_f32 v60, v38, v60
	v_mul_f32 v35, v35, v64
	v_mul_f32 v36, v36, v64
	v_mul_f32 v37, v37, v64
	v_mul_f32 v38, v38, v64
	s_waitcnt vmcnt(2)
	v_mac_f32 v47, v39, v49
	v_mac_f32 v48, v40, v49
	v_mac_f32 v53, v41, v49
	v_mac_f32 v50, v42, v49
	v_mac_f32 v58, v39, v54
	v_mac_f32 v67, v40, v54
	v_mac_f32 v68, v41, v54
	v_mac_f32 v55, v42, v54
	v_mac_f32 v69, v39, v59
	v_mac_f32 v70, v40, v59
	v_mac_f32 v71, v41, v59
	v_mac_f32 v60, v42, v59
	v_mac_f32 v35, v39, v63
	v_mac_f32 v36, v40, v63
	v_mac_f32 v37, v41, v63
	v_mac_f32 v38, v42, v63
	s_waitcnt vmcnt(1)
	v_mac_f32 v47, v43, v51
	v_mac_f32 v48, v44, v51
	v_mac_f32 v53, v45, v51
	v_mac_f32 v50, v46, v51
	v_mac_f32 v58, v43, v56
	v_mac_f32 v67, v44, v56
	v_mac_f32 v68, v45, v56
	v_mac_f32 v55, v46, v56
	v_mac_f32 v69, v43, v61
	v_mac_f32 v70, v44, v61
	v_mac_f32 v71, v45, v61
	v_mac_f32 v60, v46, v61
	v_mac_f32 v35, v43, v65
	v_mac_f32 v36, v44, v65
	v_mac_f32 v37, v45, v65
	v_mac_f32 v38, v46, v65
	s_waitcnt vmcnt(0)
	v_mac_f32 v47, v31, v52
	v_mac_f32 v48, v32, v52
	v_mac_f32 v53, v33, v52
	v_mac_f32 v50, v34, v52
	v_mac_f32 v58, v31, v57
	v_mac_f32 v67, v32, v57
	v_mac_f32 v68, v33, v57
	v_mac_f32 v55, v34, v57
	v_mac_f32 v69, v31, v62
	v_mac_f32 v70, v32, v62
	v_mac_f32 v71, v33, v62
	v_mac_f32 v60, v34, v62
	v_mac_f32 v35, v31, v66
	v_mac_f32 v36, v32, v66
	v_mac_f32 v37, v33, v66
	v_mac_f32 v38, v34, v66
	v_add_f32 v9, v47, v9
	v_add_f32 v17, v58, v17
	v_add_f32 v13, v69, v13
	v_add_f32 v5, v35, v5
	v_add_f32 v10, v48, v10
	v_add_f32 v18, v67, v18
	v_add_f32 v14, v70, v14
	v_add_f32 v6, v36, v6
	v_add_f32 v11, v53, v11
	v_add_f32 v19, v68, v19
	v_add_f32 v15, v71, v15
	v_add_f32 v7, v37, v7
	v_add_f32 v12, v50, v12
	v_add_f32 v20, v55, v20
	v_add_f32 v16, v60, v16
	v_add_f32 v8, v38, v8
	v_add_i32 v29, vcc, 4, v29
	v_cmp_le_u32 vcc, s12, v29
	s_or_b64 s[32:33], vcc, s[32:33]
	s_andn2_b64 exec, exec, s[32:33]
	s_cbranch_execnz SKBB1_8
// SKBB#6:                                 // %Flow
                                        //   in Loop: Header=SKBB1_5 Depth=1
	s_or_b64 exec, exec, s[32:33]
SKBB1_7:                                  // %for.cond.cleanup.50
                                        //   in Loop: Header=SKBB1_5 Depth=1
	s_or_b64 exec, exec, s[30:31]
	s_barrier
	v_add_i32 v28, vcc, 1, v28
	v_cmp_ge_u32 vcc, v28, v4
	s_or_b64 s[18:19], vcc, s[18:19]
	s_andn2_b64 exec, exec, s[18:19]
	s_cbranch_execnz SKBB1_5
// SKBB#2:                                 // %Flow1
	s_or_b64 exec, exec, s[18:19]
SKBB1_4:                                  // %Flow2
	s_or_b64 exec, exec, s[4:5]
	v_mul_lo_i32 v0, v3, s2
	v_add_i32 v0, vcc, v0, v2
// SKBB#3:                                 // %for.cond.cleanup
	v_lshlrev_b32 v1, 4, v0
	v_add_i32 v1, vcc, s14, v1
	tbuffer_store_format_xyzw v[9:12], v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v1, vcc, s2, v0
	v_lshlrev_b32 v1, 4, v1
	v_add_i32 v1, vcc, s14, v1
	tbuffer_store_format_xyzw v[17:20], v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_lshl_b32 s0, s2, 1
	v_add_i32 v1, vcc, s0, v0
	v_lshlrev_b32 v1, 4, v1
	v_add_i32 v1, vcc, s14, v1
	tbuffer_store_format_xyzw v[13:16], v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_mul_i32 s0, s2, 3
	v_add_i32 v0, vcc, s0, v0
	v_lshlrev_b32 v0, 4, v0
	v_add_i32 v0, vcc, s14, v0
	tbuffer_store_format_xyzw v[5:8], v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

.args
	float[4]* matrixA 0 uav10 
	float[4]* matrixB 16 uav11 
	float[4]* matrixC 32 uav12 
	i32 widthA 48 
	float[4]* blockA 64 hl

// Merge warning: sections do not match
.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 1308
	// NumVgprs = 72
	// NumSgprs = 36
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1
// Merged MatrixMultiplication_Kernels_fast.s MatrixMultiplication_Kernels_source.s

