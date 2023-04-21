
# === 2. DATA VISUALIZATION OF SUMMARY STATISTICS ===

setwd("~/Desktop/EvoGenomics_workshop")

# Load libraries
library(tidyverse)
library(cowplot)


# 2a ----------------------------------------------------------------------

#   Using the missing data stats you generated in step 1.3a, plot the data however you 
#   would like. What is the average proportion of missing data across the entire
#   dataset?
miss <- read_tsv("outputs/lampro_filtered.imiss", col_names = TRUE)

miss %>% 
  arrange(desc(F_MISS)) %>%
  mutate(INDV = factor(INDV, levels = INDV)) %>% 
  ggplot(aes(x = INDV, y = F_MISS)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90)) +
  ylab("Proportion missing data")

mean(miss$F_MISS) # 5.9% avg missingness


# 2b ----------------------------------------------------------------------

#   Using the depth statistics you generated in step 1.3b, plot the data in whichever 
#   way you would like. What is the average read depth across the entire dataset?
depth <- read_tsv("outputs/lampro_filtered.idepth", col_names = TRUE)

depth %>% 
  arrange(desc(MEAN_DEPTH)) %>%
  mutate(INDV = factor(INDV, levels = INDV)) %>% 
  ggplot(aes(x = INDV, y = MEAN_DEPTH)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90)) +
  ylab("Mean read depth")

mean(depth$MEAN_DEPTH) # 72.2 avg read depth


# 2c ----------------------------------------------------------------------

#   Is there a relationship between missing data and read depth? If these 
#   were your data, would you remove some samples to minimize low coverage and/or
#   high missing data? 
dat <- full_join(depth, miss, by = "INDV")

dat %>% 
  ggplot(aes(x = MEAN_DEPTH, y = F_MISS)) +
  geom_point() +
  ylab("Proportion missing data") +
  xlab("Mean read depth") # yes, there's definitely a relationship between the two.

# It's user choice whether samples should be removed, and this is a constant balance
# between having to toss samples (maybe some of your low-coverage samples are valuable
# or critical for your analyses) and retaining crappy data. In this case, all these
# samples were retained because high amounts of missing data in RADseq data are to be
# expected, and selectively removing poorer-quality samples didn't affect end results 
# substantially, but these samples did come from important localities.


# 2d ----------------------------------------------------------------------

#   Using the PCA results generated in 1.4d, generate a scatterplot for the first
#   two PC axes (*hint:* use the plink.eigenvec file).

# N.B.: You may have noticed that the sample IDs are duplicated (i.e., the first two
# columns of the data). This is because plink is expecting both family and individual-
# level IDs (i.e., pedigree information). Disregard one of these columns.
pcs <- read.table("outputs/lampro_filtered.eigenvec", header = FALSE) %>% 
  select(-V1)
colnames(pcs) <- c("INDV", "PC1", "PC2", "PC3", "PC4", "PC5", "PC6", "PC7", "PC8", "PC9", "PC10")

p_pcs <-
  pcs %>% 
  ggplot(aes(x = PC1, y = PC2)) + 
  geom_point()

p_pcs


# 2e ----------------------------------------------------------------------

#   How much variation is explained by PCs 1 and 2?

#   The proportion of variance of each PC axis can be calculated by looking at
#   the eigenvalues associated with each PC (check out the .eigenval file for 
#   these). The % variance of each PC axis is the proportion of each PC axis's
#   relative to the sum of all eigenvalues.
eigenvals <- read_tsv("outputs/lampro_filtered.eigenval", col_names = FALSE)

eigenvals <- eigenvals %>% 
  mutate(prop = X1 / sum(X1) * 100) %>% 
  mutate(PC = paste0("PC", row.names(eigenvals)))

View(eigenvals) # PC1 explains 42.0% of variance and PC2 explains 18.7%.


# 2f ----------------------------------------------------------------------

#   Is there a relationship between the fixation index (F) and PC1? *hint:*
#   this is the F column from the .het plink file.

het <- read.table("outputs/lampro_filtered.het", header = TRUE)

full_join(het, pcs, by = "INDV") %>% 
  ggplot(aes(x = PC1, y = F)) +
  geom_point()

# Relationships between F-statistics and PCs can often arise in cases where
# there are excesses of heterozygosity (close to -1) or homozygosity (close to
# +1). Samples with very negative values that are also outliers in the PCA
# could be due to cross-contamination. In our case, no values fall beneath 0
# and no samples are too close to +1, so we should be OK.


# 2g ----------------------------------------------------------------------

#   Using skeleton code provided in the R script, generate a visualization of the
#   the admixture results for the LD-pruned dataset (using the Q files).
#		BONUS: Generate a PCA for the LD-pruned dataset. How does it differ from that 
#   of the unpruned dataset?

