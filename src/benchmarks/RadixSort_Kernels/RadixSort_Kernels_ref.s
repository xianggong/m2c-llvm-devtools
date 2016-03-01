	.text
	.section	.AMDGPU.config
.long	47176
.long	786561
.long	47180
.long	6024
.long	47200
.long	0
	.hsa_code_object_version 1,0
	.hsa_code_object_isa 0,0,0,"AMD","AMDGPU"
	.text
	.globl	histogram
histogram:                              ; @histogram
; BB#0:                                 ; %entry
	s_load_dword s2, s[0:1], 0x6
	s_load_dwordx2 s[8:9], s[0:1], 0x9
	s_load_dwordx2 s[12:13], s[0:1], 0xb
	s_load_dword s3, s[0:1], 0xd
	s_load_dword s0, s[0:1], 0xe
	v_lshlrev_b32_e32 v1, 2, v0
	v_mov_b32_e32 v2, 0
	s_mov_b32 s11, 0xf000
	s_mov_b32 s10, 0
	s_mov_b32 m0, -1
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s1, s2, s4
	v_add_i32_e32 v3, vcc, s1, v0
	v_ashrrev_i32_e32 v4, 31, v3
	v_lshl_b64 v[3:4], v[3:4], 2
	v_add_i32_e32 v0, vcc, s0, v1
	ds_write_b32 v0, v2
	s_waitcnt lgkmcnt(0)
	s_barrier
	buffer_load_dword v1, v[3:4], s[8:11], 0 addr64
	s_and_b32 s1, s3, 31
	s_waitcnt vmcnt(0)
	v_bfe_u32 v1, v1, s1, 8
	v_lshlrev_b32_e32 v1, 2, v1
	v_add_i32_e32 v1, vcc, s0, v1
	v_mov_b32_e32 v2, -1
	ds_inc_u32 v1, v2
	s_waitcnt lgkmcnt(0)
	s_barrier
	ds_read_b32 v0, v0
	s_mov_b64 s[14:15], s[10:11]
	s_waitcnt lgkmcnt(0)
	buffer_store_dword v0, v[3:4], s[12:15], 0 addr64
	s_endpgm

	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 88
; NumSgprs: 18
; NumVgprs: 5
; FloatMode: 192
; IeeeMode: 0
; ScratchSize: 0
	.section	.AMDGPU.config
.long	47176
.long	786565
.long	47180
.long	6024
.long	47200
.long	0
	.hsa_code_object_version 1,0
	.hsa_code_object_isa 0,0,0,"AMD","AMDGPU"
	.text
	.globl	permute
permute:                                ; @permute
; BB#0:                                 ; %entry
	s_load_dword s3, s[0:1], 0x6
	s_load_dwordx2 s[6:7], s[0:1], 0x9
	s_load_dwordx2 s[12:13], s[0:1], 0xb
	s_load_dword s5, s[0:1], 0xd
	s_load_dword s2, s[0:1], 0xe
	s_load_dwordx2 s[8:9], s[0:1], 0xf
	v_lshlrev_b32_e32 v1, 8, v0
	s_mov_b32 s14, 0
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s0, s4, s3
	s_lshl_b32 s0, s0, 8
	v_mov_b32_e32 v2, 0
	s_mov_b32 s1, s14
	v_add_i32_e32 v3, vcc, s0, v1
	v_addc_u32_e32 v4, vcc, 0, v2, vcc
	s_mov_b32 s1, -1
	s_movk_i32 s0, 0xff00
	v_lshlrev_b32_e32 v2, 9, v0
	v_add_i32_e32 v2, vcc, s2, v2
	v_mov_b32_e32 v4, s0
	v_mov_b32_e32 v5, s1
	s_mov_b32 s15, 0xf000
	s_mov_b64 s[10:11], 0
	s_mov_b32 m0, -1
