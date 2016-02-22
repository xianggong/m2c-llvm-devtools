// Auto generated kernel

__kernel void divide_int2int2(__global int2 *src_0, __global int2 *src_1, __global float2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (float2)( src_0[gid] / src_1[gid]);
}
