.global	histogram

.text

histogram:                              // @histogram
// BB#0:                                 // %entry
	s_buffer_load_dword s0, s[8:11], 0x0
	s_buffer_load_dword s1, s[8:11], 0x4
	s_buffer_load_dword s13, s[8:11], 0x8
	s_buffer_load_dword s8, s[8:11], 0xc
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[20:23], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x4
	v_lshlrev_b32 v1, 2, v0
	v_mov_b32 v2, 0
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s2, 0xffff
	v_add_i32 v1, vcc, s8, v1
	s_mul_i32 s2, s2, s12
	v_add_i32 v0, vcc, s2, v0
	s_mov_b32 m0, -1
	ds_write_b32 v1, v2
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_lshlrev_b32 v0, 2, v0
	v_add_i32 v2, vcc, s0, v0
	tbuffer_load_format_x v2, v2, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_and_b32 s0, s13, 31
	s_waitcnt vmcnt(0)
	v_bfe_u32 v2, v2, s0, 8
	v_lshlrev_b32 v2, 2, v2
	v_add_i32 v2, vcc, s8, v2
	v_mov_b32 v3, -1
	ds_inc_u32 v2, v3
	s_waitcnt lgkmcnt(0)
	s_barrier
	ds_read_b32 v1, v1
	v_add_i32 v0, vcc, s1, v0
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v1, v0, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

// ********************* Second kernel starts
// SKBB#0:                                 // %entry

.args
	i32* unsortedData 0 uav10 
	i32* buckets 16 uav11 
	i32 shiftCount 32 
	i32* sharedArray 48 hl


.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 92
	// NumVgprs = 4
	// NumSgprs = 26
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

.global	permute

.text

permute:                                // @permute
// BB#0:                                 // %entry
	s_buffer_load_dword s14, s[8:11], 0x0
	s_buffer_load_dword s0, s[8:11], 0x4
	s_buffer_load_dword s15, s[8:11], 0x8
	s_buffer_load_dword s13, s[8:11], 0xc
	s_buffer_load_dword s8, s[8:11], 0x10
	s_load_dwordx4 s[16:19], s[2:3], 0x60
	s_load_dwordx4 s[24:27], s[2:3], 0x58
	s_load_dwordx4 s[20:23], s[2:3], 0x50
	s_buffer_load_dword s1, s[4:7], 0x4
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s1, 0xffff
	s_mul_i32 s1, s12, s2
	s_lshl_b32 s1, s1, 8
	v_lshlrev_b32 v1, 8, v0
	v_add_i32 v2, vcc, s1, v1
	v_lshlrev_b32 v2, 2, v2
	v_add_i32 v2, vcc, s0, v2
	v_lshlrev_b32 v3, 9, v0
	v_add_i32 v3, vcc, s13, v3
	v_mov_b32 v4, 0
	s_mov_b64 s[4:5], 0
	s_mov_b32 m0, -1
