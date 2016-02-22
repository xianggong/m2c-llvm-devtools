// Auto generated kernel

__kernel void abs_long8(__global long8 *src_0, __global ulong8* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (ulong8)(abs(src_0[gid]));
}
