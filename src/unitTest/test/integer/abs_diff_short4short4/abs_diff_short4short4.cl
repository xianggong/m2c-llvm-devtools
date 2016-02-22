// Auto generated kernel

__kernel void abs_diff_short4short4(__global short4 *src_0, __global short4 *src_1, __global ushort4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (ushort4)(abs_diff(src_0[gid], src_1[gid]));
}
