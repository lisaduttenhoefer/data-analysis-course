# Quiz: Non-Parametric Tests
id: nonparam

## Q: When should you use a Wilcoxon test instead of a t-test?
lang: both
- [x] When the data is not normally distributed
      Correct! Non-normal data calls for a non-parametric test like Wilcoxon.
- [ ] When you have more than 1000 data points
      Use Wilcoxon when the normality assumption behind the t-test fails, regardless of sample size.
- [ ] When comparing more than 2 groups
      Comparing more than 2 groups requires ANOVA or Kruskal-Wallis, not a standard Wilcoxon test.

## Q: The Wilcoxon test operates on the...
lang: both
- [ ] Raw values, exactly like the t-test
      The Wilcoxon test converts values to ranks before comparing groups.
- [x] Ranks of the values, not the raw values themselves
      Right! Ranks, not raw values — like Spearman vs Pearson.
- [ ] Squared differences between values
      The Wilcoxon test converts values to ranks before comparing groups.

## Q: In the plenum's by-hand computation, the U statistic (`U = R1 - n1(n1+1)/2`) is derived from...
lang: both
- [x] The sum of ranks (R1) of one group, corrected for the group's own size
      Correct! U is derived from the rank sum, corrected for the group size.
- [ ] The mean of the raw values
      U is computed from R1 (rank sum of group 1) minus a correction term based on n1.
- [ ] The standard deviation of the combined sample
      U is computed from R1 (rank sum of group 1) minus a correction term based on n1.

## Q: How do you run an unpaired Mann-Whitney U test (Wilcoxon rank-sum test) in R?
lang: r
- [ ] `t.test(x, y, nonparam = TRUE)`
      t.test() does not take a nonparam parameter; use wilcox.test().
- [x] `wilcox.test(x, y)`
      Correct! `wilcox.test(x, y)` performs the Wilcoxon rank-sum / Mann-Whitney U test by default.
- [ ] `kruskal.test(x, y)`
      kruskal.test() is used for comparing more than two groups.

## Q: Which SciPy function performs the two-sample unpaired Mann-Whitney U test?
lang: python
- [ ] `scipy.stats.wilcoxon(x, y)`
      stats.wilcoxon() is specifically for paired samples (signed-rank test).
- [x] `scipy.stats.mannwhitneyu(x, y)`
      Correct! `mannwhitneyu(x, y)` runs the non-parametric rank-sum test on independent samples.
- [ ] `scipy.stats.rankdata(x, y)`
      rankdata() computes raw ranks for an array, not a full statistical test.

## Q: What is the non-parametric equivalent of a paired two-sample t-test?
lang: both
- [ ] Mann-Whitney U test
      Mann-Whitney U is designed for independent (unpaired) samples.
- [x] Wilcoxon signed-rank test
      Correct! The Wilcoxon signed-rank test ranks the absolute differences between paired observations.
- [ ] Pearson chi-square test
      Chi-square tests categorical contingency tables, not paired continuous differences.

## Q: In Python, which call executes a paired Wilcoxon signed-rank test on two dependent arrays `before` and `after`?
lang: python
- [x] `scipy.stats.wilcoxon(before, after)`
      Correct! In SciPy, stats.wilcoxon() computes the signed-rank test on paired differences.
- [ ] `scipy.stats.mannwhitneyu(before, after)`
      mannwhitneyu is for unpaired independent groups.
- [ ] `scipy.stats.ttest_rel(before, after)`
      ttest_rel is the parametric paired t-test, not a rank-based test.

# Quiz: Proportion Tests
id: proportion

## Q: What kind of question are proportion tests (Fisher / chi-square) designed to answer?
lang: both
- [ ] Whether the means of two continuous variables differ
      Proportion tests (Fisher/chi-square) assess relationships between two categorical variables.
- [x] Whether there is a significant relationship between two categorical variables
      Correct! Proportion tests work on categorical/contingency-table data.
- [ ] Whether a dataset follows a normal distribution
      Proportion tests (Fisher/chi-square) assess relationships between two categorical variables.

## Q: An odds-ratio (OR) of exactly 1 in a 2×2 contingency table means...
lang: both
- [x] There is no association between the two categorical variables
      Right! OR = 1 is the null value — no association.
- [ ] There is a perfect positive association
      An odds-ratio of 1 is the neutral value, meaning no association between the variables.
- [ ] The test cannot be run
      An odds-ratio of 1 is the neutral value, meaning no association between the variables.

## Q: The chi-square test statistic compares which two things?
lang: both
- [x] The observed counts in the contingency table vs. the counts expected if there were no relationship
      Exactly! Observed vs. expected counts under independence ($\sum (O_i - E_i)^2 / E_i$).
- [ ] Two means
      Chi-square compares observed counts in the table to the counts expected if the variables were independent.
- [ ] Two standard deviations
      Chi-square compares observed counts in the table to the counts expected if the variables were independent.

## Q: When should Fisher's Exact Test be preferred over the Chi-square test?
lang: both
- [ ] Only when the contingency table has more than 10 rows
      Fisher's test is standard for 2×2 tables and computationally demanding for large tables.
