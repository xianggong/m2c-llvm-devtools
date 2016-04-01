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

amdRef: BinomialOption_Kernels.cl
	@-rm -f *.il *.i *.isa
	@-$(AMDCC) $< >/dev/null 2>&1
	@-rm -f *.il *.i 
	@-rename 's/_temp_0_Capeverde_//' *.isa
	@-rm -f _temp_0*

ir: BinomialOption_Kernels.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR) $< > log.0 2>&1 

irRef: BinomialOption_Kernels.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR_REF) $< -o BinomialOption_Kernels_ref.ll > log.0.ref 2>&1 

asm: ir
	@-$(LLC) $(LLC_PAR) BinomialOption_Kernels.ll --print-after-all --debug > log.1 2>&1
	@-$(LLC) $(LLC_PAR) BinomialOption_Kernels.ll --print-after-all --debug --misched=si -o BinomialOption_Kernels_sched.s > log.sched.1 2>&1

asmlsroff: ir
	@-$(LLC) $(LLC_PAR) BinomialOption_Kernels.ll --disable-lsr --print-after-all --debug > log.1 2>&1
	@-$(LLC) $(LLC_PAR) BinomialOption_Kernels.ll --disable-lsr --print-after-all --debug --misched=si -o BinomialOption_Kernels_sched.s > log.1 2>&1

asmmerge:
	@-$(KERNELMERGER) BinomialOption_Kernels.s BinomialOption_Kernels_sched.s > BinomialOption_Kernels_fusion.s

asmpre2bin:
	@-$(PRETOBIN) BinomialOption_Kernels.s > log.2 2>&1
	@-$(PRETOBIN) BinomialOption_Kernels_sched.s > log.sched.2 2>&1

asm2bin: asmmerge
	@-$(M2C) --si2bin BinomialOption_Kernels.s > log.2 2>&1
	@-$(M2C) --si2bin BinomialOption_Kernels_sched.s > log.sched.2 2>&1
	@-$(M2C) --si2bin BinomialOption_Kernels_fusion.s > log.fusion.2 2>&1

2bingdb:
	@-gdb --args $(M2C) --si2bin BinomialOption_Kernels.s

scpbin: 
	@-scp BinomialOption_Kernels.bin $(REMOTE_SERVER):$(REMOTE_PATH)/src/benchmarks/BinomialOption
	@-scp BinomialOption_Kernels_sched.bin $(REMOTE_SERVER):$(REMOTE_PATH)/src/benchmarks/BinomialOption
	@-scp BinomialOption_Kernels_fusion.bin $(REMOTE_SERVER):$(REMOTE_PATH)/src/benchmarks/BinomialOption

run: scpbin
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/BinomialOption; make && make run"
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/BinomialOption; make && make runsched"
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/BinomialOption; make && make runfusion"

rundt: scpbin
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/BinomialOption; make && make rundt"
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/BinomialOption; make && make runscheddt"
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/BinomialOption; make && make runfusiondt"

scale: scpbin
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/BinomialOption; make && make scale"

runtrace: scpbin
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/BinomialOption; make && make runtrace"
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/BinomialOption; make && make runschedtrace" 
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/BinomialOption; make && make runfusiontrace" 
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/BinomialOption; scp -r *.rpt xgong@$(MYIP):$(CURDIR)"
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/BinomialOption; scp -r *.gz xgong@$(MYIP):$(CURDIR)"
	@-gzip -d *.gz

rungettrace:
	@-mkdir trace
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/BinomialOption; scp -r *.rpt xgong@$(MYIP):$(CURDIR)/trace"
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/BinomialOption; scp -r *.gz xgong@$(MYIP):$(CURDIR)/trace"

runanalyse:
	@-$(TRACEANALYSER) BinomialOption_Kernels BinomialOption_Kernels_sched BinomialOption_Kernels_fusion

runisa: scpbin
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/BinomialOption; make && make isa && scp debug.isa xgong@$(MYIP):$(CURDIR)"
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/BinomialOption; make && make isasched && scp debug.sched.isa xgong@$(MYIP):$(CURDIR)"

asmcb1: ir
	@-$(LLC) $(LLC_PAR) BinomialOption_Kernels.ll --print-after-all --debug --view-dag-combine1-dags > log.1 2>&1

asmlgl: ir
	@-$(LLC) $(LLC_PAR) BinomialOption_Kernels.ll --print-after-all --debug --view-legalize-dags > log.1 2>&1

asmcb2: ir
	@-$(LLC) $(LLC_PAR) BinomialOption_Kernels.ll --print-after-all --debug --view-dag-combine2-dags > log.1 2>&1

asmisel: ir
	@-$(LLC) $(LLC_PAR) BinomialOption_Kernels.ll --print-after-all --debug --view-isel-dags > log.1 2>&1

asmschd: ir
	@-$(LLC) $(LLC_PAR) BinomialOption_Kernels.ll --print-after-all --debug --view-sched-dags > log.1 2>&1

asmRef: irRef
	@-$(LLC) $(LLC_PAR) BinomialOption_Kernels_ref.ll --print-after-all --debug > log.1.ref 2>&1

asmcb1Ref: irRef
	@-$(LLC) $(LLC_PAR) BinomialOption_Kernels_ref.ll --print-after-all --debug --view-dag-combine1-dags > log.1.ref 2>&1

asmlgRef: irRef
	@-$(LLC) $(LLC_PAR) BinomialOption_Kernels_ref.ll --print-after-all --debug --view-legalize-dags > log.1.ref 2>&1

asmcb2Ref: irRef
	@-$(LLC) $(LLC_PAR) BinomialOption_Kernels_ref.ll --print-after-all --debug --view-dag-combine2-dags > log.1.ref 2>&1

asmiselRef: irRef
	@-$(LLC) $(LLC_PAR) BinomialOption_Kernels_ref.ll --print-after-all --debug --view-isel-dags > log.1.ref 2>&1

asmschdRef: irRef
	@-$(LLC) $(LLC_PAR) BinomialOption_Kernels_ref.ll --print-after-all --debug --view-sched-dags > log.1.ref 2>&1

gdb: ir
	gdb --args $(LLC) $(LLC_PAR) BinomialOption_Kernels.ll --print-after-all --debug

gdbRef: irRef
	gdb --args $(LLC) $(LLC_PAR) BinomialOption_Kernels_ref.ll --print-after-all --debug

clean:
	rm -rf *.bc *.isa *.ll log* *.s *.bin *.rpt *.gz *.html *.db BinomialOption_Kernels BinomialOption_Kernels_sched BinomialOption_Kernels_fusion
