__kernel void Constant4(global    int4 *result,
                        constant  int4 *val)
{
        int gid = get_global_id(0);
        int lid = get_local_id(0);
        result[gid] = val[lid];
}

