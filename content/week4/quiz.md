# Quiz: Hierarchical Clustering
id: hclust

## Q: What is the key difference between k-means and hierarchical clustering?
lang: both
- [ ] They are mathematically identical, just different function names
      K-means needs the number of clusters upfront. Hierarchical clustering builds a full dendrogram instead.
- [x] K-means requires the number of clusters upfront; hierarchical clustering builds a dendrogram you can cut at any level afterwards
      Correct! Hierarchical clustering gives you a dendrogram to cut at any level; k-means needs k in advance.
- [ ] Hierarchical clustering can only be used on 2 variables at a time
      K-means needs the number of clusters upfront. Hierarchical clustering builds a full dendrogram instead.

## Q: What is the difference between agglomerative and divisive hierarchical clustering?
lang: both
- [ ] Agglomerative is supervised, whereas divisive is unsupervised
      Both agglomerative and divisive clustering are unsupervised methods.
- [x] Agglomerative is a bottom-up approach merging closest elements, while divisive is top-down splitting clusters iteratively
      Correct! Agglomerative starts with individual points and merges them; divisive starts with one big cluster and splits it.
- [ ] Agglomerative only works with Euclidean distance, divisive only with Manhattan distance
      Both approaches can use any valid distance or dissimilarity metric.

## Q: What property must a distance matrix always have, e.g. for use in `pheatmap()`?
lang: both
- [x] It must be symmetrical — the distance from A to B equals the distance from B to A
      Correct! A distance matrix must be symmetrical: d(A,B) = d(B,A).
- [ ] It must only contain values between 0 and 1
      A valid distance matrix can have any non-negative values; it does not need to be bounded by 1.
- [ ] It must be based on Euclidean distance only
      Any valid metric (Manhattan, maximum, correlation distance) can form a distance matrix.

## Q: Which function performs hierarchical agglomerative clustering on a distance matrix in R?
lang: r
- [ ] `kmeans()`
      kmeans() performs partitioning clustering, not hierarchical tree construction.
- [x] `hclust()`
      Correct! hclust() takes a distance matrix (from dist()) and builds the hierarchical tree.
- [ ] `cutree()`
      cutree() cuts an existing dendrogram into discrete clusters, but does not build the tree itself.

## Q: Which function in SciPy generates the hierarchical clustering linkage matrix from pairwise distances?
lang: python
- [ ] `sklearn.cluster.KMeans`
      KMeans computes flat partitioning, not a hierarchical tree.
- [x] `scipy.cluster.hierarchy.linkage()`
      Correct! linkage() performs agglomerative clustering and returns the cluster hierarchy matrix.
- [ ] `scipy.spatial.distance.pdist()`
      pdist() computes pairwise distances, which are then passed into linkage().

## Q: Why do we often select only the top 25% most variable genes before clustering samples?
lang: both
- [ ] To reduce file size only, it has no effect on the analysis
      It is about signal quality: high-variance genes actually differ between samples and are more informative for clustering.
- [x] Low-variance genes barely differ between samples, so they add mostly noise rather than useful signal
      Exactly! Low-variance genes look the same across samples and add mostly noise.
- [ ] Clustering heatmaps cannot handle more than 100 rows
      Algorithms can handle many rows, but uninformative noise obscures genuine biological clustering.

# Quiz: Linkage Methods
id: linkage

## Q: In hierarchical clustering, how does Single Linkage define the distance between two clusters?
lang: both
- [x] As the minimal pairwise distance between any single element of cluster A and cluster B
      Correct! Single linkage takes the shortest distance between any pair: min d(a_i, b_j).
- [ ] As the maximal pairwise distance between any element of cluster A and cluster B
      Maximal distance defines Complete Linkage.
- [ ] As the average of all pairwise distances between elements
      The average across all pairs defines Average Linkage (UPGMA).

## Q: How does Complete Linkage define the distance between two clusters A and B?
lang: both
- [ ] The distance between their centers of gravity (centroids)
      That defines Centroid Linkage.
- [x] The maximal pairwise distance between any element of A and any element of B
      Correct! Complete linkage considers the furthest pair: max d(a_i, b_j).
- [ ] The minimal pairwise distance between any element of A and any element of B
      Minimal distance defines Single Linkage.

