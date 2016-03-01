.global	simpleConvolution
.text

simpleConvolution:                      // @simpleConvolution
// BB#0:                                 // %entry
	s_buffer_load_dword s13, s[8:11], 0x0
	s_buffer_load_dword s14, s[8:11], 0x4
	s_buffer_load_dword s15, s[8:11], 0x8
	s_buffer_load_dwordx2 s[16:17], s[8:11], 0xc
	s_buffer_load_dwordx2 s[18:19], s[8:11], 0x10
	s_load_dwordx4 s[20:23], s[2:3], 0x60
	s_load_dwordx4 s[24:27], s[2:3], 0x58
	s_load_dwordx4 s[8:11], s[2:3], 0x50
	s_buffer_load_dword s0, s[4:7], 0x4
	s_waitcnt lgkmcnt(0)
	s_min_u32 s0, s0, 0xffff
	s_mul_i32 s2, s0, s12
	s_add_i32 s0, s18, -1
	s_lshr_b32 s4, s0, 1
	s_add_i32 s5, s16, -1
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
	v_add_i32 v0, vcc, s2, v0
	v_mul_hi_u32 v1, v1, v0
	v_mul_lo_i32 v1, v1, s16
	v_cmp_ge_u32 s[0:1], v0, v1
	v_subrev_i32 v1, vcc, v1, v0
	v_cmp_le_u32 vcc, s16, v1
	v_cndmask_b32 v2, 0, -1, s[0:1]
	v_cmp_eq_i32 s[0:1], 0, v2
	v_cndmask_b32 v3, 0, -1, vcc
	v_and_b32 v2, v2, v3
	v_cmp_eq_i32 s[2:3], 0, v2
	v_subrev_i32 v2, vcc, s16, v1
	v_cndmask_b32 v2, v2, v1, s[2:3]
	v_add_i32 v1, vcc, s16, v1
	v_cndmask_b32 v7, v2, v1, s[0:1]
	v_cmp_gt_u32 s[0:1], s4, v7
	v_add_i32 v2, vcc, s4, v7
	v_subrev_i32 v1, vcc, s4, v7
	v_cmp_gt_u32 vcc, s16, v2
	v_cndmask_b32 v1, v1, 0, s[0:1]
	v_mov_b32 v3, s5
	v_cndmask_b32 v2, v3, v2, vcc
	v_cmp_le_u32 vcc, v1, v2
	v_mov_b32 v3, 0
	s_and_saveexec_b64 s[6:7], vcc
	s_xor_b64 s[6:7], exec, s[6:7]
	s_cbranch_execz BB0_2
// BB#1:                                 // %for.cond.27.preheader.lr.ph
	s_add_i32 s0, s19, -1
	s_lshr_b32 s5, s0, 1
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
	v_cmp_gt_u32 s[0:1], s5, v3
	v_add_i32 v5, vcc, s5, v3
	v_cmp_gt_u32 s[2:3], s17, v5
	s_add_i32 s12, s17, -1
	v_mov_b32 v6, s12
	v_subrev_i32 v4, vcc, s5, v3
	v_cndmask_b32 v4, v4, 0, s[0:1]
	v_cndmask_b32 v5, v6, v5, s[2:3]
	v_sub_i32 v6, vcc, s5, v3
	v_sub_i32 v7, vcc, s4, v7
	s_mov_b64 s[0:1], 0
	v_mov_b32 v3, 0
BB0_3:                                  // %for.cond.27.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_10 Depth 2
	v_cmp_le_u32 vcc, v4, v5
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz BB0_9
// BB#4:                                 // %for.body.30.lr.ph
                                        //   in Loop: Header=BB0_3 Depth=1
	s_mov_b64 s[28:29], 0
	v_add_i32 v8, vcc, v1, v7
	v_mov_b32 v9, v4
BB0_10:                                 // %for.body.30
                                        //   Parent Loop BB0_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	v_mul_lo_i32 v10, v9, s16
	v_add_i32 v10, vcc, v10, v1
	v_lshlrev_b32 v10, 2, v10
	v_add_i32 v10, vcc, s14, v10
	tbuffer_load_format_x v10, v10, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v11, vcc, v6, v9
	v_mul_lo_i32 v11, v11, s18
	v_add_i32 v11, vcc, v11, v8
	v_lshlrev_b32 v11, 2, v11
	v_add_i32 v11, vcc, s15, v11
	tbuffer_load_format_x v11, v11, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v9, vcc, 1, v9
	v_cmp_gt_u32 vcc, v9, v5
	s_waitcnt vmcnt(1)
	v_cvt_f32_u32 v10, v10
	s_waitcnt vmcnt(0)
	v_mac_f32 v3, v11, v10
	s_or_b64 s[28:29], vcc, s[28:29]
	s_andn2_b64 exec, exec, s[28:29]
	s_cbranch_execnz BB0_10
// BB#7:                                 // %Flow
                                        //   in Loop: Header=BB0_3 Depth=1
	s_or_b64 exec, exec, s[28:29]
BB0_9:                                  // %Flow1
                                        //   in Loop: Header=BB0_3 Depth=1
	s_or_b64 exec, exec, s[2:3]
// BB#8:                                 // %for.cond.cleanup.29
                                        //   in Loop: Header=BB0_3 Depth=1
	v_add_i32 v1, vcc, 1, v1
	v_cmp_gt_u32 vcc, v1, v2
	s_or_b64 s[0:1], vcc, s[0:1]
	s_andn2_b64 exec, exec, s[0:1]
	s_cbranch_execnz BB0_3
// BB#5:                                 // %Flow2
	s_or_b64 exec, exec, s[0:1]
BB0_2:                                  // %Flow3
	s_or_b64 exec, exec, s[6:7]
// BB#6:                                 // %for.cond.cleanup
	v_add_f32 v1, 0.5, v3
	v_cvt_u32_f32 v1, v1
	v_lshlrev_b32 v0, 2, v0
	v_add_i32 v0, vcc, s13, v0
	tbuffer_store_format_x v1, v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

.args
	i32* output 0 uav10 
	i32* input 16 uav11 
	float* mask 32 uav12 
	i32[2] inputDimensions 48 
	i32[2] maskDimensions 64 

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 644
	// NumVgprs = 12
	// NumSgprs = 32
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