BB1_2:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_add_i32 v5, vcc, v4, v2
	v_add_i32 v6, vcc, 4, v5
	v_add_i32 v7, vcc, 8, v5
	v_add_i32 v8, vcc, 12, v5
	v_add_i32 v9, vcc, 16, v5
	v_add_i32 v10, vcc, 20, v5
	v_add_i32 v11, vcc, 24, v5
	v_add_i32 v12, vcc, 28, v5
	v_add_i32 v13, vcc, 32, v5
	v_add_i32 v14, vcc, 36, v5
	v_add_i32 v15, vcc, 40, v5
	v_add_i32 v16, vcc, 44, v5
	v_add_i32 v17, vcc, 48, v5
	v_add_i32 v18, vcc, 52, v5
	v_add_i32 v19, vcc, 56, v5
	v_add_i32 v20, vcc, 60, v5
	tbuffer_load_format_x v5, v5, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_x v6, v6, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_x v7, v7, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_x v8, v8, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_x v9, v9, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_x v10, v10, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_x v11, v11, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_x v12, v12, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_x v13, v13, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_x v14, v14, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_x v15, v15, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_x v16, v16, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_x v17, v17, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_x v18, v18, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_x v19, v19, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	tbuffer_load_format_x v20, v20, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v4, vcc, 64, v4
	v_add_i32 v21, vcc, 2, v3
	ds_write_b16 v3, v5
	s_waitcnt vmcnt(14)
	ds_write_b16 v21, v6
	s_waitcnt lgkmcnt(0)
	v_add_i32 v5, vcc, 4, v3
	v_add_i32 v6, vcc, 6, v3
	s_waitcnt vmcnt(13)
	ds_write_b16 v5, v7
	v_add_i32 v5, vcc, 8, v3
	s_waitcnt lgkmcnt(0)
	v_add_i32 v7, vcc, 10, v3
	s_waitcnt vmcnt(12)
	ds_write_b16 v6, v8
	v_add_i32 v6, vcc, 12, v3
	s_waitcnt lgkmcnt(0)
	v_add_i32 v8, vcc, 14, v3
	s_waitcnt vmcnt(11)
	ds_write_b16 v5, v9
	v_add_i32 v5, vcc, 16, v3
	s_waitcnt lgkmcnt(0)
	v_add_i32 v9, vcc, 18, v3
	s_waitcnt vmcnt(10)
	ds_write_b16 v7, v10
	v_add_i32 v7, vcc, 20, v3
	s_waitcnt lgkmcnt(0)
	v_add_i32 v10, vcc, 22, v3
	s_waitcnt vmcnt(9)
	ds_write_b16 v6, v11
	v_add_i32 v6, vcc, 24, v3
	s_waitcnt lgkmcnt(0)
	v_add_i32 v11, vcc, 26, v3
	s_waitcnt vmcnt(8)
	ds_write_b16 v8, v12
	v_add_i32 v8, vcc, 28, v3
	s_waitcnt lgkmcnt(0)
	v_add_i32 v12, vcc, 30, v3
	s_waitcnt vmcnt(7)
	ds_write_b16 v5, v13
	v_mov_b32 v5, 0x400
	v_cmp_eq_i32 s[0:1], v5, v4
	v_add_i32 v3, vcc, 32, v3
	s_waitcnt vmcnt(6)
	ds_write_b16 v9, v14
	s_waitcnt vmcnt(5)
	ds_write_b16 v7, v15
	s_waitcnt vmcnt(4)
	ds_write_b16 v10, v16
	s_waitcnt vmcnt(3)
	ds_write_b16 v6, v17
	s_waitcnt vmcnt(2)
	ds_write_b16 v11, v18
	s_waitcnt vmcnt(1)
	ds_write_b16 v8, v19
	s_waitcnt vmcnt(0)
	ds_write_b16 v12, v20
	s_or_b64 s[4:5], s[0:1], s[4:5]
	s_waitcnt lgkmcnt(0)
	s_andn2_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB1_2
// BB#1:                                 // %for.cond.cleanup
	s_or_b64 exec, exec, s[4:5]
	s_barrier
	s_mul_i32 s0, s2, s12
	s_lshl_b32 s0, s0, 8
	v_lshlrev_b32 v0, 8, v0
	v_add_i32 v0, vcc, s0, v0
	v_lshlrev_b32 v0, 2, v0
	s_and_b32 s0, s15, 31
	v_add_i32 v0, vcc, s14, v0
	s_mov_b64 s[2:3], 0
	v_mov_b32 v2, 0
	s_mov_b32 m0, -1
BB1_4:                                  // %for.body.15
                                        // =>This Inner Loop Header: Depth=1
	v_mov_b32 v3, 0x400
	v_add_i32 v4, vcc, v2, v0
	tbuffer_load_format_x v4, v4, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0)
	v_bfe_u32 v5, v4, s0, 8
	v_or_b32 v5, v5, v1
	v_lshlrev_b32 v5, 1, v5
	v_add_i32 v5, vcc, s13, v5
	ds_read_u16 v6, v5
	s_waitcnt lgkmcnt(0)
	v_lshlrev_b32 v7, 2, v6
	v_add_i32 v6, vcc, 1, v6
	ds_write_b16 v5, v6
	v_add_i32 v5, vcc, s8, v7
	tbuffer_store_format_x v4, v5, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0) & lgkmcnt(0)
	s_barrier
	v_add_i32 v2, vcc, 4, v2
	v_cmp_eq_i32 vcc, v3, v2
	s_or_b64 s[2:3], vcc, s[2:3]
	s_andn2_b64 exec, exec, s[2:3]
	s_cbranch_execnz BB1_4
