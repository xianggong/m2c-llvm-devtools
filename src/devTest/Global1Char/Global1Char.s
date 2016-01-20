.global	Global1
.text


Global1:                                // @Global1
// BB#0:                                 // %entry
	s_buffer_load_dword s0, s[8:11], 0x0
	s_load_dwordx4 s[8:11], s[2:3], 0x50
	s_buffer_load_dword s1, s[4:7], 0x4
	s_waitcnt lgkmcnt(0)
	s_min_u32 s1, s1, 0xffff
	s_mul_i32 s1, s1, s12
	v_add_i32 v0, vcc, s1, v0
	v_add_i32 v1, vcc, s0, v0
	buffer_store_byte v0, v1, s[8:11], 0 offen glc
	s_endpgm

.args
	i8* result 0 uav10 

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

