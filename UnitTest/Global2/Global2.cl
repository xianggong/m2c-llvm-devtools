__kernel void Global2(global int2 *result)
{
        int gid = get_global_id(0);
        result[gid] = (int2)(gid, gid);
}

