# Quiz: Formulating Hypotheses
id: hypotheses

## Q: You want to test whether the mean weight of 10 sampled chocolate bars differs from the expected 100 g. Is this a one-sample or two-sample test, and one- or two-sided?
lang: both
- [ ] Two-sample, one-sided
      One group of chocolate bars vs. one fixed target value (100g) = one-sample, two-sided ("different from", not "higher/lower than").
- [x] One-sample, two-sided — comparing one sample's mean to a fixed target value, in either direction
      Correct! One sample compared to a fixed target, difference can go either way.
- [ ] Two-sample, two-sided
      One group of chocolate bars vs. one fixed target value (100g) = one-sample, two-sided ("different from", not "higher/lower than").

## Q: To test whether males have a significantly *higher* mean weight than females, which `t.test()` alternative would you use?
lang: r
- [ ] `alternative = "two.sided"`
      To test "higher than", use alternative = "greater" (with the first group as the one expected to be higher).
- [x] `alternative = "greater"`
      Right! "greater" tests specifically for a higher mean in the first group.
- [ ] `alternative = "less"`
      To test "higher than", use alternative = "greater" (with the first group as the one expected to be higher).

## Q: To test whether sample `group_a` has a significantly *higher* mean than `group_b` using `scipy.stats.ttest_ind()`, which alternative argument should you pass?
lang: python
- [ ] `alternative="two-sided"`
      "two-sided" tests for any difference in either direction.
- [x] `alternative="greater"`
      Correct! In SciPy, alternative="greater" tests whether group_a has a greater mean than group_b.
- [ ] `alternative="upper"`
      SciPy accepts "two-sided", "greater", or "less", not "upper".

## Q: What does the significance level α represent?
lang: both
- [ ] The probability that H1 is true
      α is the proportion of tests that would wrongly detect a difference when H0 is actually true.
- [x] The false-positive rate: under H0, the proportion of tests that would (wrongly) detect a significant difference
      Correct! α is the false-positive rate under H0 (Type I error rate).
- [ ] The sample size needed for the test
      α is the proportion of tests that would wrongly detect a difference when H0 is actually true.

## Q: Does a p-value of 0.03 mean that there is a 3% probability that the null hypothesis $H_0$ is true?
lang: both
- [ ] Yes, exactly — p-value is defined as $P(H_0 \mid \text{data})$
      A p-value is NOT the probability that H0 is true; it is calculated assuming H0 is true: $P(\text{data} \mid H_0)$.
- [x] No! The p-value is the probability of observing data at least as extreme as observed, assuming $H_0$ is true
      Correct! The p-value is $P(\text{data or more extreme} \mid H_0)$, never the probability of $H_0$ itself.
- [ ] Yes, but only if the sample size $n$ exceeds 100
      The definition of a p-value never equals the posterior probability of H0, regardless of sample size.

# Quiz: Running & Interpreting t-Tests
id: ttest

## Q: Why is the p-value of a one-tailed t-test always smaller than (or equal to) the p-value of the corresponding two-tailed test?
lang: both
- [x] The two-tailed p-value adds up the area in both tails of the t-distribution, so it is (about) twice the one-tailed p-value
      Correct! Two-tailed = area in both tails = ~2× the one-tailed p-value.
- [ ] One-tailed tests always use a different dataset
      The two-sided p-value sums the area in both tails of the t-distribution, so it is about double the one-sided p-value.
- [ ] There is no relationship between the two p-values
      The two-sided p-value sums the area in both tails of the t-distribution, so it is about double the one-sided p-value.

## Q: In the chocolate bar example (p-value = 0.052), what changes if you use α = 0.1 instead of α = 0.05?
lang: both
- [ ] Nothing — the conclusion is always the same regardless of α
      The p-value stays the same; only the threshold for "significant" changes, which can flip the conclusion.
