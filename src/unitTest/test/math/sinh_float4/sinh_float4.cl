// Auto generated kernel

__kernel void sinh_float4(__global float4 *src_0, __global float4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = sinh(src_0[gid]);
}
