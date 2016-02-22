// Auto generated kernel

__kernel void remainder_float2float2(__global float2 *src_0, __global float2 *src_1, __global float2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = remainder(src_0[gid], src_1[gid]);
}
