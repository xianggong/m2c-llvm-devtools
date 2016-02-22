// Auto generated kernel

__kernel void asinpi_float4(__global float4 *src_0, __global float4* dst)
{
	int gid = get_global_id(0);
	dst[gid] = asinpi(src_0[gid]);
}
