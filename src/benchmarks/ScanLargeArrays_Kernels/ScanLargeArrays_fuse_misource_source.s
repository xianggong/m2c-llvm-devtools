.global	blockAddition
.text


blockAddition:                          // @blockAddition
// BB#0:                                 // %entry
	s_buffer_load_dword s1, s[8:11], 0x0
	s_buffer_load_dword s0, s[8:11], 0x4
	s_load_dwordx4 s[8:11], s[2:3], 0x58
	s_load_dwordx4 s[16:19], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x4
	v_cmp_eq_i32 vcc, 0, v0
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s2, 0xffff
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[4:5], exec, s[4:5]
// BB#1:                                 // %if.then
	s_lshl_b32 s3, s12, 2
	s_add_i32 s3, s1, s3
	v_mov_b32 v1, s3
	tbuffer_load_format_x v1, v1, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_mov_b32 m0, -1
	v_mov_b32 v2, 0
	s_waitcnt vmcnt(0)
	ds_write_b32 v2, v1
	s_waitcnt lgkmcnt(0)
BB0_2:                                  // %if.end
	s_or_b64 exec, exec, s[4:5]
	s_mul_i32 s1, s2, s12
	v_add_i32 v0, vcc, s1, v0
	v_lshlrev_b32 v0, 2, v0
	v_add_i32 v0, vcc, s0, v0
	s_barrier
	tbuffer_load_format_x v1, v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_mov_b32 m0, -1
	v_mov_b32 v2, 0
	ds_read_b32 v2, v2
	s_waitcnt vmcnt(0) & lgkmcnt(0)
	v_add_f32 v1, v1, v2
	tbuffer_store_format_x v1, v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

// SKBB#0:                                 // %entry
	s_buffer_load_dword s1, s[8:11], 0x0
	s_buffer_load_dword s0, s[8:11], 0x4
	s_load_dwordx4 s[8:11], s[2:3], 0x58
	s_load_dwordx4 s[16:19], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x4
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s2, 0xffff
	v_cmp_eq_i32 vcc, 0, v0
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[4:5], exec, s[4:5]
// SKBB#1:                                 // %if.then
	s_lshl_b32 s3, s12, 2
	s_add_i32 s3, s1, s3
	v_mov_b32 v1, s3
	tbuffer_load_format_x v1, v1, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_mov_b32 v2, 0
	s_mov_b32 m0, -1
	s_waitcnt vmcnt(0)
	ds_write_b32 v2, v1
	s_waitcnt lgkmcnt(0)
SKBB0_2:                                  // %if.end
	s_or_b64 exec, exec, s[4:5]
	s_barrier
	s_mul_i32 s1, s2, s12
	v_add_i32 v0, vcc, s1, v0
	v_lshlrev_b32 v0, 2, v0
	v_add_i32 v0, vcc, s0, v0
	tbuffer_load_format_x v1, v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_mov_b32 v2, 0
	s_mov_b32 m0, -1
	ds_read_b32 v2, v2
	s_waitcnt vmcnt(0) & lgkmcnt(0)
	v_add_f32 v1, v1, v2
	tbuffer_store_format_x v1, v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

.args
	float* input 0 uav10 
	float* output 16 uav11 

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 80
	// NumVgprs = 3
	// NumSgprs = 22
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1
// Merged ScanLargeArrays_Kernels_misource.s ScanLargeArrays_Kernels_source.s

.global	ScanLargeArrays
.text


