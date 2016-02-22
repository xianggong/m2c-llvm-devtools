// Auto generated kernel

__kernel void abs_diff_long2long2(__global long2 *src_0, __global long2 *src_1, __global ulong2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (ulong2)(abs_diff(src_0[gid], src_1[gid]));
}
