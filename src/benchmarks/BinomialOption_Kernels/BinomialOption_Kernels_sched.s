.global	binomial_options
.text

binomial_options:                       // @binomial_options
// BB#0:                                 // %entry
	s_buffer_load_dword s37, s[8:11], 0x0
	s_buffer_load_dword s0, s[8:11], 0x4
	s_buffer_load_dword s30, s[8:11], 0x8
	s_buffer_load_dword s31, s[8:11], 0xc
	s_buffer_load_dword s38, s[8:11], 0x10
	s_load_dwordx4 s[32:35], s[2:3], 0x58
	s_load_dwordx4 s[4:7], s[2:3], 0x50
	s_lshl_b32 s36, s12, 4
	s_waitcnt lgkmcnt(0)
	s_add_i32 s0, s0, s36
	v_mov_b32 v1, s0
	tbuffer_load_format_xyzw v[10:13], v1, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_cvt_f32_i32 v1, s37
	v_cvt_f32_u32 v2, v0
	v_lshlrev_b32 v14, 4, v0
	v_mad_f32 v15, 2.0, v2, v1
	s_waitcnt vmcnt(0)
	v_sub_f32 v16, 1.0, v13
	v_sub_f32 v17, 1.0, v12
	v_sub_f32 v18, 1.0, v11
	v_sub_f32 v19, 1.0, v10
	v_mov_b32 v2, 0x41f00000
	v_mul_f32 v20, v2, v13
	v_mul_f32 v21, v2, v12
	v_mul_f32 v22, v2, v11
	v_mul_f32 v23, v2, v10
	v_mov_b32 v2, 0x40a00000
	v_mac_f32 v23, v2, v19
	v_mac_f32 v22, v2, v18
	v_mac_f32 v21, v2, v17
	v_mac_f32 v20, v2, v16
	v_mov_b32 v2, 0x41200000
	v_mul_f32 v3, v2, v13
	v_mul_f32 v4, v2, v12
	v_mul_f32 v5, v2, v11
	v_mul_f32 v2, v2, v10
	v_mov_b32 v6, 0x3e800000
	v_mac_f32 v2, v6, v19
	v_mac_f32 v5, v6, v18
	v_mac_f32 v4, v6, v17
	v_mac_f32 v3, v6, v16
	v_rcp_f32 v1, v1
	v_mov_b32 v24, 0x7fc00000
	v_mov_b32 v25, 0x3e99999a
	v_mov_b32 v26, 0x3fb8aa3b
	v_mov_b32 v27, 0xbf317180
	v_mov_b32 v28, 0xb717f7d1
	v_mov_b32 v29, 0xb5ddea0e
	v_mov_b32 v30, 0x3331bb4c
	v_mov_b32 v31, 0x388ab355
	v_mov_b32 v32, 0xbb360b61
	v_mov_b32 v33, 0x3e2aaaab
	v_mov_b32 v34, 0x6f800000
	v_mov_b32 v35, 0x2f800000
	v_mov_b32 v36, 0xc2aeac4f
	v_mov_b32 v37, 0x42b17218
	v_mov_b32 v38, 0x7f800000
	v_mul_f32 v9, v3, v1
	v_mul_f32 v8, v4, v1
	v_mul_f32 v7, v5, v1
	v_mul_f32 v6, v2, v1
	v_cmp_gt_f32 vcc, 0, v6
	v_cmp_gt_f32 s[0:1], 0, v7
	v_cmp_gt_f32 s[2:3], 0, v8
	v_cmp_gt_f32 s[4:5], 0, v9
	v_sqrt_f32 v1, v6
	v_cndmask_b32 v1, v1, v24, vcc
	v_sqrt_f32 v2, v7
	v_cndmask_b32 v2, v2, v24, s[0:1]
	v_sqrt_f32 v3, v8
	v_cndmask_b32 v3, v3, v24, s[2:3]
	v_sqrt_f32 v4, v9
	v_cndmask_b32 v4, v4, v24, s[4:5]
	v_mul_f32 v5, v25, v4
	v_mul_f32 v4, v25, v3
	v_mul_f32 v3, v25, v2
	v_mul_f32 v2, v25, v1
	v_mul_f32 v42, v5, v15
	v_mul_f32 v41, v4, v15
	v_mul_f32 v40, v3, v15
	v_mul_f32 v39, v2, v15
	v_cmp_gt_f32 vcc, 0, v39
	v_cmp_lt_f32 s[0:1], v39, v36
	v_cmp_lt_f32 s[2:3], v39, v37
	v_cmp_u_f32 s[4:5], v39, v39
	v_cmp_gt_f32 s[6:7], 0, v40
	v_cmp_lt_f32 s[8:9], v40, v36
	v_cmp_lt_f32 s[10:11], v40, v37
	v_cmp_u_f32 s[12:13], v40, v40
	v_cmp_gt_f32 s[14:15], 0, v41
	v_cmp_lt_f32 s[16:17], v41, v36
	v_cmp_lt_f32 s[18:19], v41, v37
	v_cmp_u_f32 s[20:21], v41, v41
	v_cmp_gt_f32 s[22:23], 0, v42
	v_cmp_lt_f32 s[24:25], v42, v36
	v_cmp_lt_f32 s[26:27], v42, v37
	v_cmp_u_f32 s[28:29], v42, v42
	v_cndmask_b32 v1, 0.5, -0.5, vcc
	v_mac_f32 v1, v26, v39
	v_cvt_i32_f32 v1, v1
	v_cvt_f32_i32 v15, v1
	v_mad_f32 v24, v27, v15, v39
	v_mad_f32 v25, v28, v15, v24
	v_mul_f32 v36, v25, v25
	v_mad_f32 v37, v30, v36, v29
	v_mad_f32 v37, v37, v36, v31
	v_mad_f32 v37, v37, v36, v32
	v_mad_f32 v37, v37, v36, v33
	v_mad_f32 v36, v36, v37, v25
	v_mul_f32 v25, v36, v25
	v_sub_f32 v36, 2.0, v36
	v_cmp_gt_f32 s[40:41], v36, v34
	v_cndmask_b32 v37, 1.0, v35, s[40:41]
	v_mul_f32 v36, v37, v36
	v_rcp_f32 v36, v36
	v_mul_f32 v25, v36, v25
	v_mul_f32 v25, v25, v37
	v_mad_f32 v15, v15, v28, v25
	v_subrev_f32 v15, v24, v15
	v_sub_f32 v15, 1.0, v15
	v_lshlrev_b32 v1, 23, v1
	v_add_i32 v1, vcc, v15, v1
	v_cndmask_b32 v1, v1, 0, s[0:1]
	v_cndmask_b32 v1, v38, v1, s[2:3]
	v_cndmask_b32 v1, v1, v39, s[4:5]
	v_cndmask_b32 v15, 0.5, -0.5, s[6:7]
	v_mac_f32 v15, v26, v40
	v_cvt_i32_f32 v15, v15
	v_cvt_f32_i32 v24, v15
	v_mad_f32 v25, v27, v24, v40
	v_mad_f32 v36, v28, v24, v25
	v_mul_f32 v37, v36, v36
	v_mad_f32 v39, v30, v37, v29
	v_mad_f32 v39, v39, v37, v31
	v_mad_f32 v39, v39, v37, v32
	v_mad_f32 v39, v39, v37, v33
	v_mad_f32 v37, v37, v39, v36
	v_mul_f32 v36, v37, v36
	v_sub_f32 v37, 2.0, v37
	v_cmp_gt_f32 s[0:1], v37, v34
	v_cndmask_b32 v39, 1.0, v35, s[0:1]
	v_mul_f32 v37, v39, v37
	v_rcp_f32 v37, v37
	v_mul_f32 v36, v37, v36
	v_mul_f32 v36, v36, v39
	v_mad_f32 v24, v24, v28, v36
	v_subrev_f32 v24, v25, v24
	v_sub_f32 v24, 1.0, v24
	v_lshlrev_b32 v15, 23, v15
	v_add_i32 v15, vcc, v24, v15
	v_cndmask_b32 v15, v15, 0, s[8:9]
	v_cndmask_b32 v15, v38, v15, s[10:11]
	v_cndmask_b32 v15, v15, v40, s[12:13]
	v_cndmask_b32 v24, 0.5, -0.5, s[14:15]
	v_mac_f32 v24, v26, v41
	v_cvt_i32_f32 v24, v24
	v_cvt_f32_i32 v25, v24
	v_mad_f32 v36, v27, v25, v41
	v_mad_f32 v37, v28, v25, v36
	v_mul_f32 v39, v37, v37
	v_mad_f32 v40, v30, v39, v29
	v_mad_f32 v40, v40, v39, v31
	v_mad_f32 v40, v40, v39, v32
	v_mad_f32 v40, v40, v39, v33
	v_mad_f32 v39, v39, v40, v37
	v_mul_f32 v37, v39, v37
	v_sub_f32 v39, 2.0, v39
	v_cmp_gt_f32 s[0:1], v39, v34
	v_cndmask_b32 v40, 1.0, v35, s[0:1]
	v_mul_f32 v39, v40, v39
	v_rcp_f32 v39, v39
	v_mul_f32 v37, v39, v37
	v_mul_f32 v37, v37, v40
	v_mad_f32 v25, v25, v28, v37
	v_subrev_f32 v25, v36, v25
	v_sub_f32 v25, 1.0, v25
	v_lshlrev_b32 v24, 23, v24
	v_add_i32 v24, vcc, v25, v24
	v_cndmask_b32 v24, v24, 0, s[16:17]
	v_cndmask_b32 v24, v38, v24, s[18:19]
	v_cndmask_b32 v24, v24, v41, s[20:21]
	v_cndmask_b32 v25, 0.5, -0.5, s[22:23]
	v_mac_f32 v25, v26, v42
	v_cvt_i32_f32 v25, v25
	v_cvt_f32_i32 v26, v25
	v_mad_f32 v27, v27, v26, v42
	v_mad_f32 v36, v28, v26, v27
	v_mul_f32 v37, v36, v36
	v_mac_f32 v29, v30, v37
	v_mac_f32 v31, v29, v37
	v_mac_f32 v32, v31, v37
	v_mac_f32 v33, v32, v37
	v_mad_f32 v29, v37, v33, v36
	v_mul_f32 v30, v29, v36
	v_sub_f32 v29, 2.0, v29
	v_cmp_gt_f32 s[0:1], v29, v34
	v_cndmask_b32 v31, 1.0, v35, s[0:1]
	v_mul_f32 v29, v31, v29
	v_rcp_f32 v29, v29
	v_mul_f32 v29, v29, v30
	v_mul_f32 v29, v29, v31
	v_mad_f32 v26, v26, v28, v29
	v_subrev_f32 v26, v27, v26
	v_sub_f32 v26, 1.0, v26
	v_lshlrev_b32 v25, 23, v25
	v_add_i32 v25, vcc, v26, v25
	v_cndmask_b32 v25, v25, 0, s[24:25]
	v_cndmask_b32 v25, v38, v25, s[26:27]
	v_cndmask_b32 v25, v25, v42, s[28:29]
	v_mov_b32 v26, 0x42c80000
	v_mad_f32 v10, v26, v10, v19
	v_mad_f32 v11, v26, v11, v18
	v_mad_f32 v12, v26, v12, v17
	v_mad_f32 v13, v26, v13, v16
	v_mad_f32 v19, v20, v25, v13
	v_mad_f32 v18, v21, v24, v12
	v_mad_f32 v17, v22, v15, v11
	v_mad_f32 v16, v23, v1, v10
	v_add_i32 v1, vcc, s31, v14
	s_mov_b32 m0, -1
	v_add_i32 v10, vcc, 12, v1
	v_add_i32 v11, vcc, 8, v1
	v_add_i32 v12, vcc, 4, v1
	v_max_f32 v13, 0, v16
	v_max_f32 v14, 0, v17
	v_max_f32 v15, 0, v18
	v_max_f32 v16, 0, v19
	ds_write_b32 v10, v16
	ds_write_b32 v11, v15
	ds_write_b32 v12, v14
	ds_write_b32 v1, v13
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_cmp_lt_i32 s[0:1], 0, s37
	s_and_saveexec_b64 s[26:27], s[0:1]
	s_xor_b64 s[26:27], exec, s[26:27]
	s_cbranch_execz BB0_4
