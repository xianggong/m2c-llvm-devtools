// Auto generated kernel

__kernel void abs_int2(__global int2 *src_0, __global uint2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (uint2)(abs(src_0[gid]));
}
