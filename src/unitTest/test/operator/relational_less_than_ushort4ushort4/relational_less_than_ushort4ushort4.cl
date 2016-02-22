// Auto generated kernel

__kernel void relational_less_than_ushort4ushort4(__global ushort4 *src_0, __global ushort4 *src_1, __global int4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int4)( src_0[gid] < src_1[gid]);
}
