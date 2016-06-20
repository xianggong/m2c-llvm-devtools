.global	simpleConvolution
.text


simpleConvolution:                      // @simpleConvolution
// BB#0:                                 // %entry
	s_buffer_load_dword s13, s[8:11], 0x0
	s_buffer_load_dword s14, s[8:11], 0x4
	s_buffer_load_dword s15, s[8:11], 0x8
	s_buffer_load_dwordx2 s[16:17], s[8:11], 0xc
	s_waitcnt lgkmcnt(0)
	v_cvt_f32_u32 v1, s16
	v_rcp_f32 v1, v1
	v_mul_f32 v1, 0x4f800000, v1
	v_cvt_u32_f32 v1, v1
	s_buffer_load_dwordx2 s[8:9], s[8:11], 0x10
	s_buffer_load_dword s4, s[4:7], 0x4
	v_mul_lo_i32 v2, v1, s16
	v_mul_hi_u32 v3, v1, s16
	v_sub_i32 v4, vcc, 0, v2
	v_cmp_eq_i32 s[0:1], 0, v3
	v_cndmask_b32 v2, v2, v4, s[0:1]
	v_mul_hi_u32 v2, v2, v1
	s_waitcnt lgkmcnt(0)
	s_min_u32 s4, s4, 0xffff
	s_mul_i32 s4, s4, s12
	v_add_i32 v0, vcc, s4, v0
	v_subrev_i32 v3, vcc, v2, v1
	v_add_i32 v1, vcc, v2, v1
	v_cndmask_b32 v1, v3, v1, s[0:1]
	v_mul_hi_u32 v1, v1, v0
	v_mul_lo_i32 v1, v1, s16
	v_subrev_i32 v2, vcc, v1, v0
	v_cmp_ge_u32 s[0:1], v0, v1
	v_subrev_i32 v1, vcc, s16, v2
	v_cmp_le_u32 vcc, s16, v2
	v_cndmask_b32 v3, 0, -1, s[0:1]
	v_cndmask_b32 v4, 0, -1, vcc
	v_and_b32 v4, v3, v4
	v_cmp_eq_i32 vcc, 0, v4
	v_cndmask_b32 v1, v1, v2, vcc
	s_load_dwordx4 s[20:23], s[2:3], 0x60
	v_add_i32 v2, vcc, s16, v2
	v_cmp_eq_i32 vcc, 0, v3
	v_cndmask_b32 v4, v1, v2, vcc
	s_add_i32 s0, s8, -1
	s_add_i32 s1, s16, -1
	s_load_dwordx4 s[24:27], s[2:3], 0x58
	s_load_dwordx4 s[4:7], s[2:3], 0x50
	s_lshr_b32 s2, s0, 1
	v_mov_b32 v1, s1
	v_add_i32 v2, vcc, s2, v4
	v_cmp_gt_u32 vcc, s16, v2
	v_cndmask_b32 v1, v1, v2, vcc
	v_subrev_i32 v2, vcc, s2, v4
	v_cmp_gt_u32 vcc, s2, v4
	v_cndmask_b32 v2, v2, 0, vcc
	v_mov_b32 v3, 0
	v_cmp_le_u32 vcc, v2, v1
	s_waitcnt lgkmcnt(0)
	s_and_saveexec_b64 s[10:11], vcc
	s_xor_b64 s[10:11], exec, s[10:11]
	s_cbranch_execz BB0_2