// BB#1:                                 // %for.body.lr.ph
	v_lshlrev_b32 v10, 4, v0
	v_mov_b32 v11, 0x3ca3d70a
	v_mul_f32 v15, v11, v9
	v_mul_f32 v14, v11, v8
	v_mul_f32 v13, v11, v7
	v_mul_f32 v12, v11, v6
	v_cmp_gt_f32 vcc, 0, v15
	v_cmp_gt_f32 s[8:9], 0, v14
	v_cmp_gt_f32 s[10:11], 0, v13
	v_cmp_gt_f32 s[12:13], 0, v12
	v_cmp_u_f32 s[6:7], v15, v15
	v_cmp_u_f32 s[4:5], v14, v14
	v_cmp_u_f32 s[2:3], v13, v13
	v_cmp_u_f32 s[0:1], v12, v12
	v_mov_b32 v6, 0x3fb8aa3b
	v_cmp_gt_f32 s[14:15], 0, v2
	v_cndmask_b32 v7, 0.5, -0.5, s[14:15]
	v_mac_f32 v7, v6, v2
	v_cvt_i32_f32 v7, v7
	v_cmp_gt_f32 s[14:15], 0, v3
	v_cndmask_b32 v8, 0.5, -0.5, s[14:15]
	v_mac_f32 v8, v6, v3
	v_cvt_i32_f32 v8, v8
	v_cmp_gt_f32 s[14:15], 0, v4
	v_cndmask_b32 v9, 0.5, -0.5, s[14:15]
	v_mac_f32 v9, v6, v4
	v_cvt_i32_f32 v9, v9
	v_cndmask_b32 v11, 0.5, -0.5, vcc
	v_mac_f32 v11, v6, v15
	v_cvt_i32_f32 v11, v11
	v_cndmask_b32 v16, 0.5, -0.5, s[8:9]
	v_mac_f32 v16, v6, v14
	v_cvt_i32_f32 v16, v16
	v_cndmask_b32 v17, 0.5, -0.5, s[10:11]
	v_mac_f32 v17, v6, v13
	v_cvt_i32_f32 v17, v17
	v_cndmask_b32 v18, 0.5, -0.5, s[12:13]
	v_mac_f32 v18, v6, v12
	v_cvt_i32_f32 v18, v18
	v_cmp_gt_f32 vcc, 0, v5
	v_cndmask_b32 v19, 0.5, -0.5, vcc
	v_mac_f32 v19, v6, v5
	v_cvt_i32_f32 v6, v19
	v_mov_b32 v19, 0xbf317180
	v_cvt_f32_i32 v20, v7
	v_lshlrev_b32 v7, 23, v7
	v_cvt_f32_i32 v21, v8
	v_lshlrev_b32 v8, 23, v8
	v_cvt_f32_i32 v22, v9
	v_lshlrev_b32 v9, 23, v9
	v_cvt_f32_i32 v23, v11
	v_lshlrev_b32 v11, 23, v11
	v_cvt_f32_i32 v24, v16
	v_lshlrev_b32 v16, 23, v16
	v_cvt_f32_i32 v25, v17
	v_lshlrev_b32 v17, 23, v17
	v_cvt_f32_i32 v26, v18
	v_lshlrev_b32 v18, 23, v18
	v_mov_b32 v27, 0xb717f7d1
	v_cvt_f32_i32 v28, v6
	v_lshlrev_b32 v6, 23, v6
	v_mad_f32 v29, v19, v20, v2
	v_mad_f32 v30, v19, v21, v3
	v_mad_f32 v31, v19, v22, v4
	v_mad_f32 v32, v19, v23, v15
	v_mad_f32 v33, v19, v24, v14
	v_mad_f32 v34, v19, v25, v13
	v_mad_f32 v35, v19, v26, v12
	v_mad_f32 v19, v19, v28, v5
	v_mad_f32 v36, v27, v20, v29
	v_mad_f32 v37, v27, v21, v30
	v_mad_f32 v38, v27, v22, v31
	v_mad_f32 v39, v27, v23, v32
	v_mad_f32 v40, v27, v24, v33
	v_mad_f32 v41, v27, v25, v34
	v_mad_f32 v42, v27, v26, v35
	v_mov_b32 v43, 0xb5ddea0e
	v_mov_b32 v44, 0x3331bb4c
	v_mad_f32 v45, v27, v28, v19
	v_mul_f32 v46, v36, v36
	v_mul_f32 v47, v37, v37
	v_mul_f32 v48, v38, v38
	v_mul_f32 v49, v39, v39
	v_mul_f32 v50, v40, v40
	v_mul_f32 v51, v41, v41
	v_mul_f32 v52, v42, v42
	v_mov_b32 v53, 0x388ab355
	v_mul_f32 v54, v45, v45
	v_mad_f32 v55, v44, v46, v43
	v_mad_f32 v55, v55, v46, v53
	v_mad_f32 v56, v44, v47, v43
	v_mad_f32 v56, v56, v47, v53
	v_mad_f32 v57, v44, v48, v43
	v_mad_f32 v57, v57, v48, v53
	v_mad_f32 v58, v44, v49, v43
	v_mad_f32 v58, v58, v49, v53
	v_mad_f32 v59, v44, v50, v43
	v_mad_f32 v59, v59, v50, v53
	v_mad_f32 v60, v44, v51, v43
	v_mad_f32 v60, v60, v51, v53
	v_mad_f32 v61, v44, v52, v43
	v_mac_f32 v43, v44, v54
	v_mad_f32 v44, v61, v52, v53
	v_mac_f32 v53, v43, v54
	v_mov_b32 v43, 0xbb360b61
	v_mad_f32 v57, v57, v48, v43
	v_mad_f32 v56, v56, v47, v43
	v_mad_f32 v55, v55, v46, v43
	v_mad_f32 v58, v58, v49, v43
	v_mad_f32 v59, v59, v50, v43
	v_mad_f32 v60, v60, v51, v43
	v_mad_f32 v44, v44, v52, v43
	v_mac_f32 v43, v53, v54
	v_mov_b32 v53, 0x3e2aaaab
	v_mad_f32 v57, v57, v48, v53
	v_mad_f32 v56, v56, v47, v53
	v_mad_f32 v55, v55, v46, v53
	v_mad_f32 v58, v58, v49, v53
	v_mad_f32 v59, v59, v50, v53
	v_mad_f32 v60, v60, v51, v53
	v_mad_f32 v44, v44, v52, v53
	v_mac_f32 v53, v43, v54
	v_mad_f32 v43, v54, v53, v45
	v_mad_f32 v48, v48, v57, v38
	v_mad_f32 v47, v47, v56, v37
	v_mad_f32 v46, v46, v55, v36
	v_mad_f32 v49, v49, v58, v39
	v_mul_f32 v45, v43, v45
	v_sub_f32 v43, 2.0, v43
	v_mad_f32 v50, v50, v59, v40
	v_mul_f32 v38, v48, v38
	v_sub_f32 v48, 2.0, v48
	v_mad_f32 v51, v51, v60, v41
	v_mul_f32 v37, v47, v37
	v_sub_f32 v47, 2.0, v47
	v_mad_f32 v44, v52, v44, v42
	v_mul_f32 v36, v46, v36
	v_sub_f32 v46, 2.0, v46
	v_mul_f32 v39, v49, v39
	v_sub_f32 v49, 2.0, v49
	v_mul_f32 v40, v50, v40
	v_sub_f32 v50, 2.0, v50
	v_mul_f32 v41, v51, v41
	v_sub_f32 v51, 2.0, v51
	v_mul_f32 v42, v44, v42
	v_sub_f32 v44, 2.0, v44
	v_mov_b32 v52, 0x6f800000
	v_cmp_gt_f32 s[8:9], v43, v52
	v_cmp_gt_f32 s[10:11], v48, v52
	v_cmp_gt_f32 s[12:13], v47, v52
	v_cmp_gt_f32 s[14:15], v46, v52
	v_cmp_gt_f32 s[16:17], v49, v52
	v_cmp_gt_f32 s[18:19], v50, v52
	v_cmp_gt_f32 s[20:21], v51, v52
	v_cmp_gt_f32 s[28:29], v44, v52
	v_mov_b32 v53, 0x2f800000
	v_cndmask_b32 v54, 1.0, v53, s[8:9]
	v_mul_f32 v43, v54, v43
	v_rcp_f32 v43, v43
	v_mul_f32 v43, v43, v45
	v_mul_f32 v43, v43, v54
	v_mad_f32 v28, v28, v27, v43
	v_subrev_f32 v19, v19, v28
	v_sub_f32 v19, 1.0, v19
	v_add_i32 v6, vcc, v19, v6
	v_cndmask_b32 v19, 1.0, v53, s[10:11]
	v_mul_f32 v28, v19, v48
	v_rcp_f32 v28, v28
	v_mul_f32 v28, v28, v38
	v_mul_f32 v19, v28, v19
	v_mad_f32 v19, v22, v27, v19
	v_subrev_f32 v19, v31, v19
	v_sub_f32 v19, 1.0, v19
	v_add_i32 v9, vcc, v19, v9
	v_cndmask_b32 v19, 1.0, v53, s[12:13]
	v_mul_f32 v22, v19, v47
	v_rcp_f32 v22, v22
	v_mul_f32 v22, v22, v37
	v_mul_f32 v19, v22, v19
	v_mad_f32 v19, v21, v27, v19
	v_subrev_f32 v19, v30, v19
	v_sub_f32 v19, 1.0, v19
	v_add_i32 v8, vcc, v19, v8
	v_cndmask_b32 v19, 1.0, v53, s[14:15]
	v_mul_f32 v21, v19, v46
	v_rcp_f32 v21, v21
	v_mul_f32 v21, v21, v36
	v_mul_f32 v19, v21, v19
	v_mad_f32 v19, v20, v27, v19
	v_subrev_f32 v19, v29, v19
	v_sub_f32 v19, 1.0, v19
	v_add_i32 v7, vcc, v19, v7
	v_cndmask_b32 v19, 1.0, v53, s[16:17]
	v_mul_f32 v20, v19, v49
	v_rcp_f32 v20, v20
	v_mul_f32 v20, v20, v39
	v_mul_f32 v19, v20, v19
	v_mad_f32 v19, v23, v27, v19
	v_subrev_f32 v19, v32, v19
	v_sub_f32 v19, 1.0, v19
	v_add_i32 v11, vcc, v19, v11
	v_cndmask_b32 v19, 1.0, v53, s[18:19]
	v_mul_f32 v20, v19, v50
	v_rcp_f32 v20, v20
	v_mul_f32 v20, v20, v40
	v_mul_f32 v19, v20, v19
	v_mad_f32 v19, v24, v27, v19
	v_subrev_f32 v19, v33, v19
	v_sub_f32 v19, 1.0, v19
	v_add_i32 v16, vcc, v19, v16
	v_mov_b32 v19, 0xc2aeac4f
	v_cmp_lt_f32 vcc, v5, v19
	v_cmp_lt_f32 s[8:9], v4, v19
	v_cndmask_b32 v6, v6, 0, vcc
	v_cmp_lt_f32 vcc, v3, v19
	v_cndmask_b32 v9, v9, 0, s[8:9]
	v_cmp_lt_f32 s[8:9], v2, v19
	v_cndmask_b32 v8, v8, 0, vcc
	v_cndmask_b32 v7, v7, 0, s[8:9]
	v_cmp_lt_f32 vcc, v15, v19
	v_cmp_lt_f32 s[8:9], v14, v19
	v_cndmask_b32 v11, v11, 0, vcc
	v_cmp_lt_f32 s[10:11], v13, v19
	v_cndmask_b32 v16, v16, 0, s[8:9]
	v_cmp_lt_f32 s[8:9], v12, v19
	v_cndmask_b32 v19, 1.0, v53, s[20:21]
	v_mul_f32 v20, v19, v51
	v_rcp_f32 v20, v20
	v_mul_f32 v20, v20, v41
	v_mul_f32 v19, v20, v19
	v_mad_f32 v19, v25, v27, v19
	v_subrev_f32 v19, v34, v19
	v_sub_f32 v19, 1.0, v19
	v_add_i32 v17, vcc, v19, v17
	v_cndmask_b32 v17, v17, 0, s[10:11]
	v_mov_b32 v19, 0x42b17218
	v_cmp_lt_f32 s[10:11], v5, v19
	v_cmp_lt_f32 s[12:13], v4, v19
	v_cmp_lt_f32 s[14:15], v3, v19
	v_cmp_lt_f32 s[16:17], v2, v19
	v_cmp_lt_f32 s[18:19], v15, v19
	v_cmp_lt_f32 s[20:21], v14, v19
	v_cmp_lt_f32 s[22:23], v13, v19
	v_cmp_lt_f32 s[24:25], v12, v19
	v_cndmask_b32 v19, 1.0, v53, s[28:29]
	v_mul_f32 v20, v19, v44
	v_rcp_f32 v20, v20
	v_mul_f32 v20, v20, v42
	v_mul_f32 v19, v20, v19
	v_mad_f32 v19, v26, v27, v19
	v_subrev_f32 v19, v35, v19
	v_sub_f32 v19, 1.0, v19
	v_add_i32 v18, vcc, v19, v18
	v_cndmask_b32 v18, v18, 0, s[8:9]
	v_mov_b32 v19, 0x7f800000
	v_cndmask_b32 v6, v19, v6, s[10:11]
	v_cndmask_b32 v9, v19, v9, s[12:13]
	v_cmp_u_f32 vcc, v5, v5
	v_cndmask_b32 v5, v6, v5, vcc
	v_cndmask_b32 v6, v19, v8, s[14:15]
	v_cmp_u_f32 vcc, v4, v4
	v_cndmask_b32 v4, v9, v4, vcc
	v_cndmask_b32 v7, v19, v7, s[16:17]
	v_cmp_u_f32 vcc, v3, v3
	v_cndmask_b32 v3, v6, v3, vcc
	v_cmp_u_f32 vcc, v2, v2
	v_cndmask_b32 v2, v7, v2, vcc
	v_cndmask_b32 v6, v19, v11, s[18:19]
	v_cndmask_b32 v7, v19, v16, s[20:21]
	v_cndmask_b32 v6, v6, v15, s[6:7]
	v_cndmask_b32 v8, v19, v17, s[22:23]
	v_cndmask_b32 v7, v7, v14, s[4:5]
	v_cndmask_b32 v9, v19, v18, s[24:25]
	v_cndmask_b32 v8, v8, v13, s[2:3]
	v_cndmask_b32 v9, v9, v12, s[0:1]
	v_rcp_f32 v11, v5
	v_subrev_f32 v5, v11, v5
	v_cmp_gt_f32 s[0:1], v5, v52
	v_subrev_f32 v11, v11, v6
	v_rcp_f32 v6, v6
	v_rcp_f32 v12, v4
	v_subrev_f32 v4, v12, v4
	v_cmp_gt_f32 s[2:3], v4, v52
	v_subrev_f32 v12, v12, v7
	v_rcp_f32 v7, v7
	v_rcp_f32 v13, v3
	v_subrev_f32 v3, v13, v3
	v_cmp_gt_f32 s[4:5], v3, v52
	v_subrev_f32 v13, v13, v8
	v_rcp_f32 v14, v8
	v_rcp_f32 v8, v2
	v_subrev_f32 v2, v8, v2
	v_cmp_gt_f32 s[6:7], v2, v52
	v_subrev_f32 v8, v8, v9
	v_rcp_f32 v15, v9
	v_cndmask_b32 v9, 1.0, v53, s[0:1]
	v_mul_f32 v5, v9, v5
	v_rcp_f32 v5, v5
	v_mul_f32 v5, v5, v11
	v_cndmask_b32 v11, 1.0, v53, s[2:3]
	v_mul_f32 v4, v11, v4
	v_rcp_f32 v4, v4
	v_mul_f32 v4, v4, v12
	v_cndmask_b32 v12, 1.0, v53, s[4:5]
	v_cndmask_b32 v16, 1.0, v53, s[6:7]
	v_mul_f32 v3, v12, v3
	v_mul_f32 v2, v16, v2
	v_rcp_f32 v3, v3
	v_mul_f32 v3, v3, v13
	v_rcp_f32 v2, v2
	v_mul_f32 v2, v2, v8
	v_mad_f32 v8, v9, v5, 1.0
	v_mul_f32 v9, v5, v9
	v_mad_f32 v13, v11, v4, 1.0
	v_mul_f32 v11, v4, v11
	v_mul_f32 v5, v8, v6
	v_mul_f32 v4, v13, v7
	v_mul_f32 v9, v9, v6
	v_mul_f32 v8, v11, v7
	v_mad_f32 v6, v12, v3, 1.0
	v_mul_f32 v7, v3, v12
	v_mul_f32 v3, v6, v14
	v_mul_f32 v7, v7, v14
	v_add_i32 v12, vcc, 16, v10
	v_mad_f32 v11, v16, v2, 1.0
	v_mul_f32 v2, v2, v16
	v_mul_f32 v6, v2, v15
	v_mul_f32 v2, v11, v15
	v_add_i32 v10, vcc, s38, v10
	v_add_i32 v11, vcc, s38, v12
	s_mov_b64 s[2:3], 0
	v_add_i32 v12, vcc, s31, v12
	v_mov_b32 v13, s37