BB1_2:                                  ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	v_add_i32_e32 v6, vcc, v4, v3
	v_add_i32_e32 v7, vcc, v4, v3
	v_add_i32_e32 v8, vcc, v4, v3
	v_add_i32_e32 v9, vcc, v4, v3
	v_add_i32_e32 v10, vcc, v4, v3
	v_add_i32_e32 v11, vcc, v4, v3
	v_add_i32_e32 v12, vcc, v4, v3
	v_add_i32_e32 v13, vcc, v4, v3
	v_add_i32_e32 v14, vcc, 0x100, v6
	v_add_i32_e32 v6, vcc, 0x101, v7
	v_add_i32_e32 v16, vcc, 0x102, v8
	v_add_i32_e32 v8, vcc, 0x103, v9
	v_add_i32_e32 v18, vcc, 0x104, v10
	v_add_i32_e32 v10, vcc, 0x105, v11
	v_add_i32_e32 v20, vcc, 0x106, v12
	v_add_i32_e32 v12, vcc, 0x107, v13
	v_ashrrev_i32_e32 v15, 31, v14
	v_ashrrev_i32_e32 v7, 31, v6
	v_ashrrev_i32_e32 v17, 31, v16
	v_ashrrev_i32_e32 v9, 31, v8
	v_ashrrev_i32_e32 v19, 31, v18
	v_ashrrev_i32_e32 v11, 31, v10
	v_ashrrev_i32_e32 v21, 31, v20
	v_ashrrev_i32_e32 v13, 31, v12
	v_lshl_b64 v[14:15], v[14:15], 2
	v_lshl_b64 v[6:7], v[6:7], 2
	v_lshl_b64 v[16:17], v[16:17], 2
	v_lshl_b64 v[8:9], v[8:9], 2
	v_lshl_b64 v[18:19], v[18:19], 2
	v_lshl_b64 v[10:11], v[10:11], 2
	v_lshl_b64 v[20:21], v[20:21], 2
	v_lshl_b64 v[12:13], v[12:13], 2
	buffer_load_dword v14, v[14:15], s[12:15], 0 addr64
	buffer_load_dword v6, v[6:7], s[12:15], 0 addr64
	buffer_load_dword v7, v[16:17], s[12:15], 0 addr64
	buffer_load_dword v8, v[8:9], s[12:15], 0 addr64
	buffer_load_dword v9, v[18:19], s[12:15], 0 addr64
	buffer_load_dword v10, v[10:11], s[12:15], 0 addr64
	buffer_load_dword v11, v[20:21], s[12:15], 0 addr64
	buffer_load_dword v12, v[12:13], s[12:15], 0 addr64
	v_add_i32_e32 v13, vcc, 2, v2
	v_add_i32_e32 v15, vcc, 4, v2
	v_add_i32_e32 v16, vcc, 6, v2
	v_add_i32_e32 v17, vcc, 8, v2
	v_add_i32_e32 v18, vcc, 10, v2
	v_add_i32_e32 v19, vcc, 12, v2
	v_add_i32_e32 v20, vcc, 14, v2
	v_add_i32_e32 v4, vcc, 8, v4
	v_addc_u32_e32 v5, vcc, 0, v5, vcc
	s_waitcnt vmcnt(7)
	ds_write_b16 v2, v14
	v_cmp_eq_i64_e64 s[0:1], 0, v[4:5]
	s_waitcnt vmcnt(6)
	ds_write_b16 v13, v6
	s_waitcnt vmcnt(5)
	ds_write_b16 v15, v7
	s_waitcnt vmcnt(4)
	ds_write_b16 v16, v8
	s_waitcnt vmcnt(3)
	ds_write_b16 v17, v9
	s_waitcnt vmcnt(2)
	ds_write_b16 v18, v10
	s_waitcnt vmcnt(1)
	ds_write_b16 v19, v11
	s_waitcnt vmcnt(0)
	ds_write_b16 v20, v12
	v_add_i32_e32 v2, vcc, 16, v2
	s_or_b64 s[10:11], s[0:1], s[10:11]
	s_waitcnt lgkmcnt(0)
	s_andn2_b64 exec, exec, s[10:11]
	s_cbranch_execnz BB1_2
