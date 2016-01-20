#!/usr/bin/python

import os

# Open a file
dirs = os.listdir("./")

# Generate makefile
for dir in dirs:
        if os.path.isdir(dir):
	        kernel_file = os.path.basename(dir)
	        kernel_file_name = kernel_file.split(".")[0]
	        kernel_path = kernel_file_name.split("_")[0]

        	with open("Makefile.tpl", "r") as myfile:
                	makefile = myfile.read()
	        makefile_src = makefile.replace("KERNEL_NAME", kernel_file_name)
                makefile_src = makefile_src.replace("KERNEL_PATH", kernel_path)
               	makefile_dst = open(kernel_file_name + "/Makefile", "w+")
	        makefile_dst.write(makefile_src)
        	makefile_dst.close()
