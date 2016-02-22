// Auto generated kernel

__kernel void pre_increment_long16(__global long16 *src_0, __global long16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = ++ src_0[gid] ;
}
