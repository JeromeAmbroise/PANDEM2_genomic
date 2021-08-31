# PANDEM2_GENOMIC

## Introduction

As part of the European project PANDEM2, this pipeline is developped to analyse SARS-CoV-2 genomic data (fastq file) and its associated metadata. The steps performed are the mapping of the reads against a reference, the variants calling, the computation of the consensus sequence, and the annotation of the detected mutations. 

## Params in config.yaml

- Path to the input files (fastq and metadata)
- Path to the Reference genome
- Path to the Metadata 


## Installation with conda 

Git clone
```
git clone https://github.com/JeromeAmbroise/PANDEM2_genomic.git
cd PANDEM2_genomic
```
Create a conda environnement 
```
mamba env create --file workflow/envs/PANDEM2_genomic.yml
conda activate PANDEM2_genomic
```
Build DAG (optional) and launch the pipeline

```
snakemake -np --cores 10 --dag |dot -Tsvg > dag.svg
snakemake --cores 10
```
