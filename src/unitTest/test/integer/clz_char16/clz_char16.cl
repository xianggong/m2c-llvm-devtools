// Auto generated kernel

__kernel void clz_char16(__global char16 *src_0, __global char16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = clz(src_0[gid]);
}
