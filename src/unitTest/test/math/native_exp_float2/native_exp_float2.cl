// Auto generated kernel

__kernel void native_exp_float2(__global float2 *src_0, __global float2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = native_exp(src_0[gid]);
}
