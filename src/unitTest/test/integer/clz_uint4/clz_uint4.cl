// Auto generated kernel

__kernel void clz_uint4(__global uint4 *src_0, __global uint4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = clz(src_0[gid]);
}
