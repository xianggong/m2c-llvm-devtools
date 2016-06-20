#!/usr/bin/env python

import argparse
import itertools


class Kernel:
    """A kernel contains several kernel functions"""

    def __init__(self, file_name=None):
        self.file_name = file_name
        if file_name is not None:
            self.file_ = open(file_name, "r")
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
                kernel_func = KernelFunc(self.file_name, raw_text)
                funcs.append(kernel_func)
                raw_text = ""
        return funcs

    # Overload == operator
    def __eq__(self, other):
        return len(self.funcs_) == len(other.funcs_)

    def dump(self, file_name):
        asm = ''
        for index in range(len(self.funcs_)):
            asm += self.funcs_[index].get_asm()
        with open(file_name, "w") as text_file:
            text_file.write(asm)


class KernelFunc:

    def __init__(self, kernel_name, raw_text=None):
        self.kernel_name_ = kernel_name
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

    def get_asm(self):
        asm = self.globl_section_
        asm += self.text_section_
        asm += self.args_section_
        asm += self.metadata_section_
        return asm


class KernelMerger:

    def __init__(self):
        self.merged_kernel = Kernel()

    def mergeKernel(self, kernel0, kernel1):
        # Make sure contains same amount of kernel functions
        assert kernel0 == kernel1

        for index in range(len(kernel0.funcs_)):
            merged_func = self.mergeFunc(
                kernel0.funcs_[index], kernel1.funcs_[index])
            self.merged_kernel.funcs_.append(merged_func)
        return self.merged_kernel

    def mergeFunc(self, kernelFunc0, kernelFunc1):

        kernel_func_merged = KernelFunc('merged')

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
        kernel_func_merged.metadata_section_ += '// Merged ' + \
            kernelFunc0.kernel_name_ + ' ' + kernelFunc1.kernel_name_ + '\n\n'

        # Ignore first 3 lines
        text_section = ""
        start_append = False
        for line in kernelFunc1.text_section_.splitlines():
            if "entry" in line:
                start_append = True
            if start_append:
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
    parser.add_argument('kernels', nargs='+', help='2 Kernels to be merged')

    args = parser.parse_args()

    for subset in itertools.combinations(args.kernels, 2):
        kernel0_str, kernel1_str = subset
        common_prefix = kernel0_str.split('_')[0]
        kernel0_sched = kernel0_str[:-2].split('_')[2]
        kernel1_sched = kernel1_str[:-2].split('_')[2]

        file_name = "_".join([common_prefix, 'fuse',
                              kernel0_sched, kernel1_sched]) + '.s'
        print 'Merging: ', kernel0_str, kernel1_str
        kernel0 = Kernel(kernel0_str)
        kernel1 = Kernel(kernel1_str)
        km = KernelMerger()
        merged_kernel = km.mergeKernel(kernel0, kernel1)
        merged_kernel.dump(file_name)

if __name__ == '__main__':
    main()