BB0_5:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_cmp_lt_u32 vcc, v0, v13
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz BB0_7
// BB#6:                                 // %if.then
                                        //   in Loop: Header=BB0_5 Depth=1
	s_mov_b32 m0, -1
	ds_read_b32 v14, v12
	v_add_i32 v15, vcc, 12, v12
	ds_read_b32 v17, v15
	v_add_i32 v15, vcc, 8, v12
	ds_read_b32 v16, v15
	v_add_i32 v15, vcc, 4, v12
	ds_read_b32 v15, v15
	ds_read_b32 v18, v1
	v_add_i32 v19, vcc, 12, v1
	ds_read_b32 v21, v19
	v_add_i32 v19, vcc, 8, v1
	ds_read_b32 v20, v19
	v_add_i32 v19, vcc, 4, v1
	ds_read_b32 v19, v19
	s_waitcnt lgkmcnt(0)
	v_mul_f32 v22, v14, v2
	v_mul_f32 v23, v15, v3
	v_mul_f32 v24, v16, v4
	v_mul_f32 v25, v17, v5
	v_mac_f32 v25, v21, v9
	v_mac_f32 v24, v20, v8
	v_mac_f32 v23, v19, v7
	v_mac_f32 v22, v18, v6
	v_add_i32 v14, vcc, 12, v10
	ds_write_b32 v14, v25
	v_add_i32 v14, vcc, 8, v10
	ds_write_b32 v14, v24
	v_add_i32 v14, vcc, 4, v10
	ds_write_b32 v14, v23
	ds_write_b32 v10, v22
	s_waitcnt lgkmcnt(0)
