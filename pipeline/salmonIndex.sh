#!/bin/bash

# be safe
set -eu

# synopsis salmon index -t transcript -i index
# bash salmonIndex.sh <transcript fasta> <index directory>

# sanity
# arguments to a script are passed $@ where 0 is the script itself and $1-... are the arguments
[[ $# -ne 2 ]] && echo "The script expects two arguments" && exit 1
[[ ! -f $1 ]] && echo "The fasta file does not exist" && exit 1
[[ ! -d $2 ]] && echo "The output directory does not exist" && exit 1

salmon index -t $1 -i $2


