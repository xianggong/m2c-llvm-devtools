.global	binomial_options

.text

binomial_options:                       // @binomial_options
// BB#0:                                 // %entry
	s_buffer_load_dword s21, s[8:11], 0x0
	s_buffer_load_dword s0, s[8:11], 0x4
	s_buffer_load_dword s14, s[8:11], 0x8
	s_buffer_load_dword s15, s[8:11], 0xc
	s_buffer_load_dword s22, s[8:11], 0x10
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[4:7], s[2:3], 0x50
	s_lshl_b32 s20, s12, 4
	s_waitcnt lgkmcnt(0)
	s_add_i32 s0, s0, s20
	v_mov_b32 v1, s0
	tbuffer_load_format_xyzw v[1:4], v1, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	v_mov_b32 v5, 0x41f00000
	s_waitcnt vmcnt(0)
	v_mul_f32 v10, v5, v4
	v_mul_f32 v11, v5, v3
	v_mul_f32 v12, v5, v2
	v_mul_f32 v13, v5, v1
	v_mov_b32 v5, 0x41200000
	v_mul_f32 v6, v5, v4
	v_mul_f32 v7, v5, v3
	v_mul_f32 v14, v5, v2
	v_mul_f32 v5, v5, v1
	v_mov_b32 v8, 0x42c80000
	v_cvt_f32_i32 v15, s21
	v_sub_f32 v16, 1.0, v4
	v_sub_f32 v17, 1.0, v3
	v_sub_f32 v18, 1.0, v2
	v_sub_f32 v19, 1.0, v1
	v_mad_f32 v1, v8, v1, v19
	v_mad_f32 v20, v8, v2, v18
	v_mad_f32 v21, v8, v3, v17
	v_mad_f32 v22, v8, v4, v16
	v_mov_b32 v2, 0x3e800000
	v_mac_f32 v5, v2, v19
	v_rcp_f32 v3, v15
	v_mac_f32 v14, v2, v18
	v_mac_f32 v7, v2, v17
	v_mac_f32 v6, v2, v16
	v_mul_f32 v9, v6, v3
	v_mul_f32 v8, v7, v3
	v_mul_f32 v7, v14, v3
	v_mul_f32 v6, v5, v3
	v_mov_b32 v2, 0x7fc00000
	v_sqrt_f32 v3, v6
	v_cmp_gt_f32 vcc, 0, v6
	v_cndmask_b32 v14, v3, v2, vcc
	v_sqrt_f32 v3, v7
	v_cmp_gt_f32 vcc, 0, v7
	v_cndmask_b32 v3, v3, v2, vcc
	v_sqrt_f32 v4, v8
	v_cmp_gt_f32 vcc, 0, v8
	v_cndmask_b32 v4, v4, v2, vcc
	v_cmp_gt_f32 vcc, 0, v9
	v_sqrt_f32 v5, v9
	v_cndmask_b32 v2, v5, v2, vcc
	v_mov_b32 v23, 0x3e99999a
	v_cvt_f32_u32 v24, v0
	v_mul_f32 v5, v23, v2
	v_mul_f32 v4, v23, v4
	v_mul_f32 v3, v23, v3
	v_mul_f32 v2, v23, v14
	v_mad_f32 v14, 2.0, v24, v15
	v_mul_f32 v26, v5, v14
	v_mul_f32 v25, v4, v14
	v_mul_f32 v24, v3, v14
	v_mul_f32 v23, v2, v14
	v_cmp_gt_f32 vcc, 0, v23
	v_mov_b32 v14, 0x3fb8aa3b
	v_cndmask_b32 v15, 0.5, -0.5, vcc
	v_mac_f32 v15, v14, v23
	v_cmp_gt_f32 vcc, 0, v24
	v_cndmask_b32 v27, 0.5, -0.5, vcc
	v_mac_f32 v27, v14, v24
	v_cmp_gt_f32 vcc, 0, v25
	v_cndmask_b32 v28, 0.5, -0.5, vcc
	v_mac_f32 v28, v14, v25
	v_cmp_gt_f32 vcc, 0, v26
	v_cndmask_b32 v29, 0.5, -0.5, vcc
	v_mac_f32 v29, v14, v26
	v_cvt_i32_f32 v14, v15
	v_cvt_i32_f32 v15, v27
	v_cvt_i32_f32 v27, v28
	v_cvt_i32_f32 v28, v29
	v_mov_b32 v29, 0xbf317180
	v_cvt_f32_i32 v30, v14
	v_cvt_f32_i32 v31, v15
	v_cvt_f32_i32 v32, v27
	v_cvt_f32_i32 v33, v28
	v_mad_f32 v34, v29, v30, v23
	v_mad_f32 v35, v29, v31, v24
	v_mad_f32 v36, v29, v32, v25
	v_mad_f32 v29, v29, v33, v26
	v_mov_b32 v37, 0xb717f7d1
	v_mov_b32 v38, 0xb5ddea0e
	v_mov_b32 v39, 0x3331bb4c
	v_mad_f32 v40, v37, v30, v34
	v_mad_f32 v41, v37, v31, v35
	v_mad_f32 v42, v37, v32, v36
	v_mad_f32 v43, v37, v33, v29
	v_mul_f32 v44, v40, v40
	v_mul_f32 v45, v41, v41
	v_mul_f32 v46, v42, v42
	v_mul_f32 v47, v43, v43
	v_mad_f32 v48, v39, v44, v38
	v_mad_f32 v49, v39, v45, v38
	v_mad_f32 v50, v39, v46, v38
	v_mac_f32 v38, v39, v47
	v_mov_b32 v39, 0x388ab355
	v_mad_f32 v48, v48, v44, v39
	v_mad_f32 v49, v49, v45, v39
	v_mad_f32 v50, v50, v46, v39
	v_mac_f32 v39, v38, v47
	v_mov_b32 v38, 0xbb360b61
	v_mad_f32 v48, v48, v44, v38
	v_mad_f32 v49, v49, v45, v38
	v_mad_f32 v50, v50, v46, v38
	v_mac_f32 v38, v39, v47
	v_mov_b32 v39, 0x3e2aaaab
	v_mad_f32 v48, v48, v44, v39
	v_mad_f32 v49, v49, v45, v39
	v_mad_f32 v50, v50, v46, v39
	v_mac_f32 v39, v38, v47
	v_mad_f32 v38, v44, v48, v40
	v_mad_f32 v44, v45, v49, v41
	v_mad_f32 v45, v46, v50, v42
	v_mad_f32 v39, v47, v39, v43
	v_mul_f32 v40, v38, v40
	v_sub_f32 v38, 2.0, v38
	v_mul_f32 v41, v44, v41
	v_sub_f32 v44, 2.0, v44
	v_mul_f32 v42, v45, v42
	v_sub_f32 v45, 2.0, v45
	v_mul_f32 v43, v39, v43
	v_sub_f32 v39, 2.0, v39
	v_mov_b32 v46, 0x6f800000
	v_cmp_gt_f32 s[0:1], v38, v46
	v_cmp_gt_f32 s[2:3], v44, v46
	v_cmp_gt_f32 s[4:5], v45, v46
	v_cmp_gt_f32 s[6:7], v39, v46
	v_mov_b32 v46, 0x2f800000
	v_cndmask_b32 v47, 1.0, v46, s[0:1]
	v_cndmask_b32 v48, 1.0, v46, s[2:3]
	v_cndmask_b32 v49, 1.0, v46, s[4:5]
	v_cndmask_b32 v46, 1.0, v46, s[6:7]
	v_mul_f32 v38, v47, v38
	v_mul_f32 v44, v48, v44
	v_mul_f32 v45, v49, v45
	v_mul_f32 v39, v46, v39
	v_rcp_f32 v38, v38
	v_rcp_f32 v44, v44
	v_rcp_f32 v45, v45
	v_rcp_f32 v39, v39
	v_mul_f32 v38, v38, v40
	v_mul_f32 v40, v44, v41
	v_mul_f32 v41, v45, v42
	v_mul_f32 v39, v39, v43
	v_mul_f32 v38, v38, v47
	v_mul_f32 v40, v40, v48
	v_mul_f32 v41, v41, v49
	v_mul_f32 v39, v39, v46
	v_mad_f32 v30, v30, v37, v38
	v_mad_f32 v31, v31, v37, v40
	v_mad_f32 v32, v32, v37, v41
	v_mad_f32 v33, v33, v37, v39
	v_mov_b32 v37, 0xc2aeac4f
	v_cmp_lt_f32 s[0:1], v23, v37
	v_cmp_lt_f32 s[2:3], v24, v37
	v_cmp_lt_f32 s[4:5], v25, v37
	v_cmp_lt_f32 s[6:7], v26, v37
	v_subrev_f32 v30, v34, v30
	v_subrev_f32 v31, v35, v31
	v_subrev_f32 v32, v36, v32
	v_subrev_f32 v29, v29, v33
	v_lshlrev_b32 v14, 23, v14
	v_sub_f32 v30, 1.0, v30
	v_add_i32 v14, vcc, v30, v14
	v_lshlrev_b32 v15, 23, v15
	v_sub_f32 v30, 1.0, v31
	v_add_i32 v15, vcc, v30, v15
	v_lshlrev_b32 v27, 23, v27
	v_sub_f32 v30, 1.0, v32
	v_add_i32 v27, vcc, v30, v27
	v_lshlrev_b32 v28, 23, v28
	v_sub_f32 v29, 1.0, v29
	v_add_i32 v28, vcc, v29, v28
	v_mov_b32 v29, 0x42b17218
	v_cmp_lt_f32 vcc, v23, v29
	v_cmp_lt_f32 s[8:9], v24, v29
	v_cmp_lt_f32 s[10:11], v25, v29
	v_cmp_lt_f32 s[12:13], v26, v29
	v_cndmask_b32 v14, v14, 0, s[0:1]
	v_cndmask_b32 v15, v15, 0, s[2:3]
	v_cndmask_b32 v27, v27, 0, s[4:5]
	v_cndmask_b32 v28, v28, 0, s[6:7]
	v_mov_b32 v29, 0x7f800000
	v_cndmask_b32 v14, v29, v14, vcc
	v_cndmask_b32 v15, v29, v15, s[8:9]
	v_cndmask_b32 v27, v29, v27, s[10:11]
	v_cndmask_b32 v28, v29, v28, s[12:13]
	v_cmp_u_f32 vcc, v23, v23
	v_cndmask_b32 v14, v14, v23, vcc
	v_cmp_u_f32 vcc, v24, v24
	v_cndmask_b32 v15, v15, v24, vcc
	v_cmp_u_f32 vcc, v25, v25
	v_cndmask_b32 v23, v27, v25, vcc
	v_cmp_u_f32 vcc, v26, v26
	v_cndmask_b32 v24, v28, v26, vcc
	v_mov_b32 v25, 0x40a00000
	v_mac_f32 v11, v25, v17
	v_mac_f32 v10, v25, v16
	v_mad_f32 v29, v10, v24, v22
	v_mad_f32 v28, v11, v23, v21
	v_mac_f32 v12, v25, v18
	v_mad_f32 v27, v12, v15, v20
	v_mac_f32 v13, v25, v19
	v_mad_f32 v26, v13, v14, v1
	v_max_f32 v10, 0, v26
	v_max_f32 v11, 0, v27
	v_max_f32 v12, 0, v28
	v_max_f32 v13, 0, v29
	v_lshlrev_b32 v1, 4, v0
	v_add_i32 v1, vcc, s15, v1
	s_mov_b32 m0, -1
	v_add_i32 v14, vcc, 12, v1
	ds_write_b32 v14, v13
	s_waitcnt lgkmcnt(0)
	v_add_i32 v13, vcc, 8, v1
	ds_write_b32 v13, v12
	s_waitcnt lgkmcnt(0)
	v_add_i32 v12, vcc, 4, v1
	ds_write_b32 v12, v11
	ds_write_b32 v1, v10
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_cmp_lt_i32 s[0:1], 0, s21
	s_and_saveexec_b64 s[0:1], s[0:1]
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz BB0_4
// BB#1:                                 // %for.body.lr.ph
	v_mov_b32 v10, 0x3ca3d70a
	v_mul_f32 v14, v10, v9
	v_mul_f32 v13, v10, v8
	v_mul_f32 v12, v10, v7
	v_mul_f32 v11, v10, v6
	v_cmp_gt_f32 vcc, 0, v11
	v_cndmask_b32 v6, 0.5, -0.5, vcc
	v_mov_b32 v7, 0x3fb8aa3b
	v_mac_f32 v6, v7, v11
	v_cvt_i32_f32 v6, v6
	v_mov_b32 v8, 0xbf317180
	v_mov_b32 v9, 0xb717f7d1
	v_cvt_f32_i32 v10, v6
	v_mov_b32 v15, 0xb5ddea0e
	v_mov_b32 v16, 0x3331bb4c
	v_mov_b32 v17, 0x388ab355
	v_mad_f32 v18, v8, v10, v11
	v_mad_f32 v19, v9, v10, v18
	v_mul_f32 v20, v19, v19
	v_mad_f32 v21, v16, v20, v15
	v_mad_f32 v21, v21, v20, v17
	v_mov_b32 v22, 0xbb360b61
	v_mad_f32 v21, v21, v20, v22
	v_mov_b32 v23, 0x3e2aaaab
	v_mad_f32 v21, v21, v20, v23
	v_mad_f32 v20, v20, v21, v19
	v_sub_f32 v21, 2.0, v20
	v_mov_b32 v24, 0x6f800000
	v_cmp_gt_f32 s[2:3], v21, v24
	v_mov_b32 v25, 0x2f800000
	v_cndmask_b32 v26, 1.0, v25, s[2:3]
	v_mul_f32 v21, v26, v21
	v_rcp_f32 v21, v21
	v_cmp_gt_f32 vcc, 0, v12
	v_cndmask_b32 v27, 0.5, -0.5, vcc
	v_mac_f32 v27, v7, v12
	v_cvt_i32_f32 v27, v27
	v_mul_f32 v19, v20, v19
	v_mul_f32 v19, v21, v19
	v_cvt_f32_i32 v20, v27
	v_mul_f32 v19, v19, v26
	v_mad_f32 v10, v10, v9, v19
	v_subrev_f32 v10, v18, v10
	v_mad_f32 v18, v8, v20, v12
	v_mad_f32 v19, v9, v20, v18
	v_mul_f32 v21, v19, v19
	v_mad_f32 v26, v16, v21, v15
	v_mad_f32 v26, v26, v21, v17
	v_mad_f32 v26, v26, v21, v22
	v_mad_f32 v26, v26, v21, v23
	v_mad_f32 v21, v21, v26, v19
	v_sub_f32 v10, 1.0, v10
	v_lshlrev_b32 v6, 23, v6
	v_sub_f32 v26, 2.0, v21
	v_cmp_gt_f32 s[2:3], v26, v24
	v_cndmask_b32 v28, 1.0, v25, s[2:3]
	v_mul_f32 v26, v28, v26
	v_rcp_f32 v26, v26
	v_cmp_gt_f32 vcc, 0, v13
	v_cndmask_b32 v29, 0.5, -0.5, vcc
	v_mac_f32 v29, v7, v13
	v_cvt_i32_f32 v29, v29
	v_add_i32 v6, vcc, v10, v6
	v_mul_f32 v10, v21, v19
	v_mul_f32 v10, v26, v10
	v_cvt_f32_i32 v19, v29
	v_mul_f32 v10, v10, v28
	v_mad_f32 v10, v20, v9, v10
	v_subrev_f32 v10, v18, v10
	v_mad_f32 v18, v8, v19, v13
	v_mad_f32 v20, v9, v19, v18
	v_mul_f32 v21, v20, v20
	v_mad_f32 v26, v16, v21, v15
	v_mad_f32 v26, v26, v21, v17
	v_mad_f32 v26, v26, v21, v22
	v_mad_f32 v26, v26, v21, v23
	v_mad_f32 v21, v21, v26, v20
	v_sub_f32 v10, 1.0, v10
	v_lshlrev_b32 v26, 23, v27
	v_sub_f32 v27, 2.0, v21
	v_cmp_gt_f32 s[2:3], v27, v24
	v_cndmask_b32 v28, 1.0, v25, s[2:3]
	v_mul_f32 v27, v28, v27
	v_rcp_f32 v27, v27
	v_cmp_gt_f32 vcc, 0, v14
	v_cndmask_b32 v30, 0.5, -0.5, vcc
	v_mac_f32 v30, v7, v14
	v_cvt_i32_f32 v30, v30
	v_add_i32 v10, vcc, v10, v26
	v_mul_f32 v20, v21, v20
	v_mul_f32 v20, v27, v20
	v_cvt_f32_i32 v21, v30
	v_mul_f32 v20, v20, v28
	v_mad_f32 v19, v19, v9, v20
	v_subrev_f32 v18, v18, v19
	v_mad_f32 v19, v8, v21, v14
	v_mad_f32 v20, v9, v21, v19
	v_mul_f32 v26, v20, v20
	v_mad_f32 v27, v16, v26, v15
	v_mad_f32 v27, v27, v26, v17
	v_mad_f32 v27, v27, v26, v22
	v_mad_f32 v27, v27, v26, v23
	v_mad_f32 v26, v26, v27, v20
	v_sub_f32 v18, 1.0, v18
	v_sub_f32 v27, 2.0, v26
	v_cmp_gt_f32 s[2:3], v27, v24
	v_cndmask_b32 v28, 1.0, v25, s[2:3]
	v_mul_f32 v27, v28, v27
	v_rcp_f32 v27, v27
	v_lshlrev_b32 v29, 23, v29
	v_add_i32 v18, vcc, v18, v29
	v_mul_f32 v20, v26, v20
	v_mul_f32 v20, v27, v20
	v_cmp_gt_f32 vcc, 0, v2
	v_cndmask_b32 v26, 0.5, -0.5, vcc
	v_mac_f32 v26, v7, v2
	v_cvt_i32_f32 v26, v26
	v_mul_f32 v20, v20, v28
	v_mad_f32 v20, v21, v9, v20
	v_subrev_f32 v19, v19, v20
	v_cvt_f32_i32 v20, v26
	v_sub_f32 v19, 1.0, v19
	v_lshlrev_b32 v21, 23, v30
	v_add_i32 v19, vcc, v19, v21
	v_mad_f32 v21, v8, v20, v2
	v_mad_f32 v27, v9, v20, v21
	v_mul_f32 v28, v27, v27
	v_mad_f32 v29, v16, v28, v15
	v_mad_f32 v29, v29, v28, v17
	v_mad_f32 v29, v29, v28, v22
	v_mad_f32 v29, v29, v28, v23
	v_mad_f32 v28, v28, v29, v27
	v_mov_b32 v29, 0xc2aeac4f
	v_cmp_lt_f32 vcc, v11, v29
	v_cndmask_b32 v6, v6, 0, vcc
	v_mov_b32 v30, 0x42b17218
	v_cmp_lt_f32 vcc, v11, v30
	v_mov_b32 v31, 0x7f800000
	v_cndmask_b32 v6, v31, v6, vcc
	v_cmp_u_f32 vcc, v11, v11
	v_cndmask_b32 v6, v6, v11, vcc
	v_cmp_lt_f32 vcc, v12, v29
	v_cndmask_b32 v10, v10, 0, vcc
	v_cmp_lt_f32 vcc, v12, v30
	v_cndmask_b32 v10, v31, v10, vcc
	v_cmp_u_f32 vcc, v12, v12
	v_cndmask_b32 v10, v10, v12, vcc
	v_cmp_lt_f32 vcc, v13, v29
	v_cndmask_b32 v11, v18, 0, vcc
	v_cmp_lt_f32 vcc, v13, v30
	v_cndmask_b32 v11, v31, v11, vcc
	v_cmp_u_f32 vcc, v13, v13
	v_cndmask_b32 v11, v11, v13, vcc
	v_cmp_lt_f32 vcc, v14, v29
	v_cndmask_b32 v12, v19, 0, vcc
	v_cmp_lt_f32 vcc, v14, v30
	v_cndmask_b32 v12, v31, v12, vcc
	v_sub_f32 v13, 2.0, v28
	v_cmp_gt_f32 s[2:3], v13, v24
	v_cndmask_b32 v18, 1.0, v25, s[2:3]
	v_mul_f32 v13, v18, v13
	v_cmp_gt_f32 vcc, 0, v3
	v_cndmask_b32 v19, 0.5, -0.5, vcc
	v_mac_f32 v19, v7, v3
	v_cvt_i32_f32 v19, v19
	v_rcp_f32 v13, v13
	v_cmp_u_f32 vcc, v14, v14
	v_cndmask_b32 v12, v12, v14, vcc
	v_cvt_f32_i32 v14, v19
	v_mul_f32 v27, v28, v27
	v_mul_f32 v13, v13, v27
	v_mul_f32 v13, v13, v18
	v_mad_f32 v18, v8, v14, v3
	v_mad_f32 v27, v9, v14, v18
	v_mul_f32 v28, v27, v27
	v_mad_f32 v32, v16, v28, v15
	v_mad_f32 v32, v32, v28, v17
	v_mad_f32 v32, v32, v28, v22
	v_mad_f32 v32, v32, v28, v23
	v_mad_f32 v28, v28, v32, v27
	v_cmp_gt_f32 vcc, 0, v4
	v_cndmask_b32 v32, 0.5, -0.5, vcc
	v_mac_f32 v32, v7, v4
	v_cvt_i32_f32 v32, v32
	v_sub_f32 v33, 2.0, v28
	v_cmp_gt_f32 s[2:3], v33, v24
	v_cndmask_b32 v34, 1.0, v25, s[2:3]
	v_mul_f32 v33, v34, v33
	v_rcp_f32 v33, v33
	v_mad_f32 v13, v20, v9, v13
	v_cvt_f32_i32 v20, v32
	v_mul_f32 v27, v28, v27
	v_mul_f32 v27, v33, v27
	v_mul_f32 v27, v27, v34
	v_mad_f32 v28, v8, v20, v4
	v_mad_f32 v33, v9, v20, v28
	v_mul_f32 v34, v33, v33
	v_mad_f32 v35, v16, v34, v15
	v_mad_f32 v35, v35, v34, v17
	v_mad_f32 v35, v35, v34, v22
	v_mad_f32 v35, v35, v34, v23
	v_mad_f32 v34, v34, v35, v33
	v_cmp_gt_f32 vcc, 0, v5
	v_cndmask_b32 v35, 0.5, -0.5, vcc
	v_mac_f32 v35, v7, v5
	v_cvt_i32_f32 v7, v35
	v_sub_f32 v35, 2.0, v34
	v_cmp_gt_f32 s[2:3], v35, v24
	v_cndmask_b32 v36, 1.0, v25, s[2:3]
	v_mul_f32 v35, v36, v35
	v_rcp_f32 v35, v35
	v_cvt_f32_i32 v37, v7
	v_mad_f32 v14, v14, v9, v27
	v_mul_f32 v27, v34, v33
	v_mul_f32 v27, v35, v27
	v_mad_f32 v8, v8, v37, v5
	v_mad_f32 v33, v9, v37, v8
	v_mul_f32 v34, v33, v33
	v_mac_f32 v15, v16, v34
	v_mac_f32 v17, v15, v34
	v_mac_f32 v22, v17, v34
	v_mac_f32 v23, v22, v34
	v_mad_f32 v15, v34, v23, v33
	v_sub_f32 v16, 2.0, v15
	v_cmp_gt_f32 s[2:3], v16, v24
	v_cndmask_b32 v17, 1.0, v25, s[2:3]
	v_mul_f32 v16, v17, v16
	v_rcp_f32 v16, v16
	v_mul_f32 v22, v27, v36
	v_mad_f32 v20, v20, v9, v22
	v_mul_f32 v15, v15, v33
	v_mul_f32 v15, v16, v15
	v_mul_f32 v15, v15, v17
	v_mad_f32 v9, v37, v9, v15
	v_subrev_f32 v13, v21, v13
	v_sub_f32 v13, 1.0, v13
	v_lshlrev_b32 v15, 23, v26
	v_add_i32 v13, vcc, v13, v15
	v_subrev_f32 v14, v18, v14
	v_cmp_lt_f32 vcc, v2, v29
	v_cndmask_b32 v13, v13, 0, vcc
	v_cmp_lt_f32 vcc, v2, v30
	v_cndmask_b32 v13, v31, v13, vcc
	v_sub_f32 v14, 1.0, v14
	v_lshlrev_b32 v15, 23, v19
	v_add_i32 v14, vcc, v14, v15
	v_cmp_lt_f32 vcc, v3, v29
	v_cndmask_b32 v14, v14, 0, vcc
	v_cmp_lt_f32 vcc, v3, v30
	v_cndmask_b32 v14, v31, v14, vcc
	v_subrev_f32 v15, v28, v20
	v_sub_f32 v15, 1.0, v15
	v_lshlrev_b32 v16, 23, v32
	v_add_i32 v15, vcc, v15, v16
	v_cmp_lt_f32 vcc, v4, v29
	v_cndmask_b32 v15, v15, 0, vcc
	v_cmp_lt_f32 vcc, v4, v30
	v_cndmask_b32 v15, v31, v15, vcc
	v_subrev_f32 v8, v8, v9
	v_sub_f32 v8, 1.0, v8
	v_lshlrev_b32 v7, 23, v7
	v_add_i32 v7, vcc, v8, v7
	v_cmp_lt_f32 vcc, v5, v29
	v_cndmask_b32 v7, v7, 0, vcc
	v_rcp_f32 v8, v11
	v_cmp_lt_f32 vcc, v5, v30
	v_cndmask_b32 v7, v31, v7, vcc
	v_rcp_f32 v9, v12
	v_cmp_u_f32 vcc, v2, v2
	v_cndmask_b32 v2, v13, v2, vcc
	v_cmp_u_f32 vcc, v3, v3
	v_cndmask_b32 v3, v14, v3, vcc
	v_cmp_u_f32 vcc, v4, v4
	v_cndmask_b32 v4, v15, v4, vcc
	v_cmp_u_f32 vcc, v5, v5
	v_cndmask_b32 v5, v7, v5, vcc
	v_rcp_f32 v7, v5
	v_rcp_f32 v13, v4
	v_rcp_f32 v14, v2
	v_rcp_f32 v15, v3
	v_subrev_f32 v12, v7, v12
	v_subrev_f32 v11, v13, v11
	v_subrev_f32 v5, v7, v5
	v_subrev_f32 v4, v13, v4
	v_subrev_f32 v2, v14, v2
	v_cmp_gt_f32 s[2:3], v2, v24
	v_cndmask_b32 v7, 1.0, v25, s[2:3]
	v_mul_f32 v2, v7, v2
	v_cmp_gt_f32 s[2:3], v4, v24
	v_cndmask_b32 v13, 1.0, v25, s[2:3]
	v_mul_f32 v4, v13, v4
	v_rcp_f32 v4, v4
	v_cmp_gt_f32 s[2:3], v5, v24
	v_cndmask_b32 v16, 1.0, v25, s[2:3]
	v_mul_f32 v5, v16, v5
	v_rcp_f32 v5, v5
	v_rcp_f32 v2, v2
	v_mul_f32 v4, v4, v11
	v_mul_f32 v11, v4, v13
	v_mul_f32 v5, v5, v12
	v_mul_f32 v12, v5, v16
	v_mad_f32 v13, v13, v4, 1.0
	v_mad_f32 v16, v16, v5, 1.0
	v_mul_f32 v5, v12, v9
	v_mul_f32 v4, v11, v8
	v_mul_f32 v9, v16, v9
	v_mul_f32 v8, v13, v8
	v_subrev_f32 v11, v14, v6
	v_mul_f32 v2, v2, v11
	v_subrev_f32 v3, v15, v3
	v_cmp_gt_f32 s[2:3], v3, v24
	v_cndmask_b32 v11, 1.0, v25, s[2:3]
	v_mul_f32 v3, v11, v3
	v_rcp_f32 v3, v3
	v_rcp_f32 v6, v6
	v_subrev_f32 v12, v15, v10
	v_rcp_f32 v10, v10
	v_mul_f32 v3, v3, v12
	v_mul_f32 v12, v2, v7
	v_mad_f32 v13, v7, v2, 1.0
	v_mul_f32 v2, v3, v11
	v_mad_f32 v7, v11, v3, 1.0
	v_mul_f32 v3, v2, v10
	v_mul_f32 v2, v12, v6
	v_mul_f32 v7, v7, v10
	v_mul_f32 v6, v13, v6
	v_lshlrev_b32 v11, 4, v0
	v_add_i32 v12, vcc, 16, v11
	v_add_i32 v10, vcc, s15, v12
	v_add_i32 v11, vcc, s22, v11
	v_add_i32 v12, vcc, s22, v12
	s_mov_b64 s[2:3], 0
	v_mov_b32 v13, s21
