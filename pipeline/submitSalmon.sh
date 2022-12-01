#!/bin/bash

# safe
set -eu

# vars
inx=~/indices/Pabies1.0-all-phase.gff3.CDSandLTR-TE_salmon_v.1.8.0
in=/data/raw_data/trimmomatic/
out=~/salmon

# loop
for f in $(find $in -name "*_trimmomatic_1.fq.gz"); do
	fnam=$(basename ${f/_sortmerna_trimmomatic_1.fq.gz/})
	[[ ! -d $out/$fnam ]] && mkdir -p $out/$fnam
	bash runSalmon.sh $inx $f ${f/_1.fq.gz/_2.fq.gz} $out/$fnam
done
