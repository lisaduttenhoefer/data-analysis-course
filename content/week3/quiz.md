# Quiz: Correlation
id: correlation

## Q: What is the main difference between Pearson and Spearman correlation?
lang: both
- [ ] They always return the exact same value
      Pearson = linear relationship on raw values. Spearman = monotonic relationship on ranks.
- [x] Pearson measures the linear relationship using raw values; Spearman uses ranks to measure monotonic relationships
      Correct! Pearson uses raw values (linear relationship), Spearman uses ranks (monotonic relationship).
- [ ] Pearson only works on categorical variables
      Pearson = linear relationship on raw values. Spearman = monotonic relationship on ranks.

## Q: What does `cor(dat$stab.glu, dat$glyhb, method='pearson')` compute?
lang: r
- [x] The Pearson correlation coefficient between the two variables
      Correct! cor() returns the correlation coefficient itself.
- [ ] The p-value of a t-test comparing the two variables
      cor() returns the correlation coefficient, not a p-value or mean difference.
- [ ] The mean difference between the two variables
      cor() returns the correlation coefficient, not a p-value or mean difference.

## Q: How do you compute the Pearson correlation between two columns in a pandas DataFrame `dat`?
lang: python
- [x] `dat["stab_glu"].corr(dat["glyhb"], method="pearson")`
      Correct! Series.corr() defaults to Pearson correlation.
- [ ] `dat[["stab_glu", "glyhb"]].mean()`
      .mean() calculates the arithmetic average, not the correlation coefficient.
- [ ] `scipy.stats.ttest_ind(dat["stab_glu"], dat["glyhb"])`
      ttest_ind computes a two-sample t-test, not a correlation coefficient.

## Q: Why is Spearman correlation often more robust to outliers than Pearson?
lang: both
- [ ] It automatically removes missing values
      Spearman is rank-based — an extreme value only shifts a rank by one position, not by its raw magnitude.
- [x] It is based on ranks rather than raw values, so extreme values shift the ranks only slightly
      Exactly! Ranks compress the effect of extreme values.
- [ ] It only works with normally distributed data
      Spearman is rank-based — an extreme value only shifts a rank by one position, not by its raw magnitude.

## Q: What does Anscombe's Quartet illustrate about correlation and regression?
lang: both
- [ ] Datasets with identical scatter plots can have completely different correlation coefficients
      Anscombe's Quartet demonstrates the reverse: identical summary statistics can describe wildly different shapes.
- [x] Datasets with virtually identical correlation coefficients ($r \approx 0.82$) can have completely different graphical structures
      Correct! It highlights why visualizing data is crucial: four distinct patterns (linear, curved, outlier-driven) share the same $r$.
- [ ] Non-linear relationships always result in a Pearson correlation of exactly zero
      Non-linear curves can still yield substantial non-zero Pearson correlation values.

## Q: What is the fundamental difference between covariance and Pearson correlation?
lang: both
- [ ] Covariance is bounded between -1 and +1, whereas correlation is unbounded
      Correlation is normalized between -1 and +1; covariance depends on raw data units.
- [x] Correlation is scale-invariant (dimensionless), while covariance depends on the measurement units of both variables
      Correct! Correlation standardizes covariance by dividing by the product of both standard deviations ($s_x s_y$).
- [ ] Covariance measures monotonic relationships, whereas correlation measures linear relationships
      Both standard covariance and Pearson correlation quantify linear association.

# Quiz: Missing Data
id: missing

## Q: Given `rmv.rows <- apply(dat, 1, function(x) sum(is.na(x)))`, what does `i.missing <- which(rmv.rows > 0)` contain?
lang: r
- [ ] The total number of missing values in the dataset
      rmv.rows > 0 is a logical vector per row; which() turns it into the indices of TRUE rows.
- [x] The row indices of patients that have at least one missing value
      Correct! which() on a logical condition returns the row indices.