BB0_5:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_cmp_lt_u32 vcc, v0, v13
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execz BB0_7
// BB#6:                                 // %if.then
                                        //   in Loop: Header=BB0_5 Depth=1
	s_mov_b32 m0, -1
	ds_read_b32 v14, v1
	v_add_i32 v15, vcc, 12, v1
	ds_read_b32 v17, v15
	ds_read_b32 v18, v10
	v_add_i32 v15, vcc, 12, v10
	ds_read_b32 v21, v15
	v_add_i32 v15, vcc, 8, v10
	ds_read_b32 v20, v15
	v_add_i32 v15, vcc, 4, v10
	ds_read_b32 v19, v15
	v_add_i32 v15, vcc, 8, v1
	ds_read_b32 v16, v15
	v_add_i32 v15, vcc, 4, v1
	ds_read_b32 v15, v15
	s_waitcnt lgkmcnt(0)
	v_mul_f32 v22, v18, v6
	v_mul_f32 v23, v19, v7
	v_mul_f32 v24, v20, v8
	v_mul_f32 v25, v21, v9
	v_mac_f32 v25, v17, v5
	v_mac_f32 v24, v16, v4
	v_mac_f32 v23, v15, v3
	v_mac_f32 v22, v14, v2
	v_add_i32 v14, vcc, 12, v11
	ds_write_b32 v14, v25
	v_add_i32 v14, vcc, 8, v11
	ds_write_b32 v14, v24
	v_add_i32 v14, vcc, 4, v11
	ds_write_b32 v14, v23
	ds_write_b32 v11, v22
	s_waitcnt lgkmcnt(0)