## Q: What does the height of a branch in a dendrogram represent?
lang: both
- [ ] The number of observations contained inside that subtree
      Branch height reflects distance, not the count of leaf elements.
- [x] The dissimilarity/distance value at which the two subclusters were merged
      Correct! The vertical axis (height) shows the distance between the clusters at the moment of merging.
- [ ] The statistical significance (p-value) of the cluster split
      Standard dendrogram heights show distance/dissimilarity, not statistical p-values.

## Q: How do you cut an `hclust` tree object `hc` to obtain exactly 3 discrete clusters in R?
lang: r
- [ ] `split(hc, 3)`
      split() partitions vectors/dataframes by factors, not hclust objects.
- [x] `cutree(hc, k = 3)`
      Correct! cutree(hc, k = 3) cuts the dendrogram horizontally to yield k clusters.
- [ ] `hc$centers <- 3`
      centers is a parameter of kmeans(), not an attribute of hclust.

## Q: How do you cut a hierarchical linkage matrix `Z` to form 3 flat clusters in SciPy?
lang: python
- [ ] `Z.cut(3)`
      Linkage matrices are NumPy arrays and do not possess a .cut() method.
- [x] `scipy.cluster.hierarchy.fcluster(Z, t=3, criterion='maxclust')`
      Correct! fcluster() extracts flat clusters from the linkage matrix using either distance threshold or cluster count.
- [ ] `sklearn.cluster.cut_tree(Z, 3)`
      scipy.cluster.hierarchy.fcluster is the standard function for cutting trees in Python.

# Quiz: Principal Component Analysis (PCA)
id: pca

## Q: What is the main goal of PCA?
lang: both
- [ ] To remove every correlated variable from the dataset
      PCA finds new uncorrelated components that summarize the variance in fewer dimensions.
- [x] To reduce dimensionality by finding new, uncorrelated variables (principal components) that capture as much variance as possible
      Correct! PCA reduces dimensionality while keeping as much variance as possible.
- [ ] To impute missing values automatically
      PCA finds new uncorrelated components that summarize the variance in fewer dimensions.

## Q: In `prcomp(bc_data, center = TRUE, scale = TRUE)`, why do we scale the data?
lang: r
- [ ] Scaling is mandatory syntax with no statistical purpose
      Without scaling, a variable with a huge numeric range would dominate the PCA regardless of its actual importance.
- [x] So variables measured on larger numeric scales don't dominate the PCA just because of their range
      Right! Scaling puts all variables on a comparable footing (unit variance).
- [ ] So the data gets converted to ranks, like Spearman correlation
      Without scaling, a variable with a huge numeric range would dominate the PCA regardless of its actual importance.

## Q: Why is `StandardScaler()` commonly applied before running `PCA()` in scikit-learn?
lang: python
- [ ] PCA throws an exception if variables have different numeric ranges
      PCA executes mathematically, but features with wide ranges distort the principal axes.
- [x] To prevent features with large numeric scales from dominating the principal components purely due to unit magnitude
      Correct! Standardization (mean = 0, std = 1) ensures all variables contribute equally to variance discovery.
- [ ] To force all negative data points to become positive numbers
      StandardScaler centers data at zero, meaning approximately half the values become negative.

## Q: Mathematically, how are principal components obtained from the correlation or covariance matrix?
lang: both
- [ ] By solving a system of linear regressions for every pair of columns
      PCA relies on matrix decomposition rather than pairwise regression lines.
- [x] By matrix diagonalization: finding the eigenvectors (directions) and eigenvalues (variance explained)
      Correct! The eigenvectors of the covariance/correlation matrix give the loading directions, and eigenvalues give the variance.
- [ ] By computing pairwise Manhattan distances between observations
      PCA is based on linear transformations and variance maximization, not Manhattan distance.

## Q: What does a scree plot show?
lang: both
- [ ] The pairwise correlation between all original variables
      A scree plot shows variance explained per component, not correlations or cluster membership.
- [x] How much variance each principal component explains, usually shown in decreasing order
      Correct! The scree plot ranks components by how much variance they explain.
- [ ] The cluster assignment of each patient
      A scree plot shows variance explained per component, not correlations or cluster membership.

