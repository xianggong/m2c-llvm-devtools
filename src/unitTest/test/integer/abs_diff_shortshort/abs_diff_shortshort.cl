// Auto generated kernel

__kernel void abs_diff_shortshort(__global short *src_0, __global short *src_1, __global ushort* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (ushort)(abs_diff(src_0[gid], src_1[gid]));
}
