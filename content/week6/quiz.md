# Quiz: The Central Limit Theorem
id: clt

## Q: In the coffee shop example, individual waiting times follow a right-skewed Gamma distribution. What does the Central Limit Theorem say about the distribution of *sample means* of waiting times as the sample size n grows?
lang: both
- [ ] It stays right-skewed, just like the individual waiting times
      The CLT says sample means become approximately normal, no matter the shape of the original distribution.
- [x] It becomes approximately normal, regardless of the shape of the original distribution
      Correct! That is the core statement of the CLT: the sample mean converges to a normal distribution.
- [ ] It becomes uniform
      The CLT says sample means become approximately normal, no matter the shape of the original distribution.

## Q: What is one essential condition for the Central Limit Theorem to hold?
lang: both
- [ ] The original variable must already be normally distributed
      The CLT explicitly requires the variables being averaged to be independent and identically distributed (i.i.d.).
- [x] The individual random variables being averaged must be independent and identically distributed (i.i.d.)
      Right! Independence and identical distribution of the underlying random variables are essential.
- [ ] The sample size must be exactly 30
      The CLT is an asymptotic theorem as n increases; n does not need to be any single fixed number.

## Q: Looking at the Q-Q plots for n = 2, n = 10 and n = 200 sample means, what pattern do you see?
lang: both
- [ ] The fit to the normal line gets worse as n increases
      As n grows, the Q-Q plot fits the diagonal (normal) line better and better.
- [x] The fit to the normal line gets better as n increases, becoming almost perfect at large n
      Exactly! Larger sample size n means a tighter fit to normality for the sample mean.
- [ ] n has no effect on the Q-Q plot
      As n grows, the Q-Q plot fits the diagonal (normal) line better and better.

## Q: How does the Central Limit Theorem mathematically define the distribution of the sample mean $\overline{X}$ for large $n$?
lang: both
- [ ] $\overline{X} \sim \mathcal{N}(\mu, \sigma^2)$
      The variance of the sample mean is divided by n, shrinking as sample size grows.
- [x] $\overline{X} \sim \mathcal{N}\left(\mu, \frac{\sigma^2}{n}\right)$
      Correct! The expected value is $\mu$ and the variance of the mean is $\sigma^2 / n$.
- [ ] $\overline{X} \sim \text{Pois}(\lambda = \mu)$
      The CLT states that the sample mean converges specifically to a Normal distribution.

# Quiz: Standard Error & Sample Size
id: se

## Q: What does the formula $\text{SE} = \sigma / \sqrt{n}$ tell you?
lang: both
- [x] The standard error shrinks as the sample size n grows
      Correct! Larger samples give more precise (less variable) estimates of the population mean.
- [ ] The standard error grows as the sample size n grows
      SE = σ/√n shrinks as n grows — more data means a more precise estimate of the mean.
- [ ] The standard error is independent of n
      SE = σ/√n shrinks as n grows — more data means a more precise estimate of the mean.

## Q: The exercise notes "diminishing returns": going from n=10 to n=20 helps more than going from n=80 to n=90. Why?
lang: both
- [x] Because SE depends on $\sqrt{n}$, so each additional observation reduces SE less and less at larger n
      Right! The square root creates diminishing returns on error reduction.
- [ ] Because software algorithms slow down at large sample sizes
      Because SE scales with 1/√n, each extra observation matters less as n grows.
- [ ] Because the true mean increases at large sample sizes
      Because SE scales with 1/√n, each extra observation matters less as n grows.

## Q: Does the *mean* of the sample means change as the sample size n increases?
lang: both
- [x] No — it stays centered on the true population mean $\mu$; only the spread (SE) shrinks
      Correct! The sample mean is an unbiased estimator: its expected value equals the true mean $\mu$.
- [ ] Yes — it increases proportionally with n
      The mean of sample means stays centered on the true population mean regardless of n.
- [ ] Yes — it decreases proportionally with n
      The mean of sample means stays centered on the true population mean regardless of n.

## Q: What is the crucial conceptual difference between the standard deviation (SD) and the standard error (SE)?
lang: both
- [ ] SD and SE are identical terms for the same metric
      SD measures data spread; SE measures estimation uncertainty of the mean.
- [x] SD measures the variability of individual observations in the population, whereas SE measures the uncertainty of the estimated mean
      Correct! SD describes the scatter of the underlying data points, while SE describes how much the sample mean fluctuates across repeated samples.
- [ ] SD decreases with $1/\sqrt{n}$, while SE remains constant
      SD stays roughly constant as a population property, while SE shrinks with sample size $n$.

