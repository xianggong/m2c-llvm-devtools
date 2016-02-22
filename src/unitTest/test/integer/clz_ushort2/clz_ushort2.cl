// Auto generated kernel

__kernel void clz_ushort2(__global ushort2 *src_0, __global ushort2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = clz(src_0[gid]);
}
