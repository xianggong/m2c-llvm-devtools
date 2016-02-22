// Auto generated kernel

__kernel void clz_ushort(__global ushort *src_0, __global ushort* dst)
{
	int gid = get_global_id(0);
	dst[gid] = clz(src_0[gid]);
}