# Quiz: Estimation and Bias
id: estimation

## Q: Why do we divide by $n - 1$ instead of $n$ when calculating the sample variance $s^2 = \frac{1}{n-1}\sum(x_i - \overline{x})^2$?
lang: both
- [ ] Because the last observation in any dataset is always an outlier
      Bessel's correction accounts for degrees of freedom, not corrupt data points.
- [x] Dividing by $n$ underestimates the true population variance; dividing by $n - 1$ makes the sample variance an unbiased estimator
      Correct! Using the sample mean $\overline{x}$ instead of the true mean $\mu$ removes one degree of freedom, requiring Bessel's correction ($n-1$).
- [ ] To ensure the calculated variance is always greater than the mean
      The correction purely removes the downward estimation bias.

## Q: How does R's built-in `var(x)` function compute variance by default?
lang: r
- [ ] It divides by $n$ (population variance)
      var() in R uses n - 1 (sample variance).
- [x] It divides by $n - 1$ (unbiased sample variance)
      Correct! `var()` in base R automatically applies Bessel's correction ($n-1$).
- [ ] It computes the Median Absolute Deviation (MAD)
      Use mad() for Median Absolute Deviation.

## Q: In Python, how do `numpy.var()` and `pandas.Series.var()` differ in their default divisor?
lang: python
- [ ] Both divide by $n - 1$ by default
      NumPy defaults to ddof=0, while pandas defaults to ddof=1.
- [x] `np.var(x)` divides by $n$ (`ddof=0`) by default, whereas `pd.Series(x).var()` divides by $n - 1$ (`ddof=1`)
      Correct! Be careful: NumPy computes the biased population variance by default unless you set `ddof=1`.
- [ ] Neither divides by $n - 1$; both require manual calculation
      Both libraries support Bessel's correction via the delta degrees of freedom parameter (`ddof`).

# Quiz: Confidence Intervals
id: ci

## Q: What does a "95% confidence interval" mean?
lang: both
- [ ] There is a 95% probability that any single future observation falls in this range
      A 95% CI means: repeat the sampling procedure many times, and ~95% of the resulting intervals contain the true parameter.
- [x] If we repeated the sampling procedure many times, about 95% of the constructed intervals would contain the true population parameter
      Correct! It is a frequentist statement about the long-run coverage of the method, not a single interval.
- [ ] The sample mean is wrong 95% of the time
      A 95% CI means: repeat the sampling procedure many times, and ~95% of the resulting intervals contain the true parameter.

## Q: In the coffee-cup example ($n = 9$ cups), why do we use the **t-distribution** with 8 degrees of freedom rather than the normal distribution to compute the critical value?
lang: both
- [x] Because the sample size is small, and the true standard deviation $\sigma$ is unknown and estimated from the sample
      Right! When $\sigma$ is replaced by the sample standard deviation $s$, the standardized statistic follows Student's t-distribution with $n-1$ degrees of freedom.
- [ ] Because volume measurements can only follow a t-distribution
      With small n and an unknown population SD, the t-distribution accounts for the extra uncertainty in estimating $\sigma$.
- [ ] Because degrees of freedom only exist for the normal distribution
      The normal distribution has no degrees of freedom; the t-distribution is parameterized by $df$.

## Q: How do you compute the critical value $t_{95}$ for a two-sided 95% confidence interval with $df = 8$ in R?
lang: r
- [ ] `pnorm(0.95)`
      pnorm computes probabilities from values; critical values require quantile functions (qt / qnorm).
- [x] `qt(0.975, df = 8)`
      Correct! A two-sided 95% interval leaves 2.5% in each tail, so we evaluate the 97.5th percentile ($1 - \alpha/2$).
- [ ] `qt(0.95, df = 8)`
      qt(0.95) would give the cutoff for a one-sided 95% interval (or an 90% two-sided interval).

## Q: How do you compute the critical value $t_{95}$ for a two-sided 95% confidence interval with $df = 8$ in Python?
lang: python
- [ ] `scipy.stats.norm.ppf(0.95)`
      A small sample with estimated $\sigma$ requires the t-distribution, and two-sided 95% requires quantile 0.975.
- [x] `scipy.stats.t.ppf(0.975, df=8)`
      Correct! For a two-sided 95% interval ($\alpha = 0.05$), evaluate the $1 - \alpha/2 = 0.975$ percentile.
- [ ] `scipy.stats.t.cdf(0.95, df=8)`
      .cdf() maps values to probabilities; .ppf() maps probabilities to critical values.

