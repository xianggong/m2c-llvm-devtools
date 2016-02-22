// Auto generated kernel

__kernel void abs_char16(__global char16 *src_0, __global uchar16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (uchar16)(abs(src_0[gid]));
}
