	.text
	.section	.AMDGPU.config
.long	47176
.long	786560
.long	47180
.long	38792
.long	47200
.long	0
	.hsa_code_object_version 1,0
	.hsa_code_object_isa 0,0,0,"AMD","AMDGPU"
	.text
	.globl	blockAddition
blockAddition:                          ; @blockAddition
; BB#0:                                 ; %entry
	s_load_dword s2, s[0:1], 0x6
	s_load_dwordx2 s[8:9], s[0:1], 0xb
	v_cmp_eq_i32_e32 vcc, 0, v0
	s_waitcnt lgkmcnt(0)
	s_and_saveexec_b64 s[6:7], vcc
	s_xor_b64 s[6:7], exec, s[6:7]
	s_cbranch_execz BB0_2
; BB#1:                                 ; %if.then
	s_load_dwordx2 s[12:13], s[0:1], 0x9
	s_ashr_i32 s5, s4, 31
	s_mov_b32 s15, 0xf000
	s_lshl_b64 s[10:11], s[4:5], 2
	s_mov_b32 s14, 0
	v_mov_b32_e32 v1, s10
	v_mov_b32_e32 v2, s11
	s_waitcnt lgkmcnt(0)
	buffer_load_dword v1, v[1:2], s[12:15], 0 addr64
	v_mov_b32_e32 v2, 0
	s_mov_b32 m0, -1
	s_waitcnt vmcnt(0)
	ds_write_b32 v2, v1
	s_waitcnt lgkmcnt(0)
BB0_2:                                  ; %if.end
	s_or_b64 exec, exec, s[6:7]
	s_barrier
	s_mul_i32 s0, s2, s4
	v_add_i32_e32 v0, vcc, s0, v0
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshl_b64 v[0:1], v[0:1], 2
	s_mov_b32 s11, 0xf000
	s_mov_b32 s10, 0
	buffer_load_dword v2, v[0:1], s[8:11], 0 addr64
	v_mov_b32_e32 v3, 0
	s_mov_b32 m0, -1
	ds_read_b32 v3, v3
	s_waitcnt vmcnt(0) & lgkmcnt(0)
	v_add_f32_e32 v2, v2, v3
	buffer_store_dword v2, v[0:1], s[8:11], 0 addr64
	s_endpgm

	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 92
; NumSgprs: 18
; NumVgprs: 4
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
	.globl	ScanLargeArrays
ScanLargeArrays:                        ; @ScanLargeArrays
; BB#0:                                 ; %entry
	s_load_dword s5, s[0:1], 0x6
	s_load_dwordx2 s[8:9], s[0:1], 0xb
	s_load_dword s2, s[0:1], 0xd
	s_load_dword s3, s[0:1], 0xe
	s_mov_b32 s11, 0xf000
	s_mov_b32 s10, 0
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s5, s5, s4
	v_add_i32_e32 v1, vcc, s5, v0
	v_lshlrev_b32_e32 v1, 1, v1
	v_ashrrev_i32_e32 v2, 31, v1
	v_lshl_b64 v[4:5], v[1:2], 2
	v_or_b32_e32 v3, 1, v1
	buffer_load_dword v8, v[4:5], s[8:11], 0 addr64
	v_ashrrev_i32_e32 v4, 31, v3
	v_lshl_b64 v[5:6], v[3:4], 2
	buffer_load_dword v9, v[5:6], s[8:11], 0 addr64
	v_lshlrev_b32_e32 v6, 1, v0
	v_lshlrev_b32_e32 v5, 3, v0
	s_mov_b32 m0, -1
	v_or_b32_e32 v7, 1, v6
	v_add_i32_e32 v5, vcc, s2, v5
	s_waitcnt vmcnt(1)
	ds_write_b32 v5, v8
	s_waitcnt lgkmcnt(0)
	v_lshlrev_b32_e32 v8, 2, v7
	v_add_i32_e32 v8, vcc, s2, v8
	s_waitcnt vmcnt(0)
	ds_write_b32 v8, v9
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_cmp_lt_u32_e64 s[6:7], 1, s3
	s_and_saveexec_b64 s[6:7], s[6:7]
	s_xor_b64 s[6:7], exec, s[6:7]
	s_cbranch_execz BB1_4
