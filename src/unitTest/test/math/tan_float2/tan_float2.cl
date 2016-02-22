// Auto generated kernel

__kernel void tan_float2(__global float2 *src_0, __global float2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = tan(src_0[gid]);
}