; BB#1:                                 ; %for.cond.cleanup
	s_or_b64 exec, exec, s[10:11]
	s_barrier
	s_mul_i32 s0, s3, s4
	v_add_i32_e32 v0, vcc, s0, v0
	v_lshlrev_b32_e32 v2, 8, v0
	v_ashrrev_i32_e32 v3, 31, v2
	s_mov_b64 s[12:13], 0
	v_lshl_b64 v[3:4], v[2:3], 2
	v_add_i32_e32 v2, vcc, s6, v3
	s_and_b32 s0, s5, 31
	v_mov_b32_e32 v0, s7
	v_addc_u32_e32 v3, vcc, v4, v0, vcc
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	s_mov_b32 s15, 0xf000
	s_mov_b32 s14, 0
	s_mov_b32 s6, 0xffff
	s_movk_i32 s16, 0x400
	s_mov_b64 s[4:5], s[12:13]
	s_mov_b32 m0, -1
BB1_4:                                  ; %for.body.15
                                        ; =>This Inner Loop Header: Depth=1
	v_mov_b32_e32 v4, s14
	v_mov_b32_e32 v5, s15
	v_add_i32_e32 v4, vcc, v2, v6
	v_addc_u32_e32 v5, vcc, v3, v7, vcc
	buffer_load_dword v0, v[4:5], s[12:15], 0 addr64
	s_waitcnt vmcnt(0)
	v_bfe_u32 v4, v0, s0, 8
	v_or_b32_e32 v4, v4, v1
	v_lshlrev_b32_e32 v4, 1, v4
	v_add_i32_e32 v4, vcc, s2, v4
	ds_read_u16 v8, v4
	v_mov_b32_e32 v9, 0
	s_waitcnt lgkmcnt(0)
	v_add_i32_e32 v5, vcc, 1, v8
	ds_write_b16 v4, v5
	s_mov_b32 s7, s14
	v_and_b32_e32 v4, s6, v8
	s_waitcnt lgkmcnt(0)
	v_and_b32_e32 v5, s7, v9
	s_mov_b64 s[10:11], s[14:15]
	v_lshl_b64 v[4:5], v[4:5], 2
	buffer_store_dword v0, v[4:5], s[8:11], 0 addr64
	s_waitcnt vmcnt(0) & expcnt(0)
	s_barrier
	s_mov_b32 s17, s14
	v_add_i32_e32 v6, vcc, 4, v6
	v_addc_u32_e32 v7, vcc, 0, v7, vcc
	v_cmp_eq_i64_e32 vcc, s[16:17], v[6:7]
	s_or_b64 s[4:5], vcc, s[4:5]
	s_andn2_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB1_4
; BB#3:                                 ; %for.cond.cleanup.14
	s_or_b64 exec, exec, s[4:5]
	s_endpgm

	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 468
; NumSgprs: 20
; NumVgprs: 22
; FloatMode: 192
; IeeeMode: 0
; ScratchSize: 0
	.section	.AMDGPU.config
.long	47176
.long	786561
.long	47180
.long	6024
.long	47200
.long	0
	.hsa_code_object_version 1,0
	.hsa_code_object_isa 0,0,0,"AMD","AMDGPU"
	.text
	.globl	ScanArraysdim2
