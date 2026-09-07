# Quiz: Simple Linear Regression
id: simple

## Q: What does `lm(chol ~ glyhb, data = dat)` do?
- [x] Fits a linear regression model predicting cholesterol from glycosylated hemoglobin
      Correct! lm(y ~ x) fits a linear model of y on x.
- [ ] Computes the correlation between the two variables only
      lm(chol ~ glyhb, data=dat) fits a linear regression predicting chol from glyhb.
- [ ] Removes missing values from the dataset
      lm(chol ~ glyhb, data=dat) fits a linear regression predicting chol from glyhb.

## Q: Which two assumptions should you check on the residuals of a linear regression?
- [x] The residuals should be normally distributed, and uncorrelated with the explanatory variable
      Right! Normal residuals + no correlation with the predictor.
- [ ] The residuals should always be exactly zero
      Check that residuals are normally distributed and uncorrelated with the explanatory variable.
- [ ] The residuals should be perfectly correlated with the outcome variable
      Check that residuals are normally distributed and uncorrelated with the explanatory variable.

## Q: For a *simple* linear regression (one explanatory variable), how does the p-value of the t-test for the slope compare to the p-value of the overall F-test?
- [x] They are identical
      Exactly! With one predictor, the t-test and F-test give the same p-value.
- [ ] The t-test p-value is always much smaller
      For simple regression (1 predictor), the slope's t-test p-value equals the overall F-test p-value.
- [ ] They are unrelated
      For simple regression (1 predictor), the slope's t-test p-value equals the overall F-test p-value.

# Quiz: Multiple Regression
id: multiple

## Q: What does `lm(chol ~ ., data = dat)` do?
- [x] Fits a regression of cholesterol on every other column in the dataset
      Correct! The "." means "all other columns".
- [ ] Fits a regression using only the first column
      In an lm() formula, "." stands for all remaining columns in the dataframe as predictors.
- [ ] Computes the mean of every column
      In an lm() formula, "." stands for all remaining columns in the dataframe as predictors.

## Q: In the exercise, `weight`, `waist` and `hip` did not reach significance in the full multiple regression model. What is a likely explanation given in the sheet?
- [x] These variables strongly correlate with each other, so their individual contributions become hard to disentangle
      Right! Multicollinearity makes individual contributions hard to separate.
- [ ] R cannot handle more than 5 variables in a regression
      weight/waist/hip are mutually correlated, which can mask their individual significance in the full model.
- [ ] These variables have no numeric values
      weight/waist/hip are mutually correlated, which can mask their individual significance in the full model.

## Q: After removing `waist` and `hip` from the model, the significance of `weight` increased. What does this illustrate?
- [x] Removing correlated variables can reveal the contribution of a variable that was previously masked by multicollinearity
      Correct! Removing correlated predictors can unmask a variable's real contribution.
- [ ] weight has no real effect on cholesterol at all
      This illustrates how multicollinearity can hide a variable's true effect until correlated variables are removed.
- [ ] Removing variables always increases every remaining p-value
      This illustrates how multicollinearity can hide a variable's true effect until correlated variables are removed.

# Quiz: Model Evaluation
id: evaluation

## Q: What does the RMSE (root mean squared error) measure?
- [x] The typical size of the prediction error — how far predictions are from real values, on average
      Correct! RMSE summarizes the typical prediction error size.
- [ ] The correlation between two variables
      RMSE is the square root of the average squared prediction error — the typical size of a mistake.
- [ ] The number of explanatory variables in the model
      RMSE is the square root of the average squared prediction error — the typical size of a mistake.

## Q: Why is it "cheating" to compute the RMSE on the same data used to fit the model?
- [x] Because the model was optimized to fit exactly that data, so its performance there overestimates how well it generalizes to new data
      Right! Evaluating on training data overestimates real-world performance.
- [ ] Because R gives a random RMSE value every time
      The model is fit to minimize error on the training data, so its training performance is optimistic vs. new data.
- [ ] It isn't cheating, there's no issue with this
      The model is fit to minimize error on the training data, so its training performance is optimistic vs. new data.

## Q: In a train/test split, why is the RMSE typically higher on the test set than on the training set?
- [x] The test set gives a more realistic estimate, since the model wasn't fitted on it
      Correct! Test RMSE is the more honest estimate of real performance.
- [ ] The test set always contains errors in the data
      Test-set RMSE is typically higher because the model never saw that data during training — a fairer evaluation.
- [ ] RMSE cannot be computed on a test set
      Test-set RMSE is typically higher because the model never saw that data during training — a fairer evaluation.

# Quiz: F-Test, Coefficients & PCA
id: ftest

## Q: What does the overall F-test in a multiple regression's `summary()` output tell you?
- [x] Whether the model as a whole explains significantly more variance than an intercept-only model
      Correct! The F-test checks the model as a whole.
- [ ] Whether a single coefficient is exactly zero
      The overall F-test asks: does this model explain significantly more variance than no predictors at all?
- [ ] The RMSE of the model
      The overall F-test asks: does this model explain significantly more variance than no predictors at all?

## Q: Why can PCA help before running a multiple regression with many correlated explanatory variables?
- [x] Principal components are uncorrelated with each other, removing the multicollinearity problem
      Right! PCA components are uncorrelated by construction.
- [ ] PCA removes the need for an outcome variable
      Principal components are mutually uncorrelated, which directly solves the multicollinearity problem.
- [ ] PCA guarantees a higher R²
      Principal components are mutually uncorrelated, which directly solves the multicollinearity problem.

## Q: Each individual coefficient's t-test in `summary(lm(...))` tests what?
- [x] Whether that specific variable's coefficient is significantly different from zero, given the other variables in the model
      Exactly! Each coefficient's t-test is about that one variable, holding others constant.
- [ ] Whether the whole model is useful
      Each row in the coefficients table tests whether that specific predictor's effect is significant given the rest of the model.
- [ ] Whether the dataset has missing values
      Each row in the coefficients table tests whether that specific predictor's effect is significant given the rest of the model.
