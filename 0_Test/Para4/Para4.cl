__kernel void Para4(global int4 *result,
                           int4  val)
{
        int gid = get_global_id(0);
        result[gid] = val;
}