- [x] With α = 0.1, H0 can now be rejected since the p-value is below 0.1, even though it wasn't below 0.05
      Right! 0.052 < 0.1 but not < 0.05, so the conclusion flips with a looser α.
- [ ] The p-value itself changes when you change α
      The p-value stays the same; only the threshold for "significant" changes, which can flip the conclusion.

## Q: According to the exercise sheet, when should you choose your α value?
lang: both
- [ ] After seeing the p-value, so you can pick whichever gives a significant result
      Picking α after seeing the p-value defeats its purpose — always decide H0, H1 and α beforehand.
- [x] Before running the test, together with formulating H0 and H1
      Exactly! α must be fixed in advance, not chosen after seeing results.
- [ ] α does not need to be decided in advance
      Picking α after seeing the p-value defeats its purpose — always decide H0, H1 and α beforehand.

## Q: How do sample size $n$ and effect size relate when evaluating statistical significance?
lang: both
- [ ] A small effect size will never achieve significance, regardless of how large $n$ is
      Even tiny, biologically irrelevant differences will reach $p < 0.001$ if $n$ is large enough.
- [x] A very small effect size can become statistically significant with large $n$, whereas a large effect size may be non-significant if $n$ is small
      Correct! Standard error scales with $1/\sqrt{n}$, so large $n$ inflates test statistics for tiny differences, while small $n$ lacks power.
- [ ] Increasing $n$ changes the underlying population effect size $\overline{x}_1 - \overline{x}_2$
      Effect size is a property of the population; increasing sample size only increases statistical power.

# Quiz: Variants of the t-Test
id: ttest-variants

## Q: In a clinical trial, cholesterol is measured in 30 patients before treatment and again in the same 30 patients after 3 months. Which t-test must be used?
lang: both
- [ ] One-sample t-test
      We have two sets of measurements from the same patients.
- [ ] Two-sample unpaired Student's t-test
      Measurements on the exact same subjects over time are dependent (paired), not independent.
- [x] Two-sample paired t-test
      Correct! Since before/after measurements come from the same subjects, the paired t-test analyzes intra-individual differences ($x_D = x_{\text{after}} - x_{\text{before}}$).
- [ ] Two-sample Welch's t-test
      Welch's test assumes independent samples, but repeated measures are paired.

## Q: What is the difference between Student's t-test and Welch's t-test?
lang: both
- [ ] Student's t-test does not assume normal distribution, whereas Welch's does
      Both tests assume approximately normal distributions of data (or means).
- [x] Student's t-test assumes equal variances between the two groups; Welch's t-test does not require equal variances
      Correct! Welch's t-test adjusts degrees of freedom and standard error to handle unequal group variances ($\sigma_1^2 \ne \sigma_2^2$).
- [ ] Welch's t-test only works for paired samples
      Welch's test is an unpaired two-sample test with unequal variances.

## Q: In R, how do you perform an unpaired two-sample t-test assuming *equal* group variances?
lang: r
- [ ] `t.test(x, y)`
      By default in R, t.test() runs Welch's test with var.equal = FALSE.
