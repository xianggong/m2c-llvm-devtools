// Auto generated kernel

__kernel void pre_increment_uint16(__global uint16 *src_0, __global uint16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = ++ src_0[gid] ;
}
