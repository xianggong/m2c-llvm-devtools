#!/bin/bash

sed -i '/\.ident/d' $1
sed -i '/\.align/d' $1
sed -i '/\.text/d' $1
sed -i '/\.note\.GNU/d' $1
sed -i '/EndOfTextLabel/d' $1
sed -i 's/\_e32//g' $1
sed -i 's/\_e64//g' $1
sed -i 's/|//g' $1
sed -i 's/-v/v/g' $1
sed -i 's/\_iflag//g' $1
sed -i 's/\;/\/\//g' $1
sed -i 's/\t\.globl/.global/g' $1
sed -i '/\.global/a .text\n' $1

