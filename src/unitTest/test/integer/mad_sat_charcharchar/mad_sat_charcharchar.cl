// Auto generated kernel

__kernel void mad_sat_charcharchar(__global char *src_0, __global char *src_1, __global char *src_2, __global char* dst)
{
	int gid = get_global_id(0);
	dst[gid] = mad_sat(src_0[gid], src_1[gid], src_2[gid]);
}
