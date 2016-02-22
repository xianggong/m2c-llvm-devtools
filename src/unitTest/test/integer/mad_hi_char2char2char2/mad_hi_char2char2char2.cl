// Auto generated kernel

__kernel void mad_hi_char2char2char2(__global char2 *src_0, __global char2 *src_1, __global char2 *src_2, __global char2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = mad_hi(src_0[gid], src_1[gid], src_2[gid]);
}
