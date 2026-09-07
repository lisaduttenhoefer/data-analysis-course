# Quiz: Distribution Functions and Syntax
id: functions

## Q: R's distribution functions share a root name prefixed by `p`, `d`, `q` or `r` (e.g. `pnorm`, `dnorm`, `qnorm`, `rnorm`). What does the `q`-prefix stand for?
lang: r
- [ ] Quality of fit
      q- like quantile: qnorm() takes a probability and returns the corresponding value.
- [x] Quantile — the inverse of the cumulative distribution function
      Correct! q = quantile, the inverse of the cumulative distribution function.
- [ ] Quick random draw
      q- like quantile: qnorm() takes a probability and returns the corresponding value.

## Q: In Python's `scipy.stats` distributions (e.g. `scipy.stats.norm`), which method corresponds to R's `q`-prefix (quantile / inverse CDF)?
lang: python
- [ ] `.cdf()`
      .cdf() is the cumulative distribution function (equivalent to R's p-prefix).
- [x] `.ppf()` (Percent Point Function)
      Correct! ppf() is the inverse of the CDF, returning the quantile corresponding to a probability.
- [ ] `.pdf()`
      .pdf() is the probability density function (equivalent to R's d-prefix).
- [ ] `.rvs()`
      .rvs() draws random variates (equivalent to R's r-prefix).

## Q: What does `pnorm(1.9, mean=1.75, sd=0.15, lower.tail=FALSE)` compute?
lang: r
- [x] The probability of a value being greater than 1.9
      Correct! lower.tail=FALSE flips pnorm() to give P(X > x).
- [ ] The probability of a value being less than 1.9
      lower.tail=FALSE means we want the probability above the value, not below it.
- [ ] A random sample from the distribution
      lower.tail=FALSE means we want the probability above the value, not below it.

## Q: In `scipy.stats`, which call computes the probability of obtaining a value strictly greater than 1.9 from $\mathcal{N}(1.75, 0.15)$?
lang: python
- [ ] `stats.norm.cdf(1.9, loc=1.75, scale=0.15)`
      cdf() calculates P(X <= x); to get P(X > x) use survival function sf() or 1 - cdf().
- [x] `stats.norm.sf(1.9, loc=1.75, scale=0.15)` (or `1 - stats.norm.cdf(...)`)
      Correct! .sf() is the survival function, giving P(X > x), equivalent to lower.tail=FALSE in R.
- [ ] `stats.norm.pdf(1.9, loc=1.75, scale=0.15)`
      .pdf() gives the height of the probability density at 1.9, not the cumulative tail area.

## Q: What does `qnorm(c(0.25, 0.5, 0.75), mean=2, sd=1)` return?
lang: r
- [ ] The cumulative probabilities at x = 0.25, 0.5, 0.75
      qnorm() goes from probability to value — the opposite direction of pnorm().
- [x] The x-values corresponding to the 25th, 50th and 75th percentiles of that normal distribution
      Exactly! qnorm() is the inverse CDF — probabilities in, values out.
- [ ] Three random draws from the distribution
      qnorm() goes from probability to value — the opposite direction of pnorm().

## Q: What does `stats.norm.ppf([0.25, 0.5, 0.75], loc=2, scale=1)` return?
lang: python
- [ ] An array of cumulative tail probabilities
      .cdf() yields probabilities; .ppf() yields values along the x-axis.
- [x] The data values corresponding to the 25th, 50th, and 75th percentiles (quartiles)
      Correct! ppf() maps probabilities back to the domain of the variable.
- [ ] Three pseudo-random numbers drawn from the normal distribution
      Random values are drawn with .rvs(), not .ppf().

# Quiz: Binomial & Negative Binomial
id: binomial

## Q: What does `dbinom(5, size=5, prob=0.5)` compute?
lang: r
- [x] The probability of getting exactly 5 successes out of 5 trials
      Correct! dbinom() gives the probability of exactly that many successes.
- [ ] The probability of getting 5 or fewer successes out of 5 trials
      dbinom() is the density/probability mass function — probability of exactly k successes.
- [ ] The expected number of successes
      dbinom() is the density/probability mass function — probability of exactly k successes.

## Q: Which `scipy.stats` call calculates the probability of obtaining exactly 5 successes in 5 trials ($p = 0.5$)?
lang: python
- [ ] `stats.binom.cdf(5, n=5, p=0.5)`
      .cdf() calculates P(X <= 5), which is 1.0 here; for an exact count use pmf().
- [x] `stats.binom.pmf(5, n=5, p=0.5)`
      Correct! .pmf() computes the probability mass function for discrete distributions at an exact integer.
- [ ] `stats.binom.pdf(5, n=5, p=0.5)`
      Discrete distributions in scipy.stats use .pmf(), not .pdf().

## Q: A footballer scores 90% of penalties (p = 0.9) and takes 20 in training (L = 20). Using `E(X) = L·p`, the expected number of goals is 18. What do `L` and `p` represent in the binomial distribution?
lang: both
- [x] `L` = number of independent trials, `p` = probability of success on each trial
      Right! L = trials, p = success probability per trial.
- [ ] `L` = number of successes, `p` = number of trials
      L is the number of trials (here: penalties taken), p is the per-trial success probability.
- [ ] `L` and `p` are interchangeable
      L is the number of trials (here: penalties taken), p is the per-trial success probability.

## Q: What does the negative binomial distribution describe?
lang: both
- [ ] The probability of exactly k successes in a fixed number of trials
      Negative binomial = number of trials/failures needed to reach a fixed number of successes r.
- [x] The number of failures (or trials) needed to reach a fixed number of successes `r`
      Correct! It models the waiting time (failures/trials) until r successes.
- [ ] The probability that a continuous variable falls below a threshold
      Negative binomial = number of trials/failures needed to reach a fixed number of successes r.

# Quiz: Poisson Distribution
id: poisson

## Q: The Poisson distribution has a single parameter λ, with `E(X) = Var(X) = λ`. In the gene mutation example, what did λ represent?
lang: both
- [ ] The probability of any single mutation occurring
      λ is the expected (average) number of events — here, mutations per generation.
- [x] The average (expected) number of mutations accumulated after one generation
      Correct! λ is the average/expected count in the interval.
- [ ] The total number of genes in the genome
      λ is the expected (average) number of events — here, mutations per generation.

## Q: What does `ppois(q = 10, lambda = 30)` compute?
lang: r
- [ ] The probability of observing exactly 10 events
      ppois() is the cumulative distribution function: P(X ≤ q). For exactly 10, you would use dpois().
- [x] The probability of observing 10 or fewer events, given an average rate of 30
      Right! ppois() is cumulative — 10 or fewer events.
- [ ] A random draw from a Poisson distribution
      ppois() is the cumulative distribution function: P(X ≤ q). For exactly 10, you would use dpois().

## Q: What does `stats.poisson.cdf(10, mu=30)` calculate in Python?
lang: python
- [ ] The probability of observing exactly 10 events
      For an exact count use stats.poisson.pmf(10, mu=30).
- [x] The cumulative probability $P(X \le 10)$ given an average rate $\lambda = 30$
      Correct! cdf() computes the cumulative sum of probabilities up to 10 events.
- [ ] A simulated count generated from a Poisson process
      Simulating draws is performed via stats.poisson.rvs(mu=30).

## Q: On average 50 students attend a lecture. Which function computes the probability that *exactly* 60 students show up?
lang: r
- [x] `dpois(60, lambda = 50)`
      Correct! dpois() gives the probability of an exact count.
- [ ] `ppois(60, lambda = 50)`
      "Exactly 60" needs the density function dpois(), not the cumulative ppois().
- [ ] `rpois(60, lambda = 50)`
      "Exactly 60" needs the density function dpois(), not the cumulative ppois().

## Q: If an event occurs on average 50 times ($\lambda = 50$), which SciPy method computes the probability of observing *exactly* 60 events?
lang: python
- [x] `stats.poisson.pmf(60, mu=50)`
      Correct! .pmf() computes the probability of a discrete count equal to exactly 60.
- [ ] `stats.poisson.cdf(60, mu=50)`
      .cdf() yields the cumulative probability P(X <= 60).
- [ ] `stats.poisson.sf(60, mu=50)`
      .sf() yields the upper tail probability P(X > 60).

# Quiz: Over-Dispersion & Count Modeling
id: overdispersion

## Q: In RNA-seq experiments, why is the Negative Binomial distribution used instead of the Poisson distribution?
lang: both
- [ ] Because Poisson distributions cannot handle integer counts
      Poisson distributions specifically model discrete non-negative integer counts.
- [x] Because biological replicates exhibit over-dispersion, meaning variance is substantially larger than the mean ($\text{Var}(X) > E(X)$)
      Correct! In real RNA-seq data, biological variability inflates the variance far above the Poisson expectation ($\text{Var} = \lambda$).
- [ ] Because Negative Binomial models are continuous rather than discrete
      Both Poisson and Negative Binomial are discrete count distributions.

## Q: For a Poisson distribution, how does the variance relate to the expectation?
lang: both
- [ ] $\text{Var}(X) = (1 - p) \cdot E(X)$
      That relation describes the Binomial distribution.
- [x] $\text{Var}(X) = E(X) = \lambda$
      Correct! A defining property of the Poisson distribution is that mean and variance are equal.
- [ ] $\text{Var}(X) = \frac{E(X)}{p^2}$
      That relation describes over-dispersed Negative Binomial scaling.

## Q: When plotting $\log(\text{variance})$ against $\log(\text{mean})$ across all transcripts in RNA-seq replicates, what is observed?
lang: both
- [ ] All transcripts fall exactly on the identity line $y = x$
      Falling on $y = x$ would mean variance equals mean (Poisson behavior), which does not hold for biological replicates.
- [x] Points lie systematically above the line $y = x$, confirming over-dispersion across expression levels
      Correct! Biological variance exceeds mean expression across nearly all genes, requiring an extra dispersion parameter.
- [ ] High-expression transcripts have variance near zero
      Variance increases with mean expression; it does not drop to zero.

# Quiz: Normal & t-Distribution
id: normal

## Q: In the TP53 gene expression example, why can we use the sample mean and standard deviation from 586 patients as `mu` and `sigma` of a normal distribution model?
lang: both
- [x] Because we cannot measure every lung cancer patient in the world, so the sample statistics estimate the population parameters
      Correct! Sample statistics are our best estimate of the population parameters.
- [ ] Because R and Python require exactly 586 data points to define a normal distribution
      Distribution functions accept theoretical parameters regardless of sample size.
- [ ] Because normal distributions only work with gene expression data
      Normal distributions model continuous variables across many domains.

## Q: What makes the **standard** normal distribution special?
lang: both
- [x] It has mean $\mu = 0$ and standard deviation $\sigma = 1$
      Correct! $\mu = 0, \sigma = 1$ defines the standard normal distribution $\mathcal{N}(0, 1)$.
- [ ] It only applies to sample sizes below 30
      The standard normal distribution is defined by mean = 0 and sd = 1.
- [ ] It has zero variance
      Variance of the standard normal distribution is $\sigma^2 = 1$.

## Q: What percentage of the area under a standard normal distribution falls within $[-1.96, +1.96]$ standard deviations?
lang: both
- [ ] 68.0%
      68% falls within $[-1, +1]$ standard deviations.
- [ ] 90.0%
      90% falls within $[-1.64, +1.64]$ standard deviations.
- [x] 95.0%
      Correct! $z = \pm 1.96$ leaves 2.5% in each tail, encompassing exactly 95% of the total probability area.
- [ ] 99.7%
      99.7% falls within $[-3, +3]$ standard deviations.

## Q: What happens to Student's t-distribution as the degrees of freedom ($df$) increase towards infinity?
lang: both
- [ ] Its tails become progressively heavier
      Tails shrink as sample size and degrees of freedom grow.
- [x] It converges towards the standard normal distribution $\mathcal{N}(0, 1)$
      Exactly! With large degrees of freedom ($df \ge 100$), the t-distribution becomes indistinguishable from $\mathcal{N}(0, 1)$.
- [ ] It transforms into a discrete Poisson distribution
      The t-distribution is continuous and converges to the continuous normal distribution.

# Quiz: Relationships Between Distributions
id: relationships

## Q: Under what condition does the Poisson distribution become approximately equivalent to a Normal distribution?
lang: both
- [x] When $\lambda$ is large ($\lambda \gg 1$)
      Correct! For large $\lambda$, $\text{Pois}(\lambda) \approx \mathcal{N}(\lambda, \sqrt{\lambda})$.
- [ ] When $\lambda = 0$
      At $\lambda = 0$ the distribution collapses to a point mass at zero.
- [ ] Only when counts are transformed to negative ranks
      Poisson convergence to normal occurs on raw values as $\lambda$ grows.

## Q: A $\text{Binomial}(n, p)$ distribution converges to a $\text{Poisson}(\lambda = np)$ distribution under which condition?
lang: both
- [ ] When $p = 0.5$ exactly
      Binom(n,p) → Pois(λ=np) requires rare events with large trial counts.
- [x] When the number of trials $n \to \infty$ while $n \cdot p$ stays constant (equal to $\lambda$)
      Right! Many independent trials with a small per-trial probability converge to a Poisson rate.
- [ ] Never — Binomial and Poisson are fundamentally incompatible
      Poisson is mathematically derived as the limiting law of the Binomial for rare events.

## Q: In a Q-Q plot comparing quantiles from two distributions, what does it mean when the points fall closely along the diagonal line?
lang: both
- [ ] The two distributions are independent
      Q-Q plots evaluate distributional shapes, not stochastic independence[cite: 2, 5].
- [x] The two distributions have very similar shapes
      Correct! Points hugging the diagonal line indicate that the empirical quantiles match the theoretical quantiles[cite: 2, 5].
- [ ] One distribution has twice the variance of the other
      Different variances cause points to deviate from the slope = 1 line[cite: 2, 5].
