// Auto generated kernel

__kernel void abs_char(__global char *src_0, __global uchar* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (uchar)(abs(src_0[gid]));
}
