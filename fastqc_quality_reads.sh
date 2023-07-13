#!/usr/bin/env bash
#set -o pipefail

# set input directory to wherever the .fastq sequencing files are, set output to where reports will go
input_dir="/*.fastq"
output_dir="/sequencing_quality"

for run in $input_dir
do
  fastqc -o $output_dir $run
done