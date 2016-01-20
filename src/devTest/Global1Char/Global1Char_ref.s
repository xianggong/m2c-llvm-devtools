	.text
	.section	.AMDGPU.config
.long	47176
.long	786496
.long	47180
.long	6024
.long	47200
.long	0
	.hsa_code_object_version 1,0
	.hsa_code_object_isa 0,0,0,"AMD","AMDGPU"
	.text
	.globl	Global1
Global1:                                ; @Global1
; BB#0:                                 ; %entry
	s_load_dword s2, s[0:1], 0x6
	s_load_dwordx2 s[8:9], s[0:1], 0x9
	s_mov_b32 s11, 0xf000
	s_waitcnt lgkmcnt(0)
	s_mul_i32 s0, s2, s4
	v_add_i32_e32 v0, vcc, s0, v0
	v_ashrrev_i32_e32 v1, 31, v0
	s_mov_b32 s10, 0
	buffer_store_byte v0, v[0:1], s[8:11], 0 addr64
	s_endpgm

	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 20
; NumSgprs: 14
; NumVgprs: 2
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
