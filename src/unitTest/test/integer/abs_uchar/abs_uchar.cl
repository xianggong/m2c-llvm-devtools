// Auto generated kernel

__kernel void abs_uchar(__global uchar *src_0, __global uchar* dst)
{
	int gid = get_global_id(0);
	dst[gid] = abs(src_0[gid]);
}
