// Auto generated kernel

__kernel void rhadd_ushortushort(__global ushort *src_0, __global ushort *src_1, __global ushort* dst)
{
	int gid = get_global_id(0);
	dst[gid] = rhadd(src_0[gid], src_1[gid]);
}
