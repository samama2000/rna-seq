#!/bin/bash 

#SBATCH --mail-user=santiago.marinmartinez@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --job-name="mapping"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=2:00:00
#SBATCH --mem=10G


#Load modules
module load UHTS/Aligner/bowtie/1.2.0
module load UHTS/Analysis/samtools/1.10

#Go to data folder
cd /data/users/smarin/rna-project/data

###Map to genome and convert to BAM
#For all processed libraries
for x in $(ls -d *RNA.fastq);
do echo ${x};
#Options: -S = Output as SAM with header, -t = tell time, -p = number of threads, -v 1 = alignments can not have more than one mismatch, -m 1 = if a read has more than one reportable alignment then do not count, --best --strata = only chose the 'best' alignment according to bowtie stratum criteria 
bowtie -S -t -p 4 -v 1 -m 1 --best --strata \
#Index file for mapping, -q specifies input files as fastq files
./indices/GRCh38.p13.genome -q ${x} \ 
#stderr into log.txt file and stdout into samtools
2> $(basename ${x} .fastq)_GRCh38_p13_log.txt | samtools \
#Options: view can convert same to bam, -h include header, -F 4 = exclude FLAG '4', -b = output to bam
view -h -F 4 -b \
#STDOUT into new bam file
> $(basename ${x} .fastq)_GRCh38_p13.bam; done

###Sort the BAM file
for x in $(ls -d *.bam); 
do echo ${x}; 
#-@ 4 = number of threads, -o specifies output file
samtools sort -@ 4 ${x} -o $(basename ${x} .bam)_sorted.bam; 
done

# Remove the unsorted BAM file
rm *GRCh38_p13.bam

###END








