__kernel void Constant1(global    int *result,
                        constant  int *val)
{
        int gid = get_global_id(0);
        int lid = get_local_id(0);
        result[gid] = val[lid];
}

