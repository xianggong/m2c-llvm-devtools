include ../Makefile.com

all: ir irRef asm asmRef amdRef

amdRef: VectorAddition_Kernel.cl
	@-$(AMDCC) $< >/dev/null 2>&1
	@-rm *.il *.i
	@-mv _temp*.isa VectorAddition_Kernel.isa
	@-rm _temp_0*

ir: VectorAddition_Kernel.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR) $< > log.0 2>&1 

irRef: VectorAddition_Kernel.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR_REF) $< -o VectorAddition_Kernel_ref.ll > log.0.ref 2>&1 

asm: ir
	@-$(LLC) $(LLC_PAR) VectorAddition_Kernel.ll --print-after-all --debug > log.1 2>&1

asmcb1: ir
	@-$(LLC) $(LLC_PAR) VectorAddition_Kernel.ll --print-after-all --debug --view-dag-combine1-dags > log.1 2>&1

asmlgl: ir
	@-$(LLC) $(LLC_PAR) VectorAddition_Kernel.ll --print-after-all --debug --view-legalize-dags > log.1 2>&1

asmcb2: ir
	@-$(LLC) $(LLC_PAR) VectorAddition_Kernel.ll --print-after-all --debug --view-dag-combine2-dags > log.1 2>&1

asmisel: ir
	@-$(LLC) $(LLC_PAR) VectorAddition_Kernel.ll --print-after-all --debug --view-isel-dags > log.1 2>&1

asmschd: ir
	@-$(LLC) $(LLC_PAR) VectorAddition_Kernel.ll --print-after-all --debug --view-sched-dags > log.1 2>&1

asmRef: irRef
	@-$(LLC) $(LLC_PAR) VectorAddition_Kernel_ref.ll --print-after-all --debug > log.1.ref 2>&1

asmcb1Ref: irRef
	@-$(LLC) $(LLC_PAR) VectorAddition_Kernel_ref.ll --print-after-all --debug --view-dag-combine1-dags > log.1.ref 2>&1

asmlgRef: irRef
	@-$(LLC) $(LLC_PAR) VectorAddition_Kernel_ref.ll --print-after-all --debug --view-legalize-dags > log.1.ref 2>&1

asmcb2Ref: irRef
	@-$(LLC) $(LLC_PAR) VectorAddition_Kernel_ref.ll --print-after-all --debug --view-dag-combine2-dags > log.1.ref 2>&1

asmiselRef: irRef
	@-$(LLC) $(LLC_PAR) VectorAddition_Kernel_ref.ll --print-after-all --debug --view-isel-dags > log.1.ref 2>&1

asmschdRef: irRef
	@-$(LLC) $(LLC_PAR) VectorAddition_Kernel_ref.ll --print-after-all --debug --view-sched-dags > log.1.ref 2>&1

gdb: ir
	gdb --args $(LLC) $(LLC_PAR) VectorAddition_Kernel.ll --print-after-all --debug

gdbRef: irRef
	gdb --args $(LLC) $(LLC_PAR) VectorAddition_Kernel_ref.ll --print-after-all --debug

clean:
	rm -rf *.bc *.isa *.ll log* *.s