ScanArraysdim2:                         ; @ScanArraysdim2
; BB#0:                                 ; %entry
	s_load_dword s2, s[0:1], 0x6
	s_load_dword s3, s[0:1], 0x7
	s_load_dwordx2 s[12:13], s[0:1], 0xb
	s_load_dword s8, s[0:1], 0xd
	s_mov_b32 s14, 0
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s2, s2, s4
	s_mul_i32 s3, s3, s5
	v_add_i32_e32 v2, vcc, s2, v0
	v_add_i32_e32 v1, vcc, s3, v1
	v_lshlrev_b32_e32 v2, 8, v2
	v_add_i32_e32 v1, vcc, v1, v2
	v_ashrrev_i32_e32 v2, 31, v1
	v_lshl_b64 v[3:4], v[1:2], 2
	s_mov_b32 s15, 0xf000
	buffer_load_dword v4, v[3:4], s[12:15], 0 addr64
	v_lshlrev_b32_e32 v3, 2, v0
	v_add_i32_e32 v3, vcc, s8, v3
	s_mov_b32 m0, -1
	s_waitcnt vmcnt(0)
	ds_write_b32 v3, v4
	s_waitcnt lgkmcnt(0)
	s_barrier
	s_load_dword s9, s[0:1], 0xe
	s_waitcnt lgkmcnt(0)
	v_cvt_f32_u32_e32 v4, s9
	v_rcp_iflag_f32_e32 v4, v4
	v_mul_f32_e32 v4, 0x4f800000, v4
	v_cvt_u32_f32_e32 v4, v4
	v_mul_hi_u32 v5, v4, s9
	v_mul_lo_i32 v6, v4, s9
	s_load_dword s6, s[0:1], 0x3
	v_cmp_eq_i32_e64 s[2:3], 0, v5
	v_sub_i32_e32 v5, vcc, 0, v6
	v_cndmask_b32_e64 v5, v6, v5, s[2:3]
	v_mul_hi_u32 v5, v5, v4
	v_add_i32_e32 v6, vcc, v5, v4
	v_subrev_i32_e32 v4, vcc, v5, v4
	v_cndmask_b32_e64 v4, v4, v6, s[2:3]
	s_waitcnt lgkmcnt(0)
	v_mul_hi_u32 v4, v4, s6
	v_mul_lo_i32 v5, v4, s9
	v_cmp_ge_u32_e32 vcc, s6, v5
	v_cndmask_b32_e64 v6, 0, -1, vcc
	v_sub_i32_e32 v5, vcc, s6, v5
	v_cmp_le_u32_e32 vcc, s9, v5
	v_cndmask_b32_e64 v5, 0, -1, vcc
	v_and_b32_e32 v5, v6, v5
	v_cmp_eq_i32_e64 s[2:3], 0, v5
	v_cmp_eq_i32_e64 s[6:7], 0, v6
	v_add_i32_e32 v5, vcc, 1, v4
	v_cndmask_b32_e64 v5, v5, v4, s[2:3]
	v_add_i32_e32 v4, vcc, -1, v4
	v_cndmask_b32_e64 v4, v5, v4, s[6:7]
	v_cmp_lt_u32_e64 s[2:3], 1, s9
	s_and_saveexec_b64 s[2:3], s[2:3]
	s_xor_b64 s[2:3], exec, s[2:3]
	s_cbranch_execz BB2_4
; BB#1:                                 ; %for.body.lr.ph
	s_mov_b32 m0, -1
	v_mov_b32_e32 v5, s8
	ds_read_b32 v6, v5
	s_mov_b64 s[6:7], 0
	v_mov_b32_e32 v5, 1
	s_waitcnt lgkmcnt(0)
BB2_5:                                  ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	v_cmp_ge_i32_e32 vcc, v0, v5
	s_and_saveexec_b64 s[10:11], vcc
	s_xor_b64 s[10:11], exec, s[10:11]
; BB#6:                                 ; %if.then
                                        ;   in Loop: Header=BB2_5 Depth=1
	v_subrev_i32_e32 v6, vcc, v5, v0
	v_lshlrev_b32_e32 v6, 2, v6
	v_add_i32_e32 v6, vcc, s8, v6
	s_mov_b32 m0, -1
	ds_read_b32 v6, v6
	ds_read_b32 v7, v3
	s_waitcnt lgkmcnt(0)
	v_add_i32_e32 v6, vcc, v6, v7
