__kernel void Global1(global int *result,
														 int  val)
{
		result[0] = val;
}

__kernel void Global2(global int2 *result,
										         int2  val)
{
		result[0] = val;
}

__kernel void Global4(global int4 *result,
										         int4  val)
{
		result[0] = val;
}

__kernel void Local1(global int *result,
										 local  int *val)
{
		result[0] = val[0];
}

__kernel void Local2(global int2 *result,
										 local  int2 *val)
{
		result[0] = val[0];
}

__kernel void Local4(global int4 *result,
										 local  int4 *val)
{
		result[0] = val[0];
}

__kernel void Constant1(global    int *result,
                        constant  int *val)
{
        result[0] = val[0];
}

__kernel void Constant2(global    int2 *result,
                        constant  int2 *val)
{
        result[0] = val[0];
}

__kernel void Constant4(global int4 *result,
                        constant  int4 *val)
{
        result[0] = val[0];
}





