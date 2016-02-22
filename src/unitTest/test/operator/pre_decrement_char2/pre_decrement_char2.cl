// Auto generated kernel

__kernel void pre_decrement_char2(__global char2 *src_0, __global char2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = -- src_0[gid] ;
}