BB2_7:                                  ; %if.end
                                        ;   in Loop: Header=BB2_5 Depth=1
	s_or_b64 exec, exec, s[10:11]
	s_mov_b32 m0, -1
	s_barrier
	ds_write_b32 v3, v6
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_lshlrev_b32_e32 v5, 1, v5
	v_cmp_le_u32_e32 vcc, s9, v5
	s_or_b64 s[6:7], vcc, s[6:7]
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB2_5
; BB#2:                                 ; %Flow
	s_or_b64 exec, exec, s[6:7]
BB2_4:                                  ; %Flow1
	s_or_b64 exec, exec, s[2:3]
	s_load_dwordx2 s[12:13], s[0:1], 0x9
	s_load_dwordx2 s[16:17], s[0:1], 0x11
	v_mul_lo_i32 v3, v4, s5
	v_add_i32_e32 v3, vcc, s4, v3
	s_waitcnt lgkmcnt(0)
; BB#3:                                 ; %for.cond.cleanup
	s_lshl_b32 s0, s9, 2
	s_add_i32 s0, s0, s8
	s_add_i32 s0, s0, -4
	s_mov_b32 m0, -1
	v_mov_b32_e32 v4, s0
	ds_read_b32 v5, v4
	v_ashrrev_i32_e32 v4, 31, v3
	s_mov_b32 s19, 0xf000
	s_mov_b32 s18, 0
	v_lshl_b64 v[3:4], v[3:4], 2
	s_waitcnt lgkmcnt(0)
	buffer_store_dword v5, v[3:4], s[16:19], 0 addr64
	v_cmp_ne_i32_e32 vcc, 0, v0
	v_mov_b32_e32 v3, 0
	s_waitcnt vmcnt(0) & expcnt(0)
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
; BB#8:                                 ; %if.else
	v_lshlrev_b32_e32 v0, 2, v0
	v_add_i32_e32 v0, vcc, s8, v0
	v_add_i32_e32 v0, vcc, -4, v0
	s_mov_b32 m0, -1
	ds_read_b32 v3, v0
	s_waitcnt lgkmcnt(0)
BB2_9:                                  ; %if.end.27
	s_or_b64 exec, exec, s[0:1]
	v_lshl_b64 v[0:1], v[1:2], 2
	s_mov_b64 s[14:15], s[18:19]
	buffer_store_dword v3, v[0:1], s[12:15], 0 addr64
	s_endpgm

	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 428
; NumSgprs: 22
; NumVgprs: 8
; FloatMode: 192
; IeeeMode: 0
; ScratchSize: 0
	.section	.AMDGPU.config
.long	47176
.long	786497
.long	47180
.long	6024
.long	47200
.long	0
	.hsa_code_object_version 1,0
	.hsa_code_object_isa 0,0,0,"AMD","AMDGPU"
	.text
	.globl	ScanArraysdim1
ScanArraysdim1:                         ; @ScanArraysdim1
; BB#0:                                 ; %entry
	s_load_dword s5, s[0:1], 0x6
	s_load_dwordx2 s[8:9], s[0:1], 0xb
	s_load_dword s2, s[0:1], 0xd
	s_load_dword s3, s[0:1], 0xe
	s_mov_b32 s11, 0xf000
	s_mov_b32 s10, 0
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s4, s5, s4
	v_add_i32_e32 v1, vcc, s4, v0
	v_ashrrev_i32_e32 v2, 31, v1
	v_lshl_b64 v[3:4], v[1:2], 2
	buffer_load_dword v4, v[3:4], s[8:11], 0 addr64
	v_lshlrev_b32_e32 v3, 2, v0
	s_mov_b32 m0, -1
	v_add_i32_e32 v3, vcc, s2, v3
	s_waitcnt vmcnt(0)
	ds_write_b32 v3, v4
	v_cmp_lt_u32_e64 s[4:5], 1, s3
	s_waitcnt lgkmcnt(0)
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execz BB3_4
; BB#1:                                 ; %for.body.lr.ph
	s_mov_b32 m0, -1
	v_mov_b32_e32 v4, s2
	ds_read_b32 v5, v4
	s_mov_b64 s[6:7], 0
	v_mov_b32_e32 v4, 1
	s_waitcnt lgkmcnt(0)
