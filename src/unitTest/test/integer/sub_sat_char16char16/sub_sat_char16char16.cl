// Auto generated kernel

__kernel void sub_sat_char16char16(__global char16 *src_0, __global char16 *src_1, __global char16* dst)
{
	int gid = get_global_id(0);
	dst[gid] = sub_sat(src_0[gid], src_1[gid]);
}
