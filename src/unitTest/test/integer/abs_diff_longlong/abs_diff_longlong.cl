// Auto generated kernel

__kernel void abs_diff_longlong(__global long *src_0, __global long *src_1, __global ulong* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (ulong)(abs_diff(src_0[gid], src_1[gid]));
}
