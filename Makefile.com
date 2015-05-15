LLVM_ROOT = /home/xgong/Develop/apps/m2c-llvm/bin
CLANG = $(LLVM_ROOT)/clang
LLVM_AS = $(LLVM_ROOT)/llvm-as
LLVM_DIS = $(LLVM_ROOT)/llvm-dis
OPT = $(LLVM_ROOT)/opt
LLC = /home/xgong/Develop/apps/m2c-llvm/bin/llc

CLANG_INC  = -I ../include -include ../include/clc/clc.h 
CLANG_PAR  = -S -emit-llvm -D cl_clang_storage_class_specifiers
CLANG_PAR += -O0 --target=amdgcn -mcpu=verde

LLC_PAR = -march=amdgcn -mcpu=verde