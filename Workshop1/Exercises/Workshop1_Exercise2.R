# === 2. DATA VISUALIZATION OF SUMMARY STATISTICS ===

# Load libraries


# 2a ----------------------------------------------------------------------

#   Using the missing data stats you generated in step 1.3a, plot the data however you 
#   would like. What is the average proportion of missing data across the entire
#   dataset?
# TODO: **YOUR ANSWER HERE**


# 2b ----------------------------------------------------------------------

#   Using the depth statistics you generated in step 1.3b, plot the data in whichever 
#   way you would like. What is the average read depth across the entire dataset?
# TODO: **YOUR ANSWER HERE**


# 2c ----------------------------------------------------------------------

#   Is there a relationship between missing data and read depth?
# TODO: **YOUR ANSWER HERE**


# 2d ----------------------------------------------------------------------

#   Using the PCA results generated in 1.4d, generate a scatterplot for the first
#   two PC axes (*hint:* use the plink.eigenvec file).

# N.B.: You may have noticed that the sample IDs are duplicated (i.e., the first two
# columns of the data). This is because plink is expecting both family and individual-
# level IDs (i.e., pedigree information). Disregard one of these columns.
# TODO: **YOUR ANSWER HERE**


# 2e ----------------------------------------------------------------------

#   How much variation is explained by PCs 1 and 2?

#   The proportion of variance of each PC axis can be calculated by looking at
#   the eigenvalues associated with each PC (check out the .eigenval file for 
#   these). The % variance of each PC axis is the proportion of each PC axis's
#   relative to the sum of all eigenvalues.

# TODO: **YOUR ANSWER HERE**


# 2f ----------------------------------------------------------------------

#   Is there a relationship between the fixation index (F) and PC1? *hint:*
#   this is the F column from the .het plink file.
# TODO: **YOUR ANSWER HERE**


# 2g ----------------------------------------------------------------------

#   Using skeleton code provided in the R script, generate a visualization of the
#   the admixture results for the LD-pruned dataset (using the Q files).
#		BONUS: Generate a PCA for the LD-pruned dataset. How does it differ from that 
#   of the unpruned dataset?

#   There are many ways to build a structure-style plot, which is really just a 
#   stacked bar plot. The following does so using the tidyverse, but please
#   feel free to do so however you'd like!

#   1. Tidy data such that each row is an observation (i.e., each row only has
#   one individual and one K proportion). The easiest way to do so is with the
#   pivot_longer() function within the tidyr package.
# TODO: **YOUR ANSWER HERE**

#   2. Now, you should be able to build your plot using geom_bar with the 
#   position and stat args set to "stack" and "identity", respectively,
#   filling by cluster.
# TODO: **YOUR ANSWER HERE**


# 2h ----------------------------------------------------------------------

#   Based on what you've observed about the data from all your visualizations, 
#   what do you notice about the major groupings within the PCA (axes 1 and 2)? 
#		Are the groupings along PC1 explained by (a) read depth, (b) missing data, or 
#		(c) a different species having been included in the dataset? What about PC2?
#		What is your evidence for this? Are there other reasons that could explain 
#		the pattern and how would you investigate these? BONUS: Colorize your PCA with
#   the two first PCs based on admixture groupings. Colorize your PCA of the first
#   two PCs based on missing data and/or read depth.
# TODO: **YOUR ANSWER HERE**