ScanLargeArrays:                        // @ScanLargeArrays
// BB#0:                                 // %entry
	s_buffer_load_dword s1, s[8:11], 0x0
	s_buffer_load_dword s15, s[8:11], 0x4
	s_buffer_load_dword s0, s[8:11], 0x8
	s_buffer_load_dword s14, s[8:11], 0xc
	s_buffer_load_dword s13, s[8:11], 0x10
	s_load_dwordx4 s[16:19], s[2:3], 0x60
	s_load_dwordx4 s[20:23], s[2:3], 0x58
	s_load_dwordx4 s[8:11], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x4
	s_mov_b32 m0, -1
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s2, 0xffff
	s_mul_i32 s2, s2, s12
	v_add_i32 v1, vcc, s2, v0
	v_lshlrev_b32 v2, 3, v1
	v_add_i32 v2, vcc, s15, v2
	tbuffer_load_format_x v6, v2, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v4, 1, v0
	v_lshlrev_b32 v3, 3, v0
	v_or_b32 v5, 1, v4
	v_lshlrev_b32 v7, 2, v5
	v_lshlrev_b32 v1, 1, v1
	v_or_b32 v2, 1, v1
	v_lshlrev_b32 v8, 2, v2
	v_add_i32 v8, vcc, s15, v8
	tbuffer_load_format_x v8, v8, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v3, vcc, s0, v3
	s_waitcnt vmcnt(1)
	ds_write_b32 v3, v6
	s_waitcnt lgkmcnt(0)
	v_add_i32 v6, vcc, s0, v7
	s_waitcnt vmcnt(0)
	ds_write_b32 v6, v8
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_cmp_lt_u32 s[2:3], 1, s14
	s_and_saveexec_b64 s[2:3], s[2:3]
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz BB1_4
// BB#1:                                 // %for.body.lr.ph
	s_mov_b32 m0, -1
	s_add_i32 s4, s0, 4
	v_mov_b32 v7, s4
	ds_read_b32 v7, v7
	v_mov_b32 v8, s0
	ds_read_b32 v8, v8
	s_waitcnt lgkmcnt(0)
	v_add_f32 v9, v7, v8
	s_mov_b64 s[4:5], 0
	v_mov_b32 v7, 1
BB1_5:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_cmp_ge_i32 vcc, v4, v7
	s_and_saveexec_b64 s[6:7], vcc
	s_xor_b64 s[6:7], exec, s[6:7]
	s_cbranch_execz BB1_7
// BB#6:                                 // %if.then
                                        //   in Loop: Header=BB1_5 Depth=1
	v_subrev_i32 v8, vcc, v7, v4
	v_lshlrev_b32 v8, 2, v8
	v_subrev_i32 v9, vcc, v7, v5
	v_lshlrev_b32 v9, 2, v9
	s_mov_b32 m0, -1
	v_add_i32 v8, vcc, s0, v8
	v_add_i32 v9, vcc, s0, v9
	ds_read_b32 v10, v6
	ds_read_b32 v11, v3
	ds_read_b32 v8, v8
	ds_read_b32 v9, v9
	s_waitcnt lgkmcnt(0)
	v_add_f32 v8, v11, v8
	v_add_f32 v9, v10, v9
BB1_7:                                  // %if.end
                                        //   in Loop: Header=BB1_5 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_mov_b32 m0, -1
	s_barrier
	ds_write_b32 v3, v8
	ds_write_b32 v6, v9
	v_lshlrev_b32 v7, 1, v7
	v_cmp_le_u32 vcc, s14, v7
	s_waitcnt lgkmcnt(0)
	s_barrier
	s_or_b64 s[4:5], vcc, s[4:5]
	s_andn2_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB1_5
// BB#2:                                 // %Flow1
	s_or_b64 exec, exec, s[4:5]
BB1_4:                                  // %Flow2
	s_or_b64 exec, exec, s[2:3]
// BB#3:                                 // %for.cond.cleanup
	s_lshl_b32 s2, s14, 2
	s_add_i32 s2, s2, s0
	s_add_i32 s2, s2, -4
	s_mov_b32 m0, -1
	s_lshl_b32 s3, s12, 2
	s_add_i32 s3, s13, s3
	v_mov_b32 v5, s2
	ds_read_b32 v5, v5
	v_mov_b32 v6, s3
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v5, v6, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_cmp_ne_i32 vcc, 0, v0
	s_waitcnt vmcnt(0) & expcnt(0)
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz BB1_8
// BB#10:                                // %if.else
	s_mov_b32 m0, -1
	v_lshlrev_b32 v0, 2, v4
	v_add_i32 v0, vcc, s0, v0
	v_add_i32 v0, vcc, -4, v0
	ds_read_b32 v0, v0
	v_lshlrev_b32 v4, 2, v1
	v_add_i32 v4, vcc, s1, v4
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v0, v4, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
	ds_read_b32 v0, v3
	v_lshlrev_b32 v4, 2, v2
	v_add_i32 v4, vcc, s1, v4
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v0, v4, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
BB1_8:                                  // %Flow
	s_or_saveexec_b64 s[2:3], s[2:3]
	s_xor_b64 exec, exec, s[2:3]
	s_cbranch_execz BB1_11
