// Auto generated kernel

__kernel void clz_ushort16(__global ushort16 *src_0, __global ushort16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = clz(src_0[gid]);
}
