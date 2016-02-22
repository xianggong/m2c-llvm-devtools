// Auto generated kernel

__kernel void post_increment_char8(__global char8 *src_0, __global char8* dst)
{
	int gid = get_global_id(0);
	dst[gid] =  src_0[gid] ++;
}
