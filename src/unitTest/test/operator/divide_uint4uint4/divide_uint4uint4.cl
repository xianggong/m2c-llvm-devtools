// Auto generated kernel

__kernel void divide_uint4uint4(__global uint4 *src_0, __global uint4 *src_1, __global float4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (float4)( src_0[gid] / src_1[gid]);
}
