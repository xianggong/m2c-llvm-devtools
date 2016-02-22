// Auto generated kernel

__kernel void equal_shortshort(__global short *src_0, __global short *src_1, __global int* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int)( src_0[gid] == src_1[gid]);
}
