// Auto generated kernel

__kernel void half_exp2_float4(__global float4 *src_0, __global float4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = half_exp2(src_0[gid]);
}
