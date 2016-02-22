// Auto generated kernel

__kernel void abs_diff_long16long16(__global long16 *src_0, __global long16 *src_1, __global ulong16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (ulong16)(abs_diff(src_0[gid], src_1[gid]));
}
