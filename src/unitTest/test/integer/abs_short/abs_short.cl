// Auto generated kernel

__kernel void abs_short(__global short *src_0, __global ushort* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (ushort)(abs(src_0[gid]));
}
