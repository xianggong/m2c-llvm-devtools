// Auto generated kernel

__kernel void add_sat_uint16uint16(__global uint16 *src_0, __global uint16 *src_1, __global uint16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = add_sat(src_0[gid], src_1[gid]);
}
