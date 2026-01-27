# Detailed Genome Assembly and Annotation Workflow (ONT)

This document provides a **complete, step-by-step explanation** of the genome assembly and annotation workflow used in this project.

The workflow is optimized for **Oxford Nanopore Technologies (ONT) long-read sequencing data** and is intended for **bacterial (prokaryotic) genomes**.

---

## 1. Raw Data Description

- Sequencing platform: **Oxford Nanopore Technologies (ONT)**
- Data format: `FASTQ / FASTQ.GZ`
- Read type: Long reads (barcoded)
- Basecalling: ONT Guppy (performed prior to this workflow)

The dataset contained a mixture of **short and long reads**, typical of ONT sequencing runs.

---

## 2. Initial Read Statistics

FastQC was **not used**, as it is not well suited for large ONT long-read datasets.

Instead, **SeqKit** was used to obtain reliable read statistics.

```bash
seqkit stats *.fastq.gz



This step was used to assess:

- Total number of reads

- Total bases

- Read length distribution

- Presence of ultra-long reads

3. Read Filtering Strategy

. ONT datasets often contain many short or low-quality reads that can negatively affect assembly.

A conservative filtering strategy was applied using Filtlong to:

. Remove very short reads

. Retain the longest and most informative reads


filtlong --min_length 1000 --keep_percent 90 all_reads.fastq.gz > reads.filtered.fastq


Rationale

. Reads shorter than 1 kb contribute little to long-read assembly

. Preserving long reads improves contiguity and repeat resolution

. Conservative filtering avoids excessive data loss

4. Genome Assembly

. Genome assembly was performed using Flye, a long-read assembler designed for noisy ONT data.


flye --nano-raw reads.filtered.fastq \
     --out-dir flye_out \
     --threads 16

Flye was chosen because:

. It is optimized for ONT error profiles

. Performs well for bacterial genomes

. Produces reliable initial assemblies even with noisy reads


The primary assembly output is:

flye_out/assembly.fasta

5. Assembly Polishing

Raw ONT assemblies contain base-level errors that must be corrected.

5.1 Read Mapping

Reads were mapped back to the assembly using Minimap2.


minimap2 -x map-ont flye_out/assembly.fasta reads.filtered.fastq > aln.paf


5.2 Racon Polishing

Two rounds of Racon polishing were performed to correct systematic errors.


racon reads.filtered.fastq aln.paf flye_out/assembly.fasta > asm.racon1.fasta


(Second round performed using the output of the first round.)

5.3 Medaka Polishing

Final polishing was performed using Medaka, which uses a neural network model trained on ONT data.

medaka_consensus \
  -i reads.filtered.fastq \
  -d asm.racon2.fasta \
  -o medaka_out


Final polished assembly:

medaka_out/consensus.fasta

6. Assembly Quality Assessment
6.1 QUAST

Assembly statistics were evaluated using QUAST.

quast medaka_out/consensus.fasta


Key metrics assessed:

. Number of contigs

. N50

. Total assembly length

6.2 BUSCO

Genome completeness was assessed using BUSCO with a bacterial lineage dataset.

busco -i medaka_out/consensus.fasta \
      -l bacteria_odb10 \
      -m genome


BUSCO provides:

. Percentage of complete genes

. Fragmented genes

. Missing genes

7. Genome Annotation

Genome annotation was performed using Prokka.

prokka medaka_out/consensus.fasta \
  --outdir prokka_out \
  --prefix sample


Prokka identifies:

. Protein-coding genes

. rRNA and tRNA genes

. Functional annotations

8. Notes and Best Practices

. Long-read length distribution is more important than raw read count

. Conservative filtering improves assembly quality

. Polishing is essential for downstream annotation accuracy

. Annotation should always be performed on a polished assembly

9. Limitations

. Workflow is optimized for bacterial genomes

. Not directly suitable for large eukaryotic genomes

. Final quality depends on DNA extraction and sequencing quality

10. Reproducibility

All commands in this workflow are reproducible and correspond to the executable script:

scripts/assembly_pipeline.sh
