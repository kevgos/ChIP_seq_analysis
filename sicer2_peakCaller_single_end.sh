#!/bin/bash
set -ueox pipefail

# sicer2 peak caller, -t treatment, -c control sample, Arabidopsis effective genome faction 0.9, must add TAIR10 to the genome.py file beforehand (see documentation)

treatment_files=( "" )
control_files=( "" )
output_dir="/"

# iterate over treatment files up until the length of treatment files is reached and use iteration to index files
for ((i=0; i<${#treatment_files[@]}; i++)); do
  treatment_file="${treatment_files[$i]}"
  control_file="${control_files[$i]}"

  # extract the filename for the naming output
  filename=$(basename "${treatment_file%.*}")

sicer -t "$treatment_file" \
  -c "$control_file" \
  -s tair10 \
  -f 400 \
  -egf 0.9 \
  -o "$output_dir"
done
