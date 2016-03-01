#!/usr/bin/python

import argparse


class Kernel:

    def __init__(self, file=None):
        if file is not None:
            self.file_ = open(file, "r")
            self.funcs_ = self.buildFuncList()
        else:
            self.file_ = ""
            self.funcs_ = []

    def buildFuncList(self):
        funcs = []
        raw_text = ""
        for line in self.file_:
            raw_text = raw_text + line
            if "TGID_Z_EN = 1" in line:
                kernel_func = KernelFunc(raw_text)
                funcs.append(kernel_func)
                raw_text = ""
        return funcs

    # Overload == operator
    def __eq__(self, other):
        return len(self.funcs_) == len(other.funcs_)

    def dump(self):
        for index in range(len(self.funcs_)):
            self.funcs_[index].dump()


class KernelFunc:

    def __init__(self, raw_text=None):
        if raw_text is not None:
            self.raw_text_ = raw_text
        else:
            self.raw_text_ = ""

        # Each kernel function has 4 sections
        self.sections_ = ["", "", "", ""]
        self.globl_section_ = ""
        self.text_section_ = ""
        self.args_section_ = ""
        self.metadata_section_ = ""

        # Append to corresponding sections
        index = 0
        for line in self.raw_text_.splitlines():
            if ".global" in line:
                index = 0
            elif ".text" in line:
                index = 1
            elif ".args" in line:
                index = 2
            elif ".metadata" in line:
                index = 3

            self.sections_[index] += line + "\n"

        self.globl_section_ = self.sections_[0]
        self.text_section_ = self.sections_[1]
        self.args_section_ = self.sections_[2]
        self.metadata_section_ = self.sections_[3]

    def dump(self):
        print self.globl_section_
        print self.text_section_
        print self.args_section_
        print self.metadata_section_


class KernelMerger:

    def __init__(self):
        self.merged_kernel = Kernel()

    def mergeKernel(self, kernel0, kernel1):
        # Make sure contains same amount of kernel functions
        assert(kernel0 == kernel1)

        for index in range(len(kernel0.funcs_)):
            merged_func = self.mergeFunc(
                kernel0.funcs_[index], kernel1.funcs_[index])
            self.merged_kernel.funcs_.append(merged_func)
        return self.merged_kernel

    def mergeFunc(self, kernelFunc0, kernelFunc1):

        kernel_func_merged = KernelFunc()

        # Only merge .text section, other sections are inherited from
        # kernelFunc0
        kernel_func_merged.globl_section_ = kernelFunc0.globl_section_
        kernel_func_merged.text_section_ = kernelFunc0.text_section_
        kernel_func_merged.args_section_ = kernelFunc0.args_section_
        # Warning when metadata section doesn't match
        if kernelFunc0.metadata_section_ != kernelFunc1.metadata_section_:
            kernel_func_merged.metadata_section_ += \
                "// Merge warning: sections do not match\n"
        kernel_func_merged.metadata_section_ += kernelFunc0.metadata_section_

        # Ignore first 3 lines
        text_section = "// ********************* Second kernel starts\n"
        for line in kernelFunc1.text_section_.splitlines():
            if "entry" in line:
                text_section += line + "\n"

        # To avoid branch to wrong label
        text_section = text_section.replace("BB", "SKBB")

        # print text_section
        kernel_func_merged.text_section_ += text_section

        # Return
        return kernel_func_merged


def main():
    # Arg parser
    parser = argparse.ArgumentParser(
        description='Multi2Sim kernel merger')
    parser.add_argument('kernels', nargs=2, help='2 Kernels to be merged')

    args = parser.parse_args()

    km = KernelMerger()
    kernel0 = Kernel(args.kernels[0])
    kernel1 = Kernel(args.kernels[1])

    merged_kernel = km.mergeKernel(kernel0, kernel1)
    merged_kernel.dump()

if __name__ == '__main__':
    main()
