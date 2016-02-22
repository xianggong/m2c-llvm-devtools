// Auto generated kernel

__kernel void isnormal_float8(__global float8 *src_0, __global int8* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (int8)(isnormal(src_0[gid]));
}
