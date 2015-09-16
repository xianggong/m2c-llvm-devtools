__kernel void Global1(global int *result)
{
        int gid = get_global_id(0);
        result[gid] = gid;
}

