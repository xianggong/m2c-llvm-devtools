// Auto generated kernel

__kernel void native_divide_float16(__global float16 *src_0, __global float16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = native_divide(src_0[gid]);
}
