.global binarySearch
.text


binarySearch:                           // @binarySearch
// BB#0:                                 // %entry
  s_buffer_load_dword s7, s[4:7], 0x4
  s_buffer_load_dword s0, s[8:11], 0x0
  s_buffer_load_dword s1, s[8:11], 0x4
  s_buffer_load_dword s4, s[8:11], 0x8
  s_buffer_load_dword s5, s[8:11], 0xc
  s_buffer_load_dword s6, s[8:11], 0x10
  s_waitcnt lgkmcnt(0)
  s_min_u32 s7, s7, 0xffff
  s_load_dwordx4 s[8:11], s[2:3], 0x58
  s_mul_i32 s7, s7, s12
  v_add_i32 v0, vcc, s7, v0
  v_mul_lo_i32 v1, v0, s4
  s_load_dwordx4 s[12:15], s[2:3], 0x50
  v_add_i32 v1, vcc, s5, v1
  v_lshlrev_b32 v1, 2, v1
  v_add_i32 v1, vcc, s1, v1
  s_waitcnt lgkmcnt(0)
  v_nop
  v_nop
  v_nop
  v_nop
  v_nop  
  tbuffer_load_format_x v1, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
  s_waitcnt vmcnt(0)
  v_cmp_ge_u32 vcc, s6, v1
  s_and_saveexec_b64 s[2:3], vcc
  s_xor_b64 s[2:3], exec, s[2:3]
  s_cbranch_execz BB0_4
// BB#1:                                 // %lor.lhs.false
  v_add_i32 v1, vcc, 1, v0
  v_mul_lo_i32 v1, v1, s4
  v_add_i32 v1, vcc, s5, v1
  v_lshlrev_b32 v1, 2, v1
  v_add_i32 v1, vcc, s1, v1
  v_add_i32 v1, vcc, -4, v1
  v_nop
  v_nop
  v_nop
  v_nop
  v_nop  
  tbuffer_load_format_x v1, v1, s[8:11], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
  s_waitcnt vmcnt(0)
  v_cmp_le_u32 vcc, s6, v1
  s_and_saveexec_b64 s[16:17], vcc
  s_xor_b64 s[16:17], exec, s[16:17]
// BB#2:                                 // %if.else
  v_mov_b32 v1, s0
  v_nop
  v_nop
  v_nop
  v_nop
  v_nop  
  tbuffer_load_format_xyzw v[1:4], v1, s[12:15], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
  s_waitcnt vmcnt(0)
  v_mov_b32 v1, v0
  v_mov_b32 v4, 1
  v_mov_b32 v0, s0
  tbuffer_store_format_xyzw v[1:4], v0, s[12:15], 0x0  offen format:[BUF_DATA_FORMAT_32_32_32_32,BUF_NUM_FORMAT_FLOAT]
  s_waitcnt vmcnt(0) & expcnt(0)
BB0_3:                                  // %Flow
  s_or_b64 exec, exec, s[16:17]
BB0_4:                                  // %cleanup
  s_or_b64 exec, exec, s[2:3]
  s_endpgm

.args
  i32[4]* outputArray 0 uav10 
  i32* sortedArray 16 uav11 
  i32 subdivSize 32 
  i32 globalLowerIndex 48 
  i32 findMe 64 

.metadata
  userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
  userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
  userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

  // CodeLenInByte = 132
  // NumVgprs = 5
  // NumSgprs = 20
  FloatMode = 192
  IeeeMode = 0

  COMPUTE_PGM_RSRC2:USER_SGPR = 12
  COMPUTE_PGM_RSRC2:TGID_X_EN = 1
  COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
  COMPUTE_PGM_RSRC2:TGID_Z_EN = 1
.global binarySearch_mulkeys
.text


binarySearch_mulkeys:                   // @binarySearch_mulkeys
// BB#0:                                 // %entry
  s_buffer_load_dword s0, s[8:11], 0x0
  s_buffer_load_dword s1, s[8:11], 0x4
  s_buffer_load_dword s13, s[8:11], 0x8
  s_buffer_load_dword s8, s[8:11], 0xc
  s_load_dwordx4 s[16:19], s[2:3], 0x60
  s_load_dwordx4 s[20:23], s[2:3], 0x58
  s_load_dwordx4 s[24:27], s[2:3], 0x50
  s_waitcnt lgkmcnt(0)
  v_cmp_ne_i32 s[2:3], 0, s13
  s_and_saveexec_b64 s[2:3], s[2:3]
  s_xor_b64 s[2:3], exec, s[2:3]
  s_cbranch_execz BB1_4
