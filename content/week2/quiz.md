# Quiz: Loading and Exploring
id: loading

## Q: What does `dim(dat)` return for a dataframe with 400 rows and 17 columns?
- [ ] `c(17, 400)`
      Not quite. dim() returns c(rows, cols). 400 patients, 17 variables → c(400, 17).
- [x] `c(400, 17)`
      Correct! dim() always returns (rows, columns) — rows first!
- [ ] `400`
      Not quite. dim() returns c(rows, cols). 400 patients, 17 variables → c(400, 17).
- [ ] `6800`
      Not quite. dim() returns c(rows, cols). 400 patients, 17 variables → c(400, 17).

## Q: What does `head(dat)` show by default?
- [ ] The last 6 rows
      head() shows the beginning of the data — default is 6 rows.
- [x] The first 6 rows
      Exactly! head(dat) shows the first 6 rows. Use head(dat, n) for a custom number.
- [ ] A summary of all columns
      head() shows the beginning of the data — default is 6 rows.
- [ ] The first row only
      head() shows the beginning of the data — default is 6 rows.

## Q: How do you access the column `age` from a dataframe `dat`?
- [ ] `dat[age]`
      Try dat$age or dat[, "age"] in RStudio!
- [x] `dat$age`
      Correct! dat$age is the standard way to access a column by name in R.
- [ ] `dat["age", ]`
      Try dat$age or dat[, "age"] in RStudio!
- [ ] `get(dat, "age")`
      Try dat$age or dat[, "age"] in RStudio!

# Quiz: Data Cleanup
id: cleanup

## Q: `which(x > 5)` for `x <- c(2, 8, 3, 7, 1)` returns…
- [ ] `c(8, 7)` — the values greater than 5
      which() returns positions (indices), not values.
- [x] `c(2, 4)` — the indices (positions) where the condition is TRUE
      Correct! which() returns INDICES — use x[which(x > 5)] to get the actual values.
- [ ] `c(FALSE, TRUE, FALSE, TRUE, FALSE)`
      which() returns positions (indices), not values.
- [ ] An error
      which() returns positions (indices), not values.

## Q: How do you remove columns 3 and 7 from dataframe `dat`?
- [ ] `dat[-c(3,7)]`
      Remember: dat[rows, columns]. To select columns use dat[, ...]. Negative index removes.
- [x] `dat[, -c(3,7)]`
      Right! The comma separates rows (left) from columns (right). Negative = exclude.
- [ ] `dat[c(3,7), ]`
      Remember: dat[rows, columns]. To select columns use dat[, ...]. Negative index removes.
- [ ] `dat - c(3,7)`
      Remember: dat[rows, columns]. To select columns use dat[, ...]. Negative index removes.

## Q: `apply(dat, 1, function(x) sum(is.na(x)))` counts the NAs…
- [ ] Per column (one value per variable)
      MARGIN=1 applies the function to each row. MARGIN=2 would be column-wise.
- [x] Per row (one value per patient)
      Exactly! MARGIN=1 means row-wise. Each result value = NA count for one patient.
- [ ] In the entire dataframe (one total)
      MARGIN=1 applies the function to each row. MARGIN=2 would be column-wise.
- [ ] Per cell (one value per element)
      MARGIN=1 applies the function to each row. MARGIN=2 would be column-wise.

# Quiz: Visualisation
id: viz

## Q: What does the `breaks` parameter in `hist()` control?
- [ ] The colour of the bars
      Try hist(x, breaks=3) vs hist(x, breaks=20) in RStudio and compare!
- [x] The number of bins
      Correct! More breaks = more (narrower) bins. Fewer breaks = broader view.
- [ ] The y-axis range
      Try hist(x, breaks=3) vs hist(x, breaks=20) in RStudio and compare!
- [ ] The x-axis title
      Try hist(x, breaks=3) vs hist(x, breaks=20) in RStudio and compare!

## Q: In a boxplot, the central line inside the box represents…
- [ ] The mean
      The central line in a boxplot is always the median — not the mean!
- [x] The median (50th percentile)
      Right! The box spans Q1–Q3 (middle 50%), the line is the median, whiskers extend to 1.5×IQR.
- [ ] The standard deviation
      The central line in a boxplot is always the median — not the mean!
- [ ] The minimum value
      The central line in a boxplot is always the median — not the mean!

## Q: What does a Q-Q plot tell you?
- [ ] The correlation between two variables
      A Q-Q plot compares your data's quantiles to a theoretical distribution (usually normal).
- [ ] How many outliers the data has
      A Q-Q plot compares your data's quantiles to a theoretical distribution (usually normal).
- [x] How closely the data follows a theoretical distribution (e.g. normal)
      Exactly! Points on the diagonal = matches the normal distribution. Curves away = skewed or heavy tails.
- [ ] The distribution of each group separately
      A Q-Q plot compares your data's quantiles to a theoretical distribution (usually normal).

# Quiz: Putting it all together
id: exercises

## Q: Which function creates a smooth probability density curve (not a histogram)?
- [ ] `hist()`
      hist() makes bars. density() makes a smooth curve — pass its result to plot().
- [x] `density()`
      Correct! density() estimates the curve, then plot(density(x)) draws it.
- [ ] `curve()`
      hist() makes bars. density() makes a smooth curve — pass its result to plot().
- [ ] `smooth()`
      hist() makes bars. density() makes a smooth curve — pass its result to plot().

## Q: You identified rows with NAs: `i.missing <- which(nb_NA > 0)`. How do you remove them?
- [ ] `dat[i.missing, ]`
      dat[i.missing, ] would KEEP those rows. Add a - to REMOVE them: dat[-i.missing, ].
- [x] `dat[-i.missing, ]`
      Right! Negative row index removes those rows. dat[-i.missing, ] keeps everyone else.
- [ ] `dat[, -i.missing]`
      dat[i.missing, ] would KEEP those rows. Add a - to REMOVE them: dat[-i.missing, ].
- [ ] `na.omit(i.missing)`
      dat[i.missing, ] would KEEP those rows. Add a - to REMOVE them: dat[-i.missing, ].

## Q: The operator `%in%` is used to…
- [ ] Calculate percentages
      %in% tests membership — TRUE if the element appears anywhere in the right-hand vector.
- [x] Test if elements of one vector appear in another
      Exactly! c("a","b","c") %in% c("b","d") → c(FALSE,TRUE,FALSE). Useful for finding columns by name.
- [ ] Apply a function to each element
      %in% tests membership — TRUE if the element appears anywhere in the right-hand vector.
- [ ] Check exact equality of two vectors
      %in% tests membership — TRUE if the element appears anywhere in the right-hand vector.
