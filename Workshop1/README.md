
# Workshop 1: Basics of genomic data and quality control

## Friday, April 21 (10am-1pm)

Instructor: Anne Chambers (eachambers@berkeley.edu)

This workshop will explore the basics of genomics, including available methods to gather genome-scale data (including reduced-representation methods, whole genome sequencing, transcriptomics, etc.). We will go over the basics of data assembly (filtering and basic bioinformatics processing) with an emphasis on considerations to make depending on sampling, availability of funding and a reference genome, and if you have only low-coverage datasets. We will then do some basic quality control and data exploration of assemblies. The worksheet will be on quality control, basic population genomics (e.g., structure), and generating output files for downstream analyses.

### Topics

**1. Basics of genomics (slides [here](XXX))**
* Quick summary of approaches: library prep & bioinformatics assembly (standard filtering, mapping, and variant calling)
* How do methods compare? How does it depend on the questions you want to ask?
* Considerations and biases for different genomic data types
* Brief review of sequencing/input/output file types
* ***Activities and questions [here](XXX)***

**2. Quality control of genomic data (slides [here](XXX))**
* Missing data, read depth, and other considerations
* Visualizing data for QC: PCA, relatedness, diversity, ADMIXTURE
* "Red flags" in your data and what to do about them
* ***Activities and questions [here](XXX)***

**3. Generating files for downstream analysis (slides [here](XXX))**
* Pruned vcf, distance matrix, dosage/genotype matrix
* Advanced data processing: ROH, LD-pruning, imputation
* ***Activities and questions [here](XXX)***

### Software required
**Linux:** `vcftools`, `bcftools`, `plink`, `ADMIXTURE`

**R packages:** `devtools`, `vcfR`, `tidyverse`, `adegenet`, `hierfstat`

See course installation instructions [here](XXX).

### Example dataset to be used

We will be using the *Sceloporus* ddRADseq dataset from [Bouzid et al. 2021](https://onlinelibrary.wiley.com/doi/full/10.1111/mec.15836).

### Additional resources