; BB#1:                                 ; %for.body.lr.ph
	s_mov_b32 m0, -1
	v_mov_b32_e32 v9, s2
	v_mov_b32_e32 v11, s2
	ds_read_b32 v10, v9
	ds_read_b32 v9, v11 offset:4
	s_mov_b64 s[8:9], 0
	s_waitcnt lgkmcnt(0)
	v_add_f32_e32 v11, v9, v10
	v_mov_b32_e32 v9, 1
BB1_5:                                  ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	v_cmp_ge_i32_e32 vcc, v6, v9
	s_and_saveexec_b64 s[10:11], vcc
	s_xor_b64 s[10:11], exec, s[10:11]
	s_cbranch_execz BB1_7
; BB#6:                                 ; %if.then
                                        ;   in Loop: Header=BB1_5 Depth=1
	v_subrev_i32_e32 v10, vcc, v9, v6
	v_lshlrev_b32_e32 v10, 2, v10
	v_add_i32_e32 v10, vcc, s2, v10
	s_mov_b32 m0, -1
	ds_read_b32 v10, v10
	ds_read_b32 v11, v5
	v_subrev_i32_e32 v12, vcc, v9, v7
	v_lshlrev_b32_e32 v12, 2, v12
	v_add_i32_e32 v12, vcc, s2, v12
	ds_read_b32 v12, v12
	ds_read_b32 v13, v8
	s_waitcnt lgkmcnt(0)
	v_add_f32_e32 v10, v11, v10
	v_add_f32_e32 v11, v13, v12
BB1_7:                                  ; %if.end
                                        ;   in Loop: Header=BB1_5 Depth=1
	s_or_b64 exec, exec, s[10:11]
	s_mov_b32 m0, -1
	s_barrier
	ds_write_b32 v5, v10
	ds_write_b32 v8, v11
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_lshlrev_b32_e32 v9, 1, v9
	v_cmp_le_u32_e32 vcc, s3, v9
	s_or_b64 s[8:9], vcc, s[8:9]
	s_andn2_b64 exec, exec, s[8:9]
	s_cbranch_execnz BB1_5
; BB#2:                                 ; %Flow1
	s_or_b64 exec, exec, s[8:9]
BB1_4:                                  ; %Flow2
	s_or_b64 exec, exec, s[6:7]
	s_load_dwordx2 s[12:13], s[0:1], 0x9
	s_load_dwordx2 s[8:9], s[0:1], 0xf
	s_waitcnt lgkmcnt(0)
; BB#3:                                 ; %for.cond.cleanup
	s_lshl_b32 s0, s3, 2
	s_add_i32 s0, s0, s2
	s_add_i32 s0, s0, -4
	s_mov_b32 m0, -1
	v_mov_b32_e32 v7, s0
	ds_read_b32 v7, v7
	s_ashr_i32 s5, s4, 31
	s_mov_b32 s11, 0xf000
	s_lshl_b64 s[0:1], s[4:5], 2
	s_mov_b32 s10, 0
	v_mov_b32_e32 v8, s0
	v_mov_b32_e32 v9, s1
	s_waitcnt lgkmcnt(0)
	buffer_store_dword v7, v[8:9], s[8:11], 0 addr64
	v_cmp_ne_i32_e32 vcc, 0, v0
	s_waitcnt vmcnt(0) & expcnt(0)
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz BB1_8
; BB#10:                                ; %if.else
	v_lshlrev_b32_e32 v0, 2, v6
	v_add_i32_e32 v0, vcc, s2, v0
	v_add_i32_e32 v0, vcc, -4, v0
	s_mov_b32 m0, -1
	ds_read_b32 v0, v0
	ds_read_b32 v6, v5
	v_lshl_b64 v[7:8], v[1:2], 2
	s_mov_b64 s[14:15], s[10:11]
	s_waitcnt lgkmcnt(0)
	buffer_store_dword v0, v[7:8], s[12:15], 0 addr64
	v_lshl_b64 v[7:8], v[3:4], 2
	buffer_store_dword v6, v[7:8], s[12:15], 0 addr64
	s_waitcnt vmcnt(0) & expcnt(0)