// BB#9:                                 // %if.then.38
	v_lshlrev_b32 v0, 2, v1
	v_add_i32 v0, vcc, s1, v0
	v_mov_b32 v1, 0
	tbuffer_store_format_x v1, v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_mov_b32 m0, -1
	ds_read_b32 v0, v3
	s_waitcnt vmcnt(0) & expcnt(0)
	v_lshlrev_b32 v1, 2, v2
	v_add_i32 v1, vcc, s1, v1
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v0, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
BB1_11:                                 // %if.end.56
	s_or_b64 exec, exec, s[2:3]
	s_endpgm

// SKBB#0:                                 // %entry
	s_buffer_load_dword s0, s[8:11], 0x0
	s_buffer_load_dword s15, s[8:11], 0x4
	s_buffer_load_dword s1, s[8:11], 0x8
	s_buffer_load_dword s14, s[8:11], 0xc
	s_buffer_load_dword s13, s[8:11], 0x10
	s_load_dwordx4 s[16:19], s[2:3], 0x60
	s_load_dwordx4 s[20:23], s[2:3], 0x58
	s_load_dwordx4 s[8:11], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x4
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s2, 0xffff
	s_mul_i32 s2, s2, s12
	v_add_i32 v1, vcc, s2, v0
	v_lshlrev_b32 v2, 3, v1
	v_add_i32 v2, vcc, s15, v2
	tbuffer_load_format_x v4, v2, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v1, 1, v1
	v_or_b32 v2, 1, v1
	v_lshlrev_b32 v3, 2, v2
	v_add_i32 v3, vcc, s15, v3
	tbuffer_load_format_x v7, v3, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v3, 3, v0
	v_add_i32 v3, vcc, s1, v3
	s_mov_b32 m0, -1
	s_waitcnt vmcnt(1)
	ds_write_b32 v3, v4
	s_waitcnt lgkmcnt(0)
	v_lshlrev_b32 v4, 1, v0
	v_or_b32 v5, 1, v4
	v_lshlrev_b32 v6, 2, v5
	v_add_i32 v6, vcc, s1, v6
	s_waitcnt vmcnt(0)
	ds_write_b32 v6, v7
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_cmp_lt_u32 s[2:3], 1, s14
	s_and_saveexec_b64 s[2:3], s[2:3]
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz SKBB1_4
// SKBB#1:                                 // %for.body.lr.ph
	s_mov_b32 m0, -1
	v_mov_b32 v7, s1
	s_add_i32 s4, s1, 4
	ds_read_b32 v8, v7
	v_mov_b32 v7, s4
	ds_read_b32 v7, v7
	s_mov_b64 s[4:5], 0
	s_waitcnt lgkmcnt(0)
	v_add_f32 v9, v7, v8
	v_mov_b32 v7, 1
SKBB1_5:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_cmp_ge_i32 vcc, v4, v7
	s_and_saveexec_b64 s[6:7], vcc
	s_xor_b64 s[6:7], exec, s[6:7]
	s_cbranch_execz SKBB1_7
// SKBB#6:                                 // %if.then
                                        //   in Loop: Header=SKBB1_5 Depth=1
	v_subrev_i32 v8, vcc, v7, v4
	v_lshlrev_b32 v8, 2, v8
	v_add_i32 v8, vcc, s1, v8
	s_mov_b32 m0, -1
	ds_read_b32 v8, v8
	ds_read_b32 v9, v3
	v_subrev_i32 v10, vcc, v7, v5
	v_lshlrev_b32 v10, 2, v10
	v_add_i32 v10, vcc, s1, v10
	ds_read_b32 v10, v10
	ds_read_b32 v11, v6
	s_waitcnt lgkmcnt(0)
	v_add_f32 v8, v9, v8
	v_add_f32 v9, v11, v10
SKBB1_7:                                  // %if.end
                                        //   in Loop: Header=SKBB1_5 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_mov_b32 m0, -1
	s_barrier
	ds_write_b32 v3, v8
	ds_write_b32 v6, v9
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_lshlrev_b32 v7, 1, v7
	v_cmp_le_u32 vcc, s14, v7
	s_or_b64 s[4:5], vcc, s[4:5]
	s_andn2_b64 exec, exec, s[4:5]
	s_cbranch_execnz SKBB1_5
// SKBB#2:                                 // %Flow1
	s_or_b64 exec, exec, s[4:5]