- [ ] The column names that contain missing values
      rmv.rows > 0 is a logical vector per row; which() turns it into the indices of TRUE rows.

## Q: Given `missing_mask = dat.isna().any(axis=1)`, what does `dat[missing_mask].index` contain?
lang: python
- [ ] The total count of all missing cells across the DataFrame
      isna().sum().sum() counts total missing entries; .any(axis=1) finds rows with at least one NA.
- [x] The row indices of samples that contain at least one missing value
      Correct! .any(axis=1) flags rows containing any True, and .index retrieves their identifiers.
- [ ] The names of columns containing missing entries
      dat.columns[dat.isna().any(axis=0)] gives column names with missing entries.

## Q: Why do we usually handle missing values before computing correlations or running k-means?
lang: both
- [ ] R and Python cannot store missing values in a data matrix at all
      Both languages store missing indicators (NA / NaN), but mathematical algorithms require complete values.
- [x] Functions like `cor()` or `kmeans()` cannot compute distances with missing values and will fail or propagate NAs
      Right! Pairwise distance calculations and coordinate means require valid numbers for every dimension.
- [ ] Missing values always indicate incorrect experimental measurements
      Missing values can occur purely by design or technical dropouts; they are not inherently errors.

## Q: What does `dat[-i.missing, ]` do?
lang: r
- [ ] Keeps only the rows with missing values
      dat[i.missing, ] would KEEP those rows. The minus sign removes them.
- [x] Removes the rows with missing values, keeping everyone else
      Correct! The minus sign excludes those row indices.
- [ ] Removes the columns with missing values
      dat[i.missing, ] would KEEP those rows. The minus sign removes them.

## Q: How do you drop all rows containing any `NaN` values from a pandas DataFrame `dat`?
lang: python
- [ ] `dat.dropna(axis=1)`
      axis=1 drops columns containing missing values instead of rows.
- [x] `dat.dropna(axis=0)` (or `dat.dropna()`)
      Correct! dropna() defaults to axis=0 ('index'), which removes rows containing missing values.
- [ ] `dat.remove_na()`
      DataFrames do not have a remove_na method; use dropna().

## Q: Why is a `log(x + 1)` transformation frequently applied to high-throughput sequencing data before clustering?
lang: both
- [ ] To force all negative count values to become positive
      Sequencing read counts are non-negative integers; counts cannot be negative.
- [x] To compress extreme positive skewness and prevent a few highly expressed genes from dominating distance metrics
      Correct! Gene expression data is strongly right-skewed; log transformation stabilizes variance and compresses extremes.
- [ ] Because distance metrics can only be computed on logarithmic scales
      Distance metrics work on any scale, but unlogged skewed variables skew Euclidean distances entirely toward extreme values.

# Quiz: Distance Metrics
id: distances

## Q: What is the Euclidean distance between points $(2, 4)$ and $(9, 7)$?
lang: both
- [ ] $10$
      10 is the Manhattan distance: |9-2| + |7-4| = 7 + 3.
- [x] $\sqrt{58} \approx 7.62$
      Correct! By the Pythagorean theorem: $\sqrt{(9-2)^2 + (7-4)^2} = \sqrt{7^2 + 3^2} = \sqrt{49 + 9} = \sqrt{58}$[cite: 3].
- [ ] $58$
      58 is the squared Euclidean distance; remember to take the square root.
- [ ] $7$
      7 is the difference along the x-axis alone.

## Q: How is the Manhattan (city-block) distance computed between two points $x$ and $y$ across $n$ variables?
lang: both
- [ ] By taking the square root of the sum of squared differences: $\sqrt{\sum (x_i - y_i)^2}$
      That is the formula for Euclidean distance.
- [x] By summing the absolute differences across all dimensions: $\sum |x_i - y_i|$
      Correct! Manhattan distance sums absolute coordinate distances without squaring[cite: 3].
