#!/bin/bash

# Genome assembly and annotation pipeline (ONT)

# Step 1: Filter reads
filtlong --min_length 1000 --keep_percent 90 all_reads.fastq.gz > reads.filtered.fastq

# Step 2: Assemble genome
flye --nano-raw reads.filtered.fastq --out-dir flye_out --threads 16

# Step 3: Polishing (example: Racon)
minimap2 -x map-ont flye_out/assembly.fasta reads.filtered.fastq > aln.paf
racon reads.filtered.fastq aln.paf flye_out/assembly.fasta > asm.racon1.fasta