// BB#3:                                 // %for.cond.cleanup.14
	s_or_b64 exec, exec, s[2:3]
	s_endpgm

// ********************* Second kernel starts
// SKBB#0:                                 // %entry

.args
	i32* unsortedData 0 uav10 
	i32* scanedBuckets 16 uav11 
	i32 shiftCount 32 
	i16* sharedBuckets 48 hl
	i32* sortedData 64 uav12 


// Merge warning: sections do not match
.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 420
	// NumVgprs = 22
	// NumSgprs = 30
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

.global	ScanArraysdim2

.text

ScanArraysdim2:                         // @ScanArraysdim2
// BB#0:                                 // %entry
	s_buffer_load_dword s14, s[8:11], 0x0
	s_buffer_load_dword s0, s[8:11], 0x4
	s_buffer_load_dword s15, s[8:11], 0x8
	s_buffer_load_dword s21, s[8:11], 0xc
	s_buffer_load_dword s1, s[8:11], 0x10
	s_buffer_load_dword s20, s[8:11], 0x14
	s_load_dwordx4 s[16:19], s[2:3], 0x60
	s_load_dwordx4 s[24:27], s[2:3], 0x58
	s_load_dwordx4 s[8:11], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_buffer_load_dword s1, s[4:7], 0x4
	s_buffer_load_dword s3, s[4:7], 0x5
	s_mov_b32 s4, 0xffff
	s_waitcnt lgkmcnt(0)
	s_min_u32 s1, s1, s4
	s_min_u32 s3, s3, s4
	s_mul_i32 s3, s3, s13
	v_add_i32 v1, vcc, s3, v1
	s_mul_i32 s1, s1, s12
	v_add_i32 v2, vcc, s1, v0
	v_lshlrev_b32 v2, 8, v2
	v_add_i32 v1, vcc, v1, v2
	v_lshlrev_b32 v2, 2, v1
	v_add_i32 v2, vcc, s0, v2
	tbuffer_load_format_x v3, v2, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v2, 2, v0
	v_add_i32 v2, vcc, s15, v2
	s_mov_b32 m0, -1
	s_waitcnt vmcnt(0)
	ds_write_b32 v2, v3
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_cvt_f32_u32 v3, s21
	v_rcp_f32 v3, v3
	v_mul_f32 v3, 0x4f800000, v3
	v_cvt_u32_f32 v3, v3
	v_mul_hi_u32 v4, v3, s21
	v_mul_lo_i32 v5, v3, s21
	v_cmp_eq_i32 s[0:1], 0, v4
	v_sub_i32 v4, vcc, 0, v5
	v_cndmask_b32 v4, v5, v4, s[0:1]
	v_mul_hi_u32 v4, v4, v3
	v_add_i32 v5, vcc, v4, v3
	v_subrev_i32 v3, vcc, v4, v3
	v_cndmask_b32 v3, v3, v5, s[0:1]
	v_mul_hi_u32 v3, v3, s2
	v_mul_lo_i32 v4, v3, s21
	v_cmp_ge_u32 vcc, s2, v4
	v_cndmask_b32 v5, 0, -1, vcc
	v_sub_i32 v4, vcc, s2, v4
	v_cmp_le_u32 vcc, s21, v4
	v_cndmask_b32 v4, 0, -1, vcc
	v_and_b32 v4, v5, v4
	v_cmp_eq_i32 s[0:1], 0, v4
	v_add_i32 v4, vcc, 1, v3
	v_cndmask_b32 v4, v4, v3, s[0:1]
	v_add_i32 v3, vcc, -1, v3
	v_cmp_eq_i32 vcc, 0, v5
	v_cndmask_b32 v3, v4, v3, vcc
	v_cmp_lt_u32 s[0:1], 1, s21
	s_and_saveexec_b64 s[0:1], s[0:1]
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz BB2_4
// BB#1:                                 // %for.body.lr.ph
	s_mov_b32 m0, -1
	v_mov_b32 v4, s15
	ds_read_b32 v5, v4
	s_mov_b64 s[2:3], 0
	v_mov_b32 v4, 1
	s_waitcnt lgkmcnt(0)
