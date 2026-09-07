# Quiz: Hierarchical Clustering
id: hclust

## Q: What is the key difference between k-means and hierarchical clustering?
- [ ] They are mathematically identical, just different function names
      K-means needs the number of clusters upfront. Hierarchical clustering builds a full dendrogram instead.
- [x] K-means requires the number of clusters upfront; hierarchical clustering builds a dendrogram you can cut at any level afterwards
      Correct! Hierarchical clustering gives you a dendrogram to cut at any level; k-means needs k in advance.
- [ ] Hierarchical clustering can only be used on 2 variables at a time
      K-means needs the number of clusters upfront. Hierarchical clustering builds a full dendrogram instead.

## Q: What property must a distance matrix always have, e.g. for use in `pheatmap()`?
- [x] It must be symmetrical — the distance from A to B equals the distance from B to A
      Correct! A distance matrix must be symmetrical.
- [ ] It must only contain values between 0 and 1
      A valid distance matrix must be symmetrical — distance(A,B) = distance(B,A).
- [ ] It must be based on Euclidean distance only
      A valid distance matrix must be symmetrical — distance(A,B) = distance(B,A).

## Q: Why do we often select only the top 25% most variable genes before clustering samples?
- [ ] To reduce file size only, it has no effect on the analysis
      It is about signal quality: high-variance genes actually differ between samples and are more informative for clustering.
- [x] Low-variance genes barely differ between samples, so they add mostly noise rather than useful signal
      Exactly! Low-variance genes look the same across samples and add mostly noise.
- [ ] `pheatmap()` cannot handle more than 100 rows
      It is about signal quality: high-variance genes actually differ between samples and are more informative for clustering.

# Quiz: Principal Component Analysis (PCA)
id: pca

## Q: What is the main goal of PCA?
- [ ] To remove every correlated variable from the dataset
      PCA finds new uncorrelated components that summarize the variance in fewer dimensions.
- [x] To reduce dimensionality by finding new, uncorrelated variables (principal components) that capture as much variance as possible
      Correct! PCA reduces dimensionality while keeping as much variance as possible.
- [ ] To impute missing values automatically
      PCA finds new uncorrelated components that summarize the variance in fewer dimensions.

## Q: In `prcomp(bc_data, center = TRUE, scale = TRUE)`, why do we scale the data?
- [ ] Scaling is mandatory syntax with no statistical purpose
      Without scaling, a variable with a huge numeric range would dominate the PCA regardless of its actual importance.
- [x] So variables measured on larger numeric scales don't dominate the PCA just because of their range
      Right! Scaling puts all variables on a comparable footing.
- [ ] So the data gets converted to ranks, like Spearman correlation
      Without scaling, a variable with a huge numeric range would dominate the PCA regardless of its actual importance.

## Q: What does a scree plot show?
- [ ] The pairwise correlation between all original variables
      A scree plot shows variance explained per component, not correlations or cluster membership.
- [x] How much variance each principal component explains, usually shown in decreasing order
      Correct! The scree plot ranks components by how much variance they explain.
- [ ] The cluster assignment of each patient
      A scree plot shows variance explained per component, not correlations or cluster membership.

# Quiz: Putting it together
id: together

## Q: In the PCA loadings (`pca_result$rotation`), what does a large positive value for a variable on PC1 mean?
- [ ] That variable has too many missing values
      Loadings describe how strongly (and in which direction) each original variable feeds into a principal component.
- [x] That variable contributes strongly and positively to PC1
      Correct! Large positive loadings mean a strong positive contribution to that component.
- [ ] That variable is uncorrelated with everything else
      Loadings describe how strongly (and in which direction) each original variable feeds into a principal component.

## Q: How can PCA be combined with k-means clustering?
- [ ] They cannot be combined
      PCA and k-means combine nicely — cluster on the first few principal components instead of the raw variables.
- [x] Run k-means on the first few principal components (`pca$x`) instead of the original variables
      Exactly! Running kmeans() on pca$x clusters in the reduced, decorrelated space.
- [ ] PCA replaces the need for clustering entirely
      PCA and k-means combine nicely — cluster on the first few principal components instead of the raw variables.

## Q: What is one key difference between what hierarchical clustering and PCA each produce?
- [x] Hierarchical clustering produces a dendrogram/tree of similarity; PCA produces new continuous axes (components) that summarize variance
      Correct! One gives a similarity tree, the other gives new variance-maximizing axes.
- [ ] They always produce exactly the same plot
      Hierarchical clustering outputs a dendrogram; PCA outputs continuous components — different kinds of output entirely.
- [ ] PCA only works on categorical data, clustering does not
      Hierarchical clustering outputs a dendrogram; PCA outputs continuous components — different kinds of output entirely.
