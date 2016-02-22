// Auto generated kernel

__kernel void relational_greater_than_or_equal_to_ushortushort(__global ushort *src_0, __global ushort *src_1, __global int* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int)( src_0[gid] >= src_1[gid]);
}
