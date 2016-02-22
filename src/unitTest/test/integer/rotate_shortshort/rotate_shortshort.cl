// Auto generated kernel

__kernel void rotate_shortshort(__global short *src_0, __global short *src_1, __global short* dst)
{
	int gid = get_global_id(0);
	dst[gid] = rotate(src_0[gid], src_1[gid]);
}
