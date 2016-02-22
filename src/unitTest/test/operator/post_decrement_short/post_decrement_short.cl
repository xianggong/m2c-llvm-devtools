// Auto generated kernel

__kernel void post_decrement_short(__global short *src_0, __global short* dst)
{
	int gid = get_global_id(0);
	dst[gid] =  src_0[gid] --;
}
