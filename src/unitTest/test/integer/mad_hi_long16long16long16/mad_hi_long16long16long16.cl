// Auto generated kernel

__kernel void mad_hi_long16long16long16(__global long16 *src_0, __global long16 *src_1, __global long16 *src_2, __global long16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = mad_hi(src_0[gid], src_1[gid], src_2[gid]);
}
