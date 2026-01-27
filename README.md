<<<<<<< HEAD
=======
# ONT-Genome-Assembly-Annotation
End-to-end Genome Assembly and Annotation Using Oxford Nanopore Long-Read Data                                                  
>>>>>>> 76ac16710a4faf8ebcb056fe52379f534f76d36d
# Genome Assembly and Annotation using Oxford Nanopore Data

This repository documents a **complete genome assembly and annotation workflow**
performed using **Oxford Nanopore Technologies (ONT) long-read sequencing data**.

The project was carried out as part of my self-learning in bioinformatics,
with a focus on understanding **real sequencing data, practical limitations,
and reproducible workflows**.

---

## Project Overview

- Sequencing platform: Oxford Nanopore Technologies (ONT)
- Data type: Long-read sequencing (barcoded)
- Organism type: Prokaryotic (bacterial)
- Workflow type: Assembly → Polishing → QC → Annotation

---

## Dataset Summary (after filtering)

| Metric | Value |
|------|------|
| Total reads | ~290,000 |
| Total bases | ~1.68 Gb |
| Average read length | ~5.8 kb |
| Maximum read length | ~191 kb |

Although the raw data contained many short reads, conservative filtering preserved
a strong long-read tail, enabling high-quality genome assembly.

---

## Tools Used

- SeqKit – read statistics
- Filtlong – read filtering
- Flye – genome assembly
- Minimap2 – read mapping
- Racon – assembly polishing
- Medaka – neural-network-based polishing
- QUAST – assembly quality assessment
- BUSCO – genome completeness assessment
- Prokka – genome annotation

All tools were installed using **conda**.

---

## Workflow Steps

### 1. Initial Read Statistics

```bash
seqkit stats *.fastq.gz
<<<<<<< HEAD

=======
>>>>>>> 76ac16710a4faf8ebcb056fe52379f534f76d36d