BB0_7:                                  // %if.end
                                        //   in Loop: Header=BB0_5 Depth=1
	s_or_b64 exec, exec, s[4:5]
	s_barrier
	v_add_i32 v13, vcc, -1, v13
	v_cmp_lt_u32 vcc, v0, v13
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execz BB0_9
// BB#8:                                 // %if.then.64
                                        //   in Loop: Header=BB0_5 Depth=1
	s_mov_b32 m0, -1
	ds_read_b32 v14, v11
	v_add_i32 v15, vcc, 12, v11
	ds_read_b32 v17, v15
	ds_read_b32 v18, v12
	v_add_i32 v15, vcc, 12, v12
	ds_read_b32 v21, v15
	v_add_i32 v15, vcc, 8, v12
	ds_read_b32 v20, v15
	v_add_i32 v15, vcc, 4, v12
	ds_read_b32 v19, v15
	v_add_i32 v15, vcc, 8, v11
	ds_read_b32 v16, v15
	v_add_i32 v15, vcc, 4, v11
	ds_read_b32 v15, v15
	s_waitcnt lgkmcnt(0)
	v_mul_f32 v22, v18, v6
	v_mul_f32 v23, v19, v7
	v_mul_f32 v24, v20, v8
	v_mul_f32 v25, v21, v9
	v_mac_f32 v25, v17, v5
	v_mac_f32 v24, v16, v4
	v_mac_f32 v23, v15, v3
	v_mac_f32 v22, v14, v2
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
	s_or_b64 exec, exec, s[4:5]
	s_barrier
	v_add_i32 v14, vcc, 1, v13
	v_add_i32 v13, vcc, -1, v13
	v_cmp_gt_i32 vcc, 3, v14
	s_or_b64 s[2:3], vcc, s[2:3]
	s_andn2_b64 exec, exec, s[2:3]
	s_cbranch_execnz BB0_5
