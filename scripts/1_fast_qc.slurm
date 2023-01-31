#!/bin/bash

#SBATCH --mail-user=santiago.marinmartinez@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --job-name="QC"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=1:00:00
#SBATCH --mem=1G

#Source all the modules and go to target directory
module add UHTS/Quality_control/fastqc/0.11.9
module add UHTS/Analysis/MultiQC/1.8

cd /data/users/smarin/rna-project/data

#Do fastqc for standard sequences
	# -o defines the output location and -f the file format
mkdir fastqc
fastqc -o ./fastqc -f fastq *[1-2].fastq.gz
cd fastqc
multiqc .

#Go back to start
cd ../

#Do fastqc for clipped sequences
mkdir fastqc_clpd
fastqc -o ./fastqc_clpd -f fastq *clpd.fastq.gz
cd fastqc_clpd
multiqc . 

#Back to start
cd ../

#Do fastqc for clipped and trimmed sequences
mkdir fastqc_tr
fastqc -o ./fastqc_tr -f fastq *tr.fastq.gz

cd fastqc_tr
multiqc . 

cd ../

#END
