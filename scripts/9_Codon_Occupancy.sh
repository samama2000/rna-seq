./Codon_occupancy_cal.sh \
../data/annotations/transcriptome/GRCh38_p13_APPRIS_CDS_plus18_SingleLine.fa \
../data/RPF_KO_Rep1_clpd_tr_no_r-t-sno-sn-RNA_GRCh38_p13_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ../data/RPF_KO_Rep1_Codon_occupancy.txt

./Codon_occupancy_cal.sh \
../data/annotations/transcriptome/GRCh38_p13_APPRIS_CDS_plus18_SingleLine.fa \
../data/RPF_KO_Rep2_clpd_tr_no_r-t-sno-sn-RNA_GRCh38_p13_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ../data/RPF_KO_Rep2_Codon_occupancy.txt

./Codon_occupancy_cal.sh \
../data/annotations/transcriptome/GRCh38_p13_APPRIS_CDS_plus18_SingleLine.fa \
../data/RPF_WT_Rep1_clpd_tr_no_r-t-sno-sn-RNA_GRCh38_p13_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ../data/RPF_WT_Rep1_Codon_occupancy.txt

./Codon_occupancy_cal.sh \
../data/annotations/transcriptome/GRCh38_p13_APPRIS_CDS_plus18_SingleLine.fa \
../data/RPF_WT_Rep2_clpd_tr_no_r-t-sno-sn-RNA_GRCh38_p13_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ../data/RPF_WT_Rep2_Codon_occupancy.txt
