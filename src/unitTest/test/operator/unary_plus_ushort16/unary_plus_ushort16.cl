// Auto generated kernel

__kernel void unary_plus_ushort16(__global ushort16 *src_0, __global ushort16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = + src_0[gid] ;
}
