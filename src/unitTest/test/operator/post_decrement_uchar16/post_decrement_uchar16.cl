// Auto generated kernel

__kernel void post_decrement_uchar16(__global uchar16 *src_0, __global uchar16* dst)
{
	int gid = get_global_id(0);
	dst[gid] =  src_0[gid] --;
}
