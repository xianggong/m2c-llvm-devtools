// Auto generated kernel

__kernel void post_increment_short2(__global short2 *src_0, __global short2* dst)
{
	int gid = get_global_id(0);
	dst[gid] =  src_0[gid] ++;
}
