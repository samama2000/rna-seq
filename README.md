# rna-seq
Repository of RNA-sequencing project

The project was set up into three folders:
- rna-project/data
- rna-project/scripts
- rna-project/tools

Within tools was just the sratoolkit which was needed at the beginning of the project but nothing else.
Within scripts were all slurm and sh scripts used during the project - as well as the .txt files specifying the sample names and links for download
Within data were all raw and processed data files, no more subfolders were created besides for the fastqc-results, otherwise they were all dumped there as single files so that I did not have to specify subfolders further, instead I used regex to specify which files to work on. 