# Quiz: Selecting Components & Biplots
id: pca-selection

## Q: According to the Kaiser criterion, which principal components should be retained?
lang: both
- [ ] Only the first two components (PC1 and PC2)
      The Kaiser rule uses a statistical cutoff based on eigenvalues rather than an arbitrary count.
- [x] Components with an eigenvalue greater than the average eigenvalue (or > 1 for standardized data)
      Correct! Kaiser's rule retains components that explain more variance than an average original variable.
- [ ] Components that have negative loadings across all variables
      Sign of loadings indicates direction along an axis, not importance.

## Q: What do the arrows represent in a PCA biplot?
lang: both
- [ ] The trajectory of patients over time
      Biplots display static features and samples, not longitudinal trajectories.
- [x] The original variables, showing how strongly and in which direction each variable loads onto the plotted PCs
      Correct! Arrow direction and length show the contribution (loadings) of each original variable to the principal axes.
- [ ] The residuals of a linear regression fit
      Arrows in a PCA biplot represent variable loadings, not regression residuals.

## Q: If two variable arrows point in almost the exact same direction in a PCA biplot, what does this suggest?
lang: both
- [ ] The two variables are completely uncorrelated ($r \approx 0$)
      Uncorrelated variables have vectors that are orthogonal ($90^\circ$ angle).
- [x] The two variables have a strong positive correlation
      Correct! Arrows pointing in the same direction reflect variables that vary together and contribute similarly to the PCs.
- [ ] One of the variables contains corrupted data
      Close alignment is a sign of correlation and shared information, not corrupt data.

# Quiz: Putting it together
id: together

## Q: In the PCA loadings (`pca_result$rotation`), what does a large positive value for a variable on PC1 mean?
lang: r
- [ ] That variable has too many missing values
      Loadings describe how strongly (and in which direction) each original variable feeds into a principal component.
- [x] That variable contributes strongly and positively to PC1
      Correct! Large positive loadings mean a strong positive contribution to that component.
- [ ] That variable is uncorrelated with everything else
      Loadings describe how strongly (and in which direction) each original variable feeds into a principal component.

## Q: In scikit-learn's `pca.components_`, what does a high positive coefficient for a feature in component 0 indicate?
lang: python
- [ ] The feature has near-zero variance
      Features with near-zero variance have near-zero loadings across components.
- [x] The feature contributes strongly and positively to the first principal component
      Correct! The components_ array contains the eigenvector loadings for each feature.
- [ ] The feature was excluded from the analysis
      Excluded features do not appear in the components_ array.

## Q: How can PCA be combined with k-means clustering?
lang: r
- [ ] They cannot be combined
      PCA and k-means combine nicely — cluster on the first few principal components instead of the raw variables.
- [x] Run k-means on the first few principal components (`pca$x`) instead of the original variables
      Exactly! Running kmeans() on pca$x clusters in the reduced, decorrelated space.
- [ ] PCA replaces the need for clustering entirely
      PCA and k-means combine nicely — cluster on the first few principal components instead of the raw variables.

## Q: How do you cluster data using K-Means in a reduced PCA space in Python?
lang: python
- [ ] `KMeans().fit(pca.components_)`
      pca.components_ contains feature loadings/eigenvectors, not transformed sample coordinates.
- [x] `KMeans().fit(pca.transform(X)[:, :n_components])`
      Correct! Transform the samples into PC space and run KMeans on the leading coordinates.
- [ ] `KMeans().fit(pca.explained_variance_ratio_)`
      explained_variance_ratio_ is a 1D summary of variance percentages, not sample coordinates.

## Q: What is one key difference between what hierarchical clustering and PCA each produce?
lang: both
- [x] Hierarchical clustering produces a dendrogram/tree of similarity; PCA produces new continuous axes (components) that summarize variance
      Correct! One gives a similarity tree, the other gives new variance-maximizing axes.
- [ ] They always produce exactly the same plot
      Hierarchical clustering outputs a dendrogram; PCA outputs continuous components — different kinds of output entirely.
- [ ] PCA only works on categorical data, clustering does not
      Hierarchical clustering outputs a dendrogram; PCA outputs continuous components — different kinds of output entirely.
