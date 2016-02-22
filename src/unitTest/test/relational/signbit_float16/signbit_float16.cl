// Auto generated kernel

__kernel void signbit_float16(__global float16 *src_0, __global int16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int16)(signbit(src_0[gid]));
}
