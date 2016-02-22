// Auto generated kernel

__kernel void clz_long(__global long *src_0, __global long* dst)
{
	int gid = get_global_id(0);
	dst[gid] = clz(src_0[gid]);
}
