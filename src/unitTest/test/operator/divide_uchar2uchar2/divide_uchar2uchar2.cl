// Auto generated kernel

__kernel void divide_uchar2uchar2(__global uchar2 *src_0, __global uchar2 *src_1, __global float2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (float2)( src_0[gid] / src_1[gid]);
}
