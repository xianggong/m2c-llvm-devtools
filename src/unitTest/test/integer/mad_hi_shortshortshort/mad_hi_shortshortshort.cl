// Auto generated kernel

__kernel void mad_hi_shortshortshort(__global short *src_0, __global short *src_1, __global short *src_2, __global short* dst)
{
	int gid = get_global_id(0);
	dst[gid] = mad_hi(src_0[gid], src_1[gid], src_2[gid]);
}
