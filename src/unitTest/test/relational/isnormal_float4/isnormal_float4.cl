// Auto generated kernel

__kernel void isnormal_float4(__global float4 *src_0, __global int4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int4)(isnormal(src_0[gid]));
}
