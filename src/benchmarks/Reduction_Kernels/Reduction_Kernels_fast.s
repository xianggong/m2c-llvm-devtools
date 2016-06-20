.global	reduce
.text


reduce:                                 // @reduce
// BB#0:                                 // %entry
	s_buffer_load_dword s13, s[4:7], 0x4
	s_buffer_load_dword s14, s[8:11], 0x0
	s_buffer_load_dword s0, s[8:11], 0x4
	s_buffer_load_dword s1, s[8:11], 0x8
	s_load_dwordx4 s[4:7], s[2:3], 0x58
	s_load_dwordx4 s[8:11], s[2:3], 0x50
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s13, 0xffff
	s_mul_i32 s3, s2, s12
	v_add_i32 v1, vcc, s3, v0
	v_lshlrev_b32 v1, 5, v1
	v_or_b32 v2, 16, v1
	v_add_i32 v1, vcc, s14, v1
	v_add_i32 v2, vcc, s14, v2
	tbuffer_load_format_xyzw v[3:6], v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_xyzw v[7:10], v2, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0)
	v_add_i32 v2, vcc, v3, v7
	v_add_i32 v3, vcc, v4, v8
	v_add_i32 v4, vcc, v5, v9
	v_add_i32 v5, vcc, v6, v10
	v_lshlrev_b32 v1, 4, v0
	s_mov_b32 m0, -1
	v_add_i32 v1, vcc, s1, v1
	ds_write_b32 v1, v2
	s_waitcnt lgkmcnt(0)
	v_add_i32 v2, vcc, 4, v1
	ds_write_b32 v2, v3
	v_add_i32 v2, vcc, 8, v1
	ds_write_b32 v2, v4
	v_add_i32 v2, vcc, 12, v1
	ds_write_b32 v2, v5
	s_waitcnt lgkmcnt(0)
	s_barrier
	s_lshr_b32 s2, s2, 1
	v_cmp_ne_i32 s[10:11], 0, s2
	s_mov_b64 s[8:9], 0
	v_mov_b32 v2, s2
	s_and_saveexec_b64 s[2:3], s[10:11]
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz BB0_2
BB0_3:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_cmp_lt_u32 vcc, v0, v2
	s_and_saveexec_b64 s[10:11], vcc
	s_xor_b64 s[10:11], exec, s[10:11]
	s_cbranch_execz BB0_5
// BB#4:                                 // %if.then
                                        //   in Loop: Header=BB0_3 Depth=1
	s_mov_b32 m0, -1
	ds_read_b32 v3, v1
	v_add_i32 v7, vcc, 4, v1
	ds_read_b32 v4, v7
	v_add_i32 v8, vcc, 8, v1
	ds_read_b32 v5, v8
	v_add_i32 v9, vcc, 12, v1
	ds_read_b32 v6, v9
	v_add_i32 v10, vcc, v2, v0
	v_lshlrev_b32 v10, 4, v10
	v_add_i32 v10, vcc, s1, v10
	ds_read_b32 v11, v10
	v_add_i32 v12, vcc, 4, v10
	ds_read_b32 v12, v12
	v_add_i32 v13, vcc, 8, v10
	ds_read_b32 v13, v13
	v_add_i32 v10, vcc, 12, v10
	ds_read_b32 v14, v10
	s_waitcnt lgkmcnt(0)
	v_add_i32 v3, vcc, v11, v3
	v_add_i32 v4, vcc, v12, v4
	v_add_i32 v5, vcc, v13, v5
	v_add_i32 v6, vcc, v14, v6
	ds_write_b32 v1, v3
	ds_write_b32 v7, v4
	ds_write_b32 v8, v5
	ds_write_b32 v9, v6
	s_waitcnt lgkmcnt(0)
BB0_5:                                  // %if.end
                                        //   in Loop: Header=BB0_3 Depth=1
	s_or_b64 exec, exec, s[10:11]
	v_lshrrev_b32 v2, 1, v2
	v_cmp_eq_i32 vcc, 0, v2
	s_barrier
	s_or_b64 s[8:9], vcc, s[8:9]
	s_andn2_b64 exec, exec, s[8:9]
	s_cbranch_execnz BB0_3
// BB#1:                                 // %Flow
	s_or_b64 exec, exec, s[8:9]
BB0_2:                                  // %for.cond.cleanup
	s_or_b64 exec, exec, s[2:3]
	v_cmp_eq_i32 vcc, 0, v0
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz BB0_7
// BB#6:                                 // %if.then.14
	s_mov_b32 m0, -1
	v_mov_b32 v0, s1
	s_add_i32 s8, s1, 4
	ds_read_b32 v0, v0
	v_mov_b32 v1, s8
	s_add_i32 s8, s1, 8
	ds_read_b32 v1, v1
	v_mov_b32 v2, s8
	s_add_i32 s8, s1, 12
	ds_read_b32 v2, v2
	v_mov_b32 v3, s8
	ds_read_b32 v3, v3
	s_lshl_b32 s8, s12, 4
	s_add_i32 s8, s0, s8
	v_mov_b32 v4, s8
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_xyzw v[0:3], v4, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
BB0_7:                                  // %if.end.17
	s_or_b64 exec, exec, s[2:3]
	s_endpgm

.args
	i32[4]* input 0 uav10 
	i32[4]* output 16 uav11 
	i32[4]* sdata 32 hl

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 284
	// NumVgprs = 15
	// NumSgprs = 17
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

