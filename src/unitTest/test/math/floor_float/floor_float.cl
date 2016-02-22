// Auto generated kernel

__kernel void floor_float(__global float *src_0, __global float* dst)
{
	int gid = get_global_id(0);
	dst[gid] = floor(src_0[gid]);
}
