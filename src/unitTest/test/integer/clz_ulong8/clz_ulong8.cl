// Auto generated kernel

__kernel void clz_ulong8(__global ulong8 *src_0, __global ulong8* dst)
{
	int gid = get_global_id(0);
	dst[gid] = clz(src_0[gid]);
}
