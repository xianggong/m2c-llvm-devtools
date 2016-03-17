.global	dwtHaar1D

.text

dwtHaar1D:                              // @dwtHaar1D
// BB#0:                                 // %entry
	s_buffer_load_dword s21, s[8:11], 0x0
	s_buffer_load_dword s13, s[8:11], 0x4
	s_buffer_load_dword s0, s[8:11], 0x8
	s_buffer_load_dword s1, s[8:11], 0xc
	s_buffer_load_dword s15, s[8:11], 0x10
	s_buffer_load_dword s14, s[8:11], 0x14
	s_buffer_load_dword s22, s[8:11], 0x18
	s_buffer_load_dword s20, s[8:11], 0x1c
	s_load_dwordx4 s[8:11], s[2:3], 0x60
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[24:27], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x4
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s2, 0xffff
	s_mul_i32 s3, s12, s2
	s_lshl_b32 s3, s3, 1
	v_add_i32 v1, vcc, s3, v0
	v_lshlrev_b32 v1, 2, v1
	v_add_i32 v1, vcc, s21, v1
	v_add_i32 v2, vcc, s2, v0
	v_add_i32 v3, vcc, s3, v2
	v_lshlrev_b32 v3, 2, v3
	v_add_i32 v3, vcc, s21, v3
	tbuffer_load_format_x v4, v1, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_x v3, v3, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_cmp_eq_i32 s[2:3], 0, s22
	s_waitcnt vmcnt(0)
	s_and_saveexec_b64 s[2:3], s[2:3]
	s_xor_b64 s[2:3], exec, s[2:3]
// BB#1:                                 // %if.then
	v_cvt_f32_u32 v1, s14
	v_rsq_f32 v1, v1
	v_mul_f32 v4, v4, v1
	v_mul_f32 v3, v3, v1
BB0_2:                                  // %if.end
	s_or_b64 exec, exec, s[2:3]
	v_lshlrev_b32 v1, 2, v0
	v_add_i32 v1, vcc, s1, v1
	s_mov_b32 m0, -1
	ds_write_b32 v1, v4
	v_lshlrev_b32 v2, 2, v2
	v_add_i32 v2, vcc, s1, v2
	ds_write_b32 v2, v3
	s_waitcnt lgkmcnt(0)
	s_barrier
	s_min_u32 s4, s15, s20
	v_cmp_ne_i32 s[2:3], 0, s4
	s_and_saveexec_b64 s[2:3], s[2:3]
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz BB0_6
// BB#3:                                 // %for.body.lr.ph
	s_lshr_b32 s5, s14, 1
	s_and_b32 s6, s4, 31
	s_lshl_b32 s6, 1, s6
	s_lshr_b32 s7, s6, 31
	s_add_i32 s6, s6, s7
	s_ashr_i32 s15, s6, 1
	v_lshlrev_b32 v3, 3, v0
	v_add_i32 v2, vcc, s1, v3
	v_or_b32 v3, 4, v3
	v_add_i32 v3, vcc, s1, v3
	s_mov_b64 s[6:7], 0
	v_mov_b32 v4, 0
	v_mov_b32 v5, s15
                                        // implicit-def: VGPR6
                                        // implicit-def: VGPR7
BB0_7:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_cmp_lt_u32 vcc, v0, v5
	s_and_saveexec_b64 s[20:21], vcc
	s_xor_b64 s[20:21], exec, s[20:21]
// BB#8:                                 // %if.then.26
                                        //   in Loop: Header=BB0_7 Depth=1
	s_mov_b32 m0, -1
	ds_read_b32 v7, v2
	ds_read_b32 v6, v3
	s_waitcnt lgkmcnt(0)
BB0_9:                                  // %if.end.32
                                        //   in Loop: Header=BB0_7 Depth=1
	s_or_b64 exec, exec, s[20:21]
	s_barrier
	v_cmp_lt_u32 vcc, v0, v5
	s_and_saveexec_b64 s[20:21], vcc
	s_xor_b64 s[20:21], exec, s[20:21]
	s_cbranch_execz BB0_11
