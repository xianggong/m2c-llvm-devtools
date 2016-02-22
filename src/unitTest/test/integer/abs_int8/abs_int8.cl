// Auto generated kernel

__kernel void abs_int8(__global int8 *src_0, __global uint8* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (uint8)(abs(src_0[gid]));
}
