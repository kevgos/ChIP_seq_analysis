#!usr/bin/env bash
set pipefail -ueou

input_dir="/Users/frankwellmer/kevin/ChIPseq/data/aligned_reads/"

for input_file in "$input_dir"/*.bam; do
  # retrieve basename of the file, then collect the filename up until 'sort' in this case (coming from sorted BAM files)
  filename=$(basename "$input_file")
  file_name="${filename%sort*}"
  samtools flagstat $input_file > "/Users/frankwellmer/kevin/ChIPseq/data/sequencing_quality/alignment/${file_name}flagstat.txt"
done