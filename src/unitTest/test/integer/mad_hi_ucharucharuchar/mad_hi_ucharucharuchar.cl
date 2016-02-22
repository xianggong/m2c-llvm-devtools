// Auto generated kernel

__kernel void mad_hi_ucharucharuchar(__global uchar *src_0, __global uchar *src_1, __global uchar *src_2, __global uchar* dst)
{
	int gid = get_global_id(0);
	dst[gid] = mad_hi(src_0[gid], src_1[gid], src_2[gid]);
}