BB2_5:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_cmp_ge_i32 vcc, v0, v4
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[4:5], exec, s[4:5]
// BB#6:                                 // %if.then
                                        //   in Loop: Header=BB2_5 Depth=1
	v_subrev_i32 v5, vcc, v4, v0
	v_lshlrev_b32 v5, 2, v5
	v_add_i32 v5, vcc, s15, v5
	s_mov_b32 m0, -1
	ds_read_b32 v5, v5
	ds_read_b32 v6, v2
	s_waitcnt lgkmcnt(0)
	v_add_i32 v5, vcc, v5, v6
BB2_7:                                  // %if.end
                                        //   in Loop: Header=BB2_5 Depth=1
	s_or_b64 exec, exec, s[4:5]
	s_mov_b32 m0, -1
	s_barrier
	ds_write_b32 v2, v5
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_lshlrev_b32 v4, 1, v4
	v_cmp_le_u32 vcc, s21, v4
	s_or_b64 s[2:3], vcc, s[2:3]
	s_andn2_b64 exec, exec, s[2:3]
	s_cbranch_execnz BB2_5
// BB#2:                                 // %Flow
	s_or_b64 exec, exec, s[2:3]
BB2_4:                                  // %Flow1
	s_or_b64 exec, exec, s[0:1]
	v_mul_lo_i32 v2, v3, s13
	v_add_i32 v2, vcc, s12, v2
// BB#3:                                 // %for.cond.cleanup
	s_lshl_b32 s0, s21, 2
	s_add_i32 s0, s0, s15
	s_add_i32 s0, s0, -4
	s_mov_b32 m0, -1
	v_mov_b32 v3, s0
	ds_read_b32 v3, v3
	v_lshlrev_b32 v2, 2, v2
	v_add_i32 v2, vcc, s20, v2
	v_cmp_ne_i32 vcc, 0, v0
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v3, v2, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_mov_b32 v2, 0
	s_waitcnt vmcnt(0) & expcnt(0)
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
// BB#8:                                 // %if.else
	v_lshlrev_b32 v0, 2, v0
	v_add_i32 v0, vcc, s15, v0
	v_add_i32 v0, vcc, -4, v0
	s_mov_b32 m0, -1
	ds_read_b32 v2, v0
	s_waitcnt lgkmcnt(0)
BB2_9:                                  // %if.end.27
	s_or_b64 exec, exec, s[0:1]
	v_lshlrev_b32 v0, 2, v1
	v_add_i32 v0, vcc, s14, v0
	tbuffer_store_format_x v2, v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

// ********************* Second kernel starts
// SKBB#0:                                 // %entry

.args
	i32* output 0 uav10 
	i32* input 16 uav11 
	i32* block 32 hl
	i32 block_size 48 
	i32 stride 64 
	i32* sumBuffer 80 uav12 


// Merge warning: sections do not match
.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 416
	// NumVgprs = 7
	// NumSgprs = 30
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

.global	ScanArraysdim1

.text

ScanArraysdim1:                         // @ScanArraysdim1
// BB#0:                                 // %entry
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
	v_add_i32 v1, vcc, s2, v0
	v_lshlrev_b32 v2, 2, v1
	v_add_i32 v2, vcc, s14, v2
	tbuffer_load_format_x v3, v2, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v2, 2, v0
	s_mov_b32 m0, -1
	v_add_i32 v2, vcc, s1, v2
	s_waitcnt vmcnt(0)
	ds_write_b32 v2, v3
	v_cmp_lt_u32 s[2:3], 1, s13
	s_waitcnt lgkmcnt(0)
	s_and_saveexec_b64 s[2:3], s[2:3]
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz BB3_4
// BB#1:                                 // %for.body.lr.ph
	s_mov_b32 m0, -1
	v_mov_b32 v3, s1
	ds_read_b32 v4, v3
	s_mov_b64 s[4:5], 0
	v_mov_b32 v3, 1
	s_waitcnt lgkmcnt(0)
BB3_5:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_cmp_ge_i32 vcc, v0, v3
	s_and_saveexec_b64 s[6:7], vcc
	s_xor_b64 s[6:7], exec, s[6:7]
// BB#6:                                 // %if.then
                                        //   in Loop: Header=BB3_5 Depth=1
	v_subrev_i32 v4, vcc, v3, v0
	v_lshlrev_b32 v4, 2, v4
	v_add_i32 v4, vcc, s1, v4
	s_mov_b32 m0, -1
	ds_read_b32 v4, v4
	ds_read_b32 v5, v2
	s_waitcnt lgkmcnt(0)
	v_add_i32 v4, vcc, v4, v5
