// Auto generated kernel

__kernel void abs_int16(__global int16 *src_0, __global uint16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (uint16)(abs(src_0[gid]));
}