SKBB1_4:                                  // %Flow2
	s_or_b64 exec, exec, s[2:3]
// SKBB#3:                                 // %for.cond.cleanup
	s_lshl_b32 s2, s14, 2
	s_add_i32 s2, s2, s1
	s_add_i32 s2, s2, -4
	s_mov_b32 m0, -1
	v_mov_b32 v5, s2
	ds_read_b32 v5, v5
	s_lshl_b32 s2, s12, 2
	s_add_i32 s2, s13, s2
	v_mov_b32 v6, s2
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v5, v6, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_cmp_ne_i32 vcc, 0, v0
	s_waitcnt vmcnt(0) & expcnt(0)
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz SKBB1_8
// SKBB#10:                                // %if.else
	v_lshlrev_b32 v0, 2, v4
	v_add_i32 v0, vcc, s1, v0
	v_add_i32 v0, vcc, -4, v0
	s_mov_b32 m0, -1
	ds_read_b32 v0, v0
	ds_read_b32 v4, v3
	v_lshlrev_b32 v5, 2, v1
	v_add_i32 v5, vcc, s0, v5
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v0, v5, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
	v_lshlrev_b32 v0, 2, v2
	v_add_i32 v0, vcc, s0, v0
	tbuffer_store_format_x v4, v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
SKBB1_8:                                  // %Flow
	s_or_saveexec_b64 s[2:3], s[2:3]
	s_xor_b64 exec, exec, s[2:3]
	s_cbranch_execz SKBB1_11
// SKBB#9:                                 // %if.then.38
	s_mov_b32 m0, -1
	ds_read_b32 v0, v3
	v_lshlrev_b32 v1, 2, v1
	v_add_i32 v1, vcc, s0, v1
	v_mov_b32 v3, 0
	tbuffer_store_format_x v3, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v1, 2, v2
	v_add_i32 v1, vcc, s0, v1
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v0, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
SKBB1_11:                                 // %if.end.56
	s_or_b64 exec, exec, s[2:3]
	s_endpgm

.args
	float* output 0 uav10 
	float* input 16 uav11 
	float* block 32 hl
	i32 block_size 48 
	float* sumBuffer 64 uav12 

// Merge warning: sections do not match
.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 356
	// NumVgprs = 12
	// NumSgprs = 26
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1
// Merged ScanLargeArrays_Kernels_misource.s ScanLargeArrays_Kernels_source.s

.global	prefixSum
.text


prefixSum:                              // @prefixSum
// BB#0:                                 // %entry
	s_buffer_load_dword s1, s[8:11], 0x0
	s_buffer_load_dword s14, s[8:11], 0x4
	s_buffer_load_dword s0, s[8:11], 0x8
	s_buffer_load_dword s13, s[8:11], 0xc
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[8:11], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x4
	s_mov_b32 m0, -1
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s2, 0xffff
	s_mul_i32 s2, s2, s12
	v_add_i32 v1, vcc, s2, v0
	v_lshlrev_b32 v2, 3, v1
	v_add_i32 v2, vcc, s14, v2
	tbuffer_load_format_x v6, v2, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v4, 1, v0
	v_lshlrev_b32 v3, 3, v0
	v_or_b32 v5, 1, v4
	v_lshlrev_b32 v7, 2, v5
	v_lshlrev_b32 v1, 1, v1
	v_or_b32 v2, 1, v1
	v_lshlrev_b32 v8, 2, v2
	v_add_i32 v8, vcc, s14, v8
	tbuffer_load_format_x v8, v8, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v3, vcc, s0, v3
	s_waitcnt vmcnt(1)
	ds_write_b32 v3, v6
	s_waitcnt lgkmcnt(0)
	v_add_i32 v6, vcc, s0, v7
	s_waitcnt vmcnt(0)
	ds_write_b32 v6, v8
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_cmp_lt_u32 s[2:3], 1, s13
	s_and_saveexec_b64 s[2:3], s[2:3]
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz BB2_4
// BB#1:                                 // %for.body.lr.ph
	s_mov_b32 m0, -1
	s_add_i32 s4, s0, 4
	v_mov_b32 v7, s4
	ds_read_b32 v7, v7
	v_mov_b32 v8, s0
	ds_read_b32 v8, v8
	s_waitcnt lgkmcnt(0)
	v_add_f32 v9, v7, v8
	s_mov_b64 s[4:5], 0
	v_mov_b32 v7, 1
