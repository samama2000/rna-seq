#!/bin/bash

#SBATCH --mail-user=santiago.marinmartinez@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --job-name="codon occupancy"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=2:00:00
#SBATCH --mem=8G


cd ../data

for x in $(ls -d *RNA.fastq); \
do echo ${x}; \
bowtie \
-t \
-p 4 \
-v 1 \
-m 1 \
--best \
--strata \
#no reverse compliments
--norc \
./indices/GRCh38_p13_APPRIS_CDS_plus18 \
-q ${x} \
-S $(basename ${x} .fastq)_GRCh38_p13_APPRIS_CDS.sam 2> $(basename ${x} .fastq)_GRC;
done
