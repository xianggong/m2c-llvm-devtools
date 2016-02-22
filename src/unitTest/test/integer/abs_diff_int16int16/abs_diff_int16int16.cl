// Auto generated kernel

__kernel void abs_diff_int16int16(__global int16 *src_0, __global int16 *src_1, __global uint16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (uint16)(abs_diff(src_0[gid], src_1[gid]));
}
