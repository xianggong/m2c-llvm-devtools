// Auto generated kernel

__kernel void abs_uchar4(__global uchar4 *src_0, __global uchar4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = abs(src_0[gid]);
}
