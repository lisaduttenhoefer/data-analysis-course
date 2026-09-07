# Quiz: The Central Limit Theorem
id: clt

## Q: In the coffee shop example, individual waiting times follow a right-skewed Gamma distribution. What does the Central Limit Theorem say about the distribution of *sample means* of waiting times as the sample size n grows?
- [ ] It stays right-skewed, just like the individual waiting times
      The CLT says sample means become approximately normal, no matter the shape of the original distribution.
- [x] It becomes approximately normal, regardless of the shape of the original distribution
      Correct! That is the core statement of the CLT.
- [ ] It becomes uniform
      The CLT says sample means become approximately normal, no matter the shape of the original distribution.

## Q: What is one essential condition for the Central Limit Theorem to hold?
- [ ] The original variable must already be normally distributed
      The CLT explicitly requires the variables being averaged to be independent (and identically distributed).
- [x] The individual random variables being averaged must be independent of each other
      Right! Independence of the underlying random variables is essential.
- [ ] The sample size must be exactly 30
      The CLT explicitly requires the variables being averaged to be independent (and identically distributed).

## Q: Looking at the Q-Q plots for n = 2, n = 10 and n = 200 sample means, what pattern do you see?
- [ ] The fit to the normal line gets worse as n increases
      As n grows, the Q-Q plot fits the diagonal (normal) line better and better.
- [x] The fit to the normal line gets better as n increases, becoming almost perfect at n = 200
      Exactly! Larger n means a better fit to normality.
- [ ] n has no effect on the Q-Q plot
      As n grows, the Q-Q plot fits the diagonal (normal) line better and better.

# Quiz: Standard Error & Sample Size
id: se

## Q: What does the formula `SE = σ / √n` tell you?
- [x] The standard error shrinks as the sample size n grows
      Correct! Larger samples give more precise (less variable) mean estimates.
- [ ] The standard error grows as the sample size n grows
      SE = σ/√n shrinks as n grows — more data means a more precise estimate of the mean.
- [ ] The standard error is independent of n
      SE = σ/√n shrinks as n grows — more data means a more precise estimate of the mean.

## Q: The exercise notes "diminishing returns": going from n=10 to n=20 helps more than going from n=80 to n=90. Why?
- [x] Because SE depends on √n, so each additional observation reduces SE less and less at larger n
      Right! The square root creates diminishing returns.
- [ ] Because R has a bug for large sample sizes
      Because SE scales with 1/√n, each extra observation matters less as n grows.
- [ ] Because the mean changes at large n
      Because SE scales with 1/√n, each extra observation matters less as n grows.

## Q: Does the *mean* of the sample means change as the sample size n increases?
- [x] No — it stays centered on the true population mean; only the spread (SE) shrinks
      Correct! Only the spread shrinks, not the center.
- [ ] Yes — it increases proportionally with n
      The mean of sample means stays centered on the true population mean regardless of n.
- [ ] Yes — it decreases proportionally with n
      The mean of sample means stays centered on the true population mean regardless of n.

# Quiz: Confidence Intervals
id: ci

## Q: What does a "95% confidence interval" mean?
- [ ] There is a 95% probability that any single observation falls in this range
      A 95% CI means: repeat the sampling procedure many times, and ~95% of the resulting intervals contain the true parameter.
- [x] If we repeated the sampling many times, about 95% of the constructed intervals would contain the true population parameter
      Correct! It is a statement about the long-run behavior of the method, not a single interval.
- [ ] The sample mean is wrong 95% of the time
      A 95% CI means: repeat the sampling procedure many times, and ~95% of the resulting intervals contain the true parameter.

## Q: In the coffee-cup example (n = 9 cups), why do we use the **t-distribution** with 8 degrees of freedom rather than the normal distribution to compute the critical value?
- [x] Because the sample size is small, and the true standard deviation is unknown and estimated from the sample
      Right! Small samples with an estimated (not known) SD call for the t-distribution.
- [ ] Because coffee cup volumes are always t-distributed
      With small n and an unknown population SD, the t-distribution accounts for the extra uncertainty.
- [ ] Because degrees of freedom only apply to normal distributions
      With small n and an unknown population SD, the t-distribution accounts for the extra uncertainty.

## Q: Comparing a 90% CI and a 95% CI computed from the same data, which one is wider?
- [ ] The 90% CI is wider
      To be more confident of capturing the true value, the interval must be wider — 95% CI > 90% CI in width.
- [x] The 95% CI is wider — higher confidence requires a larger margin
      Correct! Higher confidence (95% > 90%) needs a wider interval.
- [ ] They are always exactly the same width
      To be more confident of capturing the true value, the interval must be wider — 95% CI > 90% CI in width.

# Quiz: Plenum Demos — CLT in Action
id: plenum

## Q: In the dice-sum ("Augensumme") plenum demo, rolling 2 dice and averaging over N repeated pairs of rolls, what happens to the distribution of the averaged sum as N grows from 1 to 100?
- [ ] It stays exactly the same, uniformly spread between 2 and 12
      As N grows, the averaged dice sum becomes more concentrated and bell-shaped around 7 — CLT in action.
- [x] It becomes increasingly concentrated and bell-shaped around the theoretical mean of 7
      Correct! Averaging more dice rolls concentrates the result around the true mean of 7.
- [ ] It becomes more spread out and skewed
      As N grows, the averaged dice sum becomes more concentrated and bell-shaped around 7 — CLT in action.

## Q: In the chocolate-bar weight demo, individual error sources (weighing cocoa, weighing sugar, ...) are each **uniformly** distributed on [-1, 1]. What happens to the distribution of the total error once you sum up 100 such independent uniform error sources?
- [ ] It stays uniformly distributed, just wider
      Even though each error source is uniform, their sum becomes approximately normal — confirmed by the Q-Q plot.
- [x] It becomes approximately normally distributed — confirmed by the Q-Q plot lying on the diagonal
      Exactly! Summing many independent uniform errors gives an approximately normal total error.
- [ ] It becomes a Poisson distribution
      Even though each error source is uniform, their sum becomes approximately normal — confirmed by the Q-Q plot.

## Q: The plenum repeats the "mean of N samples" experiment starting from Normal, Poisson and t-distributed data. What is the common conclusion across all of them?
- [ ] Only data that starts out normal ends up with normal sample means
      The plenum shows the same pattern regardless of starting distribution: sample means cluster around the true mean with shrinking spread.
- [x] Regardless of the starting distribution, the sample means concentrate around the true mean with a spread shrinking like 1/√N — the CLT in action
      Correct! That is the universal message of the CLT, demonstrated across Normal, Poisson and t starting distributions.
- [ ] The sample mean is unrelated to the true mean
      The plenum shows the same pattern regardless of starting distribution: sample means cluster around the true mean with shrinking spread.
