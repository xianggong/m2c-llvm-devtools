// Auto generated kernel

__kernel void isfinite_float(__global float *src_0, __global int* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int)(isfinite(src_0[gid]));
}
