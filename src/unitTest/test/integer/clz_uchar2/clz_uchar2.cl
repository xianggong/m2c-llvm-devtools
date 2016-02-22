// Auto generated kernel

__kernel void clz_uchar2(__global uchar2 *src_0, __global uchar2* dst)
{
	int gid = get_global_id(0);
	dst[gid] = clz(src_0[gid]);
}
