---
title: "Data Analysis - Exercise Sheet 1"
author: "Carl Herrmann, Maïwen Caudron-Herger"
date: "`r Sys.Date()`"
output: 
  html_document:
    toc: true
    toc_depth: 3
    toc_float: true
editor_options: 
  markdown: 
    wrap: sentence
---

```{r knitr_init, echo=FALSE, cache=FALSE}
library(knitr)
library(rmdformats)
## Global options
options(max.print=200)
opts_chunk$set(echo=TRUE,
	             cache=TRUE,
               prompt=FALSE,
               tidy=TRUE,
               comment=NA,
               message=FALSE,
               warning=FALSE)
opts_knit$set(width=150)
```

# 1. Objectives

In this practical session you will

-   learn to use RStudio
-   learn how to implement some of the ideas taught in the first lesson using the R programming language.

Throughout this course we will use a common **diabetes dataset** to practically implement the concepts taught during the lectures.

Our dataset has various clinical measurements of \> 400 individuals.
Clinical parameters like blood glucose levels, cholesterol levels, age, body size, weight, blood pressure etc have been measured.

# 2. Loading and understanding the data

We will load a dataaset using the `read.delim` command in R, using an URL:

```{r}
dat <- read.delim('https://www.dropbox.com/scl/fi/zqjdoi7naolmruyxrraxq/diabetes_2025.tsv?rlkey=txnps3ccr0vj47yvjmpecbeom&dl=1') # Load the dataset
head(dat, 10) # Look at the first 10 lines of the table
```

In your RStudio "Environment", you should see a variable with the name "dat".
If you click on it, it will open this variable, that is a data.frame.

**1.** What is the dimension of our dataset (i.e. how many rows/columns are there in our data)

```{r}
# Dimension
dim(dat)
```

```{r, results='hide'}
# Number of columns
ncol(dat)
# Number of rows
nrow(dat)
```

**2.** What are the column names of our dataset

```{r}
colnames(dat) # Similarly rownames() for rows
```

