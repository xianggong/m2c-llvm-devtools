// Auto generated kernel

__kernel void rotate_int4int4(__global int4 *src_0, __global int4 *src_1, __global int4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = rotate(src_0[gid], src_1[gid]);
}
