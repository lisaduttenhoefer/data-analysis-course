# Quiz: Simple Linear Regression
id: simple

## Q: What does `lm(chol ~ glyhb, data = dat)` do?
lang: r
- [x] Fits a linear regression model predicting cholesterol from glycosylated hemoglobin
      Correct! lm(y ~ x) fits a linear model of y on x.
- [ ] Computes the correlation between the two variables only
      lm(chol ~ glyhb, data=dat) fits a linear regression predicting chol from glyhb.
- [ ] Removes missing values from the dataset
      lm(chol ~ glyhb, data=dat) fits a linear regression predicting chol from glyhb.

## Q: How do you fit an Ordinary Least Squares (OLS) regression predicting `chol` from `glyhb` using `statsmodels` in Python?
lang: python
- [x] `smf.ols('chol ~ glyhb', data=dat).fit()`
      Correct! statsmodels.formula.api uses the formula interface 'y ~ x' matching R's syntax.
- [ ] `dat.corr('chol', 'glyhb')`
      .corr() computes correlation coefficients, not an OLS regression model.
- [ ] `scipy.stats.linregress(dat)`
      linregress takes two 1D sequences, whereas smf.ols fits models from DataFrames via formula syntax.

## Q: In simple linear regression $Y = b_0 + b_1 X$, how is the slope $b_1$ related to the Pearson correlation $r$?
lang: both
- [ ] $b_1 = r$ regardless of the units of measurement
      The slope depends on the measurement units of X and Y, whereas r is dimensionless.
- [x] $b_1 = r \cdot \frac{s_Y}{s_X}$, scaling correlation by the ratio of standard deviations
      Correct! The least-squares slope adjusts the scale-free correlation $r$ by the ratio of standard deviations $s_Y / s_X$.
- [ ] $b_1 = r^2$
      $r^2$ equals the coefficient of determination $R^2$, not the slope $b_1$.

## Q: Which two assumptions should you check on the residuals of a linear regression?
lang: both
- [x] The residuals should be normally distributed, and uncorrelated with the explanatory variable
      Right! Normal residuals + no correlation with the predictor ($E(e) = 0$, $\text{cor}(X, e) = 0$).
- [ ] The residuals should always be exactly zero
      Check that residuals are normally distributed and uncorrelated with the explanatory variable.
- [ ] The residuals should be perfectly correlated with the outcome variable
      Check that residuals are normally distributed and uncorrelated with the explanatory variable.

## Q: For a *simple* linear regression (one explanatory variable), how does the p-value of the t-test for the slope compare to the p-value of the overall F-test?
lang: both
- [x] They are identical
      Exactly! With one predictor, the t-test for $b_1$ and the overall F-test yield the exact same p-value ($F = t^2$).
- [ ] The t-test p-value is always much smaller
      For simple regression (1 predictor), the slope's t-test p-value equals the overall F-test p-value.
- [ ] They are unrelated
      For simple regression (1 predictor), the slope's t-test p-value equals the overall F-test p-value.

# Quiz: Variance Decomposition & Correlation Test
id: vardec

## Q: How is the total variance of the response variable $Y$ decomposed in linear regression?
lang: both
- [ ] $SS_T = SS_M - SS_R$
      The total sum of squares is the sum of model and residual squares, not their difference.
- [x] $SS_T = SS_M + SS_R$ (Total Sum of Squares = Model Sum of Squares + Residual Sum of Squares)
      Correct! Because predicted values $\hat{Y}$ and residuals $e$ are uncorrelated, total variance cleanly splits into explained ($SS_M$) and unexplained ($SS_R$).
- [ ] $SS_T = \frac{SS_M}{SS_R}$
      The ratio of mean squares defines the F-statistic, not total sum of squares.

## Q: What does the coefficient of determination $R^2$ represent in a linear regression model?
lang: both
- [ ] The probability that the true slope is zero
      p-values represent probabilities under H0; $R^2$ measures explained variance.
- [x] The proportion of total variance in $Y$ explained by the model ($R^2 = SS_M / SS_T = r^2$)
      Correct! $R^2 \in [0, 1]$ quantifies the proportion of variation captured by the regression line.
- [ ] The standard deviation of the residuals
      Residual variation is measured by the residual standard error, not $R^2$.

