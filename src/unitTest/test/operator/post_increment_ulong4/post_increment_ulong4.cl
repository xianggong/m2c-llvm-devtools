// Auto generated kernel

__kernel void post_increment_ulong4(__global ulong4 *src_0, __global ulong4* dst)
{
	int gid = get_global_id(0);
	dst[gid] =  src_0[gid] ++;
}
