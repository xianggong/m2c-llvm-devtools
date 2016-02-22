// Auto generated kernel

__kernel void asinpi_float(__global float *src_0, __global float* dst)
{
	int gid = get_global_id(0);
	dst[gid] = asinpi(src_0[gid]);
}