BB1_8:                                  ; %Flow
	s_or_saveexec_b64 s[0:1], s[0:1]
	s_xor_b64 exec, exec, s[0:1]
	s_cbranch_execz BB1_11
; BB#9:                                 ; %if.then.38
	s_mov_b32 m0, -1
	ds_read_b32 v0, v5
	v_lshl_b64 v[1:2], v[1:2], 2
	s_mov_b32 s15, 0xf000
	s_mov_b32 s14, 0
	v_mov_b32_e32 v5, 0
	buffer_store_dword v5, v[1:2], s[12:15], 0 addr64
	v_lshl_b64 v[1:2], v[3:4], 2
	s_waitcnt lgkmcnt(0)
	buffer_store_dword v0, v[1:2], s[12:15], 0 addr64
	s_waitcnt vmcnt(0) & expcnt(0)
BB1_11:                                 ; %if.end.56
	s_or_b64 exec, exec, s[0:1]
	s_endpgm

	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 352
; NumSgprs: 18
; NumVgprs: 14
; FloatMode: 192
; IeeeMode: 0
; ScratchSize: 0
	.section	.AMDGPU.config
.long	47176
.long	786499
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
	s_load_dword s5, s[0:1], 0x6
	s_load_dwordx2 s[8:9], s[0:1], 0xb
	s_load_dword s2, s[0:1], 0xd
	s_load_dword s3, s[0:1], 0xe
	s_mov_b32 s11, 0xf000
	s_mov_b32 s10, 0
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s4, s5, s4
	v_add_i32_e32 v1, vcc, s4, v0
	v_lshlrev_b32_e32 v1, 1, v1
	v_ashrrev_i32_e32 v2, 31, v1
	v_lshl_b64 v[4:5], v[1:2], 2
	v_or_b32_e32 v3, 1, v1
	buffer_load_dword v8, v[4:5], s[8:11], 0 addr64
	v_ashrrev_i32_e32 v4, 31, v3
	v_lshl_b64 v[5:6], v[3:4], 2
	buffer_load_dword v9, v[5:6], s[8:11], 0 addr64
	v_lshlrev_b32_e32 v6, 1, v0
	v_lshlrev_b32_e32 v5, 3, v0
	s_mov_b32 m0, -1
	v_or_b32_e32 v7, 1, v6
	v_add_i32_e32 v5, vcc, s2, v5
	s_waitcnt vmcnt(1)
	ds_write_b32 v5, v8
	s_waitcnt lgkmcnt(0)
	v_lshlrev_b32_e32 v8, 2, v7
	v_add_i32_e32 v8, vcc, s2, v8
	s_waitcnt vmcnt(0)
	ds_write_b32 v8, v9
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_cmp_lt_u32_e64 s[4:5], 1, s3
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execz BB2_4
; BB#1:                                 ; %for.body.lr.ph
	s_mov_b32 m0, -1
	v_mov_b32_e32 v9, s2
	v_mov_b32_e32 v11, s2
	ds_read_b32 v10, v9
	ds_read_b32 v9, v11 offset:4
	s_mov_b64 s[6:7], 0
	s_waitcnt lgkmcnt(0)
	v_add_f32_e32 v11, v9, v10
	v_mov_b32_e32 v9, 1
