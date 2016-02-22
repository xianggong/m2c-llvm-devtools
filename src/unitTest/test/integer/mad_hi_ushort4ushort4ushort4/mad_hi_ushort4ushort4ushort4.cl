// Auto generated kernel

__kernel void mad_hi_ushort4ushort4ushort4(__global ushort4 *src_0, __global ushort4 *src_1, __global ushort4 *src_2, __global ushort4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = mad_hi(src_0[gid], src_1[gid], src_2[gid]);
}
