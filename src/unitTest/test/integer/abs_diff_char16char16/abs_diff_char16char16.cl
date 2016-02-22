// Auto generated kernel

__kernel void abs_diff_char16char16(__global char16 *src_0, __global char16 *src_1, __global uchar16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (uchar16)(abs_diff(src_0[gid], src_1[gid]));
}
