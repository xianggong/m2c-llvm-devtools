// Auto generated kernel

__kernel void abs_ulong2(__global ulong2 *src_0, __global ulong2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = abs(src_0[gid]);
}
