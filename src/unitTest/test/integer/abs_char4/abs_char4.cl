// Auto generated kernel

__kernel void abs_char4(__global char4 *src_0, __global uchar4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (uchar4)(abs(src_0[gid]));
}
