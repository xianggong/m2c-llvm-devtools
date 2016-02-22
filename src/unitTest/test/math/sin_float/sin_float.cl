// Auto generated kernel

__kernel void sin_float(__global float *src_0, __global float* dst)
{
	int gid = get_global_id(0);
	dst[gid] = sin(src_0[gid]);
}
