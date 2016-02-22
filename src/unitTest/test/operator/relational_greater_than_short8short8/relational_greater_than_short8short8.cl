// Auto generated kernel

__kernel void relational_greater_than_short8short8(__global short8 *src_0, __global short8 *src_1, __global int8* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int8)( src_0[gid] > src_1[gid]);
}