// BB#1:                                 // %for.cond.27.preheader.lr.ph
	v_cvt_f32_u32 v3, s16
	v_rcp_f32 v3, v3
	v_mul_f32 v3, 0x4f800000, v3
	v_cvt_u32_f32 v3, v3
	v_mul_lo_i32 v5, v3, s16
	v_mul_hi_u32 v6, v3, s16
	v_sub_i32 v7, vcc, 0, v5
	v_cmp_eq_i32 s[0:1], 0, v6
	v_cndmask_b32 v5, v5, v7, s[0:1]
	v_mul_hi_u32 v5, v5, v3
	v_subrev_i32 v6, vcc, v5, v3
	v_add_i32 v3, vcc, v5, v3
	v_cndmask_b32 v3, v6, v3, s[0:1]
	v_mul_hi_u32 v3, v3, v0
	s_add_i32 s0, s9, -1
	s_add_i32 s1, s17, -1
	v_mul_lo_i32 v5, v3, s16
	v_sub_i32 v4, vcc, s2, v4
	s_mov_b64 s[18:19], 0
	s_lshr_b32 s3, s0, 1
	v_mov_b32 v6, s1
	v_subrev_i32 v7, vcc, v5, v0
	v_cmp_ge_u32 vcc, v0, v5
	v_cmp_le_u32 s[0:1], s16, v7
	v_cndmask_b32 v5, 0, -1, vcc
	v_cndmask_b32 v7, 0, -1, s[0:1]
	v_and_b32 v7, v5, v7
	v_cmp_eq_i32 s[0:1], 0, v7
	v_add_i32 v7, vcc, 1, v3
	v_cndmask_b32 v7, v7, v3, s[0:1]
	v_add_i32 v3, vcc, -1, v3
	v_cmp_eq_i32 vcc, 0, v5
	v_cndmask_b32 v3, v7, v3, vcc
	v_subrev_i32 v7, vcc, s3, v3
	v_add_i32 v5, vcc, s3, v3
	v_cmp_gt_u32 vcc, s17, v5
	v_cndmask_b32 v5, v6, v5, vcc
	v_sub_i32 v6, vcc, s3, v3
	v_cmp_gt_u32 vcc, s3, v3
	v_cndmask_b32 v7, v7, 0, vcc
	v_mov_b32 v3, 0
BB0_3:                                  // %for.cond.27.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_10 Depth 2
	v_cmp_le_u32 vcc, v7, v5
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz BB0_9
// BB#4:                                 // %for.body.30.lr.ph
                                        //   in Loop: Header=BB0_3 Depth=1
	v_add_i32 v8, vcc, v2, v4
	s_mov_b64 s[28:29], 0
	v_mov_b32 v9, v7
BB0_10:                                 // %for.body.30
                                        //   Parent Loop BB0_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	v_mul_lo_i32 v10, v9, s16
	v_add_i32 v11, vcc, v6, v9
	v_mul_lo_i32 v11, v11, s8
	v_add_i32 v10, vcc, v10, v2
	v_lshlrev_b32 v10, 2, v10
	v_add_i32 v10, vcc, s14, v10
	tbuffer_load_format_x v10, v10, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v11, vcc, v11, v8
	v_lshlrev_b32 v11, 2, v11
	v_add_i32 v11, vcc, s15, v11
	tbuffer_load_format_x v11, v11, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	v_cvt_f32_u32 v10, v10
	v_add_i32 v9, vcc, 1, v9
	s_waitcnt vmcnt(0)
	v_mac_f32 v3, v11, v10
	v_cmp_gt_u32 vcc, v9, v5
	s_or_b64 s[28:29], vcc, s[28:29]
	s_andn2_b64 exec, exec, s[28:29]
	s_cbranch_execnz BB0_10
// BB#7:                                 // %Flow
                                        //   in Loop: Header=BB0_3 Depth=1
	s_or_b64 exec, exec, s[28:29]
BB0_9:                                  // %Flow1
                                        //   in Loop: Header=BB0_3 Depth=1
	s_or_b64 exec, exec, s[0:1]
// BB#8:                                 // %for.cond.cleanup.29
                                        //   in Loop: Header=BB0_3 Depth=1
	v_add_i32 v2, vcc, 1, v2
	v_cmp_gt_u32 vcc, v2, v1
	s_or_b64 s[18:19], vcc, s[18:19]
	s_andn2_b64 exec, exec, s[18:19]
	s_cbranch_execnz BB0_3
// BB#5:                                 // %Flow2
	s_or_b64 exec, exec, s[18:19]
BB0_2:                                  // %Flow3
	s_or_b64 exec, exec, s[10:11]
// BB#6:                                 // %for.cond.cleanup
	v_add_f32 v1, 0.5, v3
	v_cvt_u32_f32 v1, v1
	v_lshlrev_b32 v0, 2, v0
	v_add_i32 v0, vcc, s13, v0
	tbuffer_store_format_x v1, v0, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