BB0_7:                                  // %if.end
                                        //   in Loop: Header=BB0_5 Depth=1
	s_or_b64 exec, exec, s[0:1]
	v_add_i32 v13, vcc, -1, v13
	s_barrier
	v_cmp_lt_u32 vcc, v0, v13
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz BB0_9
// BB#8:                                 // %if.then.64
                                        //   in Loop: Header=BB0_5 Depth=1
	s_mov_b32 m0, -1
	ds_read_b32 v14, v11
	v_add_i32 v15, vcc, 12, v11
	ds_read_b32 v17, v15
	v_add_i32 v15, vcc, 8, v11
	ds_read_b32 v16, v15
	v_add_i32 v15, vcc, 4, v11
	ds_read_b32 v15, v15
	ds_read_b32 v18, v10
	v_add_i32 v19, vcc, 12, v10
	ds_read_b32 v21, v19
	v_add_i32 v19, vcc, 8, v10
	ds_read_b32 v20, v19
	v_add_i32 v19, vcc, 4, v10
	ds_read_b32 v19, v19
	s_waitcnt lgkmcnt(0)
	v_mul_f32 v22, v14, v2
	v_mul_f32 v23, v15, v3
	v_mul_f32 v24, v16, v4
	v_mul_f32 v25, v17, v5
	v_mac_f32 v25, v21, v9
	v_mac_f32 v24, v20, v8
	v_mac_f32 v23, v19, v7
	v_mac_f32 v22, v18, v6
	v_add_i32 v14, vcc, 12, v1
	ds_write_b32 v14, v25
	v_add_i32 v14, vcc, 8, v1
	ds_write_b32 v14, v24
	v_add_i32 v14, vcc, 4, v1
	ds_write_b32 v14, v23
	ds_write_b32 v1, v22
	s_waitcnt lgkmcnt(0)
