// Auto generated kernel

__kernel void isinf_float4(__global float4 *src_0, __global int4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int4)(isinf(src_0[gid]));
}
