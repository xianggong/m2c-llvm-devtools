// Auto generated kernel

__kernel void abs_char8(__global char8 *src_0, __global uchar8* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (uchar8)(abs(src_0[gid]));
}
