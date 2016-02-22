// Auto generated kernel

__kernel void bitselect_uint2uint2uint2(__global uint2 *src_0, __global uint2 *src_1, __global uint2 *src_2, __global uint2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = bitselect(src_0[gid], src_1[gid], src_2[gid]);
}
