.global	bitonicSort
.text


bitonicSort:                            // @bitonicSort
// BB#0:                                 // %entry
	s_buffer_load_dword s0, s[8:11], 0x0
	s_buffer_load_dword s1, s[8:11], 0x4
	s_buffer_load_dword s13, s[8:11], 0x8
	s_buffer_load_dword s8, s[8:11], 0xc
	s_buffer_load_dword s4, s[4:7], 0x4
	s_load_dwordx4 s[16:19], s[2:3], 0x50
	s_waitcnt lgkmcnt(0)
	s_sub_i32 s2, s1, s13
	s_min_u32 s3, s4, 0xffff
	s_and_b32 s2, s2, 31
	s_mul_i32 s3, s3, s12
	v_add_i32 v0, vcc, s3, v0
	s_lshl_b32 s3, 1, s2
	v_lshrrev_b32 v1, s2, v0
	v_mul_lo_i32 v1, s3, v1
	s_bfm_b32 s2, s2, 0
	v_and_b32 v2, s2, v0
	v_lshlrev_b32 v1, 1, v1
	v_add_i32 v1, vcc, v2, v1
	v_lshlrev_b32 v2, 2, v1
	v_add_i32 v1, vcc, s3, v1
	v_add_i32 v2, vcc, s0, v2
	v_lshlrev_b32 v1, 2, v1
	tbuffer_load_format_x v3, v2, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v1, vcc, s0, v1
	tbuffer_load_format_x v4, v1, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_and_b32 s0, s1, 31
	s_sub_i32 s1, 1, s8
	v_mov_b32 v5, s8
	s_lshl_b32 s0, 1, s0
	v_and_b32 v0, s0, v0
	v_cmp_eq_i32 vcc, 0, v0
	v_mov_b32 v0, s1
	v_cndmask_b32 v0, v0, v5, vcc
	v_cmp_eq_i32 vcc, 0, v0
	s_waitcnt vmcnt(0)
	v_cmp_gt_u32 s[0:1], v3, v4
	v_cndmask_b32 v0, v4, v3, s[0:1]
	v_cndmask_b32 v3, v3, v4, s[0:1]
	v_cndmask_b32 v4, v3, v0, vcc
	v_cndmask_b32 v0, v0, v3, vcc
	tbuffer_store_format_x v4, v2, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_store_format_x v0, v1, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

.args
	i32* theArray 0 uav10 
	i32 stage 16 
	i32 passOfStage 32 
	i32 direction 48 

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 164
	// NumVgprs = 6
	// NumSgprs = 22
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

