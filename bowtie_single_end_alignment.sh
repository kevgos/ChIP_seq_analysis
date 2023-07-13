
#!/usr/bin/env bash

# choose input directory containing single end .fastq read files and output directory for
input_dir="/"
output_dir="/"

# Loop through the fastq reads file and create the variable for the output directory
for reads_file in "$input_dir"/*.fastq; do

  # Define the name of the sorted BAM file by removing the .fastq and adding _sorted.bam
  reads_file_sorted="${reads_file%.fastq}_sorted.bam"

  # Perform the alignment using bowtie, then samtools for SAM to BAM, sort, and index
  bowtie2 -p 8 -x ~/refs/Bowtie2Index/genome -U "$reads_file" | samtools view -bS | samtools sort -@ 8 -m 6G -O BAM > "${output_dir}/${reads_file_sorted##*/}"
done

for bam_file in "$output_dir"/*.bam; do
    samtools index $bam_file
done