- [x] `t.test(x, y, var.equal = TRUE)`
      Correct! Setting var.equal = TRUE uses pooled variance (classical Student's t-test).
- [ ] `t.test(x, y, paired = TRUE)`
      paired = TRUE runs a paired t-test, not an unpaired equal-variance test.

## Q: In Python, which function and parameter executes a paired t-test between two arrays `before` and `after`?
lang: python
- [ ] `scipy.stats.ttest_ind(before, after)`
      ttest_ind is for independent (unpaired) two-sample tests.
- [x] `scipy.stats.ttest_rel(before, after)`
      Correct! `ttest_rel()` calculates the t-test on two related (paired) samples.
- [ ] `scipy.stats.ttest_1samp(before - after, popmean=1)`
      Testing no difference in 1samp would require popmean=0, but ttest_rel is the standard dedicated function.

# Quiz: Checking Normality
id: normality

## Q: What is a key requirement for a t-test to be valid?
lang: both
- [x] The data should be approximately normally distributed
      Correct! t-tests assume approximately normal data (or sufficiently large sample sizes via CLT).
- [ ] The sample size must be exactly 10
      t-tests require the data to be approximately normally distributed.
- [ ] There must be no missing values anywhere in the dataset
      t-tests require the data to be approximately normally distributed.

## Q: How do you interpret `shapiro.test(x)$p.value`?
lang: r
- [x] p-value ≥ 0.05 → data looks normally distributed; p-value < 0.05 → data is not normally distributed
      Right! Same p-value logic as any hypothesis test: p ≥ α means we cannot reject "data is normal".
- [ ] p-value ≥ 0.05 → data is NOT normal
      For p ≥ 0.05 we cannot reject normality (data looks normal); for p < 0.05, we reject it (not normal).
- [ ] The p-value has no meaning for the Shapiro-Wilk test
      For p ≥ 0.05 we cannot reject normality (data looks normal); for p < 0.05, we reject it (not normal).

## Q: Which function in SciPy tests the null hypothesis that data was drawn from a normal distribution?
lang: python
- [ ] `scipy.stats.norm.cdf()`
      cdf() calculates cumulative probability, not a hypothesis test of sample normality.
- [x] `scipy.stats.shapiro(x)`
      Correct! shapiro() performs the Shapiro-Wilk test for normality and returns a test statistic and p-value.
- [ ] `scipy.stats.ttest_ind(x)`
      ttest_ind compares means between two samples.

## Q: If the Shapiro-Wilk test shows a variable is NOT normally distributed (e.g. $p = 0.003$), what should you do instead of a standard t-test?
lang: both
- [x] Use a non-parametric test instead (e.g. the Wilcoxon / Mann-Whitney test)
      Correct! Non-parametric tests make no distributional assumptions and operate on ranks.
- [ ] Delete the dataset and collect new data
      When data isn't normal, switch to a non-parametric test (e.g. Wilcoxon).
- [ ] Run the t-test anyway, it makes no difference
      When data isn't normal, switch to a non-parametric test (e.g. Wilcoxon).

# Quiz: Understanding the Null Distribution
id: null

## Q: The exercise builds an empirical H0 distribution by repeatedly splitting the cohort into 2 *random* groups and computing the t-value each time. Why should there be no real difference between 2 random groups?
lang: both
- [x] Because random groups are drawn from the same overall population, so on average they shouldn't systematically differ
      Correct! Random splits of the same population shouldn't systematically differ.
- [ ] Because software always returns 0 for random samples
      Two random subsets of the same cohort come from the same underlying population — no real difference is expected.
- [ ] Because random groups are always exactly the same size
      Two random subsets of the same cohort come from the same underlying population — no real difference is expected.

## Q: The empirical H0 distribution of 10,000 random-split t-values closely matches which theoretical distribution?
lang: both
- [x] A t-distribution with df = number of patients − 2
      Right! The empirical H0 distribution matches the theoretical t-distribution closely ($df = n_1 + n_2 - 2$).
- [ ] A Poisson distribution
      The simulated t-values follow a t-distribution matching the theoretical null distribution of the t-test.
- [ ] A uniform distribution
      The simulated t-values follow a t-distribution matching the theoretical null distribution of the t-test.

## Q: A sample of two groups of 5 mice is drawn from the SAME population (true mean 100g) and tested. If H0 is rejected here, what kind of error occurred?
lang: both
- [x] A false positive (Type I error) — H0 was actually true, since both samples came from the same population
      Correct! Since both samples truly come from the same population, any rejection of H0 is a false positive.
- [ ] A false negative (Type II error)
      Since H0 is actually true here (same population), wrongly rejecting it is a Type I error / false positive.
- [ ] No error — rejecting H0 here is always correct
      Since H0 is actually true here (same population), wrongly rejecting it is a Type I error / false positive.
