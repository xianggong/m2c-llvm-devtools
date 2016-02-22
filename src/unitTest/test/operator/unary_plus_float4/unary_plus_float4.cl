// Auto generated kernel

__kernel void unary_plus_float4(__global float4 *src_0, __global float4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = + src_0[gid] ;
}
