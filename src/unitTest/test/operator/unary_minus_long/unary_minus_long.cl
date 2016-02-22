// Auto generated kernel

__kernel void unary_minus_long(__global long *src_0, __global long* dst)
{
	int gid = get_global_id(0);
	dst[gid] = - src_0[gid] ;
}
