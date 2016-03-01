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
	s_mov_b32 m0, -1
	v_lshlrev_b32 v1, 2, v0
	s_waitcnt lgkmcnt(0)
	v_add_i32 v1, vcc, s8, v1
	s_min_u32 s2, s2, 0xffff
	s_mul_i32 s2, s2, s12
	v_add_i32 v0, vcc, s2, v0
	v_lshlrev_b32 v0, 2, v0
	v_mov_b32 v2, 0
	ds_write_b32 v1, v2
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_add_i32 v2, vcc, s0, v0
	tbuffer_load_format_x v2, v2, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_and_b32 s0, s13, 31
	s_waitcnt vmcnt(0)
	v_bfe_u32 v2, v2, s0, 8
	v_lshlrev_b32 v2, 2, v2
	v_add_i32 v2, vcc, s8, v2
	v_add_i32 v0, vcc, s1, v0
	v_mov_b32 v3, -1
	ds_inc_u32 v2, v3
	s_waitcnt lgkmcnt(0)
	s_barrier
	ds_read_b32 v1, v1
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v1, v0, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

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
	v_lshlrev_b32 v3, 9, v0
	v_lshlrev_b32 v4, 2, v2
	v_add_i32 v2, vcc, s13, v3
	v_add_i32 v3, vcc, s0, v4
	s_mov_b64 s[4:5], 0
	v_mov_b32 v4, 0
	s_mov_b32 m0, -1
BB1_2:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	v_add_i32 v5, vcc, v4, v3
	tbuffer_load_format_x v6, v5, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v4, vcc, 64, v4
	v_mov_b32 v7, 0x400
	v_cmp_eq_i32 s[0:1], v7, v4
	v_add_i32 v7, vcc, 2, v2
	v_add_i32 v8, vcc, 4, v2
	v_add_i32 v9, vcc, 6, v2
	v_add_i32 v10, vcc, 8, v2
	v_add_i32 v11, vcc, 10, v2
	v_add_i32 v12, vcc, 12, v2
	v_add_i32 v13, vcc, 14, v2
	v_add_i32 v14, vcc, 16, v2
	v_add_i32 v15, vcc, 18, v2
	v_add_i32 v16, vcc, 20, v2
	v_add_i32 v17, vcc, 22, v2
	v_add_i32 v18, vcc, 24, v2
	v_add_i32 v19, vcc, 26, v2
	v_add_i32 v20, vcc, 28, v2
	v_add_i32 v21, vcc, 30, v2
	v_add_i32 v22, vcc, 4, v5
	v_add_i32 v23, vcc, 8, v5
	v_add_i32 v24, vcc, 12, v5
	v_add_i32 v25, vcc, 16, v5
	v_add_i32 v26, vcc, 20, v5
	v_add_i32 v27, vcc, 24, v5
	v_add_i32 v28, vcc, 28, v5
	v_add_i32 v29, vcc, 32, v5
	v_add_i32 v30, vcc, 36, v5
	v_add_i32 v31, vcc, 40, v5
	v_add_i32 v32, vcc, 44, v5
	v_add_i32 v33, vcc, 48, v5
	v_add_i32 v34, vcc, 52, v5
	v_add_i32 v35, vcc, 56, v5
	v_add_i32 v5, vcc, 60, v5
	tbuffer_load_format_x v22, v22, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	ds_write_b16 v2, v6
	v_add_i32 v2, vcc, 32, v2
	s_waitcnt lgkmcnt(0)
	tbuffer_load_format_x v6, v23, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	ds_write_b16 v7, v22
	tbuffer_load_format_x v7, v24, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	ds_write_b16 v8, v6
	s_waitcnt lgkmcnt(0)
	tbuffer_load_format_x v6, v25, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	ds_write_b16 v9, v7
	s_waitcnt lgkmcnt(0)
	tbuffer_load_format_x v7, v26, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	ds_write_b16 v10, v6
	s_waitcnt lgkmcnt(0)
	tbuffer_load_format_x v6, v27, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	ds_write_b16 v11, v7
	s_waitcnt lgkmcnt(0)
	tbuffer_load_format_x v7, v28, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	ds_write_b16 v12, v6
	s_waitcnt lgkmcnt(0)
	tbuffer_load_format_x v6, v29, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	ds_write_b16 v13, v7
	s_waitcnt lgkmcnt(0)
	tbuffer_load_format_x v7, v30, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	ds_write_b16 v14, v6
	s_waitcnt lgkmcnt(0)
	tbuffer_load_format_x v6, v31, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	ds_write_b16 v15, v7
	s_waitcnt lgkmcnt(0)
	tbuffer_load_format_x v7, v32, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	ds_write_b16 v16, v6
	s_waitcnt lgkmcnt(0)
	tbuffer_load_format_x v6, v33, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	ds_write_b16 v17, v7
	s_waitcnt lgkmcnt(0)
	tbuffer_load_format_x v7, v34, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	ds_write_b16 v18, v6
	s_waitcnt lgkmcnt(0)
	tbuffer_load_format_x v6, v35, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	ds_write_b16 v19, v7
	tbuffer_load_format_x v5, v5, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(1)
	ds_write_b16 v20, v6
	s_waitcnt vmcnt(0)
	ds_write_b16 v21, v5
	s_or_b64 s[4:5], s[0:1], s[4:5]
	s_waitcnt lgkmcnt(0)
	s_andn2_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB1_2
