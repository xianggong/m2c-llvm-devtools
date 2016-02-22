// Auto generated kernel

__kernel void mad_floatfloatfloat(__global float *src_0, __global float *src_1, __global float *src_2, __global float* dst)
{
	int gid = get_global_id(0);
	dst[gid] = mad(src_0[gid], src_1[gid], src_2[gid]);
}
