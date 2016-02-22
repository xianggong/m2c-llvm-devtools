// Auto generated kernel

__kernel void abs_diff_int8int8(__global int8 *src_0, __global int8 *src_1, __global uint8* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (uint8)(abs_diff(src_0[gid], src_1[gid]));
}
