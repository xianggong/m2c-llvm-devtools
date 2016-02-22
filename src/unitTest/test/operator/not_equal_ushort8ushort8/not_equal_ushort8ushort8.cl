// Auto generated kernel

__kernel void not_equal_ushort8ushort8(__global ushort8 *src_0, __global ushort8 *src_1, __global int8* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int8)( src_0[gid] != src_1[gid]);
}
