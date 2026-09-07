# Quiz: Loading and Exploring
id: loading

## Q: What does `dim(dat)` return for a dataframe with 400 rows and 17 columns?
lang: r
- [ ] `c(17, 400)`
      Not quite. dim() returns c(rows, cols). 400 patients, 17 variables → c(400, 17).
- [x] `c(400, 17)`
      Correct! dim() always returns (rows, columns) — rows first!
- [ ] `400`
      Not quite. dim() returns c(rows, cols). 400 patients, 17 variables → c(400, 17).
- [ ] `6800`
      Not quite. dim() returns c(rows, cols). 400 patients, 17 variables → c(400, 17).

## Q: What does `dat.shape` return for a pandas DataFrame with 400 rows and 17 columns?
lang: python
- [ ] `(17, 400)`
      In Python/pandas, shape returns (rows, columns).
- [x] `(400, 17)`
      Correct! .shape returns a tuple formatted as (n_rows, n_columns).
- [ ] `400`
      len(dat) would return 400, but .shape returns both dimensions.
- [ ] `6800`
      6800 is the total element count (dat.size), not the shape.

## Q: What does `head(dat)` show by default?
lang: r
- [ ] The last 6 rows
      head() shows the beginning of the data — default is 6 rows.
- [x] The first 6 rows
      Exactly! head(dat) shows the first 6 rows. Use head(dat, n) for a custom number.
- [ ] A summary of all columns
      head() shows the beginning of the data — default is 6 rows.
- [ ] The first row only
      head() shows the beginning of the data — default is 6 rows.

## Q: What does `dat.head()` display by default in pandas?
lang: python
- [ ] The last 5 rows
      tail() displays the bottom rows; head() displays the top rows.
