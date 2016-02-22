// Auto generated kernel

__kernel void abs_short2(__global short2 *src_0, __global ushort2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (ushort2)(abs(src_0[gid]));
}
