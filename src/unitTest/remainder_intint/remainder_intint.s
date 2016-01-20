.global	remainder_intint
.text

remainder_intint:                       // @remainder_intint
// BB#0:                                 // %entry
	s_buffer_load_dword s0, s[8:11], 0x0
	s_buffer_load_dword s1, s[8:11], 0x4
	s_buffer_load_dword s8, s[8:11], 0x8
	s_load_dwordx4 s[16:19], s[2:3], 0x60
	s_load_dwordx4 s[20:23], s[2:3], 0x58
	s_load_dwordx4 s[24:27], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x4
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s2, 0xffff
	s_mul_i32 s2, s2, s12
	v_add_i32 v0, vcc, s2, v0
	v_lshlrev_b32 v0, 2, v0
	v_add_i32 v1, vcc, s1, v0
	tbuffer_load_format_x v1, v1, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v2, vcc, s0, v0
	tbuffer_load_format_x v2, v2, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	v_ashrrev_i32 v3, 31, v1
	v_add_i32 v1, vcc, v1, v3
	v_xor_b32 v1, v1, v3
	v_cvt_f32_u32 v3, v1
	v_rcp_f32 v3, v3
	v_mul_f32 v3, 0x4f800000, v3
	v_cvt_u32_f32 v3, v3
	v_mul_hi_u32 v4, v3, v1
	v_mul_lo_i32 v5, v3, v1
	v_cmp_eq_i32 s[0:1], 0, v4
	v_sub_i32 v4, vcc, 0, v5
	v_cndmask_b32 v4, v5, v4, s[0:1]
	v_mul_hi_u32 v4, v4, v3
	s_waitcnt vmcnt(0)
	v_ashrrev_i32 v5, 31, v2
	v_add_i32 v2, vcc, v2, v5
	v_xor_b32 v2, v2, v5
	v_add_i32 v6, vcc, v4, v3
	v_subrev_i32 v3, vcc, v4, v3
	v_cndmask_b32 v3, v3, v6, s[0:1]
	v_mul_hi_u32 v3, v3, v2
	v_mul_lo_i32 v3, v3, v1
	v_cmp_ge_u32 s[0:1], v2, v3
	v_subrev_i32 v2, vcc, v3, v2
	v_cndmask_b32 v3, 0, -1, s[0:1]
	v_cmp_ge_u32 s[0:1], v2, v1
	v_subrev_i32 v4, vcc, v1, v2
	v_cndmask_b32 v6, 0, -1, s[0:1]
	v_and_b32 v6, v3, v6
	v_cmp_eq_i32 vcc, 0, v6
	v_cndmask_b32 v4, v4, v2, vcc
	v_add_i32 v1, vcc, v1, v2
	v_cmp_eq_i32 vcc, 0, v3
	v_cndmask_b32 v1, v4, v1, vcc
	v_xor_b32 v1, v1, v5
	v_sub_i32 v1, vcc, v1, v5
	v_add_i32 v0, vcc, s8, v0
	tbuffer_store_format_x v1, v0, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

.args
	i32* src_0 0 uav10 
	i32* src_1 16 uav11 
	i32* dst 32 uav12 

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 240
	// NumVgprs = 7
	// NumSgprs = 30
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

