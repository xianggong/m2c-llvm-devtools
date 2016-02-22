// Auto generated kernel

__kernel void clz_long8(__global long8 *src_0, __global long8* dst)
{
	int gid = get_global_id(0);
	dst[gid] = clz(src_0[gid]);
}
