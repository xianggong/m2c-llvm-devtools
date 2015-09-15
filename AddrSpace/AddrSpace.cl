__kernel void Global1(global int *result,
                             int  val)
{
        int gid = get_global_id(0);
        result[gid] = val;
}

__kernel void Global2(global int2 *result,
                             int2  val)
{
        int gid = get_global_id(0);
        result[gid] = val;
}

__kernel void Global4(global int4 *result,
                             int4  val)
{
        int gid = get_global_id(0);
        result[gid] = val;
}

__kernel void Local1(global int *result,
                     local  int *val)
{
        int gid = get_global_id(0);
        int lid = get_local_id(0);
        result[gid] = val[lid];
}

__kernel void Local2(global int2 *result,
                     local  int2 *val)
{
        int gid = get_global_id(0);
        int lid = get_local_id(0);
        result[gid] = val[lid];
}

__kernel void Local4(global int4 *result,
                     local  int4 *val)
{
        int gid = get_global_id(0);
        int lid = get_local_id(0);
        result[gid] = val[lid];
}

__kernel void Constant1(global    int *result,
                        constant  int *val)
{
        int gid = get_global_id(0);
        int lid = get_local_id(0);
        result[gid] = val[lid];
}

__kernel void Constant2(global    int2 *result,
                        constant  int2 *val)
{
        int gid = get_global_id(0);
        int lid = get_local_id(0);
        result[gid] = val[lid];
}

__kernel void Constant4(global int4 *result,
                        constant  int4 *val)
{
        int gid = get_global_id(0);
        int lid = get_local_id(0);
        result[gid] = val[lid];
}