## Q: Comparing a 90% CI and a 95% CI computed from the same data, which one is wider?
lang: both
- [ ] The 90% CI is wider
      To be more confident of capturing the true value, the interval must be wider — 95% CI > 90% CI in width.
- [x] The 95% CI is wider — higher confidence requires a larger margin of error
      Correct! Higher confidence (95% > 90%) requires a larger critical value ($t_{95} > t_{90}$), making the interval wider.
- [ ] They are always exactly the same width
      To be more confident of capturing the true value, the interval must be wider — 95% CI > 90% CI in width.

# Quiz: Confidence Intervals for Count Data
id: poisson-ci

## Q: In the raisin bun example, you count $k = 20$ raisins in a single bun ($n = 1$). Assuming a Poisson distribution ($k \gg 1$), how is the 95% confidence interval for the mean $\mu$ estimated?
lang: both
- [ ] $[k - 1.96 \cdot k \, , \, k + 1.96 \cdot k]$
      For a Poisson distribution, the standard deviation is $\sqrt{\lambda} \approx \sqrt{k}$, not $k$ itself.
- [x] $[k - 1.96 \sqrt{k} \, , \, k + 1.96 \sqrt{k}]$
      Correct! Since $\sigma = \sqrt{\lambda} \approx \sqrt{k}$, the 95% interval for $n=1$ is $[20 - 1.96\sqrt{20}, 20 + 1.96\sqrt{20}] \approx [11.2, 28.8]$.
- [ ] $[k - 1.96 / \sqrt{k} \, , \, k + 1.96 / \sqrt{k}]$
      The standard error of a single Poisson count is $\sqrt{k}$, not $1/\sqrt{k}$.

## Q: If you count raisins across $n = 10$ buns and find an average $\overline{k} = 20.2$, how does the 95% CI change compared to inspecting a single bun?
lang: both
- [ ] It becomes wider because of extra variation between buns
      Averaging over more samples reduces the standard error of the mean.
- [x] It becomes substantially narrower because $\text{SE} = \sqrt{\overline{k}} / \sqrt{10}$, shrinking the margin of error
      Correct! Increasing the sample size to $n = 10$ divides the standard error by $\sqrt{10}$, narrowing the interval to $[17.4, 22.9]$.
- [ ] It stays the exact same width because the mean is still approximately 20
      Interval width is governed by standard error ($\sigma / \sqrt{n}$), which shrinks with $\sqrt{n}$.

# Quiz: Plenum Demos — CLT in Action
id: plenum

## Q: In the dice-sum ("Augensumme") plenum demo, rolling 2 dice and averaging over N repeated pairs of rolls, what happens to the distribution of the averaged sum as N grows from 1 to 100?
lang: both
- [ ] It stays exactly the same, uniformly spread between 2 and 12
      As N grows, the averaged dice sum becomes more concentrated and bell-shaped around 7 — CLT in action.
- [x] It becomes increasingly concentrated and bell-shaped around the theoretical mean of 7
      Correct! Averaging more dice rolls concentrates the result around the true mean of 7.
- [ ] It becomes more spread out and skewed
      As N grows, the averaged dice sum becomes more concentrated and bell-shaped around 7 — CLT in action.

## Q: In the chocolate-bar weight demo, individual error sources (weighing cocoa, weighing sugar, ...) are each **uniformly** distributed on [-1, 1]. What happens to the distribution of the total error once you sum up 100 such independent uniform error sources?
lang: both
- [ ] It stays uniformly distributed, just wider
      Even though each error source is uniform, their sum becomes approximately normal — confirmed by the Q-Q plot.
- [x] It becomes approximately normally distributed — confirmed by the Q-Q plot lying on the diagonal
      Exactly! Summing many independent uniform errors gives an approximately normal total error.
- [ ] It becomes a Poisson distribution
      Even though each error source is uniform, their sum becomes approximately normal — confirmed by the Q-Q plot.

## Q: The plenum repeats the "mean of N samples" experiment starting from Normal, Poisson and t-distributed data. What is the common conclusion across all of them?
lang: both
- [ ] Only data that starts out normal ends up with normal sample means
      The plenum shows the same pattern regardless of starting distribution: sample means cluster around the true mean with shrinking spread.
- [x] Regardless of the starting distribution, the sample means concentrate around the true mean with a spread shrinking like $1/\sqrt{N}$ — the CLT in action
      Correct! That is the universal message of the CLT, demonstrated across Normal, Poisson and t starting distributions.
- [ ] The sample mean is unrelated to the true mean
      The plenum shows the same pattern regardless of starting distribution: sample means cluster around the true mean with shrinking spread.
