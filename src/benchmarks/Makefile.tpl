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

amdRef: KERNEL_NAME.cl
	@-rm -f *.il *.i *.isa
	@-$(AMDCC) $< >/dev/null 2>&1
	@-rm -f *.il *.i 
	@-rename 's/_temp_0_Capeverde_//' *.isa
	@-rm -f _temp_0*

ir: KERNEL_NAME.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR) $< > log.0 2>&1 

irRef: KERNEL_NAME.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR_REF) $< -o KERNEL_NAME_ref.ll > log.0.ref 2>&1 

asm: ir
	@-$(LLC) $(LLC_PAR) KERNEL_NAME.ll --print-after-all --debug > log.1 2>&1
	@-$(LLC) $(LLC_PAR) KERNEL_NAME.ll --print-after-all --debug --misched=si -o KERNEL_NAME_sched.s > log.sched.1 2>&1

asmlsroff: ir
	@-$(LLC) $(LLC_PAR) KERNEL_NAME.ll --disable-lsr --print-after-all --debug > log.1 2>&1
	@-$(LLC) $(LLC_PAR) KERNEL_NAME.ll --disable-lsr --print-after-all --debug --misched=si -o KERNEL_NAME_sched.s > log.1 2>&1

asmmerge:
	@-$(KERNELMERGER) KERNEL_NAME.s KERNEL_NAME_sched.s > KERNEL_NAME_fusion.s

asmpre2bin:
	@-$(PRETOBIN) KERNEL_NAME.s > log.2 2>&1
	@-$(PRETOBIN) KERNEL_NAME_sched.s > log.sched.2 2>&1

asm2bin: asmmerge
	@-$(M2C) --si2bin KERNEL_NAME.s > log.2 2>&1
	@-$(M2C) --si2bin KERNEL_NAME_sched.s > log.sched.2 2>&1
	@-$(M2C) --si2bin KERNEL_NAME_fusion.s > log.fusion.2 2>&1

2bingdb:
	@-gdb --args $(M2C) --si2bin KERNEL_NAME.s

scpbin: 
	@-scp KERNEL_NAME.bin $(REMOTE_SERVER):$(REMOTE_PATH)/src/benchmarks/KERNEL_PATH
	@-scp KERNEL_NAME_sched.bin $(REMOTE_SERVER):$(REMOTE_PATH)/src/benchmarks/KERNEL_PATH
	@-scp KERNEL_NAME_fusion.bin $(REMOTE_SERVER):$(REMOTE_PATH)/src/benchmarks/KERNEL_PATH

run: scpbin
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/KERNEL_PATH; make && make run"
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/KERNEL_PATH; make && make runsched"
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/KERNEL_PATH; make && make runfusion"

rundt: scpbin
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/KERNEL_PATH; make && make rundt"
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/KERNEL_PATH; make && make runscheddt"
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/KERNEL_PATH; make && make runfusiondt"

scale: scpbin
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/KERNEL_PATH; make && make scale"

runtrace: scpbin
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/KERNEL_PATH; make && make runtrace"
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/KERNEL_PATH; make && make runschedtrace" 
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/KERNEL_PATH; make && make runfusiontrace" 
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/KERNEL_PATH; scp -r *.rpt xgong@$(MYIP):$(CURDIR)"
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/KERNEL_PATH; scp -r *.gz xgong@$(MYIP):$(CURDIR)"
	@-gzip -d *.gz

rungettrace:
	@-mkdir trace
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/KERNEL_PATH; scp -r *.rpt xgong@$(MYIP):$(CURDIR)/trace"
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/KERNEL_PATH; scp -r *.gz xgong@$(MYIP):$(CURDIR)/trace"

runanalyse:
	@-$(TRACEANALYSER) KERNEL_NAME KERNEL_NAME_sched KERNEL_NAME_fusion

runisa: scpbin
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/KERNEL_PATH; make && make isa && scp debug.isa xgong@$(MYIP):$(CURDIR)"
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/benchmarks/KERNEL_PATH; make && make isasched && scp debug.sched.isa xgong@$(MYIP):$(CURDIR)"

asmcb1: ir
	@-$(LLC) $(LLC_PAR) KERNEL_NAME.ll --print-after-all --debug --view-dag-combine1-dags > log.1 2>&1

asmlgl: ir
	@-$(LLC) $(LLC_PAR) KERNEL_NAME.ll --print-after-all --debug --view-legalize-dags > log.1 2>&1

asmcb2: ir
	@-$(LLC) $(LLC_PAR) KERNEL_NAME.ll --print-after-all --debug --view-dag-combine2-dags > log.1 2>&1

asmisel: ir
	@-$(LLC) $(LLC_PAR) KERNEL_NAME.ll --print-after-all --debug --view-isel-dags > log.1 2>&1

asmschd: ir
	@-$(LLC) $(LLC_PAR) KERNEL_NAME.ll --print-after-all --debug --view-sched-dags > log.1 2>&1

asmRef: irRef
	@-$(LLC) $(LLC_PAR) KERNEL_NAME_ref.ll --print-after-all --debug > log.1.ref 2>&1

asmcb1Ref: irRef
	@-$(LLC) $(LLC_PAR) KERNEL_NAME_ref.ll --print-after-all --debug --view-dag-combine1-dags > log.1.ref 2>&1

asmlgRef: irRef
	@-$(LLC) $(LLC_PAR) KERNEL_NAME_ref.ll --print-after-all --debug --view-legalize-dags > log.1.ref 2>&1

asmcb2Ref: irRef
	@-$(LLC) $(LLC_PAR) KERNEL_NAME_ref.ll --print-after-all --debug --view-dag-combine2-dags > log.1.ref 2>&1

asmiselRef: irRef
	@-$(LLC) $(LLC_PAR) KERNEL_NAME_ref.ll --print-after-all --debug --view-isel-dags > log.1.ref 2>&1

asmschdRef: irRef
	@-$(LLC) $(LLC_PAR) KERNEL_NAME_ref.ll --print-after-all --debug --view-sched-dags > log.1.ref 2>&1

gdb: ir
	gdb --args $(LLC) $(LLC_PAR) KERNEL_NAME.ll --print-after-all --debug

gdbRef: irRef
	gdb --args $(LLC) $(LLC_PAR) KERNEL_NAME_ref.ll --print-after-all --debug

clean:
	rm -rf *.bc *.isa *.ll log* *.s *.bin *.rpt *.gz *.html *.db KERNEL_NAME KERNEL_NAME_sched KERNEL_NAME_fusion
