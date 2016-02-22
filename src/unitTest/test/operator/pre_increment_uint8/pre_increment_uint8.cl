// Auto generated kernel

__kernel void pre_increment_uint8(__global uint8 *src_0, __global uint8* dst)
{
	int gid = get_global_id(0);
	dst[gid] = ++ src_0[gid] ;
}
