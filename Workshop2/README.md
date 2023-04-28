
# Workshop 2: The basics of selection and demographic analyses

## Friday, April 28 (10am-1pm)

Instructor: Phred Benham (phbenham@gmail.com)

This workshop is designed to provide a brief introduction into some commonly used approaches to identifying outlier genes of interest that may be under selection or associated with a phenotype of interest. Methods discussed will include genome scans and statistical approaches for making associations between genotype data and environmental or phenotypic variation. In the second half of the workshop, we will discuss approaches to demographic analysis (e.g. gene flow, Ne fluctuations, divergence time) in population genomics datasets. The workshop will provide an overview of how to make demographic inferences using the site frequency spectrum.

### Topics

**1. Genome scans to detect loci under selection. (slides [here](https://github.com/eachambers/EvoGeno-Methods-Workshop/blob/main/Workshop2/Lectures/EvoGen_workshop2_genomeScans.pdf))**
* Use vcftools to perform and interpret commonly used selection scan techniques between two populations (e.g. Fst, Dxy, Tajima's D,    Nucleotide diversity). 
* Learn how to make Manhattan plots to visualize results.
* Use bedtools and other software to identify specific outlier genes. 
* ***Activities and questions [here](https://github.com/eachambers/EvoGeno-Methods-Workshop/blob/main/Workshop2/Exercises/Workshop2_Exercise1.txt)***
* The vcf file for this exercise can be downloaded here: https://www.dropbox.com/s/ilzyhv1a4kw3s2k/SAVS_exampleDataset_exercise1.vcf.gz?dl=0

**2. Learn how to make genotype-environment/phenotype associations. (slides [here](https://github.com/eachambers/EvoGeno-Methods-Workshop/blob/main/Workshop2/Lectures/EvoGen_Workshop2_GEA.pdf))**
*    Learn how to prepare different data types for analysis (i.e. genotypes, environmental data, phenotypic data).
*    Use RDA to make and interpret genotype-environment associations across spatial scales.
*    Learn how to use GEMMA to make genotype-phenotype associations within a population. 
* ***Activities and questions [here](https://github.com/eachambers/EvoGeno-Methods-Workshop/blob/main/Workshop2/Exercises/Workshop2_Exercise2.txt)***

**3. The basics of demographic analysis with genomic datasets.(slides [here](https://github.com/eachambers/EvoGeno-Methods-Workshop/blob/main/Workshop2/Lectures/EvoGen_Workshop2_Demography.pdf))**
*   An overview of the different kinds of approaches for making demographic inference (e.g. SMC, coalescent models, site frequency spectrum).
*   Introduction to GADMA and the models it supports.
*   Tutorial on inputting data to GADMA, running a demographic analysis, and interpreting results. 
* ***Activities and questions [here](https://github.com/eachambers/EvoGeno-Methods-Workshop/blob/main/Workshop2/Exercises/Workshop2_Exercise3.txt)***
* The vcf file for this exercise can be downloaded here: https://www.dropbox.com/s/ld8wd3oqgoruarf/SAVS_GADMA_example.vcf.gz?dl=0

### Software required
**Online:** [http://geneontology.org](http://geneontology.org/)

**Linux:** `vcftools`, `bedtools`, `GADMA`, GEMMA

**R packages:** `vegan (RDA)`, `qqman`

See course installation instructions [here](XXX).

### Example dataset to be used
*   Rangewide exome sequence data of the Savannah Sparrow (Passerculus sandwichensis).
*   Large mouse dataset (1,934 genotyped and phenotyped individuals) from: https://www.nature.com/articles/ng.3595


### Additional resources
*   Online RDA tutorial: https://popgen.nescent.org/2018-03-27_RDA_GEA.html
*   Working with vcf files in VCFtools, plink, etc.: https://www.york.ac.uk/res/dasmahapatra/teaching/MBiol_sequence_analysis/workshop4_2019.html
*   Great collection of tutorials for population and speciation genomics: https://speciationgenomics.github.io
*   GEMMA tutorial: https://github.com/rcc-uchicago/genetic-data-analysis-2
*   Methods in population genomics: https://methodspopgen.com

### Useful reviews
Bourgeois, Y. X. C., & Warren, B. H. (2021). An overview of current population genomics methods for the analysis of whole-genome resequencing data in eukaryotes. Molecular Ecology, 30(23), 6036–6071. https://doi.org/10.1111/mec.15989

Capblancq, T., & Forester, B. R. (2021). Redundancy analysis: A Swiss Army Knife for landscape genomics. Methods in Ecology and Evolution, 12(12), 2298–2309. https://doi.org/10.1111/2041-210X.13722

Cruickshank, T. E., & Hahn, M. W. (2014). Reanalysis suggests that genomic islands of speciation are due to reduced diversity, not reduced gene flow. Molecular Ecology, 23(13), 3133–3157. https://doi.org/10.1111/mec.12796

Hoban, S., Kelley, J. L., Lotterhos, K. E., Antolin, M. F., Bradburd, G., Lowry, D. B., … Whitlock, M. C. (2016). Finding the Genomic Basis of Local Adaptation: Pitfalls, Practical Solutions, and Future Directions. The American Naturalist, 188(4), 000–000. https://doi.org/10.1086/688018

Irwin, D. E., Milá, B., Toews, D. P. L., Brelsford, A., Kenyon, H. L., Porter, A. N., … Irwin, J. H. (2018). A comparison of genomic islands of differentiation across three young avian species pairs. Molecular Ecology, (January). https://doi.org/10.1111/mec.14858

Noskova, E., Abramov, N., Iliutkin, S., Sidorin, A., Dobrynin, P., & Ulyantsev, V. (2022). GADMA2: more efficient and flexible demographic inference from genetic data. BioRxiv, (Ld), 2022.06.14.496083. Retrieved from https://doi.org/10.1101/2022.06.14.496083%0Ahttps://www.biorxiv.org/content/10.1101/2022.06.14.496083v1%0Ahttps://www.biorxiv.org/content/10.1101/2022.06.14.496083v1.abstract

Pavlidis, P., Jensen, J. D., Stephan, W., & Stamatakis, A. (2012). A critical assessment of storytelling: Gene ontology categories and the importance of validating genomic scans. Molecular Biology and Evolution, 29(10), 3237–3248. https://doi.org/10.1093/molbev/mss136

Tam, V., Patel, N., Turcotte, M., Bossé, Y., Paré, G., & Meyre, D. (2019). Benefits and limitations of genome-wide association studies. Nature Reviews Genetics, 20(August). https://doi.org/10.1038/s41576-019-0127-1
