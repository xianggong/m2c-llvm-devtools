.global	group_prefixSum

.text

group_prefixSum:                        // @group_prefixSum
// BB#0:                                 // %entry
	s_buffer_load_dword s0, s[8:11], 0x0
	s_buffer_load_dword s14, s[8:11], 0x4
	s_buffer_load_dword s1, s[8:11], 0x8
	s_buffer_load_dword s13, s[8:11], 0xc
	s_buffer_load_dword s15, s[8:11], 0x10
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[8:11], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x4
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s2, 0xffff
	s_mul_i32 s2, s12, s2
	v_add_i32 v1, vcc, s2, v0
	v_lshlrev_b32 v1, 1, v1
	v_or_b32 v1, 1, v1
	v_mul_lo_i32 v1, v1, s15
	v_add_i32 v1, vcc, -1, v1
	v_cmp_gt_u32 vcc, s13, v1
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
// BB#1:                                 // %if.then
	v_lshlrev_b32 v2, 2, v1
	v_add_i32 v2, vcc, s14, v2
	tbuffer_load_format_x v2, v2, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v3, 3, v0
	v_add_i32 v3, vcc, s1, v3
	s_mov_b32 m0, -1
	s_waitcnt vmcnt(0)
	ds_write_b32 v3, v2
	s_waitcnt lgkmcnt(0)
BB0_2:                                  // %if.end
	s_or_b64 exec, exec, s[2:3]
	v_add_i32 v2, vcc, s15, v1
	v_cmp_gt_u32 vcc, s13, v2
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
// BB#3:                                 // %if.then.10
	v_lshlrev_b32 v3, 2, v2
	v_add_i32 v3, vcc, s14, v3
	tbuffer_load_format_x v3, v3, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v4, 3, v0
	v_or_b32 v4, 4, v4
	v_add_i32 v4, vcc, s1, v4
	s_mov_b32 m0, -1
	s_waitcnt vmcnt(0)
	ds_write_b32 v4, v3
	s_waitcnt lgkmcnt(0)
BB0_4:                                  // %if.end.16
	s_or_b64 exec, exec, s[2:3]
	s_lshr_b32 s2, s13, 1
	v_cmp_ne_i32 s[4:5], 0, s2
	v_mov_b32 v3, 1
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execz BB0_9
// BB#5:                                 // %for.body.lr.ph
	v_lshlrev_b32 v3, 1, v0
	v_or_b32 v4, 1, v3
	v_add_i32 v5, vcc, 2, v3
	s_mov_b64 s[6:7], 0
	v_mov_b32 v3, 1
	v_mov_b32 v6, s2
	s_mov_b32 m0, -1
BB0_10:                                 // %for.body
                                        // =>This Inner Loop Header: Depth=1
	s_barrier
	v_cmp_lt_i32 vcc, v0, v6
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[14:15], exec, s[14:15]
	s_cbranch_execz BB0_12
// BB#11:                                // %if.then.19
                                        //   in Loop: Header=BB0_10 Depth=1
	v_mul_lo_i32 v7, v3, v4
	v_mul_lo_i32 v8, v3, v5
	v_lshlrev_b32 v7, 2, v7
	v_lshlrev_b32 v8, 2, v8
	v_add_i32 v8, vcc, s1, v8
	v_add_i32 v7, vcc, s1, v7
	v_add_i32 v7, vcc, -4, v7
	ds_read_b32 v7, v7
	v_add_i32 v8, vcc, -4, v8
	ds_read_b32 v9, v8
	s_waitcnt lgkmcnt(0)
	v_add_f32 v7, v9, v7
	ds_write_b32 v8, v7
	s_waitcnt lgkmcnt(0)
BB0_12:                                 // %if.end.31
                                        //   in Loop: Header=BB0_10 Depth=1
	s_or_b64 exec, exec, s[14:15]
	v_lshlrev_b32 v3, 1, v3
	v_ashrrev_i32 v6, 1, v6
	v_cmp_gt_i32 vcc, 1, v6
	s_or_b64 s[6:7], vcc, s[6:7]
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB0_10
// BB#6:                                 // %Flow2
	s_or_b64 exec, exec, s[6:7]
