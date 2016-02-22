// Auto generated kernel

__kernel void clz_uchar16(__global uchar16 *src_0, __global uchar16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = clz(src_0[gid]);
}
