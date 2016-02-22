// Auto generated kernel

__kernel void unary_plus_ulong(__global ulong *src_0, __global ulong* dst)
{
	int gid = get_global_id(0);
	dst[gid] = + src_0[gid] ;
}
