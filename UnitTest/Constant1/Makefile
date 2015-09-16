include ../Makefile.com

all: ir irref asm asmcb1 asmlgl asmcb2 asmisel asmschd asmRef asmcb1Ref asmlgRef asmcb2Ref asmiselRef asmschdRef

ir: Constant1.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR) $< > log.0 2>&1 

irRef: Constant1.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR_REF) $< -o Constant1_ref.ll > log.0 2>&1 

asm:
	@-$(LLC) $(LLC_PAR) Constant1.ll --print-after-all $< > log.1 2>&1

asmcb1:
	@-$(LLC) $(LLC_PAR) Constant1.ll --print-after-all --view-dag-combine1-dags $< > log.1 2>&1

asmlgl:
	@-$(LLC) $(LLC_PAR) Constant1.ll --print-after-all --view-legalize-dags $< > log.1 2>&1

asmcb2:
	@-$(LLC) $(LLC_PAR) Constant1.ll --print-after-all --view-dag-combine2-dags $< > log.1 2>&1

asmisel:
	@-$(LLC) $(LLC_PAR) Constant1.ll --print-after-all --view-isel-dags $< > log.1 2>&1

asmschd:
	@-$(LLC) $(LLC_PAR) Constant1.ll --print-after-all --view-sched-dags $< > log.1 2>&1

asmRef:
	@-$(LLC) $(LLC_PAR) Constant1_ref.ll --print-after-all $< > log.1 2>&1

asmcb1Ref:
	@-$(LLC) $(LLC_PAR) Constant1_ref.ll --print-after-all --view-dag-combine1-dags $< > log.1 2>&1

asmlgRef:
	@-$(LLC) $(LLC_PAR) Constant1_ref.ll --print-after-all --view-legalize-dags $< > log.1 2>&1

asmcb2Ref:
	@-$(LLC) $(LLC_PAR) Constant1_ref.ll --print-after-all --view-dag-combine2-dags $< > log.1 2>&1

asmiselRef:
	@-$(LLC) $(LLC_PAR) Constant1_ref.ll --print-after-all --view-isel-dags $< > log.1 2>&1

asmschdRef:
	@-$(LLC) $(LLC_PAR) Constant1_ref.ll --print-after-all --view-sched-dags $< > log.1 2>&1

clean:
	rm -rf *.bc *.ll log* *.s
