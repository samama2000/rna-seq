#!/bin/bash


#SBATCH --mail-user=santiago.marinmartinez@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --job-name="indices bowtie"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=3:00:00
#SBATCH --mem=8G

module load UHTS/Aligner/bowtie2/2.3.4.1
module load UHTS/Aligner/bowtie/1.2.0

# For the undesired [bowtie-build <input-file> <output-file name>]

bowtie-build ../data/annotations/undesired/Combined.fa GRCh38_p13_r-t-sno-sn-RNA_ENSEMBL_NCBI_GtRNAdb

# For the genome

bowtie-build ../data/annotations/genome/Homo_sapiens.GRCh38.dna.primary_assembly.fa GRCh38.p13.genome

# For the transcriptome

bowtie-build ../data/annotations/transcriptome/transcriptome.fa GRCh38_p13_APPRIS_CDS_plus18
