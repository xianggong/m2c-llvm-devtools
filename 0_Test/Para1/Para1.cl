__kernel void Para1(global int *result,
                           int  val)
{
        int gid = get_global_id(0);
        result[gid] = val;
}