BB3_7:                                  // %if.end
                                        //   in Loop: Header=BB3_5 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_mov_b32 m0, -1
	s_barrier
	ds_write_b32 v2, v4
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_lshlrev_b32 v3, 1, v3
	v_cmp_le_u32 vcc, s13, v3
	s_or_b64 s[4:5], vcc, s[4:5]
	s_andn2_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB3_5
// BB#2:                                 // %Flow
	s_or_b64 exec, exec, s[4:5]
BB3_4:                                  // %Flow1
	s_or_b64 exec, exec, s[2:3]
// BB#3:                                 // %for.cond.cleanup
	v_cmp_ne_i32 vcc, 0, v0
	v_mov_b32 v2, 0
	s_and_saveexec_b64 s[2:3], vcc
	s_xor_b64 s[2:3], exec, s[2:3]
// BB#8:                                 // %if.else
	v_lshlrev_b32 v0, 2, v0
	v_add_i32 v0, vcc, s1, v0
	v_add_i32 v0, vcc, -4, v0
	s_mov_b32 m0, -1
	ds_read_b32 v2, v0
	s_waitcnt lgkmcnt(0)
BB3_9:                                  // %if.end.15
	s_or_b64 exec, exec, s[2:3]
	v_lshlrev_b32 v0, 2, v1
	v_add_i32 v0, vcc, s0, v0
	tbuffer_store_format_x v2, v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

// ********************* Second kernel starts
// SKBB#0:                                 // %entry

.args
	i32* output 0 uav10 
	i32* input 16 uav11 
	i32* block 32 hl
	i32 block_size 48 


.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 184
	// NumVgprs = 6
	// NumSgprs = 22
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

.global	prefixSum

.text

prefixSum:                              // @prefixSum
// BB#0:                                 // %entry
	s_buffer_load_dword s0, s[8:11], 0x0
	s_buffer_load_dword s14, s[8:11], 0x4
	s_buffer_load_dword s15, s[8:11], 0x8
	s_buffer_load_dword s20, s[8:11], 0xc
	s_load_dwordx4 s[8:11], s[2:3], 0x60
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[24:27], s[2:3], 0x50
	s_buffer_load_dword s1, s[4:7], 0x4
	s_buffer_load_dword s2, s[4:7], 0x5
	s_mov_b32 s3, 0xffff
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s2, s3
	s_mul_i32 s2, s2, s13
	v_add_i32 v2, vcc, s2, v1
	v_mul_lo_i32 v3, v2, s20
	s_min_u32 s1, s1, s3
	s_mul_i32 s3, s1, s12
	v_add_i32 v4, vcc, s3, v0
	v_add_i32 v3, vcc, v3, v4
	v_lshlrev_b32 v5, 2, v3
	v_add_i32 v6, vcc, s0, v5
	v_mov_b32 v5, 0
	tbuffer_store_format_x v5, v6, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_cmp_lt_i32 vcc, 0, v4
	s_waitcnt vmcnt(0) & expcnt(0)
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execz BB4_2
// BB#1:                                 // %for.body.preheader
	v_add_i32 v1, vcc, s2, v1
	v_mul_lo_i32 v1, s20, v1
	v_add_i32 v0, vcc, s3, v0
	s_mov_b64 s[6:7], 0
	v_lshlrev_b32 v1, 2, v1
	v_add_i32 v1, vcc, s14, v1
	v_mov_b32 v5, 0
BB4_3:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	tbuffer_load_format_x v7, v1, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v0, vcc, -1, v0
	v_add_i32 v1, vcc, 4, v1
	v_cmp_eq_i32 s[0:1], 0, v0
	s_waitcnt vmcnt(0)
	v_add_i32 v5, vcc, v7, v5
	tbuffer_store_format_x v5, v6, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_or_b64 s[6:7], s[0:1], s[6:7]
	s_waitcnt vmcnt(0) & expcnt(0)
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB4_3
// BB#4:                                 // %Flow
	s_or_b64 exec, exec, s[6:7]
BB4_2:                                  // %Flow3
	s_or_b64 exec, exec, s[4:5]
