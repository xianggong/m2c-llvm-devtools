// Auto generated kernel

__kernel void relational_less_than_ucharuchar(__global uchar *src_0, __global uchar *src_1, __global int* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int)( src_0[gid] < src_1[gid]);
}
