// Auto generated kernel

__kernel void equal_short2short2(__global short2 *src_0, __global short2 *src_1, __global int2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int2)( src_0[gid] == src_1[gid]);
}
