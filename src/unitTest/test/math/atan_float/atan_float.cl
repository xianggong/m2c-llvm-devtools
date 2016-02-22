// Auto generated kernel

__kernel void atan_float(__global float *src_0, __global float* dst)
{
	int gid = get_global_id(0);
	dst[gid] = atan(src_0[gid]);
}
