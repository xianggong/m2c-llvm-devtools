// Auto generated kernel

__kernel void unary_minus_ushort2(__global ushort2 *src_0, __global ushort2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = - src_0[gid] ;
}
