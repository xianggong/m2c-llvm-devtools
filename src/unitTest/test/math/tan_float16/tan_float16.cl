// Auto generated kernel

__kernel void tan_float16(__global float16 *src_0, __global float16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = tan(src_0[gid]);
}
