// Auto generated kernel

__kernel void abs_uint4(__global uint4 *src_0, __global uint4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = abs(src_0[gid]);
}
