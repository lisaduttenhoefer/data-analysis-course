# Quiz: Correlation
id: correlation

## Q: What is the main difference between Pearson and Spearman correlation?
- [ ] They always return the exact same value
      Pearson = linear relationship on raw values. Spearman = monotonic relationship on ranks.
- [x] Pearson measures the linear relationship using raw values; Spearman uses ranks to measure monotonic relationships
      Correct! Pearson uses raw values (linear relationship), Spearman uses ranks (monotonic relationship).
- [ ] Pearson only works on categorical variables
      Pearson = linear relationship on raw values. Spearman = monotonic relationship on ranks.

## Q: What does `cor(dat$stab.glu, dat$glyhb, method='pearson')` compute?
- [x] The Pearson correlation coefficient between the two variables
      Correct! cor() returns the correlation coefficient itself.
- [ ] The p-value of a t-test comparing the two variables
      cor() returns the correlation coefficient, not a p-value or mean difference.
- [ ] The mean difference between the two variables
      cor() returns the correlation coefficient, not a p-value or mean difference.

## Q: Why is Spearman correlation often more robust to outliers than Pearson?
- [ ] It automatically removes missing values
      Spearman is rank-based — an extreme value only shifts a rank by one position, not by its raw magnitude.
- [x] It is based on ranks rather than raw values, so extreme values shift the ranks only slightly
      Exactly! Ranks compress the effect of extreme values.
- [ ] It only works with normally distributed data
      Spearman is rank-based — an extreme value only shifts a rank by one position, not by its raw magnitude.

# Quiz: Missing Data
id: missing

## Q: Given `rmv.rows <- apply(dat, 1, function(x) sum(is.na(x)))`, what does `i.missing <- which(rmv.rows > 0)` contain?
- [ ] The total number of missing values in the dataset
      rmv.rows > 0 is a logical vector per row; which() turns it into the indices of TRUE rows.
- [x] The row indices of patients that have at least one missing value
      Correct! which() on a logical condition returns the row indices.
- [ ] The column names that contain missing values
      rmv.rows > 0 is a logical vector per row; which() turns it into the indices of TRUE rows.

## Q: Why do we usually handle missing values before computing correlations or running k-means?
- [ ] R cannot store `NA` in a dataframe at all
      R can store NA fine — the issue is that many statistical functions cannot compute with them.
- [x] Functions like `cor()` or `kmeans()` cannot handle `NA`s and will fail or return `NA`
      Right! Functions like cor() or kmeans() propagate or reject NAs.
- [ ] Missing values always mean the whole row was measured incorrectly
      R can store NA fine — the issue is that many statistical functions cannot compute with them.

## Q: What does `dat[-i.missing, ]` do?
- [ ] Keeps only the rows with missing values
      dat[i.missing, ] would KEEP those rows. The minus sign removes them.
- [x] Removes the rows with missing values, keeping everyone else
      Correct! The minus sign excludes those row indices.
- [ ] Removes the columns with missing values
      dat[i.missing, ] would KEEP those rows. The minus sign removes them.

# Quiz: Introduction to Clustering
id: clustering

## Q: What does "unsupervised" mean in unsupervised learning?
- [ ] The analysis needs no data at all
      Unsupervised = no known group labels are used, the method discovers structure itself.
- [x] There are no known group labels — the method finds structure purely from the data itself
      Correct! No labels — the structure is found purely from the data.
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

# Quiz: K-means Clustering
id: kmeans

## Q: In `kmeans(x, centers = k, nstart = 10)`, what does `centers` control?
- [x] The number of clusters requested
      Correct! centers = the number of clusters requested.
- [ ] The number of random restarts
      centers sets k, the number of clusters. nstart controls the number of random restarts.
- [ ] The distance metric used
      centers sets k, the number of clusters. nstart controls the number of random restarts.

## Q: What does the Within Sum of Squares (WSS, `km$tot.withinss`) measure?
- [ ] How spread out the entire dataset is, regardless of clustering
      WSS measures compactness within each cluster, not overall spread or cluster size.
- [x] How compact each cluster is — lower WSS means tighter clusters
      Right! Lower WSS = tighter, more compact clusters.
- [ ] The number of points assigned to each cluster
      WSS measures compactness within each cluster, not overall spread or cluster size.

## Q: Why does WSS always decrease as you increase the number of clusters `k`?
- [ ] Because `kmeans()` recalculates the data randomly each time
      More clusters mean fewer points per cluster, so distances to centroids shrink — down to zero at k = n.
- [x] Because with more clusters, points sit closer to their own centroid — down to zero once every point is its own cluster
      Exactly! With more clusters, points get closer to their own centroid — that is why we look for an "elbow".
- [ ] Because R ignores clusters beyond `k = 5`
      More clusters mean fewer points per cluster, so distances to centroids shrink — down to zero at k = n.

# Quiz: Plenum Recap — Correlation & Clustering Deep Dive
id: plenum

## Q: In the plenum, a single outlier point was added to a strong linear relationship and moved further and further away. What happened to the Pearson and Spearman correlations?
- [ ] Both stayed exactly the same
      Pearson uses raw distances and keeps changing; Spearman only cares about rank order, which stays fixed.
- [x] The Pearson correlation kept changing as the outlier moved further away, while the Spearman correlation stayed constant — because moving the point further doesn't change its rank
      Correct! Ranks stay the same however far the point moves, so Spearman is constant while Pearson keeps drifting.
- [ ] The Spearman correlation kept changing while Pearson stayed constant
      Pearson uses raw distances and keeps changing; Spearman only cares about rank order, which stays fixed.

## Q: The plenum simulated points scattered randomly in a circle (no real cluster structure) and ran k-means with `centers = 2` 25 times with different random initializations. What did this demonstrate?
- [ ] K-means always converges to the exact same clustering, regardless of the data
      The 25 different-looking clusterings from the same data show that initialization matters a lot when there is no clear structure.
- [x] When there is no real cluster structure in the data, the k-means result can differ a lot depending on the random initialization
      Exactly! Without real structure, k-means results become unstable and depend heavily on the starting points.
- [ ] K-means cannot be run more than once on the same dataset
      The 25 different-looking clusterings from the same data show that initialization matters a lot when there is no clear structure.

## Q: The plenum compared standard k-means (Euclidean distance) with a custom "k-medians" implementation using Manhattan distance on the same 6 points. What does this comparison illustrate?
- [ ] Manhattan and Euclidean distance always produce identical clusters
      The point of the demo is that Euclidean/mean-based and Manhattan/median-based clustering can disagree on the same data.
- [x] The choice of distance metric (and center type: mean vs. median) can change which points end up in which cluster
      Correct! Different distance metrics (and mean vs. median centers) can assign points to different clusters.
- [ ] Manhattan distance can only be used for time-series data
      The point of the demo is that Euclidean/mean-based and Manhattan/median-based clustering can disagree on the same data.
