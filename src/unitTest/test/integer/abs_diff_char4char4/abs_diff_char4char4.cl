// Auto generated kernel

__kernel void abs_diff_char4char4(__global char4 *src_0, __global char4 *src_1, __global uchar4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (uchar4)(abs_diff(src_0[gid], src_1[gid]));
}
