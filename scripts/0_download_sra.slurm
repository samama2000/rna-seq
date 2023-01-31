#!/bin/bash

#SBATCH --mail-user=santiago.marinmartinez@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --job-name="sra download"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --time=2:00:00
#SBATCH --mem=2G


samples=$1
samples_name=$2
directory=$3

cd /data/users/smarin/rna-project/$directory
prefetch --option-file $samples
wget -i $1 
fastq-dump --gzip SRR*

count=0
for i in $(ls 'download');
do let count=$((count+1)); 
mv ./${i} ./$(head -n${count} $samples_name | tail -n1 ).fastq.gz; 
done

