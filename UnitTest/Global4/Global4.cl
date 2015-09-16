__kernel void Globali4(global int4 *result)
{
        int gid = get_global_id(0);
        result[gid] = (int4)(gid, gid, gid, gid);
}

