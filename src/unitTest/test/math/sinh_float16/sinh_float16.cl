// Auto generated kernel

__kernel void sinh_float16(__global float16 *src_0, __global float16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = sinh(src_0[gid]);
}
