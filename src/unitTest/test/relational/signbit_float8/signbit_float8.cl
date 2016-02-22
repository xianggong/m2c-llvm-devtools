// Auto generated kernel

__kernel void signbit_float8(__global float8 *src_0, __global int8* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int8)(signbit(src_0[gid]));
}
