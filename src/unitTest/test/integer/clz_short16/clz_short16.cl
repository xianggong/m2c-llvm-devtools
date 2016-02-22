// Auto generated kernel

__kernel void clz_short16(__global short16 *src_0, __global short16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = clz(src_0[gid]);
}
