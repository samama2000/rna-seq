#!/bin/bash

#SBATCH --mail-user=santiago.marinmartinez@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --job-name="QC"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=1:00:00
#SBATCH --mem=1G


source module2.sh


cd /data/users/smarin/rna-project/data

mkdir fastqc_RNA
fastqc -o ./fastqc_RNA -f fastq *RNA.fastq.gz
cd fastqc_RNA
multiqc .


