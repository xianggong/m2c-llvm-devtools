// Auto generated kernel

__kernel void add_sat_ushortushort(__global ushort *src_0, __global ushort *src_1, __global ushort* dst)
{
	int gid = get_global_id(0);
	dst[gid] = add_sat(src_0[gid], src_1[gid]);
}
