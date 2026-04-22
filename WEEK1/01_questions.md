---
title: "Plenum 1 - 2025"
author: "Carl Herrmann"
date: "2025-10-23"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


## Question 1: Which measure of spread is MOST robust to outliers?

We can create a random dataset to illustrate the question on the most robust measures

We create 2 datasets, one with and one without outliers

```{r}
# Create data without outliers
set.seed(123)
data1 <- rnorm(100, mean = 50, sd = 5) # 100 random numbers sampled from normal distribution

# Create data with outliers
data2 <- c(data1, 80, 100, 120)  # Add 3 extreme outliers
```

### Compute measures without outliers

```{r}
# A. Standard deviation
sd1 <- sd(data1)

# B. 10%-90% quantile spread  
q90_1 <- quantile(data1, 0.9)
q10_1 <- quantile(data1, 0.1)
spread1 <- as.numeric(q90_1 - q10_1)

# D. MAD
q75_1 <- quantile(data1, 0.75)
q25_1 <- quantile(data1, 0.25)

mad1 <- mad(data1)

# E. Range
range1 <- max(data1) - min(data1)
```

```{r}
measures1 <- c(SD=sd1,Spread=spread1,Median=med1,MAD=mad1,Range=range1)
measures1
```
### Compute measures with outliers

```{r}
# A. Standard deviation
sd2 <- sd(data2)

# B. 10%-90% quantile spread  
q90_2 <- quantile(data2, 0.9)
q10_2 <- quantile(data2, 0.1)
spread2 <- as.numeric(q90_2 - q10_2)

# C. Median (not a spread measure!)
med2 <- median(data2)

# D. MAD
q75_2 <- quantile(data2, 0.75)
q25_2 <- quantile(data2, 0.25)

mad2 <- mad(data2)

# E. Range
range2 <- max(data2) - min(data2)
```

```{r}
measures2 <- c(SD=sd2,Spread=spread2,Median=med2,MAD=mad2,Range=range2)
measures2
```

## Question 2

