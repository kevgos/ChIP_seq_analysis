#!/usr/bin/env bash
set -o pipefail

runs_array=() # insert desired sequencing from sequence read archive 

function retriever_seqs () {
    # Call SRA toolkit fasterq dump for sequence retrieval
  for run in "${runs_array[@]}"
  do
    ~/sratoolkit.3.0.2-mac64/bin/fasterq-dump $run -O /output_folder
  done
}

retriever_seqs