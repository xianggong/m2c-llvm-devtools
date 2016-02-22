// Auto generated kernel

__kernel void unary_minus_char(__global char *src_0, __global char* dst)
{
	int gid = get_global_id(0);
	dst[gid] = - src_0[gid] ;
}
