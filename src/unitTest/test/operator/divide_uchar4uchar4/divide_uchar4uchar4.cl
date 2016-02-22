// Auto generated kernel

__kernel void divide_uchar4uchar4(__global uchar4 *src_0, __global uchar4 *src_1, __global float4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (float4)( src_0[gid] / src_1[gid]);
}
