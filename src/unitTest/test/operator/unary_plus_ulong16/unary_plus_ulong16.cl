// Auto generated kernel

__kernel void unary_plus_ulong16(__global ulong16 *src_0, __global ulong16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = + src_0[gid] ;
}
