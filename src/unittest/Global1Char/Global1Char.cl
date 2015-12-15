__kernel void Global1(global char *result)
{
        int gid = get_global_id(0);
        result[gid] = (char)gid;
}

