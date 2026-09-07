# Quiz: Distribution Functions in R
id: functions

## Q: R's distribution functions share a root name prefixed by `p`, `d`, `q` or `r` (e.g. `pnorm`, `dnorm`, `qnorm`, `rnorm`). What does the `q`-prefix stand for?
- [ ] Quality of fit
      q- like quantile: qnorm() takes a probability and returns the corresponding value.
- [x] Quantile — the inverse of the cumulative distribution function
      Correct! q = quantile, the inverse of the cumulative distribution function.
- [ ] Quick random draw
      q- like quantile: qnorm() takes a probability and returns the corresponding value.

## Q: What does `pnorm(1.9, mean=1.75, sd=0.15, lower.tail=FALSE)` compute?
- [x] The probability of a value being greater than 1.9
      Correct! lower.tail=FALSE flips pnorm() to give P(X > x).
- [ ] The probability of a value being less than 1.9
      lower.tail=FALSE means we want the probability above the value, not below it.
- [ ] A random sample from the distribution
      lower.tail=FALSE means we want the probability above the value, not below it.

## Q: What does `qnorm(c(0.25, 0.5, 0.75), mean=2, sd=1)` return?
- [ ] The cumulative probabilities at x = 0.25, 0.5, 0.75
      qnorm() goes from probability to value — the opposite direction of pnorm().
- [x] The x-values corresponding to the 25th, 50th and 75th percentiles of that normal distribution
      Exactly! qnorm() is the inverse CDF — probabilities in, values out.
- [ ] Three random draws from the distribution
      qnorm() goes from probability to value — the opposite direction of pnorm().

# Quiz: Binomial & Negative Binomial
id: binomial

## Q: What does `dbinom(5, size=5, prob=0.5)` compute?
- [x] The probability of getting exactly 5 successes out of 5 trials
      Correct! dbinom() gives the probability of exactly that many successes.
- [ ] The probability of getting 5 or fewer successes out of 5 trials
      dbinom() is the density/probability mass function — probability of exactly k successes.
- [ ] The expected number of successes
      dbinom() is the density/probability mass function — probability of exactly k successes.

## Q: A footballer scores 90% of penalties (p = 0.9) and takes 20 in training (L = 20). Using `E(X) = L·p`, the expected number of goals is 18. What do `L` and `p` represent in the binomial distribution?
- [x] `L` = number of independent trials, `p` = probability of success on each trial
      Right! L = trials, p = success probability per trial.
- [ ] `L` = number of successes, `p` = number of trials
      L is the number of trials (here: penalties taken), p is the per-trial success probability.
- [ ] `L` and `p` are interchangeable
      L is the number of trials (here: penalties taken), p is the per-trial success probability.

## Q: What does the negative binomial distribution describe?
- [ ] The probability of exactly k successes in a fixed number of trials
      Negative binomial = number of trials/failures needed to reach a fixed number of successes r.
- [x] The number of failures (or trials) needed to reach a fixed number of successes `r`
      Correct! It models the waiting time (failures/trials) until r successes.
- [ ] The probability that a continuous variable falls below a threshold
      Negative binomial = number of trials/failures needed to reach a fixed number of successes r.

# Quiz: Poisson Distribution
id: poisson

## Q: The Poisson distribution has a single parameter λ, with `E(X) = Var(X) = λ`. In the gene mutation example, what did λ represent?
- [ ] The probability of any single mutation occurring
      λ is the expected (average) number of events — here, mutations per generation.
- [x] The average (expected) number of mutations accumulated after one generation
      Correct! λ is the average/expected count in the interval.
- [ ] The total number of genes in the genome
      λ is the expected (average) number of events — here, mutations per generation.

## Q: What does `ppois(q = 10, lambda = 30)` compute?
- [ ] The probability of observing exactly 10 events
      ppois() is the cumulative distribution function: P(X ≤ q). For exactly 10, you would use dpois().
