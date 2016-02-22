#!/usr/bin/python

import os
import subprocess
import sys
import shutil


def runCommand(command):
        p = subprocess.Popen(command,
                             stdout=subprocess.PIPE,
                             stderr=subprocess.STDOUT)
        p.wait()
        return iter(p.stdout.readline, b'')


def dumpRunCommand(command, dump_file_name, postfix):
        dumpFile = open(dump_file_name + postfix, "w+")
        dumpFile.write(command + "\n")
        for line in runCommand(command.split()):
                dumpFile.write(line)


def rmFile(file_name):
        cmd = "rm -rf " + file_name
        runCommand(cmd.split())


def ensureDir(f):
    d = os.path.dirname(f)
    if not os.path.exists(d):
        os.makedirs(d)


def main():
        kernel_file_path = sys.argv[1]
        kernel_file = os.path.basename(kernel_file_path)
        kernel_file_name = kernel_file.split(".")[0]
        kernel_path = kernel_file_name.split("_")[0]
        if not os.path.exists(kernel_file_name):
                os.makedirs(kernel_file_name)
	dst_kernel_file = "./" + kernel_file_name + "/" + kernel_file
	if kernel_file_path != dst_kernel_file: 
	        shutil.copyfile(kernel_file_path, dst_kernel_file)

        with open("Makefile.tpl", "r") as myfile:
                makefile = myfile.read()
                makefile_src = makefile.replace("KERNEL_NAME", kernel_file_name)
                makefile_src = makefile_src.replace("KERNEL_PATH", kernel_path)
                makefile_dst = open(kernel_file_name + "/Makefile", "w+")
                makefile_dst.write(makefile_src)
                makefile_dst.close()
	if len(sys.argv) == 3:
		shutil.move(kernel_file_name, sys.argv[2])

if __name__ == "__main__":
    main()
