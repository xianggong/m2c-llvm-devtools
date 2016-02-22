// Auto generated kernel

__kernel void unary_minus_int8(__global int8 *src_0, __global int8* dst)
{
	int gid = get_global_id(0);
	dst[gid] = - src_0[gid] ;
}
