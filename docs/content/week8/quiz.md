# Quiz: Non-Parametric Tests
id: nonparam

## Q: When should you use a Wilcoxon test instead of a t-test?
- [x] When the data is not normally distributed
      Correct! Non-normal data calls for a non-parametric test like Wilcoxon.
- [ ] When you have more than 1000 data points
      Use Wilcoxon when the normality assumption behind the t-test fails.
- [ ] When comparing more than 2 groups
      Use Wilcoxon when the normality assumption behind the t-test fails.

## Q: The Wilcoxon test operates on the...
- [ ] Raw values, exactly like the t-test
      The Wilcoxon test converts values to ranks before comparing groups.
- [x] Ranks of the values, not the raw values themselves
      Right! Ranks, not raw values — like Spearman vs Pearson.
- [ ] Squared differences between values
      The Wilcoxon test converts values to ranks before comparing groups.

## Q: In the plenum's by-hand computation, the U statistic (`U = R1 - n1(n1+1)/2`) is derived from...
- [x] The sum of ranks (R1) of one group, corrected for the group's own size
      Correct! U is derived from the rank sum, corrected for the group size.
- [ ] The mean of the raw values
      U is computed from R1 (rank sum of group 1) minus a correction term based on n1.
- [ ] The standard deviation of the combined sample
      U is computed from R1 (rank sum of group 1) minus a correction term based on n1.

# Quiz: Proportion Tests
id: proportion

## Q: What kind of question are proportion tests (Fisher / chi-square) designed to answer?
- [ ] Whether the means of two continuous variables differ
      Proportion tests (Fisher/chi-square) assess relationships between two categorical variables.
- [x] Whether there is a significant relationship between two categorical variables
      Correct! Proportion tests work on categorical/contingency-table data.
- [ ] Whether a dataset follows a normal distribution
      Proportion tests (Fisher/chi-square) assess relationships between two categorical variables.

## Q: An odds-ratio (OR) of exactly 1 in a 2×2 contingency table means...
- [x] There is no association between the two categorical variables
      Right! OR = 1 is the null value — no association.
- [ ] There is a perfect positive association
      An odds-ratio of 1 is the neutral value, meaning no association between the variables.
- [ ] The test cannot be run
      An odds-ratio of 1 is the neutral value, meaning no association between the variables.

## Q: The chi-square test statistic compares which two things?
- [x] The observed counts in the contingency table vs. the counts expected if there were no relationship
      Exactly! Observed vs. expected counts under independence.
- [ ] Two means
      Chi-square compares observed counts in the table to the counts expected if the variables were independent.
- [ ] Two standard deviations
      Chi-square compares observed counts in the table to the counts expected if the variables were independent.

# Quiz: Power of a Test
id: power

## Q: In the biomarker diagnostic example, what does β (the Type II error rate) represent?
- [ ] The false-positive rate — diagnosing a healthy patient as sick
      β is the Type II error / false-negative rate — failing to detect a real effect.
- [x] The false-negative rate — failing to detect the condition in a patient who actually has it
      Correct! β = false-negative rate, missing a real effect.
- [ ] The proportion of patients tested
      β is the Type II error / false-negative rate — failing to detect a real effect.

## Q: The power of a test is defined as...
- [ ] α, the significance level
      Power is 1 − β: the probability of correctly detecting a real effect when it exists.
- [x] 1 − β, the probability of correctly detecting a real effect
      Right! Power = 1 − β = sensitivity.
- [ ] The sample mean
      Power is 1 − β: the probability of correctly detecting a real effect when it exists.

## Q: Which of the following would **increase** the power of the diagnostic test in the example?
- [ ] Taking fewer measurements per patient (smaller n)
      Larger n shrinks the standard error, making the test more sensitive and increasing power.
- [x] Taking more measurements per patient (larger n), which shrinks the standard error
      Correct! More measurements per patient shrinks SE and increases power.
- [ ] Ignoring the significance level entirely
      Larger n shrinks the standard error, making the test more sensitive and increasing power.

# Quiz: False Positives, False Negatives & FDR (Plenum)
id: errors

## Q: When H0 is actually true, what should the distribution of p-values look like across many repeated tests?
- [x] Uniformly distributed between 0 and 1
      Correct! Uniform p-values under H0 is the key validity check for a test.
- [ ] Always exactly 0.05
      Under a valid H0, p-values should be uniformly distributed between 0 and 1.
- [ ] Concentrated near 0
      Under a valid H0, p-values should be uniformly distributed between 0 and 1.

## Q: In the plenum's gene expression simulation (900 genes with no real difference, 100 genes with a real difference), what does the False Discovery Rate (FDR) measure?
- [ ] The proportion of all 1000 genes that are truly different
      FDR = false positives divided by all test-positives (genes called "significant").
- [x] The proportion of genes called "significant" (test-positive) that are actually false positives
      Right! FDR looks at test-positives specifically, not all genes.
- [ ] The total number of genes tested
      FDR = false positives divided by all test-positives (genes called "significant").

## Q: Why does the FPR (false-positive rate) stop equaling α when the data is not normally distributed and you still use a t-test?
- [x] Because the t-test's theoretical guarantees rely on the normality assumption, which is violated
      Correct! The t-test's FPR = α guarantee depends on the normality assumption.
- [ ] Because R computes p-values incorrectly for non-normal data
      The t-test only controls the FPR at exactly α when its normality assumption holds — violate that, and the guarantee breaks.
- [ ] α always equals the FPR no matter what
      The t-test only controls the FPR at exactly α when its normality assumption holds — violate that, and the guarantee breaks.
