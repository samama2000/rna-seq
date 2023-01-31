#!/bin/bash

#SBATCH --mail-user=santiago.marinmartinez@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --job-name="deseq"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=1:00:00
#SBATCH --mem=4G

#Add module and go to data
module add UHTS/Analysis/subread/2.0.1
cd ../data

# Count reads on CDS
featureCounts -T 4 -t CDS -g gene_id -a ./annotations/genome/Homo_sapiens.GRCh38.107.gtf -o CDS_counts_rawfile.txt *_GRCh38_p13_sorted.bam

# Extract GeneID and Sample columns
cut -f 1,7-10 CDS_counts_rawfile.txt > CDS_counts_processed.txt



# Extract reads mapped to different biotypes
featureCounts -T 4 -t exon -g gene_biotype -a ./annotations/genome/Homo_sapiens.GRCh38.107.gtf -o biotype_counts_rawfile.txt *_GRCh38_p13_sorted.bam

# Extract Biotype and Sample columns
cut -f 1,7-10 biotype_counts_rawfile.txt > biotype_counts_processed.txt


