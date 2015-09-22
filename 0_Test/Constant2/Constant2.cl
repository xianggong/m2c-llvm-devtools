__kernel void Constant2(global    int2 *result,
                        constant  int2 *val)
{
        int gid = get_global_id(0);
        int lid = get_local_id(0);
        result[gid] = val[lid];
}

