// Auto generated kernel

__kernel void half_recip_float2(__global float2 *src_0, __global float2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = half_recip(src_0[gid]);
}
