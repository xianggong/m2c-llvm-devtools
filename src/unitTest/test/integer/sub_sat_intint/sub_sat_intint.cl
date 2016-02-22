// Auto generated kernel

__kernel void sub_sat_intint(__global int *src_0, __global int *src_1, __global int* dst)
{
	int gid = get_global_id(0);
	dst[gid] = sub_sat(src_0[gid], src_1[gid]);
}
