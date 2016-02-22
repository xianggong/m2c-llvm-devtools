// Auto generated kernel

__kernel void fmax_float4float4(__global float4 *src_0, __global float4 *src_1, __global float4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = fmax(src_0[gid], src_1[gid]);
}