- [ ] By finding the maximum difference in any single coordinate: $\max |x_i - y_i|$
      That is the Maximum (Chebyshev) distance[cite: 3].

## Q: How is correlation distance $d_{\text{corr}}(x, y)$ defined in terms of the Pearson correlation coefficient $r$?
lang: both
- [ ] $d_{\text{corr}} = 1 - r^2$
      $1 - r^2$ is related to unexplained variance in regression, not standard correlation distance.
- [x] $d_{\text{corr}} = \frac{1}{2}(1 - r)$
      Correct! When $r = 1$, distance is $0$; when $r = -1$, distance reaches maximum $1$[cite: 3].
- [ ] $d_{\text{corr}} = \frac{1}{r}$
      Division by $r$ would diverge to infinity when variables are uncorrelated ($r = 0$).

## Q: Which function in R computes a pairwise distance matrix between rows of a numerical matrix?
lang: r
- [ ] `pairwise.cor()`
      Use cor() for correlations or dist() for spatial distances.
- [x] `dist()`
      Correct! `dist(x, method = "euclidean")` computes pairwise distances between rows.
- [ ] `diff()`
      diff() computes lagged differences between adjacent elements in a vector.

## Q: Which function in SciPy computes pairwise distances between observations in an $m \times n$ array?
lang: python
- [ ] `numpy.linalg.norm()`
      norm() computes vector or matrix norms, not full pairwise distance matrices.
- [x] `scipy.spatial.distance.pdist()`
      Correct! pdist() calculates pairwise distances between all row vectors.
- [ ] `pandas.DataFrame.distance()`
      DataFrames do not provide a built-in .distance() method.

# Quiz: Introduction to Clustering
id: clustering

## Q: What does "unsupervised" mean in unsupervised learning?
lang: both
- [ ] The analysis needs no data at all
      Unsupervised = no known group labels are used, the method discovers structure itself[cite: 3].
- [x] There are no known group labels — the method finds structure purely from the data itself
      Correct! No labels — the structure is found purely from the data[cite: 3].
- [ ] A human manually assigns every observation to a group first
      Unsupervised = no known group labels are used, the method discovers structure itself[cite: 3].

## Q: What is the general goal of clustering?
lang: both
- [ ] Predict a continuous outcome variable from other variables
      Clustering is about grouping similar observations — it is not a prediction method.
- [x] Group similar observations together while separating the dissimilar ones
      Exactly! Group similar observations, separate dissimilar ones[cite: 3].
- [ ] Remove all missing values from a dataset
      Clustering is about grouping similar observations — it is not a prediction method.

## Q: In gene expression matrices where rows are genes and columns are patients, why do we transpose `X` before clustering patients?
lang: r
- [ ] Because R functions require matrices to have more columns than rows
      Clustering algorithms group the rows; matrix dimension ordering is arbitrary.
- [x] Because clustering functions cluster the rows by default; transposing puts patients into rows
      Correct! Clustering algorithms operate along row vectors, so patients must be rows.
- [ ] Because transposing standardizes the variance across genes
      Transposition only flips axes; scaling requires scale() or normalize().

## Q: If gene expression DataFrame `df` has genes as rows and samples as columns, how do you cluster samples in scikit-learn?
lang: python
- [ ] Pass `df` directly to `KMeans().fit(df)`
      Passing df directly would cluster genes (rows), not samples.
- [x] Transpose first with `KMeans().fit(df.T)`
      Correct! Scikit-learn models treat rows as samples/observations and columns as features.
- [ ] Invert values using `1 / df`
      Inverting numbers does not transpose matrix axes.

# Quiz: K-means Clustering
id: kmeans

## Q: In `kmeans(x, centers = k, nstart = 10)`, what does `centers` control?
lang: r
- [x] The number of clusters requested
      Correct! centers = the number of clusters requested.
- [ ] The number of random restarts
      centers sets k, the number of clusters. nstart controls the number of random restarts.
