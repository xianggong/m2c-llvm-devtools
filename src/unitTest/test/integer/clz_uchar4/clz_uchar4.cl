// Auto generated kernel

__kernel void clz_uchar4(__global uchar4 *src_0, __global uchar4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = clz(src_0[gid]);
}