BB3_5:                                  ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	v_cmp_ge_i32_e32 vcc, v0, v4
	s_and_saveexec_b64 s[8:9], vcc
	s_xor_b64 s[8:9], exec, s[8:9]
; BB#6:                                 ; %if.then
                                        ;   in Loop: Header=BB3_5 Depth=1
	v_subrev_i32_e32 v5, vcc, v4, v0
	v_lshlrev_b32_e32 v5, 2, v5
	v_add_i32_e32 v5, vcc, s2, v5
	s_mov_b32 m0, -1
	ds_read_b32 v5, v5
	ds_read_b32 v6, v3
	s_waitcnt lgkmcnt(0)
	v_add_i32_e32 v5, vcc, v5, v6
BB3_7:                                  ; %if.end
                                        ;   in Loop: Header=BB3_5 Depth=1
	s_or_b64 exec, exec, s[8:9]
	s_mov_b32 m0, -1
	s_barrier
	ds_write_b32 v3, v5
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_lshlrev_b32_e32 v4, 1, v4
	v_cmp_le_u32_e32 vcc, s3, v4
	s_or_b64 s[6:7], vcc, s[6:7]
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB3_5
; BB#2:                                 ; %Flow
	s_or_b64 exec, exec, s[6:7]
BB3_4:                                  ; %Flow1
	s_or_b64 exec, exec, s[4:5]
	s_load_dwordx2 s[8:9], s[0:1], 0x9
	s_waitcnt lgkmcnt(0)
; BB#3:                                 ; %for.cond.cleanup
	v_cmp_ne_i32_e32 vcc, 0, v0
	v_mov_b32_e32 v3, 0
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
; BB#8:                                 ; %if.else
	v_lshlrev_b32_e32 v0, 2, v0
	v_add_i32_e32 v0, vcc, s2, v0
	v_add_i32_e32 v0, vcc, -4, v0
	s_mov_b32 m0, -1
	ds_read_b32 v3, v0
	s_waitcnt lgkmcnt(0)
BB3_9:                                  ; %if.end.15
	s_or_b64 exec, exec, s[0:1]
	v_lshl_b64 v[0:1], v[1:2], 2
	s_mov_b32 s11, 0xf000
	s_mov_b32 s10, 0
	buffer_store_dword v3, v[0:1], s[8:11], 0 addr64
	s_endpgm

	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 188
; NumSgprs: 14
; NumVgprs: 7
; FloatMode: 192
; IeeeMode: 0
; ScratchSize: 0
	.section	.AMDGPU.config
.long	47176
.long	786563
.long	47180
.long	6024
.long	47200
.long	0
	.hsa_code_object_version 1,0
	.hsa_code_object_isa 0,0,0,"AMD","AMDGPU"
	.text
	.globl	prefixSum
prefixSum:                              ; @prefixSum
; BB#0:                                 ; %entry
	s_load_dword s2, s[0:1], 0x7
	s_load_dword s6, s[0:1], 0xf
	s_load_dword s3, s[0:1], 0x6
	s_load_dwordx2 s[12:13], s[0:1], 0x9
	s_load_dwordx2 s[8:9], s[0:1], 0xb
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s5, s2, s5
	v_add_i32_e32 v2, vcc, s5, v1
	v_mul_lo_i32 v3, v2, s6
	s_mul_i32 s4, s3, s4
	v_add_i32_e32 v5, vcc, s4, v0
	v_add_i32_e32 v3, vcc, v3, v5
	v_ashrrev_i32_e32 v4, 31, v3
	v_mov_b32_e32 v6, s13
	v_lshl_b64 v[9:10], v[3:4], 2
	v_add_i32_e32 v7, vcc, s12, v9
	v_addc_u32_e32 v8, vcc, v10, v6, vcc
	s_mov_b32 s15, 0xf000
	s_mov_b32 s14, 0
	v_mov_b32_e32 v6, 0
	buffer_store_dword v6, v[9:10], s[12:15], 0 addr64
	v_cmp_lt_i32_e32 vcc, 0, v5
	s_waitcnt vmcnt(0) & expcnt(0)
	s_and_saveexec_b64 s[10:11], vcc
	s_xor_b64 s[10:11], exec, s[10:11]
	s_cbranch_execz BB4_2
