// Auto generated kernel

__kernel void unary_minus_int2(__global int2 *src_0, __global int2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = - src_0[gid] ;
}
