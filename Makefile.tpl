include ../Makefile.com

all: gen_ir asm_ir opt_ir dis_ir gen_asm

gen_ir: KERNEL_NAME.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR) $< > log.0 2>&1 

asm_ir:
	@-$(LLVM_AS) KERNEL_NAME.ll -o KERNEL_NAME.bc $< > log.1 2>&1 

opt_ir:
	@-$(OPT) -mem2reg KERNEL_NAME.bc -o KERNEL_NAME.opt.bc $< > log.2 2>&1

dis_ir:
	@-$(LLVM_DIS) KERNEL_NAME.opt.bc -o KERNEL_NAME.opt.ll $< > log.3 2>&1

gen_asm:
	@-$(LLC) $(LLC_PAR) KERNEL_NAME.opt.bc $< > log.4 2>&1

clean:
	rm -rf *.bc *.ll log* *.s
