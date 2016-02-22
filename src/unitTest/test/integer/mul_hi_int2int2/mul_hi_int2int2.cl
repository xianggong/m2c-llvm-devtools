// Auto generated kernel

__kernel void mul_hi_int2int2(__global int2 *src_0, __global int2 *src_1, __global int2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = mul_hi(src_0[gid], src_1[gid]);
}
