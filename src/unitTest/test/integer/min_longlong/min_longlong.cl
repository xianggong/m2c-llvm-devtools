// Auto generated kernel

__kernel void min_longlong(__global long *src_0, __global long *src_1, __global long* dst)
{
	int gid = get_global_id(0);
	dst[gid] = min(src_0[gid], src_1[gid]);
}
