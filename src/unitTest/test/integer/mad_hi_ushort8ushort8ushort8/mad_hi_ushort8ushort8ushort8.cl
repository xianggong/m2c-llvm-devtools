// Auto generated kernel

__kernel void mad_hi_ushort8ushort8ushort8(__global ushort8 *src_0, __global ushort8 *src_1, __global ushort8 *src_2, __global ushort8* dst)
{
	int gid = get_global_id(0);
	dst[gid] = mad_hi(src_0[gid], src_1[gid], src_2[gid]);
}