// BB#1:                                 // %for.body.lr.ph
  s_buffer_load_dword s9, s[4:7], 0x4
  s_waitcnt lgkmcnt(0)
  s_min_u32 s9, s9, 0xffff
  s_mul_i32 s9, s9, s12
  v_add_i32 v1, vcc, s9, v0
  v_lshlrev_b32 v0, 8, v1
  v_lshlrev_b32 v1, 10, v1
  v_or_b32 v2, 0x3fc, v1
  v_add_i32 v1, vcc, s1, v1
  v_add_i32 v2, vcc, s1, v2
  s_mov_b64 s[10:11], 0
  v_mov_b32 v3, s0
  v_mov_b32 v4, s8
  v_mov_b32 v5, s13
BB1_5:                                  // %for.body
                                        // =>This Inner Loop Header: Depth=1
  v_nop
  v_nop
  v_nop
  v_nop
  v_nop  
  tbuffer_load_format_x v6, v3, s[24:27], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
  v_nop
  v_nop
  v_nop
  v_nop
  v_nop  
  tbuffer_load_format_x v7, v1, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
  s_waitcnt vmcnt(0)
  v_cmp_ge_u32 vcc, v6, v7
  s_and_saveexec_b64 s[14:15], vcc
  s_xor_b64 s[14:15], exec, s[14:15]
// BB#6:                                 // %land.lhs.true
                                        //   in Loop: Header=BB1_5 Depth=1
  v_nop
  v_nop
  v_nop
  v_nop
  v_nop  
  tbuffer_load_format_x v7, v2, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
  s_waitcnt vmcnt(0)
  v_cmp_le_u32 vcc, v6, v7
  s_and_saveexec_b64 s[28:29], vcc
  s_xor_b64 s[28:29], exec, s[28:29]
// BB#7:                                 // %if.then
                                        //   in Loop: Header=BB1_5 Depth=1
  tbuffer_store_format_x v0, v4, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
  s_waitcnt vmcnt(0) & expcnt(0)
BB1_8:                                  // %Flow
                                        //   in Loop: Header=BB1_5 Depth=1
  s_or_b64 exec, exec, s[28:29]
BB1_9:                                  // %for.inc
                                        //   in Loop: Header=BB1_5 Depth=1
  s_or_b64 exec, exec, s[14:15]
  v_add_i32 v3, vcc, 4, v3
  v_add_i32 v4, vcc, 4, v4
  v_add_i32 v5, vcc, -1, v5
  v_cmp_eq_i32 vcc, 0, v5
  s_or_b64 s[10:11], vcc, s[10:11]
  s_andn2_b64 exec, exec, s[10:11]
  s_cbranch_execnz BB1_5
// BB#2:                                 // %Flow4
  s_or_b64 exec, exec, s[10:11]
BB1_4:                                  // %Flow5
  s_or_b64 exec, exec, s[2:3]
// BB#3:                                 // %for.cond.cleanup
  s_endpgm

.args
  i32* keys 0 uav10 
  i32* input 16 uav11 
  i32 numKeys 32 
  i32* output 48 uav12 

.metadata
  userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
  userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
  userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

  // CodeLenInByte = 144
  // NumVgprs = 8
  // NumSgprs = 32
  FloatMode = 192
  IeeeMode = 0

  COMPUTE_PGM_RSRC2:USER_SGPR = 12
  COMPUTE_PGM_RSRC2:TGID_X_EN = 1
  COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
  COMPUTE_PGM_RSRC2:TGID_Z_EN = 1
.global binarySearch_mulkeysConcurrent
.text


