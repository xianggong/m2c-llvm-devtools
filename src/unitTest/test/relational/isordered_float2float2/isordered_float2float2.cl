// Auto generated kernel

__kernel void isordered_float2float2(__global float2 *src_0, __global float2 *src_1, __global int2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int2)(isordered(src_0[gid], src_1[gid]));
}