BB2_5:                                  ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	v_cmp_ge_i32_e32 vcc, v6, v9
	s_and_saveexec_b64 s[8:9], vcc
	s_xor_b64 s[8:9], exec, s[8:9]
	s_cbranch_execz BB2_7
; BB#6:                                 ; %if.then
                                        ;   in Loop: Header=BB2_5 Depth=1
	v_subrev_i32_e32 v10, vcc, v9, v6
	v_lshlrev_b32_e32 v10, 2, v10
	v_add_i32_e32 v10, vcc, s2, v10
	s_mov_b32 m0, -1
	ds_read_b32 v10, v10
	ds_read_b32 v11, v5
	v_subrev_i32_e32 v12, vcc, v9, v7
	v_lshlrev_b32_e32 v12, 2, v12
	v_add_i32_e32 v12, vcc, s2, v12
	ds_read_b32 v12, v12
	ds_read_b32 v13, v8
	s_waitcnt lgkmcnt(0)
	v_add_f32_e32 v10, v11, v10
	v_add_f32_e32 v11, v13, v12
BB2_7:                                  ; %if.end
                                        ;   in Loop: Header=BB2_5 Depth=1
	s_or_b64 exec, exec, s[8:9]
	s_mov_b32 m0, -1
	s_barrier
	ds_write_b32 v5, v10
	ds_write_b32 v8, v11
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_lshlrev_b32_e32 v9, 1, v9
	v_cmp_le_u32_e32 vcc, s3, v9
	s_or_b64 s[6:7], vcc, s[6:7]
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB2_5
; BB#2:                                 ; %Flow1
	s_or_b64 exec, exec, s[6:7]
BB2_4:                                  ; %Flow2
	s_or_b64 exec, exec, s[4:5]
	s_load_dwordx2 s[8:9], s[0:1], 0x9
	s_waitcnt lgkmcnt(0)
; BB#3:                                 ; %for.cond.cleanup
	v_cmp_ne_i32_e32 vcc, 0, v0
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz BB2_8
; BB#10:                                ; %if.else
	v_lshlrev_b32_e32 v0, 2, v6
	v_add_i32_e32 v0, vcc, s2, v0
	v_add_i32_e32 v0, vcc, -4, v0
	s_mov_b32 m0, -1
	ds_read_b32 v0, v0
	ds_read_b32 v6, v5
	v_lshl_b64 v[7:8], v[1:2], 2
	s_mov_b32 s11, 0xf000
	s_mov_b32 s10, 0
	s_waitcnt lgkmcnt(0)
	buffer_store_dword v0, v[7:8], s[8:11], 0 addr64
	v_lshl_b64 v[7:8], v[3:4], 2
	buffer_store_dword v6, v[7:8], s[8:11], 0 addr64
	s_waitcnt vmcnt(0) & expcnt(0)
BB2_8:                                  ; %Flow
	s_or_saveexec_b64 s[0:1], s[0:1]
	s_xor_b64 exec, exec, s[0:1]
	s_cbranch_execz BB2_11
; BB#9:                                 ; %if.then.35
	s_mov_b32 m0, -1
	ds_read_b32 v0, v5
	v_lshl_b64 v[1:2], v[1:2], 2
	s_mov_b32 s11, 0xf000
	s_mov_b32 s10, 0
	v_mov_b32_e32 v5, 0
	buffer_store_dword v5, v[1:2], s[8:11], 0 addr64
	v_lshl_b64 v[1:2], v[3:4], 2
	s_waitcnt lgkmcnt(0)
	buffer_store_dword v0, v[1:2], s[8:11], 0 addr64
	s_waitcnt vmcnt(0) & expcnt(0)
BB2_11:                                 ; %if.end.53
	s_or_b64 exec, exec, s[0:1]
	s_endpgm

	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 312
; NumSgprs: 14
; NumVgprs: 14
; FloatMode: 192
; IeeeMode: 0
; ScratchSize: 0
	.data
	.align	4                       ; @blockAddition.value.0
blockAddition.value.0:
.zero4


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
