// Auto generated kernel

__kernel void min_short4short4(__global short4 *src_0, __global short4 *src_1, __global short4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = min(src_0[gid], src_1[gid]);
}
