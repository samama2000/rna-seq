#!/bin/bash 

#SBATCH --mail-user=santiago.marinmartinez@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --job-name="remove unwanted RNA"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=1:00:00
#SBATCH --mem=8G

#Load modules
module load UHTS/Aligner/bowtie/1.2.0
module load UHTS/Analysis/samtools/1.10

#Go to data
cd /data/users/smarin/rna-project/data


#Unzip files
for x in $(ls -d *tr.fastq.gz); 
do echo ${x}; gunzip -d ${x}; done

#Remove all unwanted reads
for x in $(ls -d *tr.fastq);
do echo ${x}; 

bowtie \
#Print the amount of wall-clock time taken by each phase
-t \
#Number of parallel threads to use (e.g. CPUs)
-p 4 \
#Bowtie index and the files to map against it
./indices/GRCh38_p13_r-t-sno-sn-RNA_ENSEMBL_NCBI_GtRNAdb ${x} \
#Write all unaligned reads to this new file and put stderr into log.txt
--un $(basename ${x} .fastq)_no_r-t-sno-sn-RNA.fastq 2> $(basename ${x} .fastq)_no_r-t-sno-sn-RNA_log.txt > \
#Discard stdout
/dev/null; 
done


#Zip the files back up
for x in $(ls -d *tr.fastq);
do gzip ${x}; done