BB2_5:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_cmp_ge_i32 vcc, v4, v7
	s_and_saveexec_b64 s[6:7], vcc
	s_xor_b64 s[6:7], exec, s[6:7]
	s_cbranch_execz BB2_7
// BB#6:                                 // %if.then
                                        //   in Loop: Header=BB2_5 Depth=1
	v_subrev_i32 v8, vcc, v7, v4
	v_lshlrev_b32 v8, 2, v8
	v_subrev_i32 v9, vcc, v7, v5
	v_lshlrev_b32 v9, 2, v9
	s_mov_b32 m0, -1
	v_add_i32 v8, vcc, s0, v8
	v_add_i32 v9, vcc, s0, v9
	ds_read_b32 v10, v6
	ds_read_b32 v11, v3
	ds_read_b32 v8, v8
	ds_read_b32 v9, v9
	s_waitcnt lgkmcnt(0)
	v_add_f32 v8, v11, v8
	v_add_f32 v9, v10, v9
BB2_7:                                  // %if.end
                                        //   in Loop: Header=BB2_5 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_mov_b32 m0, -1
	s_barrier
	ds_write_b32 v3, v8
	ds_write_b32 v6, v9
	v_lshlrev_b32 v7, 1, v7
	v_cmp_le_u32 vcc, s13, v7
	s_waitcnt lgkmcnt(0)
	s_barrier
	s_or_b64 s[4:5], vcc, s[4:5]
	s_andn2_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB2_5
// BB#2:                                 // %Flow1
	s_or_b64 exec, exec, s[4:5]
BB2_4:                                  // %Flow2
	s_or_b64 exec, exec, s[2:3]
// BB#3:                                 // %for.cond.cleanup
	v_cmp_ne_i32 vcc, 0, v0
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz BB2_8
// BB#10:                                // %if.else
	s_mov_b32 m0, -1
	v_lshlrev_b32 v0, 2, v4
	v_add_i32 v0, vcc, s0, v0
	v_add_i32 v0, vcc, -4, v0
	ds_read_b32 v0, v0
	v_lshlrev_b32 v4, 2, v1
	v_add_i32 v4, vcc, s1, v4
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v0, v4, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
	ds_read_b32 v0, v3
	v_lshlrev_b32 v4, 2, v2
	v_add_i32 v4, vcc, s1, v4
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v0, v4, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
BB2_8:                                  // %Flow
	s_or_saveexec_b64 s[2:3], s[2:3]
	s_xor_b64 exec, exec, s[2:3]
	s_cbranch_execz BB2_11
// BB#9:                                 // %if.then.35
	v_lshlrev_b32 v0, 2, v1
	v_add_i32 v0, vcc, s1, v0
	v_mov_b32 v1, 0
	tbuffer_store_format_x v1, v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_mov_b32 m0, -1
	ds_read_b32 v0, v3
	s_waitcnt vmcnt(0) & expcnt(0)
	v_lshlrev_b32 v1, 2, v2
	v_add_i32 v1, vcc, s1, v1
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v0, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
BB2_11:                                 // %if.end.53
	s_or_b64 exec, exec, s[2:3]
	s_endpgm

// SKBB#0:                                 // %entry
	s_buffer_load_dword s0, s[8:11], 0x0
	s_buffer_load_dword s14, s[8:11], 0x4
	s_buffer_load_dword s1, s[8:11], 0x8
	s_buffer_load_dword s13, s[8:11], 0xc
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[8:11], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x4
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s2, 0xffff
	s_mul_i32 s2, s2, s12
	v_add_i32 v3, vcc, s2, v0
	v_lshlrev_b32 v2, 1, v3
	v_or_b32 v1, 1, v2
	v_lshlrev_b32 v3, 3, v3
	v_add_i32 v3, vcc, s14, v3
	tbuffer_load_format_x v6, v3, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v3, 2, v1
	v_add_i32 v3, vcc, s14, v3
	tbuffer_load_format_x v7, v3, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v4, 1, v0
	v_lshlrev_b32 v3, 3, v0
	s_mov_b32 m0, -1
	v_or_b32 v5, 1, v4
	v_add_i32 v3, vcc, s1, v3
	s_waitcnt vmcnt(1)
	ds_write_b32 v3, v6
	s_waitcnt lgkmcnt(0)
	v_lshlrev_b32 v6, 2, v5
	v_add_i32 v6, vcc, s1, v6
	s_waitcnt vmcnt(0)
	ds_write_b32 v6, v7
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_cmp_lt_u32 s[2:3], 1, s13
	s_and_saveexec_b64 s[2:3], s[2:3]
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz SKBB2_4
// SKBB#1:                                 // %for.body.lr.ph
	s_mov_b32 m0, -1
	v_mov_b32 v7, s1
	s_add_i32 s4, s1, 4
	ds_read_b32 v8, v7
	v_mov_b32 v7, s4
	ds_read_b32 v7, v7
	s_mov_b64 s[4:5], 0
	s_waitcnt lgkmcnt(0)
	v_add_f32 v9, v7, v8
	v_mov_b32 v7, 1
