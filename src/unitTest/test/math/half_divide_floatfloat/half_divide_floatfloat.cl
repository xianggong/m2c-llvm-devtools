// Auto generated kernel

__kernel void half_divide_floatfloat(__global float *src_0, __global float *src_1, __global float* dst)
{
	int gid = get_global_id(0);
	dst[gid] = half_divide(src_0[gid], src_1[gid]);
}