BB0_9:                                  // %Flow3
	s_or_b64 exec, exec, s[4:5]
// BB#7:                                 // %for.cond.cleanup
	v_cmp_gt_u32 vcc, s13, v3
	v_cndmask_b32 v4, 0, 1, vcc
	v_lshl_b32 v5, v3, v4
	v_ashrrev_i32 v3, 1, v5
	v_cmp_lt_i32 vcc, 0, v3
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz BB0_15
// BB#8:                                 // %for.body.41.lr.ph
	v_add_i32 v4, vcc, 1, v0
	s_mov_b64 s[4:5], 0
	v_mov_b32 v7, 0
	s_mov_b32 m0, -1
BB0_16:                                 // %for.body.41
                                        // =>This Inner Loop Header: Depth=1
	s_barrier
	v_or_b32 v7, 1, v7
	v_ashrrev_i32 v6, 1, v5
	v_cmp_lt_i32 vcc, v0, v7
	s_and_saveexec_b64 s[6:7], vcc
	s_xor_b64 s[6:7], exec, s[6:7]
	s_cbranch_execz BB0_18
// BB#17:                                // %if.then.45
                                        //   in Loop: Header=BB0_16 Depth=1
	v_mul_lo_i32 v8, v6, v4
	v_lshrrev_b32 v5, 2, v5
	v_add_i32 v8, vcc, -1, v8
	v_add_i32 v5, vcc, v5, v8
	v_lshlrev_b32 v8, 2, v8
	v_add_i32 v8, vcc, s1, v8
	ds_read_b32 v8, v8
	v_lshlrev_b32 v5, 2, v5
	v_add_i32 v5, vcc, s1, v5
	ds_read_b32 v9, v5
	s_waitcnt lgkmcnt(0)
	v_add_f32 v8, v9, v8
	ds_write_b32 v5, v8
	s_waitcnt lgkmcnt(0)
BB0_18:                                 // %for.inc.57
                                        //   in Loop: Header=BB0_16 Depth=1
	s_or_b64 exec, exec, s[6:7]
	v_lshlrev_b32 v7, 1, v7
	v_cmp_ge_i32 vcc, v7, v3
	s_or_b64 s[4:5], vcc, s[4:5]
	v_mov_b32 v5, v6
	s_andn2_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB0_16
// BB#13:                                // %Flow
	s_or_b64 exec, exec, s[4:5]
BB0_15:                                 // %Flow1
	s_or_b64 exec, exec, s[2:3]
// BB#14:                                // %for.cond.cleanup.40
	s_barrier
	v_cmp_gt_u32 vcc, s13, v1
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
// BB#19:                                // %if.then.61
	v_lshlrev_b32 v3, 3, v0
	v_add_i32 v3, vcc, s1, v3
	s_mov_b32 m0, -1
	ds_read_b32 v3, v3
	v_lshlrev_b32 v1, 2, v1
	v_add_i32 v1, vcc, s0, v1
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v3, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
BB0_20:                                 // %if.end.65
	s_or_b64 exec, exec, s[2:3]
	v_cmp_gt_u32 vcc, s13, v2
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
// BB#21:                                // %if.then.68
	v_lshlrev_b32 v0, 3, v0
	v_or_b32 v0, 4, v0
	v_add_i32 v0, vcc, s1, v0
	s_mov_b32 m0, -1
	ds_read_b32 v0, v0
	v_lshlrev_b32 v1, 2, v2
	v_add_i32 v1, vcc, s0, v1
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v0, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
BB0_22:                                 // %if.end.74
	s_or_b64 exec, exec, s[2:3]
	s_endpgm

// ********************* Second kernel starts
// SKBB#0:                                 // %entry

.args
	float* output 0 uav10 
	float* input 16 uav11 
	float* block 32 hl
	i32 length 48 
	i32 idxOffset 64 


.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 496
	// NumVgprs = 10
	// NumSgprs = 22
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

.global	global_prefixSum

.text

