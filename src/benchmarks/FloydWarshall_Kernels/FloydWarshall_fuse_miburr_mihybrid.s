.global	floydWarshallPass
.text


floydWarshallPass:                      // @floydWarshallPass
// BB#0:                                 // %entry
	s_buffer_load_dword s14, s[4:7], 0x4
	s_buffer_load_dword s15, s[4:7], 0x5
	s_buffer_load_dword s16, s[8:11], 0x0
	s_buffer_load_dword s0, s[8:11], 0x4
	s_buffer_load_dword s17, s[8:11], 0x8
	s_buffer_load_dword s1, s[8:11], 0xc
	s_load_dwordx4 s[4:7], s[2:3], 0x58
	s_load_dwordx4 s[8:11], s[2:3], 0x50
	s_mov_b32 s2, 0xffff
	s_waitcnt lgkmcnt(0)
	s_min_u32 s3, s15, s2
	s_mul_i32 s3, s3, s13
	v_add_i32 v1, vcc, s3, v1
	v_mul_lo_i32 v1, v1, s17
	v_add_i32 v2, vcc, s1, v1
	v_lshlrev_b32 v2, 2, v2
	v_add_i32 v2, vcc, s16, v2
	tbuffer_load_format_x v2, v2, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_min_u32 s2, s14, s2
	s_mul_i32 s2, s2, s12
	v_add_i32 v0, vcc, s2, v0
	s_mul_i32 s2, s1, s17
	v_add_i32 v3, vcc, s2, v0
	v_lshlrev_b32 v3, 2, v3
	v_add_i32 v3, vcc, s16, v3
	tbuffer_load_format_x v3, v3, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v0, vcc, v1, v0
	v_lshlrev_b32 v1, 2, v0
	v_add_i32 v1, vcc, s16, v1
	tbuffer_load_format_x v4, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	v_add_i32 v2, vcc, v2, v3
	s_waitcnt vmcnt(0)
	v_cmp_lt_i32 vcc, v2, v4
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
// BB#1:                                 // %if.then
	tbuffer_store_format_x v2, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v0, 2, v0
	v_add_i32 v0, vcc, s0, v0
	v_mov_b32 v1, s1
	tbuffer_store_format_x v1, v0, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
BB0_2:                                  // %if.end
	s_or_b64 exec, exec, s[2:3]
	s_endpgm

// SKBB#0:                                 // %entry
	s_buffer_load_dword s14, s[4:7], 0x4
	s_buffer_load_dword s15, s[4:7], 0x5
	s_buffer_load_dword s16, s[8:11], 0x0
	s_buffer_load_dword s0, s[8:11], 0x4
	s_buffer_load_dword s17, s[8:11], 0x8
	s_buffer_load_dword s1, s[8:11], 0xc
	s_load_dwordx4 s[4:7], s[2:3], 0x58
	s_load_dwordx4 s[8:11], s[2:3], 0x50
	s_mov_b32 s2, 0xffff
	s_waitcnt lgkmcnt(0)
	s_min_u32 s3, s15, s2
	s_mul_i32 s3, s3, s13
	v_add_i32 v1, vcc, s3, v1
	v_mul_lo_i32 v1, v1, s17
	v_add_i32 v2, vcc, s1, v1
	v_lshlrev_b32 v2, 2, v2
	v_add_i32 v2, vcc, s16, v2
	tbuffer_load_format_x v2, v2, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_min_u32 s2, s14, s2
	s_mul_i32 s2, s2, s12
	v_add_i32 v0, vcc, s2, v0
	s_mul_i32 s2, s1, s17
	v_add_i32 v3, vcc, s2, v0
	v_lshlrev_b32 v3, 2, v3
	v_add_i32 v3, vcc, s16, v3
	tbuffer_load_format_x v3, v3, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v0, vcc, v1, v0
	v_lshlrev_b32 v1, 2, v0
	v_add_i32 v1, vcc, s16, v1
	tbuffer_load_format_x v4, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	v_add_i32 v2, vcc, v2, v3
	s_waitcnt vmcnt(0)
	v_cmp_lt_i32 vcc, v2, v4
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
// SKBB#1:                                 // %if.then
	tbuffer_store_format_x v2, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v0, 2, v0
	v_add_i32 v0, vcc, s0, v0
	v_mov_b32 v1, s1
	tbuffer_store_format_x v1, v0, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
SKBB0_2:                                  // %if.end
	s_or_b64 exec, exec, s[2:3]
	s_endpgm

.args
	i32* pathDistanceBuffer 0 uav10 
	i32* pathBuffer 16 uav11 
	i32 numNodes 32 
	i32 pass 48 

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 120
	// NumVgprs = 5
	// NumSgprs = 20
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1
// Merged FloydWarshall_Kernels_miburr.s FloydWarshall_Kernels_mihybrid.s

