// Auto generated kernel

__kernel void abs_char2(__global char2 *src_0, __global uchar2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (uchar2)(abs(src_0[gid]));
}
