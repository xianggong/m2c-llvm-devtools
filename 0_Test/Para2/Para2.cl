__kernel void Para2(global int2 *result,
                           int2  val)
{
	int gid = get_global_id(0);
        result[gid] = val;
}

