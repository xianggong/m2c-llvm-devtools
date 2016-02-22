// Auto generated kernel

__kernel void degrees_float2(__global float2 *src_0, __global float2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = degrees(src_0[gid]);
}
