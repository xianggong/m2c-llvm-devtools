// Auto generated kernel

__kernel void bitselect_uintuintuint(__global uint *src_0, __global uint *src_1, __global uint *src_2, __global uint* dst)
{
	int gid = get_global_id(0);
	dst[gid] = bitselect(src_0[gid], src_1[gid], src_2[gid]);
}
