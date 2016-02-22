// Auto generated kernel

__kernel void bitselect_int16int16int16(__global int16 *src_0, __global int16 *src_1, __global int16 *src_2, __global int16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = bitselect(src_0[gid], src_1[gid], src_2[gid]);
}
