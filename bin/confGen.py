#!/usr/bin/python

import os
import argparse


class SimConfig:

    # GPU configurations
    numCUs = 32
    numL1s = 32
    numL2s = 6
    numMMs = 6

    # L1 Cache configurations
    l1Sets = 64
    l1Assoc = 4
    l1BlockSz = 64
    l1Lateny = 1

    # L2 Cache configurations
    l2Sets = 128
    l2Assoc = 16
    l2BlockSz = 64
    l2Latency = 10

    # Main memory configurations
    mmBlockSz = 64
    mmLatency = 100

    # Network configurations
    numNetL2ToMM = numL2s
    netInSz = 528
    netOutSz = 528
    netBw = 264

    # Paths
    cacheTplPath = "template/cache.tpl"
    l1CacheTplPath = "template/l1cache.tpl"
    l2CacheTplPath = "template/l2cache.tpl"
    mainMemTplPath = "template/mainmm.tpl"
    networkTplPath = "template/network.tpl"
    cuTplPath = "template/cu.tpl"

    def __init__(self, numCUs, numL2s):
        self.numCUs = numCUs
        self.numL1s = numCUs
        self.numL2s = numL2s
        self.numMMs = numL2s
        self.numNetL2ToMM = numL2s

    def getFileString(self, path):
        with open(path) as file:
            return file.read()

    def getCacheGeometry(self):
        cache_cfg = "; ---- Cache Geometry -----\n"
        cache_cfg += self.getFileString(self.cacheTplPath)

        cache_cfg = cache_cfg.replace("L1SETS", str(self.l1Sets))
        cache_cfg = cache_cfg.replace("L1ASSOC", str(self.l1Assoc))
        cache_cfg = cache_cfg.replace("L1BLOCKSZ", str(self.l1BlockSz))
        cache_cfg = cache_cfg.replace("L2SETS", str(self.l2Sets))

        cache_cfg = cache_cfg.replace("L2ASSOC", str(self.l2Assoc))
        cache_cfg = cache_cfg.replace("L2BLOCKSZ", str(self.l2BlockSz))
        cache_cfg = cache_cfg.replace("L2LATENCY", str(self.l2Latency))
        cache_cfg = cache_cfg.replace("L1LATENCY", str(self.l1Lateny))

        return cache_cfg

    def getL1Cache(self, lowModuleName, lowModuleCount):
        l1c_cfg = "; ---- L1 Caches ----\n"
        lowModule = ""
        for index in range(lowModuleCount):
            lowModule += lowModuleName + "-" + str(index) + " "
        for mm_id in range(self.numL1s):
            module = self.getFileString(self.l1CacheTplPath)
            module = module.replace("MMID", str(mm_id))
            module = module.replace("LOWNETWORK", lowModuleName)
            module = module.replace("LOWMODULES", lowModule)
            l1c_cfg += module + "\n"
        return l1c_cfg

    def getL2Cache(self, lowNetName):
        l2c_cfg = "; ---- L2 Caches ----\n"
        for mm_id in range(self.numL2s):
            module = self.getFileString(self.l2CacheTplPath)
            module = module.replace("MMID", str(mm_id))
            module = module.replace("NUMMODULE", str(self.numL2s))
            module = module.replace("BLOCKSIZE", str(self.l2BlockSz))
            module = module.replace("LOWNETWORK", lowNetName)
            module = module.replace("LOWMODULES", lowNetName)
            l2c_cfg += module + "\n"
        return l2c_cfg

    def getMainMemory(self, highNetName):
        mem_cfg = "; ---- Main Memory ----\n"
        for mm_id in range(self.numMMs):
            module = self.getFileString(self.mainMemTplPath)
            module = module.replace("MMID", str(mm_id))
            module = module.replace("NUMMODULE", str(self.numMMs))
            module = module.replace("BLOCKSIZE", str(self.mmBlockSz))
            module = module.replace("LATENCY", str(self.mmLatency))
            module = module.replace("HIGHNETWORK", highNetName)
            mem_cfg += module + "\n"
        return mem_cfg

    def getNetwork(self):
        net_cfg = "; ---- Network -----\n\n"

        # L1 to L2 network
        net_cfg += "[ Network net-l1-all-to-l2-all ]\n"
        net_cfg += "DefaultInputBufferSize = " + str(self.netInSz) + "\n"
        net_cfg += "DefaultOutputBufferSize = " + str(self.netOutSz) + "\n"
        net_cfg += "DefaultBandwitdh = " + str(self.netBw) + "\n\n"

        # L2 to MM networks
        for mm_id in range(self.numNetL2ToMM):
            module = self.getFileString(self.networkTplPath)
            module = module.replace("MMID", str(mm_id))
            module = module.replace("INSIZE", str(self.netInSz))
            module = module.replace("OUTSIZE", str(self.netOutSz))
            module = module.replace("BW", str(self.netBw))
            net_cfg += module + "\n"
        return net_cfg

    def getCU(self):
        cu_config = "; ---- Associating CUs with L1s\n"
        for mm_id in range(self.numL1s):
            module = self.getFileString(self.cuTplPath)
            module = module.replace("MMID", str(mm_id))
            cu_config += module + "\n"
        return cu_config

    def getSICfg(self):
        si_config = "[ Devices ]\n"
        si_config += "NumComputeUnits = " + str(self.numCUs)
        return si_config

    def getMemCfg(self):
        simcfg = ""
        simcfg = self.getCacheGeometry()
        simcfg += self.getL1Cache("l2", self.numL2s)
        simcfg += self.getL2Cache("mm")
        simcfg += self.getMainMemory("l2")
        simcfg += self.getNetwork()
        simcfg += self.getCU()
        return simcfg

    def dump(self):
        print self.getMemCfg()
        print self.getSICfg()


def main():
    # Arg parser
    parser = argparse.ArgumentParser(
        description='Multi2Sim simulation configuration generator')
    parser.add_argument('numCUs', help='Number of Compute Units')
    parser.add_argument('numL2s', help='Number of L2 caches')
    parser.add_argument('-d', "--dir", default="./",
                        help='Directory to save configuration file')
    args = parser.parse_args()

    # Create simulation generator object
    simcfg = SimConfig(int(args.numCUs), int(args.numL2s))

    # Dump configuraton files
    if not os.path.isdir(args.dir):
        os.makedirs(args.dir)
    mem_config = open(args.dir + "/mem_config_cu_" +
                      args.numCUs + ".conf", "w")
    mem_config.write(simcfg.getMemCfg())
    mem_config.close()

    si_config = open(args.dir + "/si_config_cu_" +
                     args.numCUs + ".conf", "w")
    si_config.write(simcfg.getSICfg())
    si_config.close()


if __name__ == "__main__":
    main()
