// Auto generated kernel

__kernel void multiply_ushortushort(__global ushort *src_0, __global ushort *src_1, __global ushort* dst)
{
	int gid = get_global_id(0);
	dst[gid] =  src_0[gid] * src_1[gid];
}
