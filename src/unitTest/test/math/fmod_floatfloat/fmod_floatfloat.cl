// Auto generated kernel

__kernel void fmod_floatfloat(__global float *src_0, __global float *src_1, __global float* dst)
{
	int gid = get_global_id(0);
	dst[gid] = fmod(src_0[gid], src_1[gid]);
}