- [ ] The distance metric used
      centers sets k, the number of clusters. nstart controls the number of random restarts.

## Q: Which parameter in scikit-learn's `KMeans(n_clusters=k, n_init=10)` sets the number of clusters?
lang: python
- [ ] `n_init`
      n_init sets the number of random centroid initializations.
- [x] `n_clusters`
      Correct! `n_clusters` defines $k$, the number of clusters and centroids to generate.
- [ ] `k_neighbors`
      k_neighbors is used in k-nearest neighbors (KNN), not k-means.

## Q: What are the two alternating steps executed in the standard k-means algorithm?
lang: both
- [ ] Splitting clusters hierarchically and pruning leaves
      That describes hierarchical agglomerative/divisive clustering.
- [x] Assigning each point to its nearest centroid, then recomputing centroids as the center of gravity of each cluster
      Correct! K-means alternates between cluster assignment and centroid recalculation until convergence[cite: 3].
- [ ] Maximizing covariance and calculating eigenvectors
      That describes Principal Component Analysis (PCA).

## Q: What does the Within Sum of Squares (WSS, `km$tot.withinss`) measure?
lang: both
- [ ] How spread out the entire dataset is, regardless of clustering
      WSS measures compactness within each cluster, not overall spread or cluster size[cite: 3].
- [x] How compact each cluster is — lower WSS means tighter clusters
      Right! Lower WSS = tighter, more compact clusters[cite: 3].
- [ ] The number of points assigned to each cluster
      WSS measures compactness within each cluster, not overall spread or cluster size[cite: 3].

## Q: Why does WSS always decrease as you increase the number of clusters `k`?
lang: both
- [ ] Because `kmeans()` recalculates the data randomly each time
      More clusters mean fewer points per cluster, so distances to centroids shrink — down to zero at k = n[cite: 3].
- [x] Because with more clusters, points sit closer to their own centroid — down to zero once every point is its own cluster
      Exactly! With more clusters, points get closer to their own centroid — that is why we look for an "elbow"[cite: 3].
- [ ] Because clustering algorithms ignore clusters beyond `k = 5`
      More clusters mean fewer points per cluster, so distances to centroids shrink — down to zero at k = n[cite: 3].

## Q: How do you identify the optimal number of clusters using the Elbow Method?
lang: both
- [ ] Find the value of $k$ where WSS drops to exactly 0
      WSS only reaches 0 when $k = N$, which overfits completely by making every point its own cluster[cite: 3].
- [x] Look for the "elbow" point where adding more clusters no longer yields large reductions in WSS
      Correct! The bend or kink marks the point of diminishing returns[cite: 3].
- [ ] Select the value of $k$ with the largest between-cluster variance increase
      The elbow specifically assesses the deceleration of within-cluster sum of squares decreases[cite: 3].

# Quiz: Cluster Validation and Silhouette
id: cluster-validation

## Q: How is the silhouette score $s_i$ of a single data point calculated?
lang: both
- [ ] $s_i = \frac{a_i - b_i}{a_i + b_i}$
      The numerator is $b_i - a_i$ and the denominator uses the maximum.
- [x] $s_i = \frac{b_i - a_i}{\max(a_i, b_i)}$
      Correct! $a_i$ is mean intra-cluster distance, and $b_i$ is mean distance to the nearest neighboring cluster[cite: 3].
- [ ] $s_i = 1 - \frac{\text{WSS}}{\text{TSS}}$
      That relates to the variance explained ratio, not silhouette coefficient.

## Q: What does a negative silhouette width ($s_i < 0$) indicate for a given observation?
lang: both
- [ ] The observation is isolated and forms its own separate cluster
      Single-element clusters are assigned a silhouette score of 0 by convention[cite: 3].
- [x] The observation is on average closer to members of a neighboring cluster than to its assigned cluster (likely misclassified)
      Correct! $b_i < a_i$ produces a negative value, signaling that the point sits closer to a different cluster[cite: 3].
