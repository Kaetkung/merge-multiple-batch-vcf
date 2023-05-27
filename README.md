# merge-multiple-batch-vcf
this is a script for merge multiple file and multiple version of vcf file

Overview
This script is designed to perform normalization and merging of Variant Call Format (VCF) files. The script will find all .vcf.gz files within the current directory, normalize them using bcftools, and finally merge them into a single VCF file.

Requirements
Make sure you have the following tools installed in your system:
    bcftools
    bgzip

Input Files
You need to have the following files in your current directory to run this script:
    
    1 .vcf.gz files: Compressed VCF files that contain your genomic data. The script will find all .vcf.gz files in the current directory.

    2 human_g1k_v37.fasta: Reference genome in FASTA format that is used to normalize the VCF files.

Usage
To execute the script, save it in a .sh file and provide execute permission. This can be done with the following commands:

$ chmod +x scriptname.sh
$ ./scriptname.sh

(Replace scriptname.sh with your actual script filename.)

Output

The output of this script includes:

    - Normalized .vcf.gz files: For each input .vcf.gz file, a corresponding normalized file will be created in the current directory.

    - output_directory: A directory containing the results of the intersection operation from bcftools isec. All .vcf files in this directory will be compressed to .vcf.gz and indexed.

    - merged.vcf.gz: A single merged .vcf.gz file, created from all the .vcf.gz files in the output_directory.

Note
This script assumes familiarity with bioinformatics workflows and the used tools. For more information about specific steps or troubleshooting, please refer to the documentation of bcftools and bgzip.
