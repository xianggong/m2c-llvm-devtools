// Auto generated kernel

__kernel void abs_diff_charchar(__global char *src_0, __global char *src_1, __global uchar* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (uchar)(abs_diff(src_0[gid], src_1[gid]));
}
