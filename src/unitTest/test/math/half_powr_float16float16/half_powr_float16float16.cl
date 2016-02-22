// Auto generated kernel

__kernel void half_powr_float16float16(__global float16 *src_0, __global float16 *src_1, __global float16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = half_powr(src_0[gid], src_1[gid]);
}