- [x] The first 5 rows
      Correct! In pandas, dat.head() defaults to 5 rows (unlike R's default of 6).
- [ ] The first 6 rows
      In R head() shows 6 rows, but pandas defaults to n=5.
- [ ] A statistical summary of numeric columns
      A statistical summary is provided by dat.describe(), not dat.head().

## Q: How do you access the column `age` from a dataframe `dat`?
lang: r
- [ ] `dat[age]`
      Try dat$age or dat[, "age"] in RStudio!
- [x] `dat$age`
      Correct! dat$age is the standard way to access a column by name in R.
- [ ] `dat["age", ]`
      Try dat$age or dat[, "age"] in RStudio!
- [ ] `get(dat, "age")`
      Try dat$age or dat[, "age"] in RStudio!

## Q: How do you extract the column `age` from a pandas DataFrame `dat` as a Series?
lang: python
- [ ] `dat.loc["age"]`
      dat.loc["age"] indexes rows by label; to select a column use dat["age"] or dat.loc[:, "age"].
- [x] `dat["age"]`
      Correct! dat["age"] or dat.age extracts the specified column as a Series.
- [ ] `dat[["age"]]`
      dat[["age"]] returns a DataFrame with one column, not a Series.
- [ ] `dat.get_column("age")`
      The standard indexing syntax is dat["age"] or dat.age.

# Quiz: Data Cleanup
id: cleanup

## Q: `which(x > 5)` for `x <- c(2, 8, 3, 7, 1)` returns…
lang: r
- [ ] `c(8, 7)` — the values greater than 5
      which() returns positions (indices), not values.
- [x] `c(2, 4)` — the indices (positions) where the condition is TRUE
      Correct! which() returns INDICES — use x[which(x > 5)] to get the actual values.
- [ ] `c(FALSE, TRUE, FALSE, TRUE, FALSE)`
      which() returns positions (indices), not values.
- [ ] An error
      which() returns positions (indices), not values.

## Q: What does `np.where(x > 5)[0]` return for `x = np.array([2, 8, 3, 7, 1])`?
lang: python
- [ ] `array([8, 7])`
      np.where returns the indices where the boolean condition evaluates to True.
- [x] `array([1, 3])`
      Correct! np.where returns the 0-based indices matching the condition (indices 1 and 3).
- [ ] `array([False, True, False, True, False])`
      The condition x > 5 yields the boolean mask, but np.where returns index coordinates.
- [ ] `array([2, 4])`
      Python uses 0-based indexing, so positions 2 and 4 are at indices 1 and 3.

## Q: How do you remove columns 3 and 7 from dataframe `dat`?
lang: r
- [ ] `dat[-c(3,7)]`
      Remember: dat[rows, columns]. To select columns use dat[, ...]. Negative index removes.
- [x] `dat[, -c(3,7)]`
      Right! The comma separates rows (left) from columns (right). Negative = exclude.
- [ ] `dat[c(3,7), ]`
      Remember: dat[rows, columns]. To select columns use dat[, ...]. Negative index removes.
- [ ] `dat - c(3,7)`
      Remember: dat[rows, columns]. To select columns use dat[, ...]. Negative index removes.

## Q: How do you drop columns by integer index (e.g. indices 2 and 6) in pandas?
lang: python
- [ ] `dat.drop([2, 6])`
      dat.drop([2, 6]) targets row index labels by default (axis=0).
- [x] `dat.drop(dat.columns[[2, 6]], axis=1)`
      Correct! dat.columns[[2, 6]] gets column names by position, and axis=1 removes columns.
- [ ] `dat[:, -[2, 6]]`
      Pandas DataFrames do not support negative list column slicing like R.
- [ ] `del dat[[2, 6]]`
      del dat[col_name] requires explicit column name labels, not integer index lists.

## Q: `apply(dat, 1, function(x) sum(is.na(x)))` counts the NAs…
lang: r
- [ ] Per column (one value per variable)
      MARGIN=1 applies the function to each row. MARGIN=2 would be column-wise.
- [x] Per row (one value per patient)
      Exactly! MARGIN=1 means row-wise. Each result value = NA count for one patient.
- [ ] In the entire dataframe (one total)
      MARGIN=1 applies the function to each row. MARGIN=2 would be column-wise.
- [ ] Per cell (one value per element)
      MARGIN=1 applies the function to each row. MARGIN=2 would be column-wise.

## Q: How do you count missing values (NaN) per row across a pandas DataFrame `dat`?
lang: python
- [ ] `dat.isna().sum(axis=0)`
      axis=0 aggregates across rows, yielding NA counts per column.
- [x] `dat.isna().sum(axis=1)`
      Correct! axis=1 aggregates across columns, counting missing values per row.
- [ ] `dat.count(axis=1)`
      .count() counts non-null observations per row.
- [ ] `np.sum(dat.isnull())`
      Default np.sum() on DataFrame sums per column (axis=0).

# Quiz: Visualisation
id: viz

## Q: What does the `breaks` parameter in `hist()` control?
lang: r
- [ ] The colour of the bars
      Try hist(x, breaks=3) vs hist(x, breaks=20) in RStudio and compare!
- [x] The number of bins
      Correct! More breaks = more (narrower) bins. Fewer breaks = broader view.
- [ ] The y-axis range
      Try hist(x, breaks=3) vs hist(x, breaks=20) in RStudio and compare!
- [ ] The x-axis title
      Try hist(x, breaks=3) vs hist(x, breaks=20) in RStudio and compare!

## Q: What parameter in `plt.hist()` controls the number of intervals into which data is split?
lang: python
- [ ] `intervals`
      Matplotlib uses bins= to specify intervals.
- [x] `bins`
      Correct! `bins` specifies the number of equal-width bins or explicit bin edges.
- [ ] `range`
      `range` defines upper and lower bin boundaries, but does not control the partition count.
- [ ] `step`
      `step` is a plotting style (histtype='step'), not the count of bins.

## Q: In a boxplot, the central line inside the box represents…
lang: both
- [ ] The mean
      The central line in a boxplot is always the median — not the mean!
- [x] The median (50th percentile)
      Right! The box spans Q1–Q3 (middle 50%), the line is the median, whiskers extend to 1.5×IQR.
- [ ] The standard deviation
      The central line in a boxplot is always the median — not the mean!
- [ ] The minimum value
      The central line in a boxplot is always the median — not the mean!

## Q: What does a Q-Q plot tell you?
lang: both
- [ ] The correlation between two variables
      A Q-Q plot compares your data's quantiles to a theoretical distribution (usually normal).
- [ ] How many outliers the data has
      A Q-Q plot compares your data's quantiles to a theoretical distribution (usually normal).
- [x] How closely the data follows a theoretical distribution (e.g. normal)
      Exactly! Points on the diagonal = matches the distribution. Curving away = skewed or heavy tails.
- [ ] The distribution of each group separately
      A Q-Q plot compares your data's quantiles to a theoretical distribution (usually normal).

# Quiz: Putting it all together
id: exercises

## Q: Which function creates a smooth probability density curve (not a histogram)?
lang: r
- [ ] `hist()`
      hist() makes bars. density() makes a smooth curve — pass its result to plot().
- [x] `density()`
      Correct! density() estimates the curve, then plot(density(x)) draws it.
- [ ] `curve()`
      hist() makes bars. density() makes a smooth curve — pass its result to plot().
- [ ] `smooth()`
      hist() makes bars. density() makes a smooth curve — pass its result to plot().

## Q: In Seaborn / Python, which function generates a smooth probability density estimate?
lang: python
- [ ] `sns.histplot(x, kde=False)`
      Without kde=True, histplot renders discrete rectangular histogram bars.
- [x] `sns.kdeplot(x)`
      Correct! sns.kdeplot() computes and draws a smooth kernel density estimate curve.
- [ ] `plt.bar(x)`
      plt.bar creates categorical or discrete frequency bars.
- [ ] `scipy.stats.freq()`
      Scipy offers stats.gaussian_kde, but the standard plotting function in seaborn is kdeplot.

## Q: You identified rows with NAs: `i.missing <- which(nb_NA > 0)`. How do you remove them?
lang: r
- [ ] `dat[i.missing, ]`
      dat[i.missing, ] would KEEP those rows. Add a - to REMOVE them: dat[-i.missing, ].
- [x] `dat[-i.missing, ]`
      Right! Negative row index removes those rows. dat[-i.missing, ] keeps everyone else.
- [ ] `dat[, -i.missing]`
      dat[i.missing, ] would KEEP those rows. Add a - to REMOVE them: dat[-i.missing, ].
- [ ] `na.omit(i.missing)`
      dat[i.missing, ] would KEEP those rows. Add a - to REMOVE them: dat[-i.missing, ].

## Q: If `i_missing` holds indices of rows containing NaN values, how do you drop them from DataFrame `dat`?
lang: python
- [ ] `dat.loc[i_missing]`
      dat.loc[i_missing] filters and keeps only those missing rows.
- [x] `dat.drop(index=i_missing)`
      Correct! dat.drop(index=i_missing) drops rows matching the specified index list.
- [ ] `del dat[i_missing]`
      del dat[...] is used for deleting columns by name.
- [ ] `dat.remove(i_missing)`
      DataFrames do not have a .remove() method; use .drop().

## Q: The operator `%in%` is used to…
lang: r
- [ ] Calculate percentages
      %in% tests membership — TRUE if the element appears anywhere in the right-hand vector.
- [x] Test if elements of one vector appear in another
      Exactly! c("a","b","c") %in% c("b","d") → c(FALSE,TRUE,FALSE). Useful for finding columns by name.
- [ ] Apply a function to each element
      %in% tests membership — TRUE if the element appears anywhere in the right-hand vector.
- [ ] Check exact equality of two vectors
      %in% tests membership — TRUE if the element appears anywhere in the right-hand vector.

## Q: What is the Python equivalent of R's `%in%` operator for checking values within a pandas Series or list?
lang: python
- [ ] The `==` operator
      `==` checks element-wise equality position by position, not membership in a collection.
- [x] The `.isin()` method (or `in` operator in base Python)
      Correct! series.isin(values) checks membership element-wise across a collection.
- [ ] The `.contains()` method
      .str.contains() searches for substrings inside string columns.
- [ ] The `match()` function
      match is used in regular expressions, not collection membership.

# Quiz: Data Scales and Variable Types
id: data-types

## Q: Which classification correctly describes the variable "Body Frame" (small, medium, large)?
lang: both
- [ ] Numerical continuous
      Small, medium, large are categories, not continuous numeric measurements.
- [ ] Categorical nominal
      Nominal categories have no ordering (e.g. location), but frame has an intrinsic ordering.
- [x] Categorical ordinal
      Correct! Categories that possess a natural, inherent order (small < medium < large) are ordinal.
- [ ] Numerical interval
      Categories with textual levels are not numeric interval scales.

## Q: What is the difference between an interval scale (e.g. temperature in °C) and a ratio scale (e.g. body weight)?
lang: both
- [ ] Interval scales cannot be represented by decimal numbers
      Both interval and ratio scales can be continuous floats.
- [x] Ratio scales possess an absolute physical zero point; interval scales do not
      Correct! Weight has a true absolute zero (no mass), while 0°C does not mean the absence of temperature.
- [ ] Interval scales can only represent positive values
      Interval scales can freely contain negative values (e.g. -5°C).
- [ ] Ratio scales cannot be used to compute mean or standard deviation
      Both ratio and interval scales support standard parametric statistics.

## Q: Why are pie charts generally discouraged compared to bar charts for categorical data?
lang: both
- [ ] Pie charts cannot be rendered in modern plotting libraries
      All major libraries support pie charts, but human perception is the issue.
- [x] Human perception judges linear lengths and heights much more accurately than 2D slice areas and angles
      Correct! Evaluating differences in bar lengths is far easier and less error-prone than comparing angles or slice areas.
- [ ] Pie charts cannot represent nominal categories
      Pie charts represent nominal data, but bar plots communicate differences clearer.
- [ ] Pie charts automatically order categories alphabetically
      Ordering can be customized, but slice geometry remains difficult to judge.

# Quiz: Descriptive Statistics and Robustness
id: descriptive-stats

## Q: In a strongly right-skewed distribution, what is the expected relationship between mean, median, and mode?
lang: both
- [ ] mean < median < mode
      In right-skewed distributions, extreme large values inflate the mean.
- [x] mode < median < mean
      Correct! The peak (mode) is on the left, the median splits the distribution 50/50, and the mean is pulled right by high values.
- [ ] mean == median == mode
      Equal central tendencies indicate a perfectly symmetrical, unskewed distribution.
- [ ] median > mean > mode
      The mean is the most sensitive metric and is pulled towards the long right tail.

## Q: Why is the Median Absolute Deviation (MAD) preferred over the Standard Deviation when describing noisy datasets?
lang: both
- [ ] MAD is faster to compute because it avoids squaring numbers
      Computational efficiency is not the reason MAD is preferred in data analysis.
- [x] MAD uses medians instead of means, making it much more robust to extreme outliers
      Correct! Squaring deviations from the mean inflates the standard deviation; MAD relies on medians and is robust.
- [ ] Standard deviation cannot be computed on sample datasets
      Standard deviation can be computed on any sample dataset.
- [ ] MAD can only be used on normally distributed data
      MAD is non-parametric and applies to distributions of arbitrary shape.

## Q: How is the upper whisker boundary calculated in a standard Tukey boxplot?
lang: both
- [ ] Exactly at the maximum data point, regardless of distance
      Outliers beyond 1.5×IQR are plotted as individual points beyond the whiskers.
- [x] At the largest data point that does not exceed $Q75 + 1.5 \times \text{IQR}$
      Correct! Whiskers extend to the most extreme data point within 1.5×IQR beyond the quartiles.
- [ ] Exactly at $Q75 + 3 \times \text{IQR}$
      Standard boxplots use 1.5×IQR for outlier detection.
- [ ] At the 95th percentile
      Whiskers depend directly on the Interquartile Range ($IQR = Q75 - Q25$), not fixed percentiles.
