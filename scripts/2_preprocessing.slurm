#!/bin/bash

#SBATCH --mail-user=santiago.marinmartinez@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --job-name="cut and trim"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=3:00:00
#SBATCH --mem=4G

#Add modules
module add UHTS/Quality_control/cutadapt/2.5


### Clip 3' adapter

cd ../data
#for all standard fastq files
for x in $(ls -d *.fastq.gz); do echo ${x}; \
cutadapt \
#-j specifies the number of cores to use
-j 4 \
#-a specifies the regular 3'-adapter that should be cut
-a CTGTAGGCACCATCAAT \
#-q is the quality cutoff, all reads with a quality score beneath 25 will be cut
-q 25 \
#all sequences below 25 nucleotide length will be removed from the library
--minimum-length 25 \
#all untrimmed sequences will be discarded (no adaptor means that its most likely contamination)
--discard-untrimmed \
#the output file should contain the basename (removing the .fast.gz) and add _clpd.fastqc.gz
-o $(basename ${x} .fastq.gz)_clpd.fastq.gz \
#stdout should be saved to the log.txt file
${x} 1> $(basename ${x} .fastq.gz)_clpd_log.txt; done


### Trim 4 nt (randomized bases) from the 3' end

#for all CLIPPED fastq files
for x in $(ls -d *_clpd.fastq.gz); do echo ${x}; \
cutadapt \
-j 4 \
-q 25 \
#cut the first 4 nucleotides from the 3' end
--cut -4 \
--minimum-length 25 \
-o $(basename ${x} .fastq.gz)_tr.fastq.gz \
${x} 1> $(basename ${x} .fastq.gz)_tr_log.txt; done
