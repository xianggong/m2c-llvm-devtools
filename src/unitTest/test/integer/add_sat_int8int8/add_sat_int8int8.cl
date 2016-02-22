// Auto generated kernel

__kernel void add_sat_int8int8(__global int8 *src_0, __global int8 *src_1, __global int8* dst)
{
	int gid = get_global_id(0);
	dst[gid] = add_sat(src_0[gid], src_1[gid]);
}
