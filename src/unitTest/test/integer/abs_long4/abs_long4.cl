// Auto generated kernel

__kernel void abs_long4(__global long4 *src_0, __global ulong4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (ulong4)(abs(src_0[gid]));
}