// BB#1:                                 // %for.cond.cleanup
	s_or_b64 exec, exec, s[4:5]
	s_mul_i32 s0, s2, s12
	s_lshl_b32 s0, s0, 8
	v_lshlrev_b32 v0, 8, v0
	v_add_i32 v0, vcc, s0, v0
	v_lshlrev_b32 v0, 2, v0
	s_barrier
	s_and_b32 s2, s15, 31
	v_add_i32 v0, vcc, s14, v0
	s_mov_b64 s[4:5], 0
	v_mov_b32 v2, 0
	s_mov_b32 m0, -1
BB1_4:                                  // %for.body.15
                                        // =>This Inner Loop Header: Depth=1
	v_add_i32 v3, vcc, v2, v0
	tbuffer_load_format_x v3, v3, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v2, vcc, 4, v2
	v_mov_b32 v4, 0x400
	v_cmp_eq_i32 s[0:1], v4, v2
	s_waitcnt vmcnt(0)
	v_bfe_u32 v4, v3, s2, 8
	v_or_b32 v4, v4, v1
	v_lshlrev_b32 v4, 1, v4
	v_add_i32 v4, vcc, s13, v4
	ds_read_u16 v5, v4
	s_waitcnt lgkmcnt(0)
	v_lshlrev_b32 v6, 2, v5
	v_add_i32 v6, vcc, s8, v6
	tbuffer_store_format_x v3, v6, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
	v_add_i32 v3, vcc, 1, v5
	ds_write_b16 v4, v3
	s_waitcnt lgkmcnt(0)
	s_barrier
	s_or_b64 s[4:5], s[0:1], s[4:5]
	s_andn2_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB1_4
// BB#3:                                 // %for.cond.cleanup.14
	s_or_b64 exec, exec, s[4:5]
	s_endpgm

