include ../Makefile.com

all: ir irRef asm asmRef amdRef

amdRef: Local1.cl
	@-$(AMDCC) $< >/dev/null 2>&1
	@-rm *.il *.i
	@-mv *.isa Local1.isa
	@-rm _temp_0*

ir: Local1.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR) $< > log.0 2>&1 

irRef: Local1.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR_REF) $< -o Local1_ref.ll > log.0.ref 2>&1 

asm: ir
	@-$(LLC) $(LLC_PAR) Local1.ll --print-after-all > log.1 2>&1

asmcb1: ir
	@-$(LLC) $(LLC_PAR) Local1.ll --print-after-all --view-dag-combine1-dags > log.1 2>&1

asmlgl: ir
	@-$(LLC) $(LLC_PAR) Local1.ll --print-after-all --view-legalize-dags > log.1 2>&1

asmcb2: ir
	@-$(LLC) $(LLC_PAR) Local1.ll --print-after-all --view-dag-combine2-dags > log.1 2>&1

asmisel: ir
	@-$(LLC) $(LLC_PAR) Local1.ll --print-after-all --view-isel-dags > log.1 2>&1

asmschd: ir
	@-$(LLC) $(LLC_PAR) Local1.ll --print-after-all --view-sched-dags > log.1 2>&1

asmRef: irRef
	@-$(LLC) $(LLC_PAR) Local1_ref.ll --print-after-all > log.1.ref 2>&1

asmcb1Ref: irRef
	@-$(LLC) $(LLC_PAR) Local1_ref.ll --print-after-all --view-dag-combine1-dags > log.1.ref 2>&1

asmlgRef: irRef
	@-$(LLC) $(LLC_PAR) Local1_ref.ll --print-after-all --view-legalize-dags > log.1.ref 2>&1

asmcb2Ref: irRef
	@-$(LLC) $(LLC_PAR) Local1_ref.ll --print-after-all --view-dag-combine2-dags > log.1.ref 2>&1

asmiselRef: irRef
	@-$(LLC) $(LLC_PAR) Local1_ref.ll --print-after-all --view-isel-dags > log.1.ref 2>&1

asmschdRef: irRef
	@-$(LLC) $(LLC_PAR) Local1_ref.ll --print-after-all --view-sched-dags > log.1.ref 2>&1

gdb: ir
	gdb --args $(LLC) $(LLC_PAR) Local1.ll --print-after-all

gdbRef: irRef
	gdb --args $(LLC) $(LLC_PAR) Local1_ref.ll --print-after-all

clean:
	rm -rf *.bc *.ll log* *.s