// BB#5:                                 // %if.end
	s_add_i32 s0, s20, -1
	v_cmp_eq_i32 vcc, s0, v4
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
// BB#6:                                 // %if.then.9
	v_lshlrev_b32 v0, 2, v3
	v_add_i32 v0, vcc, s14, v0
	tbuffer_load_format_x v0, v0, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v1, 2, v2
	s_waitcnt vmcnt(0)
	v_add_i32 v0, vcc, v0, v5
	v_add_i32 v1, vcc, s15, v1
	tbuffer_store_format_x v0, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
BB4_7:                                  // %if.end.17
	s_or_b64 exec, exec, s[0:1]
	s_endpgm

// ********************* Second kernel starts
// SKBB#0:                                 // %entry

.args
	i32* output 0 uav10 
	i32* input 16 uav11 
	i32* summary 32 uav12 
	i32 stride 48 


// Merge warning: sections do not match
.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 192
	// NumVgprs = 8
	// NumSgprs = 30
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

.global	blockAddition

.text

blockAddition:                          // @blockAddition
// BB#0:                                 // %entry
	s_buffer_load_dword s0, s[8:11], 0x0
	s_buffer_load_dword s1, s[8:11], 0x4
	s_buffer_load_dword s8, s[8:11], 0x8
	s_load_dwordx4 s[16:19], s[2:3], 0x58
	s_load_dwordx4 s[20:23], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x4
	s_buffer_load_dword s3, s[4:7], 0x5
	s_mov_b32 s4, 0xffff
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s2, s4
	s_min_u32 s3, s3, s4
	s_mul_i32 s2, s2, s12
	s_mul_i32 s3, s3, s13
	v_add_i32 v0, vcc, s2, v0
	v_lshlrev_b32 v0, 8, v0
	v_add_i32 v0, vcc, s3, v0
	s_mul_i32 s2, s13, s8
	s_add_i32 s2, s2, s12
	s_lshl_b32 s2, s2, 2
	s_add_i32 s0, s0, s2
	v_add_i32 v0, vcc, v1, v0
	v_mov_b32 v1, s0
	tbuffer_load_format_x v1, v1, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v0, 2, v0
	v_add_i32 v0, vcc, s1, v0
	tbuffer_load_format_x v2, v0, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0)
	v_add_i32 v1, vcc, v1, v2
	tbuffer_store_format_x v1, v0, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

// ********************* Second kernel starts
// SKBB#0:                                 // %entry

.args
	i32* input 0 uav10 
	i32* output 16 uav11 
	i32 stride 32 


.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 76
	// NumVgprs = 3
	// NumSgprs = 26
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

.global	FixOffset

.text

FixOffset:                              // @FixOffset
// BB#0:                                 // %entry
	s_buffer_load_dword s0, s[8:11], 0x0
	s_buffer_load_dword s1, s[8:11], 0x4
	s_load_dwordx4 s[8:11], s[2:3], 0x58
	s_load_dwordx4 s[16:19], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x4
	s_buffer_load_dword s3, s[4:7], 0x5
	s_mov_b32 s4, 0xffff
	s_waitcnt lgkmcnt(0)
	s_min_u32 s2, s2, s4
	s_min_u32 s3, s3, s4
	s_mul_i32 s2, s2, s12
	s_mul_i32 s3, s3, s13
	v_add_i32 v0, vcc, s2, v0
	v_add_i32 v1, vcc, s3, v1
	v_lshlrev_b32 v0, 8, v0
	v_add_i32 v0, vcc, v1, v0
	v_lshlrev_b32 v1, 2, v1
	v_add_i32 v1, vcc, s0, v1
	tbuffer_load_format_x v1, v1, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v0, 2, v0
	v_add_i32 v0, vcc, s1, v0
	tbuffer_load_format_x v2, v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0)
	v_add_i32 v1, vcc, v1, v2
	tbuffer_store_format_x v1, v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

// ********************* Second kernel starts
// SKBB#0:                                 // %entry

.args
	i32* input 0 uav10 
	i32* output 16 uav11 


.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 64
	// NumVgprs = 3
	// NumSgprs = 22
	FloatMode = 192
	IeeeMode = 0

	COMPUTE_PGM_RSRC2:USER_SGPR = 12
	COMPUTE_PGM_RSRC2:TGID_X_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
	COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

