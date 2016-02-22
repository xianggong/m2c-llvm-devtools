// Auto generated kernel

__kernel void relational_less_than_uchar2uchar2(__global uchar2 *src_0, __global uchar2 *src_1, __global int2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int2)( src_0[gid] < src_1[gid]);
}