- [ ] The observation has missing values that were not imputed
      Silhouette computation requires complete distance matrices without missing values.

## Q: When comparing clustering solutions across multiple values of $k$, which silhouette result indicates the best choice?
lang: both
- [ ] The clustering solution with the lowest total silhouette width
      Higher silhouette width indicates better cohesion and separation[cite: 3].
- [x] The clustering solution with the highest average silhouette width
      Correct! Higher average silhouette width reflects tighter, better-separated cluster configurations[cite: 3].
- [ ] The solution where all silhouette values equal zero
      A silhouette of zero represents points lying directly on cluster boundaries[cite: 3].

# Quiz: Plenum Recap — Correlation & Clustering Deep Dive
id: plenum

## Q: In the plenum, a single outlier point was added to a strong linear relationship and moved further and further away. What happened to the Pearson and Spearman correlations?
lang: both
- [ ] Both stayed exactly the same
      Pearson uses raw distances and keeps changing; Spearman only cares about rank order, which stays fixed.
- [x] The Pearson correlation kept changing as the outlier moved further away, while the Spearman correlation stayed constant — because moving the point further doesn't change its rank
      Correct! Ranks stay the same however far the point moves, so Spearman is constant while Pearson keeps drifting.
- [ ] The Spearman correlation kept changing while Pearson stayed constant
      Pearson uses raw distances and keeps changing; Spearman only cares about rank order, which stays fixed.

## Q: The plenum simulated points scattered randomly in a circle (no real cluster structure) and ran k-means with `centers = 2` 25 times with different random initializations. What did this demonstrate?
lang: both
- [ ] K-means always converges to the exact same clustering, regardless of the data
      The 25 different-looking clusterings from the same data show that initialization matters a lot when there is no clear structure.
- [x] When there is no real cluster structure in the data, the k-means result can differ a lot depending on the random initialization
      Exactly! Without real structure, k-means results become unstable and depend heavily on the starting points.
- [ ] K-means cannot be run more than once on the same dataset
      The 25 different-looking clusterings from the same data show that initialization matters a lot when there is no clear structure.

## Q: The plenum compared standard k-means (Euclidean distance) with a custom "k-medians" implementation using Manhattan distance on the same 6 points. What does this comparison illustrate?
lang: both
- [ ] Manhattan and Euclidean distance always produce identical clusters
      The point of the demo is that Euclidean/mean-based and Manhattan/median-based clustering can disagree on the same data.
- [x] The choice of distance metric (and center type: mean vs. median) can change which points end up in which cluster
      Correct! Different distance metrics (and mean vs. median centers) can assign points to different clusters.
- [ ] Manhattan distance can only be used for time-series data
      The point of the demo is that Euclidean/mean-based and Manhattan/median-based clustering can disagree on the same data.      Correct! No labels — the structure is found purely from the data.
- [ ] A human manually assigns every observation to a group first
      Unsupervised = no known group labels are used, the method discovers structure itself.

## Q: What is the general goal of clustering?
- [ ] Predict a continuous outcome variable from other variables
      Clustering is about grouping similar observations — it is not a prediction method.
- [x] Group similar observations together while separating the dissimilar ones
      Exactly! Group similar observations, separate dissimilar ones.
- [ ] Remove all missing values from a dataset
      Clustering is about grouping similar observations — it is not a prediction method.

## Q: In the gene expression example (`brca.exp`, genes × samples), what are we clustering when we run `kmeans(x = t(brca.exp), ...)`?
- [ ] The genes (rows)
      brca.exp has genes as rows and samples as columns — t() flips it so kmeans clusters the samples.
- [x] The samples/patients (columns) — that's why the matrix is transposed with `t()`
      Correct! We transpose with t() so that samples become the rows being clustered.
- [ ] The p-values of a statistical test
      brca.exp has genes as rows and samples as columns — t() flips it so kmeans clusters the samples.
