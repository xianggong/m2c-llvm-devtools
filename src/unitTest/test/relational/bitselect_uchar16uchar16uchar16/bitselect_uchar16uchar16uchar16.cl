// Auto generated kernel

__kernel void bitselect_uchar16uchar16uchar16(__global uchar16 *src_0, __global uchar16 *src_1, __global uchar16 *src_2, __global uchar16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = bitselect(src_0[gid], src_1[gid], src_2[gid]);
}
