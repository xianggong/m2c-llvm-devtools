// Auto generated kernel

__kernel void not_equal_intint(__global int *src_0, __global int *src_1, __global int* dst)
{
	int gid = get_global_id(0);
	dst[gid] =  src_0[gid] != src_1[gid];
}
