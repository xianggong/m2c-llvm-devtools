// Auto generated kernel

__kernel void abs_diff_ulong4ulong4(__global ulong4 *src_0, __global ulong4 *src_1, __global ulong4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = abs_diff(src_0[gid], src_1[gid]);
}
