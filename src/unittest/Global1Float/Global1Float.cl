__kernel void Global1float(global float *result)
{
        int gid = get_global_id(0);
        result[gid] = (float)gid;
}