// BB#10:                                // %if.then.35
                                        //   in Loop: Header=BB0_7 Depth=1
	v_add_f32 v8, v6, v7
	v_mov_b32 v9, 0x3f3504f3
	v_mul_lo_i32 v10, v5, s12
	v_mul_f32 v8, v9, v8
	s_mov_b32 m0, -1
	ds_write_b32 v1, v8
	s_waitcnt lgkmcnt(0)
	v_add_i32 v8, vcc, v10, v0
	v_add_i32 v8, vcc, s5, v8
	v_subrev_f32 v10, v6, v7
	v_mul_f32 v9, v9, v10
	v_lshlrev_b32 v8, 2, v8
	v_add_i32 v8, vcc, s13, v8
	tbuffer_store_format_x v9, v8, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_lshr_b32 s5, s5, 1
	s_waitcnt vmcnt(0) & expcnt(0)
BB0_11:                                 // %if.end.44
                                        //   in Loop: Header=BB0_7 Depth=1
	s_or_b64 exec, exec, s[20:21]
	s_barrier
	v_lshrrev_b32 v5, 1, v5
	v_add_i32 v4, vcc, 1, v4
	v_cmp_le_u32 vcc, s4, v4
	s_or_b64 s[6:7], vcc, s[6:7]
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB0_7
// BB#4:                                 // %Flow
	s_or_b64 exec, exec, s[6:7]
BB0_6:                                  // %Flow1
	s_or_b64 exec, exec, s[2:3]
// BB#5:                                 // %for.cond.cleanup
	v_cmp_eq_i32 vcc, 0, v0
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
// BB#12:                                // %if.then.48
	s_mov_b32 m0, -1
	v_mov_b32 v0, s1
	ds_read_b32 v0, v0
	s_lshl_b32 s4, s12, 2
	s_add_i32 s4, s0, s4
	v_mov_b32 v1, s4
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v0, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
BB0_13:                                 // %if.end.51
	s_or_b64 exec, exec, s[2:3]
	s_endpgm

// ********************* Second kernel starts
// SKBB#0:                                 // %entry
	s_buffer_load_dword s21, s[8:11], 0x0
	s_buffer_load_dword s13, s[8:11], 0x4
	s_buffer_load_dword s0, s[8:11], 0x8
	s_buffer_load_dword s1, s[8:11], 0xc
	s_buffer_load_dword s15, s[8:11], 0x10
	s_buffer_load_dword s14, s[8:11], 0x14
	s_buffer_load_dword s22, s[8:11], 0x18
	s_buffer_load_dword s20, s[8:11], 0x1c
	s_load_dwordx4 s[8:11], s[2:3], 0x60
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[24:27], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x4
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s2, 0xffff
	v_cmp_eq_i32 s[4:5], 0, s22
	s_mul_i32 s3, s12, s2
	s_lshl_b32 s3, s3, 1
	v_add_i32 v1, vcc, s3, v0
	v_lshlrev_b32 v1, 2, v1
	v_add_i32 v1, vcc, s21, v1
	tbuffer_load_format_x v3, v1, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v1, vcc, s2, v0
	v_add_i32 v2, vcc, s3, v1
	v_lshlrev_b32 v2, 2, v2
	v_add_i32 v2, vcc, s21, v2
	tbuffer_load_format_x v2, v2, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0)
	s_and_saveexec_b64 s[2:3], s[4:5]
	s_xor_b64 s[2:3], exec, s[2:3]
// SKBB#1:                                 // %if.then
	v_cvt_f32_u32 v4, s14
	v_rsq_f32 v4, v4
	v_mul_f32 v3, v3, v4
	v_mul_f32 v2, v2, v4
