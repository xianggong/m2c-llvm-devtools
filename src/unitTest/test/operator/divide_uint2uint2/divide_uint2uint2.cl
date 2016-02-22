// Auto generated kernel

__kernel void divide_uint2uint2(__global uint2 *src_0, __global uint2 *src_1, __global float2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (float2)( src_0[gid] / src_1[gid]);
}
