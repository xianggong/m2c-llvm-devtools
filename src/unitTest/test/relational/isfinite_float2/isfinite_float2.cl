// Auto generated kernel

__kernel void isfinite_float2(__global float2 *src_0, __global int2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int2)(isfinite(src_0[gid]));
}
