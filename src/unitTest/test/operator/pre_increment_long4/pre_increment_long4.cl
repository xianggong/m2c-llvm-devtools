// Auto generated kernel

__kernel void pre_increment_long4(__global long4 *src_0, __global long4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = ++ src_0[gid] ;
}
