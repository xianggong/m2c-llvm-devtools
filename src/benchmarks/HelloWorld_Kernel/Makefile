include ../Makefile.com

all: ir irRef asm asmpre2bin asm2bin asmRef amdRef

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

ifndef REMOTE_PATH
$(error REMOTE_PATH is not set in Makefile.com)
endif

CURDIR = $(shell pwd)

amdRef: HelloWorld_Kernel.cl
	rm -f *.il *.i *.isa
	$(AMDCC) $< >/dev/null 2>&1
	rm -f *.il *.i 
	rename 's/_temp_0_Capeverde_//' *.isa
	rm -f _temp_0*

ir: HelloWorld_Kernel.cl
	$(CLANG) $(CLANG_INC) $(CLANG_PAR) $< > log.0 2>&1 

irRef: HelloWorld_Kernel.cl
	$(CLANG) $(CLANG_INC) $(CLANG_PAR_REF) $< -o HelloWorld_Kernel_ref.ll > log.0.ref 2>&1 

asm: ir
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --print-after-all --debug --pre-RA-sched=source -o HelloWorld_Kernel_source.s  > log.1.source 2>&1
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --print-after-all --debug --pre-RA-sched=list-ilp -o HelloWorld_Kernel_ilp.s  > log.1.ilp 2>&1
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --print-after-all --debug --pre-RA-sched=list-hybrid -o HelloWorld_Kernel_hybrid.s > log.1.hybrid 2>&1
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --print-after-all --debug --pre-RA-sched=list-burr -o HelloWorld_Kernel_burr.s > log.1.burr 2>&1
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --print-after-all --debug --pre-RA-sched=fast -o HelloWorld_Kernel_fast.s > log.1.fast 2>&1
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --print-after-all --debug --pre-RA-sched=source --misched=si -o HelloWorld_Kernel_misource.s  > log.1.misource 2>&1
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --print-after-all --debug --pre-RA-sched=list-ilp --misched=si -o HelloWorld_Kernel_miilp.s  > log.1.miilp 2>&1
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --print-after-all --debug --pre-RA-sched=list-hybrid --misched=si -o HelloWorld_Kernel_mihybrid.s > log.1.mihybrid 2>&1
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --print-after-all --debug --pre-RA-sched=list-burr --misched=si -o HelloWorld_Kernel_miburr.s > log.1.miburr 2>&1
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --print-after-all --debug --pre-RA-sched=fast --misched=si -o HelloWorld_Kernel_mifast.s > log.1.mifast 2>&1

asmlsroff: ir
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --disable-lsr --print-after-all --debug --pre-RA-sched=source -o HelloWorld_Kernel_source.s  > log.1.source 2>&1
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --disable-lsr --print-after-all --debug --pre-RA-sched=list-ilp -o HelloWorld_Kernel_ilp.s  > log.1.ilp 2>&1
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --disable-lsr --print-after-all --debug --pre-RA-sched=list-hybrid -o HelloWorld_Kernel_hybrid.s > log.1.hybrid 2>&1
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --disable-lsr --print-after-all --debug --pre-RA-sched=list-burr -o HelloWorld_Kernel_burr.s > log.1.burr 2>&1
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --disable-lsr --print-after-all --debug --pre-RA-sched=fast -o HelloWorld_Kernel_fast.s > log.1.fast 2>&1
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --disable-lsr --print-after-all --debug --pre-RA-sched=source --misched=si -o HelloWorld_Kernel_misource.s  > log.1.misource 2>&1
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --disable-lsr --print-after-all --debug --pre-RA-sched=list-ilp --misched=si -o HelloWorld_Kernel_miilp.s  > log.1.miilp 2>&1
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --disable-lsr --print-after-all --debug --pre-RA-sched=list-hybrid --misched=si -o HelloWorld_Kernel_mihybrid.s > log.1.mihybrid 2>&1
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --disable-lsr --print-after-all --debug --pre-RA-sched=list-burr --misched=si -o HelloWorld_Kernel_miburr.s > log.1.miburr 2>&1
	$(LLC) $(LLC_PAR) HelloWorld_Kernel.ll --disable-lsr --print-after-all --debug --pre-RA-sched=fast --misched=si -o HelloWorld_Kernel_mifast.s > log.1.mifast 2>&1

asmmerge:
	rm -f *fuse*
	$(KERNELMERGER) $(wildcard *.s)

asmpre2bin:
	for kernel_asm in $(wildcard *.s); do \
		$(PRETOBIN) $$kernel_asm; \
	done

asm2bin:
	for kernel_asm in $(wildcard *.s); do \
		$(M2C) --si2bin $$kernel_asm; \
	done

scpbin: 
	scp *.bin $(REMOTE_SERVER):$(REMOTE_PATH)/HelloWorld

clean:
	rm -rf *.bc *.isa *.ll log* *.s *.bin *.rpt *.gz *.html *.db