// BB#2:                                 // %Flow
	s_or_b64 exec, exec, s[2:3]
BB0_4:                                  // %Flow1
	s_or_b64 exec, exec, s[0:1]
// BB#3:                                 // %for.cond.cleanup
	v_cmp_eq_i32 vcc, 0, v0
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz BB0_11
// BB#10:                                // %if.then.75
	s_mov_b32 m0, -1
	v_mov_b32 v0, s15
	s_add_i32 s2, s15, 12
	ds_read_b32 v0, v0
	v_mov_b32 v1, s2
	s_add_i32 s2, s15, 8
	ds_read_b32 v3, v1
	v_mov_b32 v1, s2
	s_add_i32 s2, s15, 4
	ds_read_b32 v2, v1
	v_mov_b32 v1, s2
	ds_read_b32 v1, v1
	s_add_i32 s2, s14, s20
	v_mov_b32 v4, s2
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_xyzw v[0:3], v4, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
BB0_11:                                 // %if.end.78
	s_or_b64 exec, exec, s[0:1]
	s_endpgm

// ********************* Second kernel starts
// SKBB#0:                                 // %entry

.args
	i32 numSteps 0 
	float[4]* randArray 16 uav10 
	float[4]* output 32 uav11 
	float[4]* callA 48 hl
	float[4]* callB 64 hl


// Merge warning: sections do not match
.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 3292
	// NumVgprs = 51
	// NumSgprs = 25
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

