// Auto generated kernel

__kernel void native_log2_float2(__global float2 *src_0, __global float2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = native_log2(src_0[gid]);
}
