// Auto generated kernel

__kernel void unary_plus_uint2(__global uint2 *src_0, __global uint2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = + src_0[gid] ;
}
