__kernel void Branch1(global int *result)
{
        int gid = get_global_id(0);
        int lid = get_local_id(0);
	if(lid < gid)
        	result[gid] = lid;
	else
        	result[lid] = gid;
}
