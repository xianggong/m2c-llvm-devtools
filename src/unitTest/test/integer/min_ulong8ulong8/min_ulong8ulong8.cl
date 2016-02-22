// Auto generated kernel

__kernel void min_ulong8ulong8(__global ulong8 *src_0, __global ulong8 *src_1, __global ulong8* dst)
{
	int gid = get_global_id(0);
	dst[gid] = min(src_0[gid], src_1[gid]);
}
