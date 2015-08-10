include ../Makefile.com

all: gen_ir gen_asm

gen_ir: KERNEL_NAME.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR) $< > log.0 2>&1 

gen_asm:
	@-$(LLC) $(LLC_PAR) KERNEL_NAME.ll --print-after-all $< > log.1 2>&1

clean:
	rm -rf *.bc *.ll log* *.s
