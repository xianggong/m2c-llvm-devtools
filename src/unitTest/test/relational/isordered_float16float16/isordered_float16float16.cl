// Auto generated kernel

__kernel void isordered_float16float16(__global float16 *src_0, __global float16 *src_1, __global int16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int16)(isordered(src_0[gid], src_1[gid]));
}
