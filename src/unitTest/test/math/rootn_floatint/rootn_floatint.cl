// Auto generated kernel

__kernel void rootn_floatint(__global float *src_0, __global int *src_1, __global float* dst)
{
	int gid = get_global_id(0);
	dst[gid] = rootn(src_0[gid], src_1[gid]);
}