- [x] When sample sizes or expected cell counts are very small (e.g. expected counts < 5)
      Correct! Chi-square relies on an asymptotic approximation that fails for small expected counts; Fisher computes exact probabilities.
- [ ] When comparing continuous measurements
      Both tests are exclusively for categorical count data.

## Q: How do you run a Chi-square test of independence on a 2D contingency table in R and Python?
lang: both
- [ ] `t.test()` in R and `stats.ttest_ind()` in Python
      t-tests compare means of continuous variables.
- [x] `chisq.test(table)` in R and `scipy.stats.chi2_contingency(table)` in Python
      Correct! Both compute the Pearson chi-squared statistic, degrees of freedom, and p-value on contingency tables.
- [ ] `prop.test()` in R and `stats.norm()` in Python
      stats.norm is a continuous normal distribution object, not a contingency test.

# Quiz: Power of a Test
id: power

## Q: In the biomarker diagnostic example, what does β (the Type II error rate) represent?
lang: both
- [ ] The false-positive rate — diagnosing a healthy patient as sick
      β is the Type II error / false-negative rate — failing to detect a real effect.
- [x] The false-negative rate — failing to detect the condition in a patient who actually has it
      Correct! β = false-negative rate, missing a real effect.
- [ ] The proportion of patients tested
      β is the Type II error / false-negative rate — failing to detect a real effect.

## Q: The power of a test is defined as...
lang: both
- [ ] α, the significance level
      Power is 1 − β: the probability of correctly detecting a real effect when it exists.
- [x] 1 − β, the probability of correctly detecting a real effect
      Right! Power = 1 − β = sensitivity.
- [ ] The sample mean
      Power is 1 − β: the probability of correctly detecting a real effect when it exists.

## Q: Which three factors directly influence the statistical power ($1 - \beta$) of a hypothesis test?
lang: both
- [ ] Variable names, color palette, and degree of skewness
      Plot aesthetics do not alter theoretical power.
- [x] Significance level $\alpha$, sample size $n$, and effect size
      Correct! Larger $\alpha$, larger sample sizes $n$, and larger effect sizes all increase the power of a test.
- [ ] Number of outliers, median, and programming language
      Power depends on $\alpha$, sample size $n$, and the true underlying effect size.

## Q: Which of the following would **increase** the power of the diagnostic test in the example?
lang: both
- [ ] Taking fewer measurements per patient (smaller n)
      Larger n shrinks the standard error, making the test more sensitive and increasing power.
- [x] Taking more measurements per patient (larger n), which shrinks the standard error
      Correct! More measurements per patient shrinks SE and increases power.
- [ ] Ignoring the significance level entirely
      Larger n shrinks the standard error, making the test more sensitive and increasing power.

# Quiz: False Positives, False Negatives & FDR (Plenum)
id: errors

## Q: When H0 is actually true, what should the distribution of p-values look like across many repeated tests?
lang: both
- [x] Uniformly distributed between 0 and 1
      Correct! Uniform p-values under H0 is the key validity check for a test.
- [ ] Always exactly 0.05
      Under a valid H0, p-values should be uniformly distributed between 0 and 1.
- [ ] Concentrated near 0
      Under a valid H0, p-values should be uniformly distributed between 0 and 1.

## Q: What is the difference between the False Positive Rate (FPR) and the False Discovery Rate (FDR)?
lang: both
- [ ] They are identical mathematical definitions
      FPR normalizes by all true negatives, while FDR normalizes by all test positives.
- [x] $\text{FPR} = \frac{\text{FP}}{\text{TN} + \text{FP}}$ (proportion of true negatives falsely called significant), while $\text{FDR} = \frac{\text{FP}}{\text{TP} + \text{FP}}$ (proportion of significant calls that are false)
      Correct! FPR controls errors relative to all negative features; FDR controls errors among the discoveries (calls) made.
- [ ] FDR is always fixed at $\alpha = 0.05$
      FDR depends on the proportion of true alternatives and test power, not fixed $\alpha$.

## Q: In the plenum's gene expression simulation (900 genes with no real difference, 100 genes with a real difference), what does the False Discovery Rate (FDR) measure?
lang: both
- [ ] The proportion of all 1000 genes that are truly different
      FDR = false positives divided by all test-positives (genes called "significant").
- [x] The proportion of genes called "significant" (test-positive) that are actually false positives
      Right! FDR looks at test-positives specifically, not all genes.
- [ ] The total number of genes tested
      FDR = false positives divided by all test-positives (genes called "significant").

## Q: Why does the FPR (false-positive rate) stop equaling α when the data is not normally distributed and you still use a t-test?
lang: both
- [x] Because the t-test's theoretical guarantees rely on the normality assumption, which is violated
      Correct! The t-test's FPR = α guarantee depends on the normality assumption.
- [ ] Because software computes p-values incorrectly for non-normal data
      The t-test only controls the FPR at exactly α when its normality assumption holds — violate that, and the guarantee breaks.
- [ ] α always equals the FPR no matter what
      The t-test only controls the FPR at exactly α when its normality assumption holds — violate that, and the guarantee breaks.
