🧬 ONT Genome Assembly and Annotation

End-to-end genome assembly and annotation using Oxford Nanopore Technologies (ONT) long-read sequencing data.

This repository documents a reproducible genome assembly workflow developed as part of my independent learning in bioinformatics, with a focus on working with real sequencing data, understanding data limitations, and applying best practices for long-read assembly.

📌 Project Overview

Sequencing platform: Oxford Nanopore Technologies (ONT)

Read type: Long reads (barcoded)

Target organism: Prokaryotic (bacterial)

Workflow: Assembly → Polishing → QC → Annotation

The pipeline is designed for bacterial genomes and prioritizes long-read preservation, accurate polishing, and transparent documentation.

📊 Dataset Summary (after filtering)
Metric	Value
Total reads	~290,000
Total bases	~1.68 Gb
Average read length	~5.8 kb
Maximum read length	~191 kb

Although the raw dataset contained many short reads, conservative filtering preserved a strong long-read tail, enabling high-quality genome assembly.

🛠 Tools Used

SeqKit – Read statistics and basic QC

Filtlong – Length-aware read filtering

Flye – Long-read genome assembly

Minimap2 – Read-to-assembly mapping

Racon – Assembly polishing

Medaka – Neural network–based polishing

QUAST – Assembly quality assessment

BUSCO – Genome completeness assessment

Prokka – Genome annotation

All tools were installed and managed using Conda.

🔬 Workflow Overview

Initial read statistics and quality assessment

Conservative read filtering to retain long reads

Genome assembly using Flye

Assembly polishing using Racon and Medaka

Assembly quality assessment (QUAST, BUSCO)

Genome annotation using Prokka