SKBB0_2:                                  // %if.end
	s_or_b64 exec, exec, s[2:3]
	v_lshlrev_b32 v4, 2, v0
	s_mov_b32 m0, -1
	v_lshlrev_b32 v5, 2, v1
	v_add_i32 v1, vcc, s1, v4
	ds_write_b32 v1, v3
	s_waitcnt lgkmcnt(0)
	v_add_i32 v3, vcc, s1, v5
	ds_write_b32 v3, v2
	s_waitcnt lgkmcnt(0)
	s_barrier
	s_min_u32 s4, s15, s20
	v_cmp_ne_i32 s[2:3], 0, s4
	s_and_saveexec_b64 s[2:3], s[2:3]
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz SKBB0_6
// SKBB#3:                                 // %for.body.lr.ph
	s_and_b32 s5, s4, 31
	s_lshl_b32 s5, 1, s5
	s_lshr_b32 s6, s5, 31
	v_lshlrev_b32 v2, 3, v0
	s_add_i32 s5, s5, s6
	s_ashr_i32 s15, s5, 1
	v_or_b32 v3, 4, v2
	s_lshr_b32 s5, s14, 1
	v_add_i32 v2, vcc, s1, v2
	v_add_i32 v3, vcc, s1, v3
	s_mov_b64 s[6:7], 0
	v_mov_b32 v4, 0
	v_mov_b32 v5, s15
                                        // implicit-def: VGPR6
                                        // implicit-def: VGPR7
SKBB0_7:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_cmp_lt_u32 vcc, v0, v5
	s_and_saveexec_b64 s[20:21], vcc
	s_xor_b64 s[20:21], exec, s[20:21]
// SKBB#8:                                 // %if.then.26
                                        //   in Loop: Header=SKBB0_7 Depth=1
	s_mov_b32 m0, -1
	ds_read_b32 v7, v2
	ds_read_b32 v6, v3
	s_waitcnt lgkmcnt(0)
SKBB0_9:                                  // %if.end.32
                                        //   in Loop: Header=SKBB0_7 Depth=1
	s_or_b64 exec, exec, s[20:21]
	v_cmp_lt_u32 vcc, v0, v5
	s_barrier
	s_and_saveexec_b64 s[20:21], vcc
	s_xor_b64 s[20:21], exec, s[20:21]
	s_cbranch_execz SKBB0_11
// SKBB#10:                                // %if.then.35
                                        //   in Loop: Header=SKBB0_7 Depth=1
	v_mov_b32 v8, 0x3f3504f3
	v_mul_lo_i32 v9, v5, s12
	v_add_i32 v9, vcc, v9, v0
	v_add_i32 v9, vcc, s5, v9
	v_lshlrev_b32 v9, 2, v9
	v_add_i32 v9, vcc, s13, v9
	v_subrev_f32 v10, v6, v7
	v_mul_f32 v10, v8, v10
	tbuffer_store_format_x v10, v9, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_f32 v9, v6, v7
	v_mul_f32 v8, v8, v9
	s_mov_b32 m0, -1
	ds_write_b32 v1, v8
	s_lshr_b32 s5, s5, 1
	s_waitcnt vmcnt(0) & expcnt(0) & lgkmcnt(0)
SKBB0_11:                                 // %if.end.44
                                        //   in Loop: Header=SKBB0_7 Depth=1
	s_or_b64 exec, exec, s[20:21]
	v_add_i32 v4, vcc, 1, v4
	v_cmp_le_u32 vcc, s4, v4
	v_lshrrev_b32 v5, 1, v5
	s_barrier
	s_or_b64 s[6:7], vcc, s[6:7]
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz SKBB0_7
// SKBB#4:                                 // %Flow
	s_or_b64 exec, exec, s[6:7]
SKBB0_6:                                  // %Flow1
	s_or_b64 exec, exec, s[2:3]
// SKBB#5:                                 // %for.cond.cleanup
	v_cmp_eq_i32 vcc, 0, v0
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
// SKBB#12:                                // %if.then.48
	s_mov_b32 m0, -1
	s_lshl_b32 s4, s12, 2
	s_add_i32 s4, s0, s4
	v_mov_b32 v0, s1
	ds_read_b32 v0, v0
	v_mov_b32 v1, s4
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v0, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
SKBB0_13:                                 // %if.end.51
	s_or_b64 exec, exec, s[2:3]
	s_endpgm


.args
	float* inSignal 0 uav10 
	float* coefsSignal 16 uav11 
	float* AverageSignal 32 uav12 
	float* sharedArray 48 hl
	i32 tLevels 64 
	i32 signalLength 80 
	i32 levelsDone 96 
	i32 mLevels 112 


.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 340
	// NumVgprs = 11
	// NumSgprs = 30
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

