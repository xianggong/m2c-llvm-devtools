// Auto generated kernel

__kernel void clz_char2(__global char2 *src_0, __global char2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = clz(src_0[gid]);
}
