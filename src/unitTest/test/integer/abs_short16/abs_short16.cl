// Auto generated kernel

__kernel void abs_short16(__global short16 *src_0, __global ushort16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (ushort16)(abs(src_0[gid]));
}
