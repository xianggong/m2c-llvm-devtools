.global	fastWalshTransform
.text


fastWalshTransform:                     // @fastWalshTransform
// BB#0:                                 // %entry
	s_buffer_load_dword s13, s[8:11], 0x0
	s_buffer_load_dword s8, s[8:11], 0x4
	s_buffer_load_dword s0, s[4:7], 0x4
	s_load_dwordx4 s[4:7], s[2:3], 0x50
	s_waitcnt lgkmcnt(0)
	s_min_u32 s0, s0, 0xffff
	s_mul_i32 s0, s0, s12
	v_add_i32 v0, vcc, s0, v0
	v_cvt_f32_u32 v1, s8
	v_rcp_f32 v1, v1
	v_mul_f32 v1, 0x4f800000, v1
	v_cvt_u32_f32 v1, v1
	v_mul_hi_u32 v2, v1, s8
	v_cmp_eq_i32 s[0:1], 0, v2
	v_mul_lo_i32 v2, v1, s8
	v_sub_i32 v3, vcc, 0, v2
	v_cndmask_b32 v2, v2, v3, s[0:1]
	v_mul_hi_u32 v2, v2, v1
	v_add_i32 v3, vcc, v2, v1
	v_subrev_i32 v1, vcc, v2, v1
	v_cndmask_b32 v1, v1, v3, s[0:1]
	v_mul_hi_u32 v1, v1, v0
	v_mul_lo_i32 v2, v1, s8
	v_cmp_ge_u32 vcc, v0, v2
	v_cndmask_b32 v3, 0, -1, vcc
	v_cmp_eq_i32 s[0:1], 0, v3
	v_subrev_i32 v0, vcc, v2, v0
	v_cmp_le_u32 vcc, s8, v0
	v_cndmask_b32 v2, 0, -1, vcc
	v_and_b32 v2, v3, v2
	v_cmp_eq_i32 s[2:3], 0, v2
	v_subrev_i32 v2, vcc, s8, v0
	v_cndmask_b32 v2, v2, v0, s[2:3]
	v_add_i32 v0, vcc, s8, v0
	v_cndmask_b32 v0, v2, v0, s[0:1]
	v_add_i32 v2, vcc, 1, v1
	v_cndmask_b32 v2, v2, v1, s[2:3]
	v_add_i32 v1, vcc, -1, v1
	v_cndmask_b32 v1, v2, v1, s[0:1]
	v_mul_lo_i32 v1, s8, v1
	v_lshlrev_b32 v1, 1, v1
	v_add_i32 v0, vcc, v0, v1
	v_lshlrev_b32 v1, 2, v0
	v_add_i32 v1, vcc, s13, v1
	tbuffer_load_format_x v2, v1, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v0, vcc, s8, v0
	v_lshlrev_b32 v0, 2, v0
	v_add_i32 v0, vcc, s13, v0
	tbuffer_load_format_x v3, v0, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0)
	v_add_f32 v4, v3, v2
	tbuffer_store_format_x v4, v1, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_subrev_f32 v1, v3, v2
	tbuffer_store_format_x v1, v0, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

.args
	float* tArray 0 uav10 
	i32 step 16 

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 256
	// NumVgprs = 5
	// NumSgprs = 16
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