```{r}
# Illustrating the relationship between Mode, Median, and Mean
# for theoretical density distributions using simple base R plots

# ============================================================
# 1. SYMMETRIC DISTRIBUTION (Normal Distribution)
# ============================================================
# Parameters: mean = 100, sd = 15
sym_mean <- 100
sym_median <- 100
sym_mode <- 100

sym_x <- seq(sym_mean - 4*15, sym_mean + 4*15, length.out = 1000)
sym_y <- dnorm(sym_x, mean = sym_mean, sd = 15)

# ============================================================
# 2. RIGHT-SKEWED DISTRIBUTION (Exponential)
# ============================================================
# Exponential distribution: mean = 1/rate, mode = 0
right_mean <- 50
right_median <- 50 * log(2)  # median of exponential with rate 0.02
right_mode <- 0

right_x <- seq(0, 300, length.out = 1000)
right_y <- dexp(right_x, rate = 1/right_mean)

# ============================================================
# 3. LEFT-SKEWED DISTRIBUTION (Beta distribution)
# ============================================================
# Beta with shape1=2, shape2=5, scaled to [0, 100]
# For Beta(2,5): mode = (2-1)/(2+5-2) = 1/5 = 0.2, so mode = 20
left_shape1 <- 5
left_shape2 <- 2
left_mode <- ((left_shape1 - 1) / (left_shape1 + left_shape2 - 2)) * 100
left_mean <- (left_shape1 / (left_shape1 + left_shape2)) * 100
# For beta distribution, median needs to be computed numerically
left_median <- qbeta(0.5, left_shape1, left_shape2) * 100

left_x <- seq(0, 100, length.out = 1000)
left_y <- dbeta(left_x / 100, shape1 = left_shape1, shape2 = left_shape2) / 100

# ============================================================
# CREATE VISUALIZATIONS WITH BASE R
# ============================================================

# Set up a 1x3 layout for three plots
par(mfrow = c(3, 1), mar = c(5, 4, 4, 2), oma = c(0, 0, 2, 0))

# Plot 1: Symmetric Distribution
plot(sym_x, sym_y, main = "Symmetric\n(Normal Distribution)", 
     xlab = "Value", ylab = "Density", 
     type = "l", col = "steelblue", lwd = 2.5)
abline(v = sym_mean, col = "red", lwd = 2, lty = 1)
abline(v = sym_median, col = "green", lwd = 2, lty = 2)
abline(v = sym_mode, col = "orange", lwd = 2, lty = 3)
legend("topright", legend = c("Mean", "Median", "Mode"), 
       col = c("red", "green", "orange"), lty = c(1, 2, 3), lwd = 2, cex = 0.8)

# Plot 2: Right-Skewed Distribution
plot(right_x, right_y, main = "Right-Skewed\n(Exponential Distribution)", 
     xlab = "Value", ylab = "Density", 
     type = "l", col = "steelblue", lwd = 2.5)
abline(v = right_mean, col = "red", lwd = 2, lty = 1)
abline(v = right_median, col = "green", lwd = 2, lty = 2)
abline(v = right_mode, col = "orange", lwd = 2, lty = 3)
legend("topright", legend = c("Mean", "Median", "Mode"), 
       col = c("red", "green", "orange"), lty = c(1, 2, 3), lwd = 2, cex = 0.8)

# Plot 3: Left-Skewed Distribution
plot(left_x, left_y, main = "Left-Skewed\n(Beta Distribution)", 
     xlab = "Value", ylab = "Density", 
     type = "l", col = "steelblue", lwd = 2.5)
abline(v = left_mean, col = "red", lwd = 2, lty = 1)
abline(v = left_median, col = "green", lwd = 2, lty = 2)
abline(v = left_mode, col = "orange", lwd = 2, lty = 3)
legend("topright", legend = c("Mean", "Median", "Mode"), 
       col = c("red", "green", "orange"), lty = c(1, 2, 3), lwd = 2, cex = 0.8)

```


## Question 4

```{r}
# Set seed for reproducibility
set.seed(123)

# Simulate gene expression for 200 genes over 10 samples
# Using negative binomial distribution (common for RNA-seq data)
n_genes <- 200
n_samples <- 10

# Create empty matrix
expression_matrix <- matrix(0, nrow = n_genes, ncol = n_samples)

# Simulate different mean expression levels for each gene
gene_means <- runif(n_genes, min = 1, max = 100)

# Fill the matrix - variance increases with mean
for (i in 1:n_genes) {
  # For RNA-seq: variance = mean + dispersion * mean^2
  # Using negative binomial
  expression_matrix[i,] <- rnbinom(n_samples, 
                                   mu = gene_means[i], 
                                   size = 5)  # dispersion parameter
}

#expression_matrix <- matrix(rnorm(n_genes*n_samples), nrow = n_genes, ncol = n_samples)


# Calculate mean and variance for each gene
mean_expression <- rowMeans(expression_matrix)
var_expression <- apply(expression_matrix, 1, var)

# Plot the relationship
plot(mean_expression, var_expression,
     xlab = "Mean Expression",
     ylab = "Variance",
     main = "Mean-Variance Relationship in Gene Expression",
     pch = 16, col = "blue")

# Add a reference line for Poisson (variance = mean)
abline(a = 0, b = 1, col = "red", lty = 2, lwd = 2)

# Add the actual trend line
fit <- lm(var_expression ~ mean_expression)
abline(fit, col = "green", lwd = 2)

# Add legend
legend("topleft", 
       legend = c("Genes", "Poisson (Var=Mean)", "Actual trend"),
       col = c("blue", "red", "green"),
       pch = c(16, NA, NA),
       lty = c(NA, 2, 1),
       lwd = c(NA, 2, 2))

# Show that variance > mean (overdispersion)
cat("Mean of all genes:", round(mean(mean_expression), 2), "\n")
cat("Mean variance:", round(mean(var_expression), 2), "\n")
cat("\nVariance is typically HIGHER than mean in gene expression!\n")


```


