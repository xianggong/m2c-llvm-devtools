// Auto generated kernel

__kernel void sinh_float2(__global float2 *src_0, __global float2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = sinh(src_0[gid]);
}
