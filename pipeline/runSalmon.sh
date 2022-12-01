#!/bin/bash

# be safe
set -eu

# salmon quant -1 -2 -l --gcBias --seqBias --posBias -i -t 
# runSalmon.sh [options] <index dir> <fwd fq> <rev fq> <outdir>
# from -t set CPU=(value from t)

# variable
CPU=4

# some checks
[[ $# -ne 4 ]] && echo "the script needs four arguments, <index dir> <fwd fq> <rev fq>" && exit 1
[[ ! -d $1 ]] && echo "the first argument needs to be a directory" && exit 1
[[ ! -f $2 ]] && echo "the second argument needs to be a file" && exit 1
[[ ! -f $3 ]] && echo "the third argument needs to be a file" && exit 1
[[ ! -d $4 ]] && echo "the fourth argument needs to be a directory" && exit 1

# calling salmon
salmon quant -l A --gcBias --seqBias --posBias -i $1 -1 $2 -2 $3 -p $CPU -o $4

