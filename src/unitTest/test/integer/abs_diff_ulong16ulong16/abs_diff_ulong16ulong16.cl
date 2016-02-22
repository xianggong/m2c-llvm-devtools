// Auto generated kernel

__kernel void abs_diff_ulong16ulong16(__global ulong16 *src_0, __global ulong16 *src_1, __global ulong16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = abs_diff(src_0[gid], src_1[gid]);
}
