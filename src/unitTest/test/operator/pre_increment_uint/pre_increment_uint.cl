// Auto generated kernel

__kernel void pre_increment_uint(__global uint *src_0, __global uint* dst)
{
	int gid = get_global_id(0);
	dst[gid] = ++ src_0[gid] ;
}
