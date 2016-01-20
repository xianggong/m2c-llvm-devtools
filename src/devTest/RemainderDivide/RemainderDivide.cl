__kernel 
void RemainderDivide(__global uint *output,
                     const uint stage, 
                     const uint passOfStage)
{
    uint threadId = get_global_id(0);
    
    uint pairDistance = 1 << (stage - passOfStage);
    uint blockWidth   = 2 * pairDistance;

    uint leftId = (threadId % pairDistance) 
                   + ((threadId / pairDistance) * blockWidth);

    output[threadId] = leftId;
}