.args
	i32* unsortedData 0 uav10 
	i32* scanedBuckets 16 uav11 
	i32 shiftCount 32 
	i16* sharedBuckets 48 hl
	i32* sortedData 64 uav12 

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 448
	// NumVgprs = 36
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
	s_buffer_load_dword s22, s[8:11], 0x4
	s_buffer_load_dword s15, s[8:11], 0x8
	s_buffer_load_dword s21, s[8:11], 0xc
	s_buffer_load_dword s0, s[8:11], 0x10
	s_buffer_load_dword s20, s[8:11], 0x14
	s_load_dwordx4 s[16:19], s[2:3], 0x60
	s_load_dwordx4 s[24:27], s[2:3], 0x58
	s_load_dwordx4 s[8:11], s[2:3], 0x50
	s_buffer_load_dword s2, s[4:7], 0x0
	s_buffer_load_dword s23, s[4:7], 0x4
	s_buffer_load_dword s4, s[4:7], 0x5
	s_waitcnt lgkmcnt(0)
	v_cvt_f32_u32 v2, s21
	v_rcp_f32 v2, v2
	v_mul_f32 v2, 0x4f800000, v2
	v_cvt_u32_f32 v2, v2
	v_mul_lo_i32 v3, v2, s21
	v_mul_hi_u32 v4, v2, s21
	v_cmp_eq_i32 s[0:1], 0, v4
	v_sub_i32 v4, vcc, 0, v3
	v_cndmask_b32 v3, v3, v4, s[0:1]
	v_mul_hi_u32 v3, v3, v2
	v_subrev_i32 v4, vcc, v3, v2
	v_add_i32 v2, vcc, v3, v2
	v_cndmask_b32 v2, v4, v2, s[0:1]
	v_mul_hi_u32 v2, v2, s2
	v_mul_lo_i32 v3, v2, s21
	v_cmp_ge_u32 s[0:1], s2, v3
	v_sub_i32 v3, vcc, s2, v3
	v_cmp_le_u32 vcc, s21, v3
	v_cndmask_b32 v3, 0, -1, s[0:1]
	v_cmp_eq_i32 s[0:1], 0, v3
	v_cndmask_b32 v4, 0, -1, vcc
	v_and_b32 v3, v3, v4
	v_cmp_eq_i32 s[2:3], 0, v3
	s_mov_b32 s5, 0xffff
	s_min_u32 s6, s23, s5
	s_mul_i32 s6, s6, s12
	s_min_u32 s4, s4, s5
	s_mul_i32 s4, s4, s13
	v_add_i32 v1, vcc, s4, v1
	v_add_i32 v3, vcc, s6, v0
	v_lshlrev_b32 v3, 8, v3
	v_add_i32 v1, vcc, v1, v3
	v_lshlrev_b32 v3, 2, v1
	v_add_i32 v3, vcc, s22, v3
	tbuffer_load_format_x v3, v3, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_lshlrev_b32 v4, 2, v0
	v_add_i32 v5, vcc, 1, v2
	v_cndmask_b32 v5, v5, v2, s[2:3]
	v_add_i32 v6, vcc, -1, v2
	v_add_i32 v2, vcc, s15, v4
	s_mov_b32 m0, -1
	s_waitcnt vmcnt(0)
	ds_write_b32 v2, v3
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32 v3, v5, v6, s[0:1]
	s_barrier
	v_cmp_lt_u32 s[0:1], 1, s21
	s_and_saveexec_b64 s[0:1], s[0:1]
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz BB2_4
// BB#1:                                 // %for.body.lr.ph
	s_mov_b32 m0, -1
	s_mov_b64 s[2:3], 0
	v_mov_b32 v4, s15
	ds_read_b32 v5, v4
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
	s_mov_b32 m0, -1
	v_add_i32 v5, vcc, s15, v5
	ds_read_b32 v6, v2
	ds_read_b32 v5, v5
	s_waitcnt lgkmcnt(0)
	v_add_i32 v5, vcc, v5, v6
BB2_7:                                  // %if.end
                                        //   in Loop: Header=BB2_5 Depth=1
	s_or_b64 exec, exec, s[4:5]
	s_barrier
	s_mov_b32 m0, -1
	ds_write_b32 v2, v5
	v_lshlrev_b32 v4, 1, v4
	v_cmp_le_u32 vcc, s21, v4
	s_waitcnt lgkmcnt(0)
	s_barrier
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
	v_lshlrev_b32 v2, 2, v2
	v_add_i32 v2, vcc, s20, v2
	v_mov_b32 v3, s0
	ds_read_b32 v3, v3
	s_waitcnt lgkmcnt(0)
	tbuffer_store_format_x v3, v2, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_cmp_ne_i32 vcc, 0, v0
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

.args
	i32* output 0 uav10 
	i32* input 16 uav11 
	i32* block 32 hl
	i32 block_size 48 
	i32 stride 64 
	i32* sumBuffer 80 uav12 

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 420
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
	v_add_i32 v2, vcc, s1, v2
	s_mov_b32 m0, -1
	s_waitcnt vmcnt(0)
	ds_write_b32 v2, v3
	v_cmp_lt_u32 s[2:3], 1, s13
	s_waitcnt lgkmcnt(0)
	s_and_saveexec_b64 s[2:3], s[2:3]
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz BB3_4
// BB#1:                                 // %for.body.lr.ph
	s_mov_b32 m0, -1
	s_mov_b64 s[4:5], 0
	v_mov_b32 v3, s1
	ds_read_b32 v4, v3
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
	s_mov_b32 m0, -1
	v_add_i32 v4, vcc, s1, v4
	ds_read_b32 v5, v2
	ds_read_b32 v4, v4
	s_waitcnt lgkmcnt(0)
	v_add_i32 v4, vcc, v4, v5