global_prefixSum:                       // @global_prefixSum
// BB#0:                                 // %entry
	s_buffer_load_dword s13, s[8:11], 0x0
	s_buffer_load_dword s14, s[8:11], 0x4
	s_buffer_load_dword s15, s[8:11], 0x8
	s_load_dwordx4 s[8:11], s[2:3], 0x50
	s_buffer_load_dword s0, s[4:7], 0x4
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s0, 0xffff
	v_cvt_f32_u32 v1, s2
	v_rcp_f32 v1, v1
	v_mul_f32 v1, 0x4f800000, v1
	v_cvt_u32_f32 v1, v1
	v_mul_hi_u32 v2, v1, s2
	v_mul_lo_i32 v3, v1, s2
	v_cmp_eq_i32 s[0:1], 0, v2
	v_sub_i32 v2, vcc, 0, v3
	v_cndmask_b32 v2, v3, v2, s[0:1]
	v_mul_hi_u32 v2, v2, v1
	v_add_i32 v3, vcc, v2, v1
	v_subrev_i32 v1, vcc, v2, v1
	v_cndmask_b32 v1, v1, v3, s[0:1]
	v_mul_hi_u32 v1, v1, s14
	v_mul_lo_i32 v2, v1, s2
	s_lshl_b32 s3, s14, 1
	v_add_i32 v3, vcc, 1, v1
	v_add_i32 v4, vcc, -1, v1
	v_cmp_ge_u32 s[0:1], s14, v2
	v_sub_i32 v2, vcc, s14, v2
	v_cndmask_b32 v5, 0, -1, s[0:1]
	v_cmp_le_u32 vcc, s2, v2
	v_cndmask_b32 v2, 0, -1, vcc
	v_and_b32 v2, v5, v2
	v_cmp_eq_i32 vcc, 0, v2
	v_cndmask_b32 v1, v3, v1, vcc
	v_cmp_eq_i32 vcc, 0, v5
	v_cndmask_b32 v1, v1, v4, vcc
	v_sub_i32 v2, vcc, s3, v1
	v_cvt_f32_u32 v3, v2
	v_rcp_f32 v3, v3
	v_mul_f32 v3, 0x4f800000, v3
	v_cvt_u32_f32 v3, v3
	v_mul_hi_u32 v4, v3, v2
	v_mul_lo_i32 v5, v3, v2
	v_cmp_eq_i32 s[0:1], 0, v4
	v_sub_i32 v4, vcc, 0, v5
	v_cndmask_b32 v4, v5, v4, s[0:1]
	v_mul_hi_u32 v4, v4, v3
	v_add_i32 v5, vcc, v4, v3
	v_subrev_i32 v3, vcc, v4, v3
	v_cvt_f32_u32 v4, s14
	v_cndmask_b32 v3, v3, v5, s[0:1]
	v_mul_hi_u32 v3, v3, s12
	v_rcp_f32 v4, v4
	v_mul_lo_i32 v5, v3, v2
	v_mul_f32 v4, 0x4f800000, v4
	v_cvt_u32_f32 v4, v4
	v_cmp_ge_u32 s[0:1], s12, v5
	v_sub_i32 v5, vcc, s12, v5
	v_cmp_ge_u32 vcc, v5, v2
	v_cndmask_b32 v2, 0, -1, s[0:1]
	v_cndmask_b32 v5, 0, -1, vcc
	v_cmp_eq_i32 s[0:1], 0, v2
	v_and_b32 v2, v2, v5
	v_add_i32 v5, vcc, 1, v3
	v_cmp_eq_i32 vcc, 0, v2
	v_cndmask_b32 v2, v5, v3, vcc
	v_mul_hi_u32 v5, v4, s14
	v_add_i32 v3, vcc, -1, v3
	v_cndmask_b32 v2, v2, v3, s[0:1]
	v_mul_lo_i32 v3, v4, s14
	v_cmp_eq_i32 s[0:1], 0, v5
	v_add_i32 v2, vcc, 1, v2
	v_mul_lo_i32 v1, v2, v1
	v_sub_i32 v2, vcc, 0, v3
	v_cndmask_b32 v2, v3, v2, s[0:1]
	v_mul_hi_u32 v2, v2, v4
	v_add_i32 v1, vcc, s12, v1
	v_mul_lo_i32 v1, v1, s2
	v_add_i32 v3, vcc, v2, v4
	v_subrev_i32 v2, vcc, v2, v4
	v_cndmask_b32 v2, v2, v3, s[0:1]
	v_add_i32 v0, vcc, v0, v1
	v_add_i32 v1, vcc, 1, v0
	v_mul_hi_u32 v2, v2, v1
	v_mul_lo_i32 v2, v2, s14
	v_cmp_ge_u32 s[0:1], v1, v2
	v_subrev_i32 v1, vcc, v2, v1
	v_cndmask_b32 v2, 0, -1, s[0:1]
	v_cmp_le_u32 s[0:1], s14, v1
	v_subrev_i32 v3, vcc, s14, v1
	v_cndmask_b32 v4, 0, -1, s[0:1]
	v_and_b32 v4, v2, v4
	v_cmp_eq_i32 vcc, 0, v4
	v_cndmask_b32 v3, v3, v1, vcc
	v_add_i32 v1, vcc, s14, v1
	v_cmp_eq_i32 vcc, 0, v2
	v_cndmask_b32 v1, v3, v1, vcc
	v_cmp_ne_i32 vcc, 0, v1
	v_cmp_gt_u32 s[0:1], s15, v0
	s_and_b64 s[0:1], vcc, s[0:1]
	s_and_saveexec_b64 s[4:5], s[0:1]
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execz BB1_2
// BB#1:                                 // %if.then
	v_cvt_f32_u32 v1, s14
	v_rcp_f32 v1, v1
	v_mul_f32 v1, 0x4f800000, v1
	v_cvt_u32_f32 v1, v1
	v_mul_hi_u32 v2, v1, s14
	v_mul_lo_i32 v3, v1, s14
	v_cmp_eq_i32 s[0:1], 0, v2
	v_sub_i32 v2, vcc, 0, v3
	v_cndmask_b32 v2, v3, v2, s[0:1]
	v_mul_hi_u32 v2, v2, v1
	v_add_i32 v3, vcc, v2, v1
	v_subrev_i32 v1, vcc, v2, v1
	v_cndmask_b32 v1, v1, v3, s[0:1]
	v_mul_hi_u32 v1, v1, v0
	v_mul_lo_i32 v1, v1, s14
	v_cmp_ge_u32 s[0:1], v0, v1
	v_subrev_i32 v1, vcc, v1, v0
	v_cndmask_b32 v2, 0, -1, s[0:1]
	v_cmp_le_u32 vcc, s14, v1
	v_cndmask_b32 v3, 0, -1, vcc
	v_cmp_eq_i32 s[0:1], 0, v2
	v_and_b32 v2, v2, v3
	v_add_i32 v3, vcc, -1, v0
	v_lshlrev_b32 v0, 2, v0
	v_add_i32 v0, vcc, s13, v0
	v_cmp_eq_i32 s[2:3], 0, v2
	v_subrev_i32 v2, vcc, s14, v1
	v_cndmask_b32 v2, v2, v1, s[2:3]
	v_add_i32 v1, vcc, s14, v1
	v_cndmask_b32 v1, v2, v1, s[0:1]
	v_subrev_i32 v1, vcc, v1, v3
	v_lshlrev_b32 v1, 2, v1
	v_add_i32 v1, vcc, s13, v1
	tbuffer_load_format_x v1, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_x v2, v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0)
	v_add_f32 v1, v2, v1
	tbuffer_store_format_x v1, v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
BB1_2:                                  // %if.end
	s_or_b64 exec, exec, s[4:5]
	s_endpgm

// ********************* Second kernel starts
// SKBB#0:                                 // %entry

.args
	float* buffer 0 uav10 
	i32 offst 16 
	i32 length 32 


// Merge warning: sections do not match
.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 772
	// NumVgprs = 6
	// NumSgprs = 18
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