For more description on these values [look here](https://hbiostat.org/data/repo/cdiabetes)

**3.** How do we extract the minimum and maximum age of patients in our dataset

```{r, results='hide'}
min(dat$age)
max(dat$age)
range(dat$age)
```

> Can you find out the same for height and weight?

**4.** How does the overall summary of our entire dataset look like?

```{r rows.print=10}
summary(dat)
```

> Can you explain what you see?

Before we keep going, here is a quick reminder of how to access columns, rows or individual cells in a dataframe:

**If you're already familiar with it you can skip the next chunk**.

```{r eval = FALSE}

# Returning a specific column or line of a data structure
dat[1,] # Returns the first line
dat[,1] # Returns the first column
dat[1,1] # Returns only the first object of the first line

# In a dataframe, if the columns have names, you can access the column using
dat$gender

# Returning an interval of columns or lines of a data structure 
dat[1:3,] # Returns the first three lines
dat[,1:3] # Returns the first three columns
dat[1:3,1:3] # Returns the first three elements of the first three lines

# Returning a value or an interval of values in a vector
dat$age[1] # Returns the first value
dat$age[1:3] # Returns the first three values

```

# 3. Data cleanup

Very often the first thing one needs to do before any data science project is to clean up the raw data and transform it into a format that is readily understood and easy to use for all downstream analysis.
This process usually involves --

-   Removing empty value rows/columns
-   Removing unused or unnecessary rows/columns
-   Reordering the data matrix
-   Keeping columns uniformly numeric (age, weight etc) or string (names, places etc) or logical (TRUE/FALSE, 1/0)
-   Handling strange caveats which are data specific like replacing `,` or `.`, or `;` from numbers etc

Lets do some clean up of our own diabetes data

1.  We will remove the `bp.2s` and `bp.2d` columns as it has mostly missing values (see summary above)
2.  We will also remove the column `time.ppn` which will not be required in our analysis
3.  We will reorder the columns of the data such that all the qualitative and quantitative values are separated. Among the quantitative values we will keep related variables together

To perform this cleanup, we need a couple of important functions, that we will first discuss.
If you went through "00_Advanced_Data_Manipulation_in_R.Rmd" from last week, you might already be familiar with some of these functions:

-   `which`
-   `apply`
-   `is.na`
-   `%in%`

IMPORTANT: Before we do any cleaning, we save the original data into a new variable, so that we can go back to it if needed (for example, if we have done a mistake)

```{r}
dat.original <- dat
```

Now, we remove some columns: first, we determine which column index corresponds to the column names bp.2s, bp.2d and time.ppn

```{r}
i.remove <- which(colnames(dat) %in% c("bp.2s", "bp.2d", "time.ppn"))
i.remove
# The function which returns the numbers of the columns with the given names.
# the 14th column has the name "bs.2s"  etc ... 
```

Now, we remove these columns, using the "-" sign:

```{r}
dat <- dat[, -i.remove]
# This will remove the columns with the indexes 14, 15 and 18 (which are stored in the variable "i.remove", see above)
```

We re-order the remaining columns, in order to put the categorical columns first, and numerical columns after:

```{r}
dat <- dat[,c(8,6,11,9,10,14,15,2,5,1,3,4,12,13)]
```

Now lets look at our cleaned data:

```{r}
summary(dat)
```

The ordering and selection of columns looks right, however it seems that there are certain columns that have missing values (like `glyhb` column has 13 `NA` values).
Lets remove all rows with any missing value: We go through each row and sum up all missing values (NA values).

Remember, 1 row = 1 patient.

For example, the 8th row (Patient with the number 1015) has a missing value in the column "bp.1s".
For this patient and column, the function `is.na()` will return the value "TRUE".

```{r}
is.na(dat[8,"bp.1s"]) # row number 8, column with the name 'bp.1s'
```

If you sum up "TRUE" values, each counts like a 1.
For example, TRUE + TRUE = 2.
Therefore, it is possible to use the function `sum()` on the result of the function `is.na()` applied on each row of the dataframe "dat".

For the first row alone, this would be obtained like this:

```{r}
sum(is.na(dat[1,]))
# This is calculating the number of NAs in the first row of the table "dat".

# The result is 0 because there are no NA on this line.
# Check out the result here:
dat[1,]

# The function is.na() returns only FALSE for each column of the first line.
is.na(dat[1,])
```

Now, we would like to repeat the same for each patient, i.e. for each line.
We are going to use the function `apply()`.
`apply()` is used with the parameter 1 for rows and the parameter 2 for columns.
Since we'd like to calculate the number of NAs per row, we use the parameter 1 in the functions.
The sum of NAs is stored in the variable nb_NA.rows - our next aim being to remove those rows with NAs.

```{r}
nb_NA.rows = apply(dat, 1, function(x) {sum(is.na(x))}) 
```

"nb_NA.rows" is a vector containing the number of NAs for each row.

> What should be the expected length of this vector?
> Think about the dimensions of the dataframe "dat"

What are the number of missing values for the first rows?
We can use for this the function `head()`.

```{r}
head(nb_NA.rows)
```

Next, we'd like to determine the index of the rows containing missing values.
For these rows, the variable nb_NA.rows will have values \> 0.

Again, we can use the function `which()` for this task.

```{r}
i.missing = which(nb_NA.rows >0) # This is returning the index of the rows with 1 or more missing values.
head(i.missing)
```

Now, we can remove the patients with missing values.
We proceed as before and use the "-" sign:

```{r}
dat = dat[-i.missing,] 
```

> How many patients were removed because they were associated with missing values?

Now our cleaned data has no missing values, columns are cleanly ordered and each column is in the right format

```{r}
summary(dat)
```

> Can you identify which types of data (continuous, discrete etc) each column above represents and why?

# 4. Visualizing data distribution

In this section you will learn the essential functions to plot data in an intuitive and useful way.

### Histograms

We can plot the column "stab.glu" as a histogram using the `hist()` function:

```{r eval = TRUE}
hist(dat$stab.glu, xlab ="Stabilized Glucose concentration in blood", main ="Glucose concentration")
```

Remember that you can type `help("hist")` in the Console to see more details about the histogram function in R.

> Add the parameter `breaks = 50` in the above lines of code and see what happens.
> Try different values for `breaks` like `10, 20, 75, 100` and try to interpret the differences.

### Density plots

For density plots, we use the `density()` function to estimate the probability density function for a given variable.
With its return value, we can build the final density plot using the `plot()` function:

```{r eval = TRUE}
d <- density(dat$stab.glu,bw = 20)
plot(d, xlab ="Stabilized Glucose concentration in blood", main ="Glucose concentration")
```

> Change the value of `bw` and see how the plot changes

### Boxplots

The `boxplot()` function produces a boxplot for a given variable:

```{r eval = TRUE}
boxplot(dat$stab.glu, xlab ="Stabilized Glucose concentration in blood", horizontal = TRUE)
```

> Can you explain all features of this graph, such as upper/lower whisker, 25% quantile, ...?

### QQ-plots

As discussed in the lecture, we can use **QQ-plots** to either (1) compare two distributions, or (2) compare a distribution with a theoretical distribution (typically the normal distribution).

We can for example compare the distribution of the blood pressure values to check if they are normally distributed

```{r eval=TRUE}
## Let's first make a histogram
hist(dat$bp.1s)

## Maybe with more bins?
hist(dat$bp.1s,breaks = 20)
```

Now we can use the function `qqnorm()` to generate the **QQ-plot** of this distribution against the standard normal distribution:

```{r eval = TRUE}
qqnorm(dat$bp.1s)
```

Using the additional command `qqline()`, we can add a straight line that goes through the first and third quartile:

```{r eval = TRUE}
qqnorm(dat$bp.1s); qqline(dat$bp.1s)
```

> So, is the distribution normal??

Now let's compare the quantiles of the cholesterol values of men and women!

```{r eval = TRUE}
# We can use "which()" to select the cholesterol values for men and women

rows.men = which(dat$gender == 'male') # positions of male patients
rows.women = which(dat$gender == 'female')

bp.men = dat$bp.1s[rows.men] # select all values from the "bp.1s" column that correspond to male patients 
bp.women = dat$bp.1s[rows.women]

# Compute the quantiles (note the "na.rm" option to ignore missing NA values!)
q.men = quantile(bp.men, probs=seq(0,1,by=0.05), na.rm=TRUE)
q.women = quantile(bp.women, probs=seq(0,1,by=0.05), na.rm=TRUE)

# Now plot against each other!
plot(q.men, q.women, pch=20)
```

# 5. Exercises

### Exercise 1: Data Exploration and Summary Statistics

The summary() function gives us a quick overview, but sometimes we need more specific information.

1.  Calculate the mean and standard deviation of the hdl (High Density Lipoprotein) values for the entire dataset using `mean()` and `sd()`.
2.  Create a new variable called `bmi` (Body Mass Index) in the dataset using the formula: BMI = weight (in pounds) / height\^2 (in inches) × 703. Add this as a new column to `dat` using `dat$bmi <- ...`
3.  Use the `table()` function on the column `location` to count how many patients come from each location. Which location has the most patients?
4.  Calculate the median age separately for male and female patients. Are they similar?

### Exercise 2: Visualizing Relationships Between Variables

In this exercise, you'll explore relationships between different clinical measurements.

1.  Create a scatter plot of `weight` vs `height` using the `plot()` function.
    Do you see a relationship between these variables? Change the aspect of the plot using the `pch=20` parameter in the `plot` function.

2.  Color the points in your scatter plot from question 1 by gender using the `col` parameter.
    *Hint: you can use `col = as.factor(dat$gender)`*.
    Does the relationship between weight and height appear different for men and women?

3.  Use the `cor()` function to calculate the correlation coefficient between weight and height.
    How strong is this relationship?

4.  Create side-by-side boxplots comparing cholesterol levels (`chol`) between males and females using  boxplot(chol ~ gender, data = dat)`.
    What differences do you observe?
    Try with other variables!



### Going further: Advanced Data Manipulation (for advanced students)

1.  Create a categorical variable called `age_group` that divides patients into three categories: "young" (age \< 40), "middle" (40 ≤ age \< 60), and "senior" (age ≥ 60).
    Add this as a new column to `dat`.
    *Hint: use the `cut()` function and check how it works in the help*.

2.  Calculate the mean cholesterol level for each combination of `gender` and `age_group`.
    Store these results in a matrix or data frame.
    *Hint: you can use `tapply()` or a combination of subsetting with `which()` and `mean()`*.

3.  Create a function called `standardize()` that takes a numeric vector as input and returns a z-transformed version (subtract mean, divide by standard deviation).
    Apply this function to all numerical columns in `dat` to create a standardized version of the dataset called `dat.scaled`.
    *Hint: you can use `apply()` with `MARGIN = 2` for columns, but remember to skip non-numeric columns*.

4.  Using your standardized dataset, identify which patient has the most extreme (highest or lowest) standardized BMI value.
    Print out all their clinical information.
    What makes this patient unusual?