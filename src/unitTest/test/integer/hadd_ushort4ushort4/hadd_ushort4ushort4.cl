// Auto generated kernel

__kernel void hadd_ushort4ushort4(__global ushort4 *src_0, __global ushort4 *src_1, __global ushort4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = hadd(src_0[gid], src_1[gid]);
}
