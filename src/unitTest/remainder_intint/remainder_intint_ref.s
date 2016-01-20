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
	.globl	remainder_intint
remainder_intint:                       ; @remainder_intint
; BB#0:                                 ; %entry
	s_load_dword s2, s[0:1], 0x6
	s_load_dwordx2 s[12:13], s[0:1], 0x9
	s_load_dwordx2 s[16:17], s[0:1], 0xb
	s_load_dwordx2 s[8:9], s[0:1], 0xd
	s_mov_b32 s15, 0xf000
	s_mov_b32 s14, 0
	s_mov_b64 s[18:19], s[14:15]
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s0, s2, s4
	v_add_i32_e32 v0, vcc, s0, v0
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshl_b64 v[0:1], v[0:1], 2
	buffer_load_dword v2, v[0:1], s[16:19], 0 addr64
	buffer_load_dword v3, v[0:1], s[12:15], 0 addr64
	s_waitcnt vmcnt(1)
	v_ashrrev_i32_e32 v4, 31, v2
	v_add_i32_e32 v2, vcc, v2, v4
	v_xor_b32_e32 v2, v2, v4
	v_cvt_f32_u32_e32 v4, v2
	v_rcp_iflag_f32_e32 v4, v4
	v_mul_f32_e32 v4, 0x4f800000, v4
	v_cvt_u32_f32_e32 v4, v4
	v_mul_hi_u32 v5, v4, v2
	v_mul_lo_i32 v6, v4, v2
	v_cmp_eq_i32_e64 s[0:1], 0, v5
	v_sub_i32_e32 v5, vcc, 0, v6
	v_cndmask_b32_e64 v5, v6, v5, s[0:1]
	v_mul_hi_u32 v5, v5, v4
	v_add_i32_e32 v6, vcc, v5, v4
	v_subrev_i32_e32 v4, vcc, v5, v4
	v_cndmask_b32_e64 v4, v4, v6, s[0:1]
	s_waitcnt vmcnt(0)
	v_ashrrev_i32_e32 v5, 31, v3
	v_add_i32_e32 v3, vcc, v3, v5
	v_xor_b32_e32 v3, v3, v5
	v_mul_hi_u32 v4, v4, v3
	v_mul_lo_i32 v4, v4, v2
	s_mov_b64 s[10:11], s[14:15]
	v_cmp_ge_u32_e64 s[0:1], v3, v4
	v_subrev_i32_e32 v3, vcc, v4, v3
	v_cndmask_b32_e64 v4, 0, -1, s[0:1]
	v_cmp_ge_u32_e64 s[0:1], v3, v2
	v_subrev_i32_e32 v6, vcc, v2, v3
	v_cndmask_b32_e64 v7, 0, -1, s[0:1]
	v_and_b32_e32 v7, v4, v7
	v_cmp_eq_i32_e32 vcc, 0, v7
	v_cndmask_b32_e32 v6, v6, v3
	v_add_i32_e32 v2, vcc, v2, v3
	v_cmp_eq_i32_e32 vcc, 0, v4
	v_cndmask_b32_e32 v2, v6, v2
	v_xor_b32_e32 v2, v2, v5
	v_sub_i32_e32 v2, vcc, v2, v5
	buffer_store_dword v2, v[0:1], s[8:11], 0 addr64
	s_endpgm

	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 224
; NumSgprs: 22
; NumVgprs: 8
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
