// Auto generated kernel

__kernel void abs_diff_short16short16(__global short16 *src_0, __global short16 *src_1, __global ushort16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (ushort16)(abs_diff(src_0[gid], src_1[gid]));
}
