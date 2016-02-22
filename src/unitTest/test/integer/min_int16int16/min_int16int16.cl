// Auto generated kernel

__kernel void min_int16int16(__global int16 *src_0, __global int16 *src_1, __global int16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = min(src_0[gid], src_1[gid]);
}
