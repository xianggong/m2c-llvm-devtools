all: amdcc

amdcc: amdcc.c
	@-gcc $< -lOpenCL -I /home/xgong/Develop/amdappsdk291/AMDAPPSDK-2.9-1/include/ -o amdcc

clean:
	rm amdcc