; BB#1:                                 ; %for.body.lr.ph
	v_add_i32_e32 v1, vcc, s5, v1
	v_mul_lo_i32 v9, s6, v1
	v_add_i32_e32 v0, vcc, s4, v0
	v_mov_b32_e32 v1, s9
	v_ashrrev_i32_e32 v10, 31, v9
	v_lshl_b64 v[9:10], v[9:10], 2
	v_add_i32_e32 v11, vcc, s8, v9
	v_addc_u32_e32 v12, vcc, v10, v1, vcc
	s_mov_b64 s[12:13], 0
	v_mov_b32_e32 v6, 0
	s_mov_b64 s[16:17], s[12:13]
BB4_3:                                  ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	v_mov_b32_e32 v13, -1
	v_mov_b32_e32 v14, s15
	buffer_load_dword v1, v[11:12], s[12:15], 0 addr64
	v_mov_b32_e32 v10, s15
	v_add_i32_e32 v0, vcc, -1, v0
	v_mov_b32_e32 v9, v13
	v_cmp_eq_i32_e64 s[2:3], 0, v0
	s_waitcnt vmcnt(0)
	v_add_i32_e32 v6, vcc, v1, v6
	buffer_store_dword v6, v[7:8], s[12:15], 0 addr64
	v_add_i32_e32 v11, vcc, 4, v11
	v_addc_u32_e32 v12, vcc, 0, v12, vcc
	s_or_b64 s[16:17], s[2:3], s[16:17]
	s_waitcnt vmcnt(0) & expcnt(0)
	s_andn2_b64 exec, exec, s[16:17]
	s_cbranch_execnz BB4_3
; BB#4:                                 ; %Flow
	s_or_b64 exec, exec, s[16:17]
BB4_2:                                  ; %Flow3
	s_or_b64 exec, exec, s[10:11]
	s_load_dwordx2 s[0:1], s[0:1], 0xd
	s_waitcnt lgkmcnt(0)
; BB#5:                                 ; %if.end
	s_add_i32 s2, s6, -1
	v_cmp_eq_i32_e32 vcc, s2, v5
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[4:5], exec, s[4:5]
; BB#6:                                 ; %if.then.9
	v_lshl_b64 v[0:1], v[3:4], 2
	s_mov_b32 s11, 0xf000
	s_mov_b32 s10, 0
	buffer_load_dword v0, v[0:1], s[8:11], 0 addr64
	v_ashrrev_i32_e32 v3, 31, v2
	s_mov_b64 s[2:3], s[10:11]
	s_waitcnt vmcnt(0)
	v_add_i32_e32 v0, vcc, v0, v6
	v_lshl_b64 v[1:2], v[2:3], 2
	buffer_store_dword v0, v[1:2], s[0:3], 0 addr64
	s_waitcnt vmcnt(0) & expcnt(0)
BB4_7:                                  ; %if.end.17
	s_or_b64 exec, exec, s[4:5]
	s_endpgm

	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 244
; NumSgprs: 20
; NumVgprs: 15
; FloatMode: 192
; IeeeMode: 0
; ScratchSize: 0
	.section	.AMDGPU.config