## Q: How is a statistical hypothesis test on a Pearson correlation coefficient ($H_0: \rho = 0$) conducted?
lang: both
- [ ] Using a Chi-square test with $n - 1$ degrees of freedom
      Chi-square tests categorical independence, not continuous correlations.
- [x] Using a t-test with test statistic $t = r / \text{SE}_r$ and $df = n - 2$
      Correct! The test statistic $t = r \sqrt{n-2} / \sqrt{1 - r^2}$ follows a t-distribution with $n - 2$ degrees of freedom under $H_0$.
- [ ] Using a z-test that does not depend on sample size $n$
      Sample size $n$ directly determines the standard error of $r$.

## Q: How do you test whether a correlation coefficient is significantly different from zero in R?
lang: r
- [ ] `cor(x, y)`
      cor() returns only the numeric correlation coefficient, without confidence intervals or p-values.
- [x] `cor.test(x, y)`
      Correct! `cor.test(x, y)` computes Pearson's product-moment correlation, the t-statistic, degrees of freedom, and p-value.
- [ ] `t.test(x, y)`
      t.test(x, y) tests for differences in means, not correlation.

## Q: Which SciPy function computes the Pearson correlation coefficient along with its two-sided p-value?
lang: python
- [ ] `np.corrcoef(x, y)`
      np.corrcoef returns the correlation matrix without p-values.
- [x] `scipy.stats.pearsonr(x, y)`
      Correct! `pearsonr()` returns the Pearson correlation coefficient and the two-tailed p-value testing $H_0: \rho = 0$.
- [ ] `scipy.stats.linregress(x, y).fvalue`
      linregress returns slope, intercept, rvalue, pvalue, and stderr; pearsonr is the dedicated function.

# Quiz: Multiple Regression
id: multiple

## Q: What does `lm(chol ~ ., data = dat)` do?
lang: r
- [x] Fits a regression of cholesterol on every other column in the dataset
      Correct! The "." means "all other columns".
- [ ] Fits a regression using only the first column
      In an lm() formula, "." stands for all remaining columns in the dataframe as predictors.
- [ ] Computes the mean of every column
      In an lm() formula, "." stands for all remaining columns in the dataframe as predictors.

## Q: In `statsmodels`, how do you specify an OLS formula including multiple predictors `age`, `weight`, and `chol` to predict `bp`?
lang: python
- [x] `smf.ols('bp ~ age + weight + chol', data=dat).fit()`
      Correct! Predictors are joined with `+` in formula syntax.
- [ ] `smf.ols('bp ~ age * weight * chol', data=dat).fit()`
      `*` includes main effects plus all interaction terms, not just additive predictors.
- [ ] `smf.ols('bp ~ all', data=dat).fit()`
      Formula syntax requires explicit column names or patsy expressions.

## Q: In the exercise, `weight`, `waist` and `hip` did not reach significance in the full multiple regression model. What is a likely explanation given in the sheet?
lang: both
- [x] These variables strongly correlate with each other, so their individual contributions become hard to disentangle
      Right! Multicollinearity inflates standard errors, making individual contributions hard to separate.
- [ ] The software cannot handle more than 5 variables in a regression
      Models can handle many variables; correlated predictors cause statistical collinearity issues.
- [ ] These variables have no numeric values
      weight/waist/hip are mutually correlated, which can mask their individual significance in the full model.

## Q: After removing `waist` and `hip` from the model, the significance of `weight` increased. What does this illustrate?
lang: both
- [x] Removing correlated variables can reveal the contribution of a variable that was previously masked by multicollinearity
      Correct! Removing redundant correlated predictors reduces coefficient standard error and unmasks true effects.
- [ ] weight has no real effect on cholesterol at all
      This illustrates how multicollinearity can hide a variable's true effect until correlated variables are removed.
- [ ] Removing variables always increases every remaining p-value
      This illustrates how multicollinearity can hide a variable's true effect until correlated variables are removed.

# Quiz: Model Evaluation
id: evaluation

## Q: What does the RMSE (root mean squared error) measure?
lang: both
- [x] The typical size of the prediction error — how far predictions are from real values, on average
      Correct! RMSE summarizes the typical prediction error size: $\sqrt{\frac{1}{n}\sum(Y_i - \hat{Y}_i)^2}$.
- [ ] The correlation between two variables
      RMSE is the square root of the average squared prediction error — the typical size of a mistake.
- [ ] The number of explanatory variables in the model
      RMSE is the square root of the average squared prediction error — the typical size of a mistake.

