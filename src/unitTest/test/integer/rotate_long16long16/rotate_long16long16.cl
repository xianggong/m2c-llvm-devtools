// Auto generated kernel

__kernel void rotate_long16long16(__global long16 *src_0, __global long16 *src_1, __global long16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = rotate(src_0[gid], src_1[gid]);
}
