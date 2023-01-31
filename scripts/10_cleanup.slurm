#!/bin/bash

#SBATCH --mail-user=santiago.marinmartinez@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --job-name="cleanup"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=1:00:00
#SBATCH --mem=8G


cd ../data

for x in $(ls -d *.sam); \
do echo ${x}; \
samtools view \
-h \
-b \
${x} > \
$(basename ${x} .sam).bam; 
samtools sort \
-@ 4 \
$(basename ${x} .sam).bam \
-o $(basename ${x} .sam)_sorted.bam; done

for y in $(ls -d *.fastq);
do echo ${y};
gzip ${y};
done