#   There are many ways to build a structure-style plot, which is really just a 
#   stacked bar plot. The following does so using the tidyverse, but please
#   feel free to do so however you'd like!

#   1. Read in the Q matrix data and tidy it such that each row is an observation 
#   (i.e., each row only has one individual and one K proportion). The easiest way 
#   to do so is with the pivot_longer() function within the tidyr package.
admix <- read.table("outputs/lampro_ldpruned.3.Q", header = FALSE) %>% 
  mutate(INDV = pcs$INDV)

admix_tidy <- admix %>% 
  pivot_longer(names_to = "cluster", values_to = "proportion", -INDV)

#   2. Now, you should be able to build your plot using geom_bar with the 
#   position and stat args set to "stack" and "identity", respectively,
#   filling by cluster.
admix_tidy %>% 
  ggplot(aes(x = INDV, y = proportion, fill = cluster)) +
  geom_bar(position = "stack", stat = "identity")

# For a cleaner/prettier structure plot:
admix_tidy %>% 
  ggplot(aes(x = INDV, y = proportion, fill = cluster)) +
  geom_bar(position = "stack", stat = "identity") + 
  scale_y_discrete(expand = c(0,0)) +
  scale_x_discrete(expand = c(0,0)) +
  theme(axis.line=element_line(colour="black"),
                                    axis.text.x = element_text(angle = 90),
                                    axis.text.y = element_blank(),
                                    axis.ticks = element_blank(),
                                    axis.title.x = element_blank(),
                                    axis.title.y = element_blank(),
                                    # legend.position = "none",
                                    panel.border = element_rect(fill=NA, colour = "black", linetype = "solid", linewidth = 1.5),
                                    strip.text.y = element_text(size = 30, face = "bold"),
                                    strip.background = element_rect(colour = "white", fill = "white"),
                                    panel.spacing = unit(-0.1, "lines"))

## BONUS:
# plink --vcf lampro_ldpruned.vcf --pca 10 --out lampro_ldpruned --allow-extra-chr --autosome-num 95

pcs_ldpruned <- read.table("outputs/lampro_ldpruned.eigenvec", header = FALSE) %>% 
  select(-V1)
colnames(pcs_ldpruned) <- c("INDV", "PC1", "PC2", "PC3", "PC4", "PC5", "PC6", "PC7", "PC8", "PC9", "PC10")

p_pcld <-
  pcs_ldpruned %>% 
  ggplot(aes(x = PC1, y = PC2)) + 
  geom_point()

plot_grid(p_pcs, p_pcld)

# Based on the above, LD-pruning does not appear to have made a substantial
# difference in the PCA results. This could be due to several things, but 
# is likely largely due to the fact that these are RADseq data and many of 
# the loci are not in linkage. Most researchers working with RADseq data
# deal with linkage by selecting a single SNP per RAD tag, making the
# assumption that tags are unlinked.


# 2h ----------------------------------------------------------------------

#   Based on what you've observed about the data from all your visualizations, 
#   what do you notice about the major groupings within the PCA (axes 1 and 2)? 
#		Are the groupings along PC1 explained by (a) read depth, (b) missing data, or 
#		(c) a different species having been included in the dataset? What is your 
#   evidence for this? Are there other reasons that could explain the pattern 
#   and how would you investigate these?

#   *hint:* if you're having a lot of problems trying to figure out how to code
#   up which samples should be assigned to which cluster, there's a file in the
#   Data folder on GitHub with individual assignments.

#   There are certainly groupings present along PCs 1 and 2. Let's see if we can
#   delve deeper into what's causing those patterns.

full_dat <- full_join(dat, pcs, by = "INDV")

# Colorize by read depth:
full_dat %>% 
  ggplot(aes(x = PC1, y = PC2, color = MEAN_DEPTH)) + 
  geom_point()

# Colorize by missingness:
full_dat %>% 
  ggplot(aes(x = PC1, y = PC2, color = F_MISS)) + 
  geom_point()

# Colorizing by admixture props is a little more interesting. One could also
# run k-means clustering and colorize that way.
groups <-
  admix %>% 
  select(-INDV) %>%
  mutate(max_K = names(.)[max.col(.)])

# Add groups to the PC dataset
group_pcs <- cbind(groups, pcs)

# Now, build PCA plot with color
group_pcs %>% 
  ggplot(aes(x = PC1, y = PC2, color = max_K)) + 
  geom_point()

# This is definitely driving the patterning we're seeing in the data! Given the
# high amount of variance along both PC1 and PC2, we're likely looking at a 
# different species that was included in the dataset. The sample that falls 
# as an intermediate along PC1 could be a hybrid.
