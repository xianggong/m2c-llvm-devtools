// Auto generated kernel

__kernel void post_increment_short8(__global short8 *src_0, __global short8* dst)
{
	int gid = get_global_id(0);
	dst[gid] =  src_0[gid] ++;
}
