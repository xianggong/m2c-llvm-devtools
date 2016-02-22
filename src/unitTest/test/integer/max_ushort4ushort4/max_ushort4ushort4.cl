// Auto generated kernel

__kernel void max_ushort4ushort4(__global ushort4 *src_0, __global ushort4 *src_1, __global ushort4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = max(src_0[gid], src_1[gid]);
}
