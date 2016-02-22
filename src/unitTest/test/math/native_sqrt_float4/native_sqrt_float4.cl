// Auto generated kernel

__kernel void native_sqrt_float4(__global float4 *src_0, __global float4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = native_sqrt(src_0[gid]);
}