BB0_9:                                  // %if.end.71
                                        //   in Loop: Header=BB0_5 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_barrier
	v_add_i32 v14, vcc, 1, v13
	v_cmp_gt_i32 s[0:1], 3, v14
	v_add_i32 v13, vcc, -1, v13
	s_or_b64 s[2:3], s[0:1], s[2:3]
	s_andn2_b64 exec, exec, s[2:3]
	s_cbranch_execnz BB0_5
// BB#2:                                 // %Flow
	s_or_b64 exec, exec, s[2:3]
BB0_4:                                  // %Flow1
	s_or_b64 exec, exec, s[26:27]
// BB#3:                                 // %for.cond.cleanup
	v_cmp_eq_i32 vcc, 0, v0
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz BB0_11
// BB#10:                                // %if.then.75
	s_mov_b32 m0, -1
	s_add_i32 s2, s31, 12
	s_add_i32 s3, s31, 8
	s_add_i32 s4, s31, 4
	s_add_i32 s5, s30, s36
	v_mov_b32 v0, s31
	v_mov_b32 v1, s2
	v_mov_b32 v2, s3
	v_mov_b32 v3, s4
	v_mov_b32 v4, s5
	ds_read_b32 v5, v0
	ds_read_b32 v8, v1
	ds_read_b32 v7, v2
	ds_read_b32 v6, v3
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_xyzw v[5:8], v4, s[32:35], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
BB0_11:                                 // %if.end.78
	s_or_b64 exec, exec, s[0:1]
	s_endpgm

.args
	i32 numSteps 0 
	float[4]* randArray 16 uav10 
	float[4]* output 32 uav11 
	float[4]* callA 48 hl
	float[4]* callB 64 hl

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 3424
	// NumVgprs = 62
	// NumSgprs = 44
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

