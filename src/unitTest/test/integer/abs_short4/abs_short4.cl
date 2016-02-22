// Auto generated kernel

__kernel void abs_short4(__global short4 *src_0, __global ushort4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (ushort4)(abs(src_0[gid]));
}
