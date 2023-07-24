#!/bin/bash
set -ueox pipefail

# macs 2 peak caller, -t treatment, -c control sample, -f format BAM single end, -n is name for output files

# define arrays for treatment and control files
treatment_files=("")

control_files=("")

# iterate over treatment files up until the length of treatment files is reached and use iteration to index files
for ((i=0; i<${#treatment_files[@]}; i++)); do
  treatment_file="${treatment_files[$i]}"
  control_file="${control_files[$i]}"

  # extract the filename for the naming output
  filename=$(basename "${treatment_file%.*}")

    # in this case genome is Arabidopsis thaliana
  macs2 callpeak -t "$treatment_file" \
    -c "$control_file" \
    -f BAM -g 1.118e8 -q 0.05 \
    -n "$filename" \
    --outdir /Users/frankwellmer/kevin/ChIPseq/data/peaks/peaks_more_stringent/"$filename"_peaks
done