binarySearch_mulkeysConcurrent:         // @binarySearch_mulkeysConcurrent
// BB#0:                                 // %entry
  s_buffer_load_dword s24, s[8:11], 0x0
  s_buffer_load_dword s13, s[8:11], 0x4
  s_buffer_load_dword s25, s[8:11], 0x8
  s_buffer_load_dword s26, s[8:11], 0xc
  s_buffer_load_dword s8, s[8:11], 0x10
  s_buffer_load_dword s0, s[4:7], 0x4
  s_load_dwordx4 s[4:7], s[2:3], 0x60
  s_mov_b64 s[10:11], 0
  s_mov_b64 s[14:15], 0
  s_load_dwordx4 s[16:19], s[2:3], 0x58
  s_load_dwordx4 s[20:23], s[2:3], 0x50
  s_waitcnt lgkmcnt(0)
  v_cvt_f32_u32 v1, s26
  s_min_u32 s0, s0, 0xffff
  s_mul_i32 s0, s0, s12
  v_add_i32 v0, vcc, s0, v0
  v_rcp_f32 v1, v1
  v_mul_f32 v1, 0x4f800000, v1
  v_cvt_u32_f32 v1, v1
  v_mul_hi_u32 v2, v1, s26
  v_mul_lo_i32 v3, v1, s26
  v_cmp_eq_i32 s[0:1], 0, v2
  v_sub_i32 v2, vcc, 0, v3
  v_cndmask_b32 v2, v3, v2, s[0:1]
  v_mul_hi_u32 v2, v2, v1
  v_add_i32 v3, vcc, v2, v1
  v_subrev_i32 v1, vcc, v2, v1
  v_cndmask_b32 v2, v1, v3, s[0:1]
  v_mul_hi_u32 v1, v2, v0
  v_mul_lo_i32 v3, v1, s26
  v_subrev_i32 v4, vcc, v3, v0
  v_cmp_ge_u32 vcc, v0, v3
  v_cndmask_b32 v0, 0, -1, vcc
  v_cmp_le_u32 vcc, s26, v4
  v_cndmask_b32 v3, 0, -1, vcc
  v_and_b32 v3, v0, v3
  v_add_i32 v5, vcc, 1, v1
  v_cmp_eq_i32 s[0:1], 0, v3
  v_cndmask_b32 v3, v5, v1, s[0:1]
  v_add_i32 v1, vcc, -1, v1
  v_cmp_eq_i32 s[2:3], 0, v0
  v_cndmask_b32 v0, v3, v1, s[2:3]
  v_lshlrev_b32 v1, 2, v0
  v_add_i32 v1, vcc, s24, v1
  v_nop
  v_nop
  v_nop
  v_nop
  v_nop  
  tbuffer_load_format_x v1, v1, s[20:23], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
  v_mul_hi_u32 v2, v2, s25
  v_mul_lo_i32 v3, v2, s26
  v_subrev_i32 v5, vcc, s26, v4
  v_cndmask_b32 v5, v5, v4, s[0:1]
  v_add_i32 v4, vcc, s26, v4
  v_cndmask_b32 v4, v5, v4, s[2:3]
  v_sub_i32 v5, vcc, s25, v3
  v_cmp_ge_u32 vcc, s25, v3
  v_cndmask_b32 v3, 0, -1, vcc
  v_cmp_le_u32 vcc, s26, v5
  v_cndmask_b32 v5, 0, -1, vcc
  v_and_b32 v5, v3, v5
  v_cmp_eq_i32 s[0:1], 0, v5
  v_add_i32 v5, vcc, 1, v2
  v_cndmask_b32 v5, v5, v2, s[0:1]
  v_add_i32 v2, vcc, -1, v2
  v_cmp_eq_i32 vcc, 0, v3
  v_cndmask_b32 v2, v5, v2, vcc
  v_mul_lo_i32 v5, v2, v4
  v_add_i32 v3, vcc, v2, v5
  v_cmp_ge_i32 vcc, v3, v5
  s_waitcnt vmcnt(0)
  s_and_saveexec_b64 s[0:1], vcc
  s_xor_b64 s[0:1], exec, s[0:1]
  s_cbranch_execz BB2_13
BB2_1:                                  // %while.body.lr.ph
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB2_2 Depth 2
  s_mov_b64 s[2:3], 0
BB2_2:                                  // %while.body
                                        //   Parent Loop BB2_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
  v_mov_b32 v4, v5
  v_add_i32 v2, vcc, v3, v4
  v_lshrrev_b32 v5, 31, v2
  v_add_i32 v2, vcc, v5, v2
  v_ashrrev_i32 v2, 1, v2
  v_lshlrev_b32 v5, 2, v2
  v_add_i32 v5, vcc, s13, v5
  v_nop
  v_nop
  v_nop
  v_nop
  v_nop  
  tbuffer_load_format_x v8, v5, s[16:19], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
  v_mov_b32 v7, 0
  v_mov_b32 v6, -1
  s_waitcnt vmcnt(0)
  v_cmp_ne_i32 vcc, v8, v1
                                        // implicit-def: VGPR5
  s_and_saveexec_b64 s[20:21], vcc
  s_xor_b64 s[20:21], exec, s[20:21]
  s_cbranch_execz BB2_10
