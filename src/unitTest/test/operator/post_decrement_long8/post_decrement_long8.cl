// Auto generated kernel

__kernel void post_decrement_long8(__global long8 *src_0, __global long8* dst)
{
	int gid = get_global_id(0);
	dst[gid] =  src_0[gid] --;
}
