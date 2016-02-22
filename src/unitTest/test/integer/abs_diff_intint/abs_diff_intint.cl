// Auto generated kernel

__kernel void abs_diff_intint(__global int *src_0, __global int *src_1, __global uint* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (uint)(abs_diff(src_0[gid], src_1[gid]));
}
