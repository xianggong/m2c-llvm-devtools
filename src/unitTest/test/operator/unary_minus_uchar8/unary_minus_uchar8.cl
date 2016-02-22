// Auto generated kernel

__kernel void unary_minus_uchar8(__global uchar8 *src_0, __global uchar8* dst)
{
	int gid = get_global_id(0);
	dst[gid] = - src_0[gid] ;
}
