// Auto generated kernel

__kernel void mul_hi_uintuint(__global uint *src_0, __global uint *src_1, __global uint* dst)
{
	int gid = get_global_id(0);
	dst[gid] = mul_hi(src_0[gid], src_1[gid]);
}
