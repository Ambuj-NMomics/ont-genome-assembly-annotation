# 🧬 ONT Genome Assembly and Annotation

**End-to-end genome assembly and annotation using Oxford Nanopore Technologies (ONT) long-read sequencing data.**

This repository documents a **reproducible genome assembly workflow** developed as part of my **independent learning in bioinformatics**.  
The focus is on working with **real ONT sequencing data**, understanding **data limitations**, and applying **best practices for long-read assembly and annotation**.


📌 Project Overview

## **📌 Project Overview**

- **Sequencing platform:** Oxford Nanopore Technologies (ONT)  
- **Read type:** Long reads (barcoded)  
- **Target organism:** Prokaryotic (bacterial)  
- **Workflow stages:**
  - Genome assembly  
  - Assembly polishing  
  - Quality control (QC)  
  - Genome annotation  

Sequencing platform: Oxford Nanopore Technologies (ONT)

Read type: Long reads (barcoded)

Target organism: Prokaryotic (bacterial)


## **📊 Dataset Summary (After Filtering)**

- **Total reads:** ~290,000  
- **Total bases:** ~1.68 Gb  
- **Average read length:** ~5.8 kb  
- **Maximum read length:** ~191 kb  

> Although the raw dataset contained many short reads, **conservative filtering preserved a strong long-read tail**, enabling high-quality genome assembly.

Workflow: Assembly → Polishing → QC → Annotation

The pipeline is designed for bacterial genomes and prioritizes long-read preservation, accurate polishing, and transparent documentation.

📊 Dataset Summary (after filtering)
Metric	Value
Total reads	~290,000
Total bases	~1.68 Gb
Average read length	~5.8 kb
Maximum read length	~191 kb



Although the raw dataset contained many short reads, conservative filtering preserved a strong long-read tail, enabling high-quality genome assembly.

## **🛠 Tools Used**

- **SeqKit** – Read statistics and basic QC  
- **Filtlong** – Length-aware read filtering  
- **Flye** – Long-read genome assembly  
- **Minimap2** – Read-to-assembly mapping  
- **Racon** – Assembly polishing  
- **Medaka** – Neural network–based polishing  
- **QUAST** – Assembly quality assessment  
- **BUSCO** – Genome completeness assessment  
- **Prokka** – Genome annotation  

All tools were installed and managed using **Conda**.


🛠 Tools Used

SeqKit – Read statistics and basic QC

Filtlong – Length-aware read filtering

Flye – Long-read genome assembly



## **🔬 Workflow Overview**

The genome assembly and annotation workflow consists of the following steps:

- Initial read statistics and quality assessment  
- Conservative read filtering to retain long reads  
- Genome assembly using **Flye**  
- Assembly polishing using **Racon** and **Medaka**  
- Assembly quality assessment using **QUAST** and **BUSCO**  
- Genome annotation using **Prokka**  

📄 **Detailed commands, explanations, and decision points** are provided in:  
➡️ **[`docs/workflow.md`](docs/workflow.md)**

---

## **📂 Repository Structure**

```text
ont-genome-assembly-annotation/
├── README.md                 # Project overview and summary
├── scripts/
│   └── assembly_pipeline.sh  # Executable pipeline
├── docs/
│   └── workflow.md           # Full step-by-step workflow
├── qc/
│   └── read_stats.txt        # Read statistics summary
└── .gitignore


- Minimap2 – Read-to-assembly mapping

- Racon – Assembly polishing

- Medaka – Neural network–based polishing

- QUAST – Assembly quality assessment

- BUSCO – Genome completeness assessment

- Prokka – Genome annotation

All tools were installed and managed using Conda.

🔬 Workflow Overview

- Initial read statistics and quality assessment

- Conservative read filtering to retain long reads

- Genome assembly using Flye

- Assembly polishing using Racon and Medaka

- Assembly quality assessment (QUAST, BUSCO)

- Genome annotation using Prokka

