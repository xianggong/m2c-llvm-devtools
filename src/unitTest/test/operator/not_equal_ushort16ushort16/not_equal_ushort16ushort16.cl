// Auto generated kernel

__kernel void not_equal_ushort16ushort16(__global ushort16 *src_0, __global ushort16 *src_1, __global int16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int16)( src_0[gid] != src_1[gid]);
}
