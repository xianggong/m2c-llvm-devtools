// Auto generated kernel

__kernel void abs_int4(__global int4 *src_0, __global uint4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = (uint4)(abs(src_0[gid]));
}
