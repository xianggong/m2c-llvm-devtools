// Auto generated kernel

__kernel void min_short2short2(__global short2 *src_0, __global short2 *src_1, __global short2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = min(src_0[gid], src_1[gid]);
}