// SKBB#0:                                 // %entry
	s_buffer_load_dword s13, s[8:11], 0x0
	s_buffer_load_dword s14, s[8:11], 0x4
	s_buffer_load_dword s15, s[8:11], 0x8
	s_buffer_load_dwordx2 s[16:17], s[8:11], 0xc
	s_buffer_load_dwordx2 s[8:9], s[8:11], 0x10
	s_buffer_load_dword s0, s[4:7], 0x4
	s_waitcnt lgkmcnt(0)
	s_min_u32 s0, s0, 0xffff
	s_mul_i32 s4, s0, s12
	s_add_i32 s0, s8, -1
	s_lshr_b32 s6, s0, 1
	s_add_i32 s7, s16, -1
	v_cvt_f32_u32 v1, s16
	v_rcp_f32 v1, v1
	v_mul_f32 v1, 0x4f800000, v1
	v_cvt_u32_f32 v1, v1
	v_mul_lo_i32 v2, v1, s16
	v_mul_hi_u32 v3, v1, s16
	v_cmp_eq_i32 s[0:1], 0, v3
	v_sub_i32 v3, vcc, 0, v2
	v_cndmask_b32 v2, v2, v3, s[0:1]
	v_mul_hi_u32 v2, v2, v1
	v_subrev_i32 v3, vcc, v2, v1
	v_add_i32 v1, vcc, v2, v1
	v_cndmask_b32 v1, v3, v1, s[0:1]
	v_add_i32 v0, vcc, s4, v0
	v_mul_hi_u32 v1, v1, v0
	v_mul_lo_i32 v1, v1, s16
	v_cmp_ge_u32 s[0:1], v0, v1
	v_subrev_i32 v1, vcc, v1, v0
	v_cmp_le_u32 vcc, s16, v1
	v_cndmask_b32 v2, 0, -1, s[0:1]
	v_cmp_eq_i32 s[0:1], 0, v2
	v_cndmask_b32 v3, 0, -1, vcc
	v_and_b32 v2, v2, v3
	v_cmp_eq_i32 s[4:5], 0, v2
	v_subrev_i32 v2, vcc, s16, v1
	v_cndmask_b32 v2, v2, v1, s[4:5]
	v_add_i32 v1, vcc, s16, v1
	v_cndmask_b32 v7, v2, v1, s[0:1]
	v_cmp_gt_u32 s[0:1], s6, v7
	v_add_i32 v2, vcc, s6, v7
	v_subrev_i32 v1, vcc, s6, v7
	s_load_dwordx4 s[24:27], s[2:3], 0x60
	s_load_dwordx4 s[28:31], s[2:3], 0x58
	s_load_dwordx4 s[20:23], s[2:3], 0x50
	v_cmp_gt_u32 vcc, s16, v2
	v_cndmask_b32 v1, v1, 0, s[0:1]
	v_mov_b32 v3, s7
	v_cndmask_b32 v2, v3, v2, vcc
	v_cmp_le_u32 vcc, v1, v2
	v_mov_b32 v3, 0
	s_waitcnt lgkmcnt(0)
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execz SKBB0_2
// SKBB#1:                                 // %for.cond.27.preheader.lr.ph
	s_add_i32 s0, s9, -1
	s_lshr_b32 s7, s0, 1
	v_cvt_f32_u32 v3, s16
	v_rcp_f32 v3, v3
	v_mul_f32 v3, 0x4f800000, v3
	v_cvt_u32_f32 v3, v3
	v_mul_lo_i32 v4, v3, s16
	v_mul_hi_u32 v5, v3, s16
	v_cmp_eq_i32 s[0:1], 0, v5
	v_sub_i32 v5, vcc, 0, v4
	v_cndmask_b32 v4, v4, v5, s[0:1]
	v_mul_hi_u32 v4, v4, v3
	v_subrev_i32 v5, vcc, v4, v3
	v_add_i32 v3, vcc, v4, v3
	v_cndmask_b32 v3, v5, v3, s[0:1]
	v_mul_hi_u32 v3, v3, v0
	v_mul_lo_i32 v4, v3, s16
	v_cmp_ge_u32 s[0:1], v0, v4
	v_subrev_i32 v4, vcc, v4, v0
	v_cmp_le_u32 vcc, s16, v4
	v_cndmask_b32 v4, 0, -1, s[0:1]
	v_cmp_eq_i32 s[0:1], 0, v4
	v_cndmask_b32 v5, 0, -1, vcc
	v_and_b32 v4, v4, v5
	v_cmp_eq_i32 s[2:3], 0, v4
	v_add_i32 v4, vcc, 1, v3
	v_cndmask_b32 v4, v4, v3, s[2:3]
	v_add_i32 v3, vcc, -1, v3
	v_cndmask_b32 v3, v4, v3, s[0:1]
	v_cmp_gt_u32 s[0:1], s7, v3
	v_add_i32 v5, vcc, s7, v3
	v_cmp_gt_u32 s[2:3], s17, v5
	s_add_i32 s10, s17, -1
	v_mov_b32 v6, s10
	v_subrev_i32 v4, vcc, s7, v3
	v_cndmask_b32 v4, v4, 0, s[0:1]
	v_cndmask_b32 v5, v6, v5, s[2:3]
	v_sub_i32 v6, vcc, s7, v3
	v_sub_i32 v7, vcc, s6, v7
	s_mov_b64 s[0:1], 0
	v_mov_b32 v3, 0
