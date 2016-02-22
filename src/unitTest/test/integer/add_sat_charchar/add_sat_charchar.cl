// Auto generated kernel

__kernel void add_sat_charchar(__global char *src_0, __global char *src_1, __global char* dst)
{
	int gid = get_global_id(0);
	dst[gid] = add_sat(src_0[gid], src_1[gid]);
}
