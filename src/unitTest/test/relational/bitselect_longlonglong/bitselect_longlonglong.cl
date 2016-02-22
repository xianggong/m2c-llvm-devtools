// Auto generated kernel

__kernel void bitselect_longlonglong(__global long *src_0, __global long *src_1, __global long *src_2, __global long* dst)
{
	int gid = get_global_id(0);
	dst[gid] = bitselect(src_0[gid], src_1[gid], src_2[gid]);
}
