// Auto generated kernel

__kernel void fmod_float8float8(__global float8 *src_0, __global float8 *src_1, __global float8* dst)
{
	int gid = get_global_id(0);
	dst[gid] = fmod(src_0[gid], src_1[gid]);
}