- [x] The probability of observing 10 or fewer events, given an average rate of 30
      Right! ppois() is cumulative — 10 or fewer events.
- [ ] A random draw from a Poisson distribution
      ppois() is the cumulative distribution function: P(X ≤ q). For exactly 10, you would use dpois().

## Q: On average 50 students attend a lecture. Which function computes the probability that *exactly* 60 students show up?
- [x] `dpois(60, lambda = 50)`
      Correct! dpois() gives the probability of an exact count.
- [ ] `ppois(60, lambda = 50)`
      "Exactly 60" needs the density function dpois(), not the cumulative ppois().
- [ ] `rpois(60, lambda = 50)`
      "Exactly 60" needs the density function dpois(), not the cumulative ppois().

# Quiz: Normal & t-Distribution
id: normal

## Q: In the TP53 gene expression example, why can we use the sample mean and standard deviation from 586 patients as `mu` and `sigma` of a normal distribution model?
- [x] Because we cannot measure every lung cancer patient in the world, so the sample statistics estimate the population parameters
      Correct! Sample statistics are our best estimate of the population parameters.
- [ ] Because R requires exactly 586 data points for `dnorm()`
      We use the sample mean/sd as estimates of the unknown population mean/sd, since we cannot measure everyone.
- [ ] Because normal distributions only work with gene expression data
      We use the sample mean/sd as estimates of the unknown population mean/sd, since we cannot measure everyone.

## Q: What makes the **standard** normal distribution special?
- [x] It has mean = 0 and standard deviation = 1
      Correct! mu = 0, sigma = 1 defines the standard normal distribution.
- [ ] It only applies to sample sizes below 30
      The standard normal distribution is defined by mean = 0 and sd = 1.
- [ ] It has no variance
      The standard normal distribution is defined by mean = 0 and sd = 1.

## Q: What happens to the t-distribution as the degrees of freedom increase?
- [ ] Its tails get wider and wider
      As degrees of freedom grow, the t-distribution's tails shrink and it approaches the standard normal.
- [x] It converges towards the standard normal distribution
      Exactly! For df = 100 the t-distribution is already very close to N(0,1).
- [ ] It becomes a Poisson distribution
      As degrees of freedom grow, the t-distribution's tails shrink and it approaches the standard normal.

# Quiz: Relationships Between Distributions (Plenum)
id: relationships

## Q: Under what condition does the Poisson distribution become approximately equivalent to a Normal distribution?
- [x] When λ is large (λ ≫ 1)
      Correct! For large λ, Poisson(λ) ≈ Normal(λ, √λ).
- [ ] When λ = 0
      The plenum showed Poisson(λ) approaches Normal(λ, √λ) as λ gets large.
- [ ] Only for discrete data
      The plenum showed Poisson(λ) approaches Normal(λ, √λ) as λ gets large.

## Q: A Binomial(n, p) distribution converges to a Poisson(λ = np) distribution under which condition?
- [ ] When p = 0.5 exactly
      Binom(n,p) → Pois(λ=np) as n → ∞ with np held constant — many rare-event trials.
- [x] When the number of trials n → ∞ while n·p stays constant (equal to λ)
      Right! Many trials, small per-trial probability, constant np = λ.
- [ ] Never — Binomial and Poisson are unrelated
      Binom(n,p) → Pois(λ=np) as n → ∞ with np held constant — many rare-event trials.

## Q: In a Q-Q plot comparing quantiles from two distributions, what does it mean when the points fall closely along the diagonal line?
- [ ] The two distributions are unrelated
      A close-to-diagonal Q-Q plot indicates the two distributions being compared are very similar.
- [x] The two distributions are very similar to each other
      Correct! Points hugging the diagonal mean the two distributions match closely.
- [ ] One distribution has twice the variance of the other
      A close-to-diagonal Q-Q plot indicates the two distributions being compared are very similar.
