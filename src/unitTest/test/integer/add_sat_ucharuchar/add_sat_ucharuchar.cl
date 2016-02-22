// Auto generated kernel

__kernel void add_sat_ucharuchar(__global uchar *src_0, __global uchar *src_1, __global uchar* dst)
{
	int gid = get_global_id(0);
	dst[gid] = add_sat(src_0[gid], src_1[gid]);
}
