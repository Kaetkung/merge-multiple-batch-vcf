#!/bin/bash

# Find all .vcf.gz files in the current directory and save them to vcf_list.txt
find "$(pwd)" -maxdepth 1 -name "*.vcf.gz" > vcf_list.txt

# Read the file paths and create a space-separated string of all VCF files
vcf_files=""
while read -r line; do
  # Normalize the VCF file and output to a new file
  output_file="${line%.vcf.gz}.norm.vcf.gz"
  bcftools norm -f human_g1k_v37.fasta -m- "$line" | bgzip -c > "$output_file"
  bcftools index "$output_file"
  
  vcf_files+="$output_file "
done < vcf_list.txt

# Run bcftools isec with the number of files obtained from vcf_list.txt
bcftools isec $vcf_files -p output_directory -n $(wc -l < vcf_list.txt)

# Compress all .vcf files in the output_directory to .gz
for file in output_directory/*.vcf; do
  bgzip "$file"
done

# Index all .vcf.gz files in the output_directory
for file in output_directory/*.vcf.gz; do
  bcftools index "$file"
done

# Merge all .vcf.gz files in the output_directory and index the merged file
bcftools merge output_directory/*.vcf.gz -Oz -o merged.vcf.gz --force-samples