SKBB0_3:                                  // %for.cond.27.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop SKBB0_10 Depth 2
	v_cmp_le_u32 vcc, v4, v5
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz SKBB0_9
// SKBB#4:                                 // %for.body.30.lr.ph
                                        //   in Loop: Header=SKBB0_3 Depth=1
	s_mov_b64 s[10:11], 0
	v_add_i32 v8, vcc, v1, v7
	v_mov_b32 v9, v4
SKBB0_10:                                 // %for.body.30
                                        //   Parent Loop SKBB0_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	v_mul_lo_i32 v10, v9, s16
	v_add_i32 v10, vcc, v10, v1
	v_lshlrev_b32 v10, 2, v10
	v_add_i32 v10, vcc, s14, v10
	tbuffer_load_format_x v10, v10, s[28:31], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v11, vcc, v9, v6
	v_mul_lo_i32 v11, v11, s8
	v_add_i32 v11, vcc, v11, v8
	v_lshlrev_b32 v11, 2, v11
	v_add_i32 v11, vcc, s15, v11
	tbuffer_load_format_x v11, v11, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v9, vcc, 1, v9
	v_cmp_gt_u32 vcc, v9, v5
	s_waitcnt vmcnt(1)
	v_cvt_f32_u32 v10, v10
	s_waitcnt vmcnt(0)
	v_mac_f32 v3, v11, v10
	s_or_b64 s[10:11], vcc, s[10:11]
	s_andn2_b64 exec, exec, s[10:11]
	s_cbranch_execnz SKBB0_10
// SKBB#7:                                 // %Flow
                                        //   in Loop: Header=SKBB0_3 Depth=1
	s_or_b64 exec, exec, s[10:11]
SKBB0_9:                                  // %Flow1
                                        //   in Loop: Header=SKBB0_3 Depth=1
	s_or_b64 exec, exec, s[2:3]
// SKBB#8:                                 // %for.cond.cleanup.29
                                        //   in Loop: Header=SKBB0_3 Depth=1
	v_add_i32 v1, vcc, 1, v1
	v_cmp_gt_u32 vcc, v1, v2
	s_or_b64 s[0:1], vcc, s[0:1]
	s_andn2_b64 exec, exec, s[0:1]
	s_cbranch_execnz SKBB0_3
// SKBB#5:                                 // %Flow2
	s_or_b64 exec, exec, s[0:1]
SKBB0_2:                                  // %Flow3
	s_or_b64 exec, exec, s[4:5]
// SKBB#6:                                 // %for.cond.cleanup
	v_add_f32 v1, 0.5, v3
	v_cvt_u32_f32 v1, v1
	v_lshlrev_b32 v0, 2, v0
	v_add_i32 v0, vcc, s13, v0
	tbuffer_store_format_x v1, v0, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

.args
	i32* output 0 uav10 
	i32* input 16 uav11 
	float* mask 32 uav12 
	i32[2] inputDimensions 48 
	i32[2] maskDimensions 64 

// Merge warning: sections do not match
.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 628
	// NumVgprs = 12
	// NumSgprs = 32
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1
// Merged SimpleConvolution_Kernels_fast.s SimpleConvolution_Kernels_mihybrid.s

