// Auto generated kernel

__kernel void abs_long2(__global long2 *src_0, __global ulong2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (ulong2)(abs(src_0[gid]));
}
