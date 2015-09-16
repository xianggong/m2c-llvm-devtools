__kernel void Local1(global int *result,
                     local  int *val)
{
        int gid = get_global_id(0);
        int lid = get_local_id(0);
        result[gid] = val[lid];
}

