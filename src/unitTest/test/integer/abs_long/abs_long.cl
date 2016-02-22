// Auto generated kernel

__kernel void abs_long(__global long *src_0, __global ulong* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (ulong)(abs(src_0[gid]));
}
