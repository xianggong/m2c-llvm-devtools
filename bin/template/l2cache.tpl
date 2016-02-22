[ Module l2-MMID ]
Type = Cache
Geometry = si-geo-l2
AddressRange = ADDR DIV BLOCKSIZE MOD NUMMODULE EQ MMID
LowNetwork = net-l2-MMID-to-LOWNETWORK-MMID
HighNetwork = net-l1-all-to-l2-all
LowModules = LOWMODULES-MMID
