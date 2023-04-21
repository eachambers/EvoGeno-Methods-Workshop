
# Workshop 1: Basics of genomic data and quality control

## Friday, April 21 (10am-1pm)

Instructor: Anne Chambers (eachambers@berkeley.edu)

This workshop will explore the basics of genomics, including available methods to gather genome-scale data (including reduced-representation methods, whole genome sequencing, transcriptomics, etc.). We will go over the basics of data assembly (filtering and basic bioinformatics processing) with an emphasis on considerations to make depending on sampling, availability of funding and a reference genome, and if you have only low-coverage datasets. We will then do some basic quality control and data exploration of assemblies. The worksheet will be on quality control, basic population genomics (e.g., structure), and generating output files for downstream analyses.

### Topics

**1. Basics of genomics (slides [here](https://github.com/eachambers/EvoGeno-Methods-Workshop/blob/main/Workshop1/Lectures/EvoGenomicsworkshop1_1.pdf))**
* Quick summary of approaches: library prep & bioinformatics assembly (standard filtering, mapping, and variant calling)
* How do methods compare? How does it depend on the questions you want to ask?
* Considerations and biases for different genomic data types
* Brief review of sequencing/input/output file types
* ***Exercises [here](https://github.com/eachambers/EvoGeno-Methods-Workshop/blob/main/Workshop1/Exercises/EvoGenomics_Ws1_Ex1.txt)***

**2. Quality control of genomic data (slides [here](https://github.com/eachambers/EvoGeno-Methods-Workshop/blob/main/Workshop1/Lectures/EvoGenomicsworkshop1_2.pdf))**
* Missing data, read depth, LD-pruning, and other considerations
* Visualizing data for QC: PCA, relatedness, diversity, ADMIXTURE
* "Red flags" in your data and what to do about them
* Advanced data processing: ROH, imputation
* ***Exercises [here](https://github.com/eachambers/EvoGeno-Methods-Workshop/blob/main/Workshop1/Exercises/EvoGenomics_Ws1_Ex2.txt) and R script [here](https://github.com/eachambers/EvoGeno-Methods-Workshop/blob/main/Workshop1/Exercises/Workshop1_Exercise2.R)***

### Software required
**Linux:** `vcftools`, `bcftools`, `plink`, `ADMIXTURE`

**R packages:** `devtools`, `vcfR`, `tidyverse`, `adegenet`, `hierfstat`

See course installation instructions [here](https://docs.google.com/document/d/1J-HjigOT_Zeu1xv38uY6dttdloo8OQG2km_fr87qIMk/edit).

### Example dataset to be used

We will be working with a *Lampropeltis* ddRADseq dataset; you can download the vcf we'll be working with [here](https://github.com/eachambers/EvoGeno-Methods-Workshop/blob/main/Workshop1/Data/lampro.vcf). The raw data files from the manuscript are available on Dryad [here](https://datadryad.org/stash/dataset/doi:10.5061/dryad.9s4mw6mj8).

### Additional resources

Manuals for programs:

**[bcftools](https://samtools.github.io/bcftools/bcftools.html)**

**[vcftools](https://vcftools.sourceforge.net/man_latest.html)**

**[plink](https://www.cog-genomics.org/plink/1.9/)**

**[admixture](https://dalexander.github.io/admixture/admixture-manual.pdf)**

Sims D, Sudbery I, Ilott NE, Heger A, Ponting CP. 2014. Sequencing depth and coverage: key considerations in genomic analyses. Nature Reviews Genetics 15:121-132. Available [here](https://www.nature.com/articles/nrg3642).
