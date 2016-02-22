// Auto generated kernel

__kernel void clz_long2(__global long2 *src_0, __global long2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = clz(src_0[gid]);
}
