// Auto generated kernel

__kernel void isnormal_float(__global float *src_0, __global int* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int)(isnormal(src_0[gid]));
}
