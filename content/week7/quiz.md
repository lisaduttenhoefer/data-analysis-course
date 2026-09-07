# Quiz: Formulating Hypotheses
id: hypotheses

## Q: You want to test whether the mean weight of 10 sampled chocolate bars differs from the expected 100 g. Is this a one-sample or two-sample test, and one- or two-sided?
- [ ] Two-sample, one-sided
      One group of chocolate bars vs. one fixed target value (100g) = one-sample, two-sided ("different from", not "higher/lower than").
- [x] One-sample, two-sided — comparing one sample's mean to a fixed target value, in either direction
      Correct! One sample compared to a fixed target, difference can go either way.
- [ ] Two-sample, two-sided
      One group of chocolate bars vs. one fixed target value (100g) = one-sample, two-sided ("different from", not "higher/lower than").

## Q: To test whether males have a significantly *higher* mean weight than females, which `t.test()` alternative would you use?
- [ ] `alternative = "two.sided"`
      To test "higher than", use alternative = "greater" (with the first group as the one expected to be higher).
- [x] `alternative = "greater"`
      Right! "greater" tests specifically for a higher mean in the first group.
- [ ] `alternative = "less"`
      To test "higher than", use alternative = "greater" (with the first group as the one expected to be higher).

## Q: What does the significance level α represent?
- [ ] The probability that H1 is true
      α is the proportion of tests that would wrongly detect a difference when H0 is actually true.
- [x] The false-positive rate: under H0, the proportion of tests that would (wrongly) detect a significant difference
      Correct! α is the false-positive rate under H0.
- [ ] The sample size needed for the test
      α is the proportion of tests that would wrongly detect a difference when H0 is actually true.

# Quiz: Running & Interpreting t-Tests
id: ttest

## Q: Why is the p-value of a one-tailed t-test always smaller than (or equal to) the p-value of the corresponding two-tailed test?
- [x] The two-tailed p-value adds up the area in both tails of the t-distribution, so it is (about) twice the one-tailed p-value
      Correct! Two-tailed = area in both tails = ~2× the one-tailed p-value.
- [ ] One-tailed tests always use a different dataset
      The two-sided p-value sums the area in both tails of the t-distribution, so it is about double the one-sided p-value.
- [ ] There is no relationship between the two p-values
      The two-sided p-value sums the area in both tails of the t-distribution, so it is about double the one-sided p-value.

## Q: In the chocolate bar example (p-value = 0.052), what changes if you use α = 0.1 instead of α = 0.05?
- [ ] Nothing — the conclusion is always the same regardless of α
      The p-value stays the same; only the threshold for "significant" changes, which can flip the conclusion.
- [x] With α = 0.1, H0 can now be rejected since the p-value is below 0.1, even though it wasn't below 0.05
      Right! 0.052 < 0.1 but not < 0.05, so the conclusion flips with a looser α.
- [ ] The p-value itself changes when you change α
      The p-value stays the same; only the threshold for "significant" changes, which can flip the conclusion.

## Q: According to the exercise sheet, when should you choose your α value?
- [ ] After seeing the p-value, so you can pick whichever gives a significant result
      Picking α after seeing the p-value defeats its purpose — always decide H0, H1 and α beforehand.
- [x] Before running the test, together with formulating H0 and H1
      Exactly! α must be fixed in advance, not chosen after seeing results.
- [ ] α does not need to be decided in advance
      Picking α after seeing the p-value defeats its purpose — always decide H0, H1 and α beforehand.

# Quiz: Checking Normality
id: normality

## Q: What is a key requirement for a t-test to be valid?
- [x] The data should be approximately normally distributed
      Correct! t-tests assume approximately normal data.
- [ ] The sample size must be exactly 10
      t-tests require the data to be approximately normally distributed.
- [ ] There must be no missing values anywhere in the dataset
      t-tests require the data to be approximately normally distributed.

## Q: How do you interpret `shapiro.test(x)$p.value`?
- [x] p-value ≥ 0.05 → data looks normally distributed; p-value < 0.05 → data is not normally distributed
      Right! Same p-value logic as any hypothesis test: p ≥ α means we cannot reject "data is normal".
- [ ] p-value ≥ 0.05 → data is NOT normal
      For p ≥ 0.05 we cannot reject normality (data looks normal); for p < 0.05, we reject it (not normal).
- [ ] The p-value has no meaning for the Shapiro-Wilk test
      For p ≥ 0.05 we cannot reject normality (data looks normal); for p < 0.05, we reject it (not normal).

## Q: If the Shapiro-Wilk test shows a variable is NOT normally distributed, what should you do instead of a t-test?
- [x] Use a non-parametric test instead (e.g. the Wilcoxon test)
      Correct! Non-parametric tests like Wilcoxon don't require normality.
- [ ] Delete the dataset and collect new data
      When data isn't normal, switch to a non-parametric test (e.g. Wilcoxon) — covered next week.
- [ ] Run the t-test anyway, it makes no difference
      When data isn't normal, switch to a non-parametric test (e.g. Wilcoxon) — covered next week.

# Quiz: Understanding the Null Distribution
id: null

## Q: The exercise builds an empirical H0 distribution by repeatedly splitting the cohort into 2 *random* groups and computing the t-value each time. Why should there be no real difference between 2 random groups?
- [x] Because random groups are drawn from the same overall population, so on average they shouldn't systematically differ
      Correct! Random splits of the same population shouldn't systematically differ.
- [ ] Because R always returns 0 for random samples
      Two random subsets of the same cohort come from the same underlying population — no real difference is expected.
- [ ] Because random groups are always exactly the same size
      Two random subsets of the same cohort come from the same underlying population — no real difference is expected.

## Q: The empirical H0 distribution of 10,000 random-split t-values closely matches which theoretical distribution?
- [x] A t-distribution with df = number of patients − 2
      Right! The empirical H0 distribution matches the theoretical t-distribution closely.
- [ ] A Poisson distribution
      The simulated t-values follow a t-distribution with df = n − 2, matching the theoretical null distribution of the t-test.
- [ ] A uniform distribution
      The simulated t-values follow a t-distribution with df = n − 2, matching the theoretical null distribution of the t-test.

## Q: A Verständnisfragen exercise samples two groups of 5 mice from the SAME population (true mean 100g) and runs both a 1-sample and 2-sample t-test. If H0 is rejected here, what kind of error occurred?
- [x] A false positive (Type I error) — H0 was actually true, since both samples came from the same population
      Correct! Since both samples truly come from the same population, any rejection of H0 is a false positive.
- [ ] A false negative (Type II error)
      Since H0 is actually true here (same population), wrongly rejecting it is a Type I error / false positive.
- [ ] No error — rejecting H0 here is always correct
      Since H0 is actually true here (same population), wrongly rejecting it is a Type I error / false positive.
