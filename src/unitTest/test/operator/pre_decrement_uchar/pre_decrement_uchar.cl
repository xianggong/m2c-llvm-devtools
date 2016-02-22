// Auto generated kernel

__kernel void pre_decrement_uchar(__global uchar *src_0, __global uchar* dst)
{
	int gid = get_global_id(0);
	dst[gid] = -- src_0[gid] ;
}
