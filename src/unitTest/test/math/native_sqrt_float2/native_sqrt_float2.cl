// Auto generated kernel

__kernel void native_sqrt_float2(__global float2 *src_0, __global float2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = native_sqrt(src_0[gid]);
}
