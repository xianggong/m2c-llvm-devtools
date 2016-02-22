// Auto generated kernel

__kernel void abs_long16(__global long16 *src_0, __global ulong16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (ulong16)(abs(src_0[gid]));
}
