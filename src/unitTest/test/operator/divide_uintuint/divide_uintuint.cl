// Auto generated kernel

__kernel void divide_uintuint(__global uint *src_0, __global uint *src_1, __global float* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (float)( src_0[gid] / src_1[gid]);
}
