// Auto generated kernel

__kernel void isordered_float4float4(__global float4 *src_0, __global float4 *src_1, __global int4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int4)(isordered(src_0[gid], src_1[gid]));
}
