#!/usr/bin/python

import os
import fnmatch

# Generate makefile
for root, dirs, files in os.walk(".") :
  for file in files :
    if fnmatch.fnmatch(file, '*.cl') :
      kernel_file = os.path.basename(root)
      kernel_file_name = file.split(".")[0]
      with open("Makefile.tpl", "r") as myfile:
        makefile = myfile.read()
      makefile_src = makefile.replace("KERNEL_NAME", kernel_file_name)
      makefile_src = makefile_src.replace("KERNEL_PATH", root)
      makefile_dst = open(root + "/Makefile", "w+")
      makefile_dst.write(makefile_src)
      makefile_dst.close()
