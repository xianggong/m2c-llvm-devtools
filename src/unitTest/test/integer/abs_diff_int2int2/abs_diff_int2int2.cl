// Auto generated kernel

__kernel void abs_diff_int2int2(__global int2 *src_0, __global int2 *src_1, __global uint2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (uint2)(abs_diff(src_0[gid], src_1[gid]));
}
