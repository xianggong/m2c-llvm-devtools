// Auto generated kernel

__kernel void abs_int(__global int *src_0, __global uint* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (uint)(abs(src_0[gid]));
}
