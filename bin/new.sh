#!/bin/bash

cl_files=$(find $1 -name *.cl)

for f in $cl_files
do
	#echo $f $2 
	./new.py $f $2 
done 
