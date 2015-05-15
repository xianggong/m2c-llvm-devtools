include ../Makefile.com

all: gen_ir asm_ir opt_ir dis_ir gen_asm

gen_ir: KERNEL_NAME.cl
	$(CLANG) $(CLANG_INC) $(CLANG_PAR) $< 2>&1 > log.0

asm_ir:
	$(LLVM_AS) KERNEL_NAME.ll -o KERNEL_NAME.bc $< 2>&1 > log.1

opt_ir:
	$(OPT) -mem2reg KERNEL_NAME.bc -o KERNEL_NAME.opt.bc $< 2>&1 > log.2

dis_ir:
	$(LLVM_DIS) KERNEL_NAME.opt.bc -o KERNEL_NAME.opt.ll $< 2>&1 > log.3

gen_asm:
	$(LLC) $(LLC_PAR) KERNEL_NAME.opt.bc $< 2>&1 > log.4