BB3_7:                                  // %if.end
                                        //   in Loop: Header=BB3_5 Depth=1
	s_or_b64 exec, exec, s[6:7]
	s_barrier
	s_mov_b32 m0, -1
	ds_write_b32 v2, v4
	v_lshlrev_b32 v3, 1, v3
	v_cmp_le_u32 vcc, s13, v3
	s_waitcnt lgkmcnt(0)
	s_barrier
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
	s_mov_b32 s3, 0xffff
	s_waitcnt lgkmcnt(0)
	s_min_u32 s1, s1, s3
	s_buffer_load_dword s4, s[4:7], 0x5
	s_mul_i32 s2, s1, s12
	v_add_i32 v2, vcc, s2, v0
	v_mov_b32 v3, 0
	s_waitcnt lgkmcnt(0)
	s_min_u32 s1, s4, s3
	s_mul_i32 s3, s1, s13
	v_add_i32 v4, vcc, s3, v1
	v_mul_lo_i32 v5, v4, s20
	v_add_i32 v5, vcc, v5, v2
	v_lshlrev_b32 v6, 2, v5
	v_add_i32 v6, vcc, s0, v6
	tbuffer_store_format_x v3, v6, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_cmp_lt_i32 vcc, 0, v2
	s_waitcnt vmcnt(0) & expcnt(0)
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execz BB4_2
// BB#1:                                 // %for.body.preheader
	v_add_i32 v1, vcc, s3, v1
	v_mul_lo_i32 v1, s20, v1
	v_lshlrev_b32 v1, 2, v1
	v_add_i32 v0, vcc, s2, v0
	v_add_i32 v1, vcc, s14, v1
	s_mov_b64 s[6:7], 0
	v_mov_b32 v3, 0
BB4_3:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
	tbuffer_load_format_x v7, v1, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0)
	v_add_i32 v3, vcc, v7, v3
	tbuffer_store_format_x v3, v6, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	v_add_i32 v0, vcc, -1, v0
	v_cmp_eq_i32 s[0:1], 0, v0
	v_add_i32 v1, vcc, 4, v1
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
	v_cmp_eq_i32 vcc, s0, v2
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
// BB#6:                                 // %if.then.9
	v_lshlrev_b32 v0, 2, v5
	v_add_i32 v0, vcc, s14, v0
	tbuffer_load_format_x v0, v0, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0)
	v_add_i32 v0, vcc, v0, v3
	v_lshlrev_b32 v1, 2, v4
	v_add_i32 v1, vcc, s15, v1
	tbuffer_store_format_x v0, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0) & expcnt(0)
BB4_7:                                  // %if.end.17
	s_or_b64 exec, exec, s[0:1]
	s_endpgm

.args
	i32* output 0 uav10 
	i32* input 16 uav11 
	i32* summary 32 uav12 
	i32 stride 48 

.metadata
	userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
	userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
	userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

	// CodeLenInByte = 196
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
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s4, s13, s8
	s_add_i32 s4, s4, s12
	s_lshl_b32 s4, s4, 2
	s_add_i32 s0, s0, s4
	v_mov_b32 v2, s0
	tbuffer_load_format_x v2, v2, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_mov_b32 s0, 0xffff
	s_min_u32 s2, s2, s0
	s_mul_i32 s2, s2, s12
	v_add_i32 v0, vcc, s2, v0
	s_min_u32 s0, s3, s0
	s_mul_i32 s0, s0, s13
	v_lshlrev_b32 v0, 8, v0
	v_add_i32 v0, vcc, s0, v0
	v_add_i32 v0, vcc, v1, v0
	v_lshlrev_b32 v0, 2, v0
	v_add_i32 v0, vcc, s1, v0
	tbuffer_load_format_x v1, v0, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0)
	v_add_i32 v1, vcc, v2, v1
	tbuffer_store_format_x v1, v0, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

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
	s_min_u32 s3, s3, s4
	s_mul_i32 s3, s3, s13
	v_add_i32 v1, vcc, s3, v1
	v_lshlrev_b32 v2, 2, v1
	v_add_i32 v2, vcc, s0, v2
	tbuffer_load_format_x v2, v2, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_min_u32 s0, s2, s4
	s_mul_i32 s0, s0, s12
	v_add_i32 v0, vcc, s0, v0
	v_lshlrev_b32 v0, 8, v0
	v_add_i32 v0, vcc, v1, v0
	v_lshlrev_b32 v0, 2, v0
	v_add_i32 v0, vcc, s1, v0
	tbuffer_load_format_x v1, v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_waitcnt vmcnt(0)
	v_add_i32 v1, vcc, v2, v1
	tbuffer_store_format_x v1, v0, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
	s_endpgm

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

