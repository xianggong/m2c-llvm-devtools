# User need to set root information
LIBCLC_ROOT = /home/xgong/Develop/apps/libclc/usr/local
LLVM_ROOT = /home/xgong/Develop/llvm/build/bin

LIBCLC_LIB = $(LIBCLC_ROOT)/lib/clc
LIBCLC_HEADER = $(LIBCLC_ROOT)/include

CLANG = $(LLVM_ROOT)/clang
LLC = $(LLVM_ROOT)/llc
AMDCC = ../../../bin/amdcc
PRETOBIN = ../../../bin/pretobin.sh
REMOTE_SERVER = xgong@nyan.ece.neu.edu
TEST_PATH = /home/xgong/m2s-bench-amdapp-2.9-si/src

GPU = amdgcn
GPUARCH = verde
OS = m2s
TARGET_TRIPLE = $(GPU)-unknown-$(OS)-unknown
TARGET_TRIPLE_REF = $(GPU)-unknown-unknown-unknown

CLANG_INC  = -I $(LIBCLC_HEADER) -include $(LIBCLC_HEADER)/clc/clc.h
CLANG_PAR  = -S -emit-llvm -Xclang -mlink-bitcode-file -Xclang $(LIBCLC_LIB)/$(GPUARCH)-$(GPU)--.bc
CLANG_PAR += -Dcl_clang_storage_class_specifiers -target $(TARGET_TRIPLE) -mcpu=$(GPUARCH)

CLANG_PAR_REF = -S -emit-llvm -Xclang -mlink-bitcode-file -Xclang $(LIBCLC_LIB)/$(GPUARCH)-$(GPU)--.bc
CLANG_PAR_REF += -Dcl_clang_storage_class_specifiers -target $(TARGET_TRIPLE_REF) -mcpu=$(GPUARCH)

LLC_PAR = -march=$(GPU) -mcpu=$(GPUARCH) 
