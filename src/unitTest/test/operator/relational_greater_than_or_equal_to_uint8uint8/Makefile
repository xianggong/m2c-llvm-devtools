include ../../../Makefile.com

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

amdRef: relational_greater_than_or_equal_to_uint8uint8.cl
	@-$(AMDCC) $< >/dev/null 2>&1
	@-rm *.il *.i
	@-rename 's/_temp_0_Capeverde_//' *.isa
	@-rm _temp_0*

ir: relational_greater_than_or_equal_to_uint8uint8.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR) $< > log.0 2>&1 

irRef: relational_greater_than_or_equal_to_uint8uint8.cl
	@-$(CLANG) $(CLANG_INC) $(CLANG_PAR_REF) $< -o relational_greater_than_or_equal_to_uint8uint8_ref.ll > log.0.ref 2>&1 

asm: ir
	@-$(LLC) $(LLC_PAR) relational_greater_than_or_equal_to_uint8uint8.ll --print-after-all --debug > log.1 2>&1

asmlsroff: ir
	@-$(LLC) $(LLC_PAR) relational_greater_than_or_equal_to_uint8uint8.ll --disable-lsr --print-after-all --debug > log.1 2>&1

asmpre2bin:
	@-$(PRETOBIN) relational_greater_than_or_equal_to_uint8uint8.s > log.2 2>&1

asm2bin:
	@-$(M2C) --si2bin relational_greater_than_or_equal_to_uint8uint8.s > log.2 2>&1

2bingdb:
	@-gdb --args $(M2C) --si2bin relational_greater_than_or_equal_to_uint8uint8.s

scpbin: 
	@-scp relational_greater_than_or_equal_to_uint8uint8.bin $(REMOTE_SERVER):$(REMOTE_PATH)/src/unitTest/./test/operator/relational_greater_than_or_equal_to_uint8uint8

run: scpbin
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/unitTest/./test/operator/relational_greater_than_or_equal_to_uint8uint8; make && make run"

runisa: scpbin
	@-ssh $(REMOTE_SERVER) "cd $(REMOTE_PATH)/src/unitTest/./test/operator/relational_greater_than_or_equal_to_uint8uint8; make && make runm2sisa && scp debug.isa xgong@$(MYIP):$(CURDIR)"

asmcb1: ir
	@-$(LLC) $(LLC_PAR) relational_greater_than_or_equal_to_uint8uint8.ll --print-after-all --debug --view-dag-combine1-dags > log.1 2>&1

asmlgl: ir
	@-$(LLC) $(LLC_PAR) relational_greater_than_or_equal_to_uint8uint8.ll --print-after-all --debug --view-legalize-dags > log.1 2>&1

asmcb2: ir
	@-$(LLC) $(LLC_PAR) relational_greater_than_or_equal_to_uint8uint8.ll --print-after-all --debug --view-dag-combine2-dags > log.1 2>&1

asmisel: ir
	@-$(LLC) $(LLC_PAR) relational_greater_than_or_equal_to_uint8uint8.ll --print-after-all --debug --view-isel-dags > log.1 2>&1

asmschd: ir
	@-$(LLC) $(LLC_PAR) relational_greater_than_or_equal_to_uint8uint8.ll --print-after-all --debug --view-sched-dags > log.1 2>&1

asmRef: irRef
	@-$(LLC) $(LLC_PAR) relational_greater_than_or_equal_to_uint8uint8_ref.ll --print-after-all --debug > log.1.ref 2>&1

asmcb1Ref: irRef
	@-$(LLC) $(LLC_PAR) relational_greater_than_or_equal_to_uint8uint8_ref.ll --print-after-all --debug --view-dag-combine1-dags > log.1.ref 2>&1

asmlgRef: irRef
	@-$(LLC) $(LLC_PAR) relational_greater_than_or_equal_to_uint8uint8_ref.ll --print-after-all --debug --view-legalize-dags > log.1.ref 2>&1

asmcb2Ref: irRef
	@-$(LLC) $(LLC_PAR) relational_greater_than_or_equal_to_uint8uint8_ref.ll --print-after-all --debug --view-dag-combine2-dags > log.1.ref 2>&1

asmiselRef: irRef
	@-$(LLC) $(LLC_PAR) relational_greater_than_or_equal_to_uint8uint8_ref.ll --print-after-all --debug --view-isel-dags > log.1.ref 2>&1

asmschdRef: irRef
	@-$(LLC) $(LLC_PAR) relational_greater_than_or_equal_to_uint8uint8_ref.ll --print-after-all --debug --view-sched-dags > log.1.ref 2>&1

gdb: ir
	gdb --args $(LLC) $(LLC_PAR) relational_greater_than_or_equal_to_uint8uint8.ll --print-after-all --debug

gdbRef: irRef
	gdb --args $(LLC) $(LLC_PAR) relational_greater_than_or_equal_to_uint8uint8_ref.ll --print-after-all --debug

clean:
	rm -rf *.bc *.isa *.ll log* *.s *.bin