## Question 5

```{r}
# Create sample data with different characteristics
set.seed(123)

# Dataset 1: Normal distribution
data1 <- rnorm(100, mean = 50, sd = 10)

# Dataset 2: Same box statistics but bimodal
data2 <- c(rnorm(50, mean = 40, sd = 3), 
           rnorm(50, mean = 60, sd = 3))

# Dataset 3: Same box statistics but different sample size
data3 <- rnorm(20, mean = 50, sd = 10)

# Dataset 4: Skewed distribution
data4 <- rgamma(100, shape = 2, rate = 0.04)

# Create a figure with multiple panels
par(mfrow = c(1, 4))

# Row 1: Standard boxplots
boxplot(data1, main = "Normal (n=100)", ylim = c(20, 80))
boxplot(data2, main = "Bimodal (n=100)", ylim = c(20, 80))
boxplot(data3, main = "Normal (n=20)", ylim = c(20, 80))
boxplot(data4, main = "Skewed (n=100)", ylim = c(20, 80))

# Row 2: Improved versions
# Add points
boxplot(data1, main = "With points", ylim = c(20, 80))
points(jitter(rep(1, length(data1)), amount = 0.1), data1, 
       col = "blue", pch = 16, cex = 0.5)

boxplot(data2, main = "Shows bimodality!", ylim = c(20, 80))
points(jitter(rep(1, length(data2)), amount = 0.1), data2, 
       col = "red", pch = 16, cex = 0.5)

boxplot(data3, main = "Shows n=20", ylim = c(20, 80))
points(jitter(rep(1, length(data3)), amount = 0.1), data3, 
       col = "black", pch = 16, cex = 0.5)

boxplot(data4, main = "Shows skewness", ylim = c(20, 80))
points(jitter(rep(1, length(data4)), amount = 0.1), data4, 
       col = "purple", pch = 16, cex = 0.5)

# Better visualization: Violin plots
library(vioplot)
par(mfrow = c(1, 3))

# Compare boxplot vs violin plot
par(mfrow = c(2, 2))

# Bimodal example
boxplot(data2, main = "Boxplot: Hides bimodality")
vioplot(data2, main = "Violin plot: Shows bimodality!", 
        col = "lightblue")

# Sample size example  
boxplot(list(data1, data3), names = c("n=100", "n=20"),
        main = "Boxplot: Can't see sample size")

plot(1, type = "n", xlim = c(0.5, 2.5), ylim = c(20, 80),
     xlab = "", ylab = "", xaxt = "n",
     main = "Points show sample size difference")
axis(1, at = c(1, 2), labels = c("n=100", "n=20"))
points(jitter(rep(1, 100), 0.1), data1, col = "blue", pch = 16, cex = 0.5)
points(jitter(rep(2, 20), 0.1), data3, col = "red", pch = 16, cex = 0.5)

# Final example: All improvements combined
par(mfrow = c(1, 1))
boxplot(list(data1, data2), names = c("Normal", "Bimodal"),
        main = "Improved: Box + Points + Sample Size",
        ylim = c(20, 80))

# Add points
points(jitter(rep(1, 100), 0.2), data1, col = rgb(0,0,1,0.3), pch = 16)
points(jitter(rep(2, 100), 0.2), data2, col = rgb(1,0,0,0.3), pch = 16)

# Add sample size
text(1, 25, paste("n =", length(data1)), cex = 0.8)
text(2, 25, paste("n =", length(data2)), cex = 0.8)

# Add mean as well
points(1, mean(data1), pch = 18, cex = 2, col = "darkblue")
points(2, mean(data2), pch = 18, cex = 2, col = "darkred")
legend("topright", legend = c("Median", "Mean"), 
       pch = c(NA, 18), lty = c(1, NA), cex = 0.8)
```

