// Auto generated kernel

__kernel void abs_diff_char2char2(__global char2 *src_0, __global char2 *src_1, __global uchar2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (uchar2)(abs_diff(src_0[gid], src_1[gid]));
}