// BB#6:                                 // %if.else
                                        //   in Loop: Header=BB2_2 Depth=2
  v_cmp_le_u32 vcc, v8, v1
  v_mov_b32 v7, -1
                                        // implicit-def: VGPR5
  s_and_saveexec_b64 s[22:23], vcc
  s_xor_b64 s[22:23], exec, s[22:23]
// BB#11:                                // %if.else.14
                                        //   in Loop: Header=BB2_2 Depth=2
  v_add_i32 v5, vcc, 1, v2
  v_cmp_lt_i32 vcc, v3, v5
  s_or_b64 s[2:3], vcc, s[2:3]
  v_mov_b32 v7, 0
BB2_7:                                  // %Flow1
                                        //   in Loop: Header=BB2_2 Depth=2
  s_or_b64 exec, exec, s[22:23]
  s_or_b64 s[2:3], s[22:23], s[2:3]
  v_mov_b32 v6, 0
BB2_10:                                 // %Flow
                                        //   in Loop: Header=BB2_2 Depth=2
  s_or_b64 exec, exec, s[20:21]
  s_or_b64 s[2:3], s[20:21], s[2:3]
  s_andn2_b64 exec, exec, s[2:3]
  s_cbranch_execnz BB2_2
// BB#8:                                 // %Flow2
                                        //   in Loop: Header=BB2_1 Depth=1
  s_or_b64 exec, exec, s[2:3]
  v_cmp_ne_i32 vcc, 0, v7
                                        // implicit-def: VGPR3
                                        // implicit-def: VGPR5
  s_and_saveexec_b64 s[2:3], vcc
  s_xor_b64 s[2:3], exec, s[2:3]
// BB#9:                                 // %if.then.13
                                        //   in Loop: Header=BB2_1 Depth=1
  v_add_i32 v3, vcc, -1, v2
  v_cmp_le_i32 vcc, v2, v4
  s_or_b64 s[14:15], vcc, s[14:15]
  v_mov_b32 v5, v4
BB2_3:                                  // %Flow3
                                        //   in Loop: Header=BB2_1 Depth=1
  s_or_b64 exec, exec, s[2:3]
  s_or_b64 s[14:15], s[2:3], s[14:15]
  s_andn2_b64 exec, exec, s[14:15]
  s_cbranch_execnz BB2_1
// BB#4:                                 // %Flow4
  s_or_b64 exec, exec, s[14:15]
  v_cmp_ne_i32 vcc, 0, v6
  s_and_saveexec_b64 s[2:3], vcc
  s_xor_b64 s[2:3], exec, s[2:3]
// BB#5:                                 // %if.then
  v_lshlrev_b32 v0, 2, v0
  v_add_i32 v0, vcc, s8, v0
  tbuffer_store_format_x v2, v0, s[4:7], 0x0  offen format:[BUF_DATA_FORMAT_32,BUF_NUM_FORMAT_FLOAT]
  s_waitcnt vmcnt(0) & expcnt(0)
BB2_12:                                 // %Flow5
  s_or_b64 exec, exec, s[2:3]
BB2_13:                                 // %cleanup
  s_or_b64 exec, exec, s[0:1]
  s_endpgm

.args
  i32* keys 0 uav10 
  i32* input 16 uav11 
  i32 inputSize 32 
  i32 numSubdivisions 48 
  i32* output 64 uav12 

.metadata
  userElements[0] = PTR_UAV_TABLE, 0, s[2:3]
  userElements[1] = IMM_CONST_BUFFER, 0, s[4:7]
  userElements[2] = IMM_CONST_BUFFER, 1, s[8:11]

  // CodeLenInByte = 512
  // NumVgprs = 9
  // NumSgprs = 29
  FloatMode = 192
  IeeeMode = 0

  COMPUTE_PGM_RSRC2:USER_SGPR = 12
  COMPUTE_PGM_RSRC2:TGID_X_EN = 1
  COMPUTE_PGM_RSRC2:TGID_Y_EN = 1
  COMPUTE_PGM_RSRC2:TGID_Z_EN = 1

