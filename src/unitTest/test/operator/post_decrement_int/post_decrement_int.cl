// Auto generated kernel

__kernel void post_decrement_int(__global int *src_0, __global int* dst)
{
	int gid = get_global_id(0);
	dst[gid] =  src_0[gid] --;
}