## Q: Why is it "cheating" to compute the RMSE on the same data used to fit the model?
lang: both
- [x] Because the model was optimized to fit exactly that data, so its performance there overestimates how well it generalizes to new data
      Right! Evaluating on training data gives an overly optimistic performance estimate (overfitting risk).
- [ ] Because software gives a random RMSE value every time
      The model is fit to minimize error on the training data, so its training performance is optimistic vs. new data.
- [ ] It isn't cheating, there's no issue with this
      The model is fit to minimize error on the training data, so its training performance is optimistic vs. new data.

## Q: In a train/test split, why is the RMSE typically higher on the test set than on the training set?
lang: both
- [x] The test set gives a more realistic estimate, since the model wasn't fitted on it
      Correct! Test RMSE is the more honest estimate of generalization performance.
- [ ] The test set always contains errors in the data
      Test-set RMSE is typically higher because the model never saw that data during training — a fairer evaluation.
- [ ] RMSE cannot be computed on a test set
      Test-set RMSE is typically higher because the model never saw that data during training — a fairer evaluation.

## Q: Which `scikit-learn` function is used to partition a dataset into training and testing subsets?
lang: python
- [ ] `sklearn.model_selection.cross_validate()`
      cross_validate performs full k-fold cross validation, not a single train/test split.
- [x] `sklearn.model_selection.train_test_split()`
      Correct! `train_test_split(X, y, test_size=0.2)` splits matrices into random train and test subsets.
- [ ] `sklearn.preprocessing.StandardScaler()`
      StandardScaler standardizes feature scales, it does not split datasets.

# Quiz: F-Test, Coefficients & PCA
id: ftest

## Q: What does the overall F-test in a multiple regression output tell you?
lang: both
- [x] Whether the model as a whole explains significantly more variance than an intercept-only null model
      Correct! The overall F-test checks $H_0: b_1 = b_2 = \dots = b_r = 0$ against the alternative that at least one coefficient is non-zero.
- [ ] Whether a single coefficient is exactly zero
      The overall F-test asks: does this model explain significantly more variance than no predictors at all?
- [ ] The RMSE of the model
      The overall F-test asks: does this model explain significantly more variance than no predictors at all?

## Q: How can you formally test whether adding new predictors (Model 2) significantly improves a simpler nested model (Model 1)?
lang: both
- [ ] By checking if the sample mean of the response increases
      Model comparison tests changes in residual variance, not the sample mean of Y.
- [x] By running a nested F-test (ANOVA) comparing the reduction in residual sum of squares: $F = \frac{(SS_R^1 - SS_R^2)/\Delta r}{SS_R^2 / df_2}$
      Correct! An ANOVA comparing two nested models determines if the extra explained variance justifies the additional degrees of freedom.
- [ ] By verifying that the correlation between Model 1 and Model 2 equals 1
      Nested models are evaluated on whether residual errors shrink significantly.

## Q: How do you compare two nested linear models `mod1` and `mod2` in R?
lang: r
- [ ] `t.test(mod1, mod2)`
      t.test is for comparing two sample means, not fitted model objects.
- [x] `anova(mod1, mod2)`
      Correct! `anova(model1, model2)` performs the nested F-test on residual sums of squares.
- [ ] `compare(mod1, mod2)`
      The standard base R function is anova().

## Q: Why can PCA help before running a multiple regression with many correlated explanatory variables?
lang: both
- [x] Principal components are uncorrelated with each other, removing the multicollinearity problem
      Right! Principal components are orthogonal/uncorrelated by construction, stabilizing regression coefficients.
- [ ] PCA removes the need for an outcome variable
      Principal components are mutually uncorrelated, which directly solves the multicollinearity problem.
- [ ] PCA guarantees a higher R²
      Principal components are mutually uncorrelated, which directly solves the multicollinearity problem.

## Q: Each individual coefficient's t-test in regression output tests what?
lang: both
- [x] Whether that specific variable's coefficient is significantly different from zero, given all other variables in the model
      Exactly! Each coefficient's t-test evaluates that single predictor holding all other covariates constant ($H_0: b_j = 0$).
- [ ] Whether the whole model is useful
      Each row in the coefficients table tests whether that specific predictor's effect is significant given the rest of the model.
- [ ] Whether the dataset has missing values
      Each row in the coefficients table tests whether that specific predictor's effect is significant given the rest of the model.