SKBB2_5:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_cmp_ge_i32 vcc, v4, v7
	s_and_saveexec_b64 s[6:7], vcc
	s_xor_b64 s[6:7], exec, s[6:7]
	s_cbranch_execz SKBB2_7
// SKBB#6:                                 // %if.then
                                        //   in Loop: Header=SKBB2_5 Depth=1
	v_subrev_i32 v8, vcc, v7, v4
	v_lshlrev_b32 v8, 2, v8
	v_add_i32 v8, vcc, s1, v8
	s_mov_b32 m0, -1
	ds_read_b32 v8, v8
	ds_read_b32 v9, v3
	v_subrev_i32 v10, vcc, v7, v5
	v_lshlrev_b32 v10, 2, v10
	v_add_i32 v10, vcc, s1, v10
	ds_read_b32 v10, v10
	ds_read_b32 v11, v6
	s_waitcnt lgkmcnt(0)
	v_add_f32 v8, v9, v8
	v_add_f32 v9, v11, v10
SKBB2_7:                                  // %if.end
                                        //   in Loop: Header=SKBB2_5 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_mov_b32 m0, -1
	s_barrier
	ds_write_b32 v3, v8
	ds_write_b32 v6, v9
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_lshlrev_b32 v7, 1, v7
	v_cmp_le_u32 vcc, s13, v7
	s_or_b64 s[4:5], vcc, s[4:5]
	s_andn2_b64 exec, exec, s[4:5]
	s_cbranch_execnz SKBB2_5
// SKBB#2:                                 // %Flow1
	s_or_b64 exec, exec, s[4:5]
SKBB2_4:                                  // %Flow2
	s_or_b64 exec, exec, s[2:3]
// SKBB#3:                                 // %for.cond.cleanup
	v_cmp_ne_i32 vcc, 0, v0
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz SKBB2_8
// SKBB#10:                                // %if.else
	v_lshlrev_b32 v0, 2, v4
	v_add_i32 v0, vcc, s1, v0
	v_add_i32 v0, vcc, -4, v0
	s_mov_b32 m0, -1
	ds_read_b32 v0, v0
	ds_read_b32 v4, v3
	v_lshlrev_b32 v5, 2, v2
	v_add_i32 v5, vcc, s0, v5
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v0, v5, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
	v_lshlrev_b32 v0, 2, v1
	v_add_i32 v0, vcc, s0, v0
	tbuffer_store_format_x v4, v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
SKBB2_8:                                  // %Flow
	s_or_saveexec_b64 s[2:3], s[2:3]
	s_xor_b64 exec, exec, s[2:3]
	s_cbranch_execz SKBB2_11
// SKBB#9:                                 // %if.then.35
	s_mov_b32 m0, -1
	ds_read_b32 v0, v3
	v_lshlrev_b32 v2, 2, v2
	v_add_i32 v2, vcc, s0, v2
	v_mov_b32 v3, 0
	tbuffer_store_format_x v3, v2, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v1, 2, v1
	v_add_i32 v1, vcc, s0, v1
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v0, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
SKBB2_11:                                 // %if.end.53
	s_or_b64 exec, exec, s[2:3]
	s_endpgm

.args
	float* output 0 uav10 
	float* input 16 uav11 
	float* block 32 hl
	i32 block_size 48 

// Merge warning: sections do not match
.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 320
	// NumVgprs = 12
	// NumSgprs = 22
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1
// Merged ScanLargeArrays_Kernels_misource.s ScanLargeArrays_Kernels_source.s