.long	47176
.long	786560
.long	47180
.long	6024
.long	47200
.long	0
	.hsa_code_object_version 1,0
	.hsa_code_object_isa 0,0,0,"AMD","AMDGPU"
	.text
	.globl	blockAddition
blockAddition:                          ; @blockAddition
; BB#0:                                 ; %entry
	s_load_dword s2, s[0:1], 0x6
	s_load_dword s3, s[0:1], 0x7
	s_load_dword s6, s[0:1], 0xd
	s_load_dwordx2 s[8:9], s[0:1], 0x9
	s_load_dwordx2 s[12:13], s[0:1], 0xb
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s0, s2, s4
	s_mul_i32 s1, s3, s5
	s_mul_i32 s2, s5, s6
	v_add_i32_e32 v0, vcc, s0, v0
	s_add_i32 s2, s2, s4
	v_lshlrev_b32_e32 v0, 8, v0
	s_ashr_i32 s3, s2, 31
	v_add_i32_e32 v0, vcc, s1, v0
	s_lshl_b64 s[0:1], s[2:3], 2
	v_add_i32_e32 v0, vcc, v1, v0
	s_mov_b32 s11, 0xf000
	s_mov_b32 s10, 0
	v_mov_b32_e32 v1, s0
	v_mov_b32_e32 v2, s1
	buffer_load_dword v2, v[1:2], s[8:11], 0 addr64
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshl_b64 v[0:1], v[0:1], 2
	s_mov_b64 s[14:15], s[10:11]
	buffer_load_dword v3, v[0:1], s[12:15], 0 addr64
	s_waitcnt vmcnt(0)
	v_add_i32_e32 v2, vcc, v2, v3
	buffer_store_dword v2, v[0:1], s[12:15], 0 addr64
	s_endpgm

	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 76
; NumSgprs: 18
; NumVgprs: 4
; FloatMode: 192
; IeeeMode: 0
; ScratchSize: 0
	.section	.AMDGPU.config
.long	47176
.long	786561
.long	47180
.long	6024
.long	47200
.long	0
	.hsa_code_object_version 1,0
	.hsa_code_object_isa 0,0,0,"AMD","AMDGPU"
	.text
	.globl	FixOffset
FixOffset:                              ; @FixOffset
; BB#0:                                 ; %entry
	s_load_dword s2, s[0:1], 0x6
	s_load_dword s3, s[0:1], 0x7
	s_load_dwordx2 s[8:9], s[0:1], 0x9
	s_load_dwordx2 s[12:13], s[0:1], 0xb
	s_mov_b32 s11, 0xf000
	s_mov_b32 s10, 0
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s0, s2, s4
	s_mul_i32 s1, s3, s5
	v_add_i32_e32 v0, vcc, s0, v0
	v_add_i32_e32 v1, vcc, s1, v1
	v_lshlrev_b32_e32 v0, 8, v0
	v_add_i32_e32 v3, vcc, v1, v0
	v_ashrrev_i32_e32 v2, 31, v1
	v_lshl_b64 v[0:1], v[1:2], 2
	v_ashrrev_i32_e32 v4, 31, v3
	buffer_load_dword v0, v[0:1], s[8:11], 0 addr64
	v_lshl_b64 v[1:2], v[3:4], 2
	s_mov_b64 s[14:15], s[10:11]
	buffer_load_dword v3, v[1:2], s[12:15], 0 addr64
	s_waitcnt vmcnt(0)
	v_add_i32_e32 v0, vcc, v0, v3
	buffer_store_dword v0, v[1:2], s[12:15], 0 addr64
	s_endpgm

	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 64
; NumSgprs: 18
; NumVgprs: 5
; FloatMode: 192
; IeeeMode: 0
; ScratchSize: 0

	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 73e976449b53bf91364bec5926194b37f7f08488) (https://github.com/llvm-mirror/llvm.git e48de91069450173c2d5abaad9da9b25920ef692)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.ident	"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"
	.section	".note.GNU-stack"
	.text
EndOfTextLabel:
