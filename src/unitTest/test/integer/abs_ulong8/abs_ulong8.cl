// Auto generated kernel

__kernel void abs_ulong8(__global ulong8 *src_0, __global ulong8* dst)
{
	int gid = get_global_id(0);
	dst[gid] = abs(src_0[gid]);
}
