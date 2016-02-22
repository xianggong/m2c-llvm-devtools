// Auto generated kernel

__kernel void add_sat_int2int2(__global int2 *src_0, __global int2 *src_1, __global int2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = add_sat(src_0[gid], src_1[gid]);
}
