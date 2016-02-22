// Auto generated kernel

__kernel void abs_uint16(__global uint16 *src_0, __global uint16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = abs(src_0[gid]);
}
