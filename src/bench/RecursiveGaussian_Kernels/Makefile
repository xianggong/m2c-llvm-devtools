include ../Makefile.com

all: ir irRef asm asm2bin asmRef amdRef

ifndef CLANG 
$(error CLANG is not set in Makefile.com)
endif

ifndef LLC 
$(error LLC is not set in Makefile.com)
endif

ifndef PRETOBIN
$(error PRETOBIN is not set in Makefile.com)
endif

ifndef M2C
$(error M2C is not set in Makefile.com)
endif

ifndef REMOTE_SERVER 
$(error REMOTE_SERVER is not set in Makefile.com)
endif

ifndef TEST_PATH
$(error TEST_PATH is not set in Makefile.com)
endif

amdRef: RecursiveGaussian_Kernels.cl
	@-$(AMDCC) $< >/dev/null 2>&1
	@-rm *.il *.i
	@-mv _temp*.isa RecursiveGaussian_Kernels.isa
	@-rm _temp_0*

ir: RecursiveGaussian_Kernels.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR) $< > log.0 2>&1 

irRef: RecursiveGaussian_Kernels.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR_REF) $< -o RecursiveGaussian_Kernels_ref.ll > log.0.ref 2>&1 

asm: ir
	@-$(LLC) $(LLC_PAR) RecursiveGaussian_Kernels.ll --print-after-all --debug > log.1 2>&1

asmpre2bin:
	@-$(PRETOBIN) RecursiveGaussian_Kernels.s > log.2 2>&1

asm2bin:
	@-$(M2C) --si2bin RecursiveGaussian_Kernels.s > log.2 2>&1

2bingdb:
	@-gdb --args $(M2C) --si2bin RecursiveGaussian_Kernels.s

scpbin:
	@-scp RecursiveGaussian_Kernels.bin $(REMOTE_SERVER):$(TEST_PATH)/RecursiveGaussian

run:
	@-ssh $(REMOTE_SERVER) "cd $(TEST_PATH)/RecursiveGaussian; make run"

asmcb1: ir
	@-$(LLC) $(LLC_PAR) RecursiveGaussian_Kernels.ll --print-after-all --debug --view-dag-combine1-dags > log.1 2>&1

asmlgl: ir
	@-$(LLC) $(LLC_PAR) RecursiveGaussian_Kernels.ll --print-after-all --debug --view-legalize-dags > log.1 2>&1

asmcb2: ir
	@-$(LLC) $(LLC_PAR) RecursiveGaussian_Kernels.ll --print-after-all --debug --view-dag-combine2-dags > log.1 2>&1

asmisel: ir
	@-$(LLC) $(LLC_PAR) RecursiveGaussian_Kernels.ll --print-after-all --debug --view-isel-dags > log.1 2>&1

asmschd: ir
	@-$(LLC) $(LLC_PAR) RecursiveGaussian_Kernels.ll --print-after-all --debug --view-sched-dags > log.1 2>&1

asmRef: irRef
	@-$(LLC) $(LLC_PAR) RecursiveGaussian_Kernels_ref.ll --print-after-all --debug > log.1.ref 2>&1

asmcb1Ref: irRef
	@-$(LLC) $(LLC_PAR) RecursiveGaussian_Kernels_ref.ll --print-after-all --debug --view-dag-combine1-dags > log.1.ref 2>&1

asmlgRef: irRef
	@-$(LLC) $(LLC_PAR) RecursiveGaussian_Kernels_ref.ll --print-after-all --debug --view-legalize-dags > log.1.ref 2>&1

asmcb2Ref: irRef
	@-$(LLC) $(LLC_PAR) RecursiveGaussian_Kernels_ref.ll --print-after-all --debug --view-dag-combine2-dags > log.1.ref 2>&1

asmiselRef: irRef
	@-$(LLC) $(LLC_PAR) RecursiveGaussian_Kernels_ref.ll --print-after-all --debug --view-isel-dags > log.1.ref 2>&1

asmschdRef: irRef
	@-$(LLC) $(LLC_PAR) RecursiveGaussian_Kernels_ref.ll --print-after-all --debug --view-sched-dags > log.1.ref 2>&1

gdb: ir
	gdb --args $(LLC) $(LLC_PAR) RecursiveGaussian_Kernels.ll --print-after-all --debug

gdbRef: irRef
	gdb --args $(LLC) $(LLC_PAR) RecursiveGaussian_Kernels_ref.ll --print-after-all --debug

clean:
	rm -rf *.bc *.isa *.ll log* *.s *.bin
