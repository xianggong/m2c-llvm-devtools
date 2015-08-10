# User need to set root information
LIBCLC_ROOT = /home/xgong/Develop/apps/libclc/usr/local
LLVM_ROOT = /home/xgong/Develop/llvm/build/bin

LIBCLC_LIB = $(LIBCLC_ROOT)/lib/clc/
LIBCLC_HEADER = $(LIBCLC_ROOT)/usr/local/include

CLANG = $(LLVM_ROOT)/clang
LLC = $(LLVM_ROOT)/llc

GPU = amdgcn
GPUARCH = verde

CLANG_INC  = -I LIBCLC_HEADER 
CLANG_PAR  = -S -emit-llvm -Xclang -mlink-bitcode-file -Xclang $(LIBCLC_LIB)/$(GPUARCH)-$(GPU)--.bc
CLANG_PAR += -Dcl_clang_storage_class_specifiers -target $(GPU) -mcpu=$(GPUARCH)

LLC_PAR = -march=$(GPU) -mcpu=$(GPUARCH)
