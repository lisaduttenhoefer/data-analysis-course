# Quiz: Vectors
id: vectors

## Q: What does `length(c(9, 3, 7, 2))` return?
lang: r
- [ ] 2
      Count the elements: 9, 3, 7, 2 – that is 4.
- [x] 4
      Correct! The vector has 4 elements.
- [ ] 9
      Count the elements: 9, 3, 7, 2 – that is 4.
- [ ] 1
      Count the elements: 9, 3, 7, 2 – that is 4.

## Q: What does `len([9, 3, 7, 2])` return?
lang: python
- [ ] 2
      Count the elements in the list: 9, 3, 7, 2 – that is 4.
- [x] 4
      Correct! The Python list contains 4 elements.
- [ ] 9
      Count the elements in the list: 9, 3, 7, 2 – that is 4.
- [ ] 1
      Count the elements in the list: 9, 3, 7, 2 – that is 4.

## Q: Why does `sum(c(TRUE, FALSE, TRUE, TRUE))` return `3`?
lang: r
- [ ] Because the vector has 3 elements
      Remember: TRUE = 1 and FALSE = 0 in R. sum(c(1,0,1,1)) = 3.
- [x] Because R treats TRUE as 1 and FALSE as 0 — sum() therefore counts the TRUE values
      Exactly! In R, TRUE = 1 and FALSE = 0. sum() adds the ones.
- [ ] Because sum() only counts the first three elements
      Remember: TRUE = 1 and FALSE = 0 in R. sum(c(1,0,1,1)) = 3.

## Q: Why does `sum([True, False, True, True])` return `3` in Python?
lang: python
- [ ] Because the list contains 3 elements
      In Python, bool subclasses int where True == 1 and False == 0.
- [x] Because Python treats True as 1 and False as 0 — sum() therefore counts the True values
      Exactly! In Python, boolean values evaluate to integers 1 and 0 when summed.
- [ ] Because sum() skips False and counts the remaining indices
      sum() accumulates the numeric values of True (1) and False (0).

## Q: What does `y[y < 5]` return when `y <- c(9, 3, 7, 2)`?
lang: r
- [ ] 9 7
      y < 5 tests each element: 9→F, 3→T, 7→F, 2→T. So 3 and 2 are returned.
- [x] 3 2
      Correct! Only elements 3 and 2 are less than 5.
- [ ] TRUE FALSE TRUE TRUE
      y < 5 tests each element: 9→F, 3→T, 7→F, 2→T. So 3 and 2 are returned.

## Q: What does `y[y < 5]` return when `y = np.array([9, 3, 7, 2])`?
lang: python
- [ ] `array([9, 7])`
      The boolean condition evaluates element-wise: [False, True, False, True].
- [x] `array([3, 2])`
      Correct! Boolean indexing filters the array to only elements less than 5.
- [ ] `array([True, False, True, True])`
      y < 5 generates the mask; indexing y[...] returns the filtered values.

## Q: What happens when data types are mixed in an R vector, e.g. `c(TRUE, "FALSE", 3)`?
lang: r
- [ ] R throws an error
      Try str(c(TRUE, "FALSE", 3)) in RStudio to see the conversion!
- [ ] Each element keeps its own type
      Try str(c(TRUE, "FALSE", 3)) in RStudio to see the conversion!
- [x] All elements are converted to the lowest common type (here: character)
      Correct! R converts all elements to the lowest common type — here character.

## Q: What happens when data types are mixed in a standard Python list, e.g. `[True, "False", 3]`?
lang: python
- [ ] Python throws a TypeError immediately
      Python lists are heterogeneous containers by design.
- [ ] All elements are automatically coerced to strings
      Python does not coerce types inside standard lists; each element retains its original type.
- [x] Each element retains its original type
      Correct! Python lists can hold elements of arbitrary and mixed data types.

# Quiz: Matrices
id: matrices

## Q: What does `dim(X)` return for `X <- matrix(1:6, nrow=2, ncol=3)`?
lang: r
- [ ] 6
      dim() returns [rows, columns]. With nrow=2, ncol=3 that is 2 3.
- [x] 2 3
      Correct! dim() always returns [rows, columns].
- [ ] 3 2
      dim() returns [rows, columns]. With nrow=2, ncol=3 that is 2 3.

## Q: What does `X.shape` return for `X = np.arange(1, 7).reshape(2, 3)`?
lang: python
- [ ] `(6,)`
      The shape attribute represents (rows, columns).
- [x] `(2, 3)`
      Correct! .shape returns a tuple representing (n_rows, n_cols).
- [ ] `(3, 2)`
      The reshape specifies 2 rows and 3 columns.

## Q: What is the difference between `cbind()` and `rbind()`?
lang: r
- [ ] No difference – both do the same thing
      cbind = "column bind", rbind = "row bind".
- [x] cbind() joins vectors as columns, rbind() as rows
      Exactly! cbind = column bind, rbind = row bind.
- [ ] cbind() only works for numbers, rbind() for all types
      cbind = "column bind", rbind = "row bind".

## Q: What is the difference between `np.column_stack()` and `np.row_stack()` (or `np.vstack`)?
lang: python
- [ ] No difference – both concatenate along axis 0
      column_stack combines 1D arrays as columns (2D), while vstack/row_stack stacks along rows.
- [x] column_stack() joins arrays as columns, row_stack() as rows
      Correct! column_stack stacks along axis 1, row_stack along axis 0.
- [ ] column_stack() only accepts numeric types; row_stack() accepts anything
      Both accept matching NumPy-compatible arrays.

## Q: What does `X[2, ]` return?
lang: r
- [ ] The element in row 2, column 0
      X[row, column] — empty field means everything. X[2, ] = all columns of row 2.
- [x] All elements of the second row
      Correct! The empty comma means: all columns. X[2, ] = all elements from row 2.
- [ ] All elements of the second column
      X[row, column] — empty field means everything. X[2, ] = all columns of row 2.

## Q: What does `X[1, :]` return for a 2D NumPy array `X`?
lang: python
- [ ] All elements of the first row
      Python uses 0-based indexing, so index 1 refers to the second row.
- [x] All elements of the second row
      Correct! Index 1 selects the second row (0-based indexing), and `:` selects all columns.
- [ ] All elements of the second column
      Row index precedes column index: X[row, column].

# Quiz: Lists
id: lists

## Q: What is the difference between `List1["color"]` and `List1[["color"]]`?
lang: r
- [ ] No difference – both return the same value
      Try length(List1["color"]) vs. length(List1[["color"]]) in RStudio!
- [x] `List1["color"]` returns a list of length 1; `List1[["color"]]` returns the content (the vector) directly
      Exactly! Single [ ] returns a list, double [[ ]] returns the actual content.
- [ ] `List1[["color"]]` returns a list; `List1["color"]` returns the content
      Try length(List1["color"]) vs. length(List1[["color"]]) in RStudio!

## Q: In a Python dictionary `d = {"color": ["blue", "red"]}`, how do you access the value list directly?
lang: python
- [ ] `d[["color"]]`
      Python dictionaries do not use double brackets for key extraction.
- [x] `d["color"]` or `d.get("color")`
      Correct! Standard square brackets d[key] extract the underlying value directly.
- [ ] `d$color`
      The `$` operator is R syntax; Python uses dict[key] or dict.get(key).

## Q: How do you access the second position of the first element of `List2 <- list(c("blue", "red"), 5, TRUE)`?
lang: r
- [ ] `List2[1][2]`
      List2[1] returns a list — use List2[[1]] to extract the vector first.
- [x] `List2[[1]][2]`
      Correct! First use [[ ]] to get the vector, then [2] for the second element.
- [ ] `List2$1[2]`
      List2[1] returns a list — use List2[[1]] to extract the vector first.

## Q: How do you access the second item of the first element in `l2 = [["blue", "red"], 5, True]`?
lang: python
- [ ] `l2[1][2]`
      Python is 0-indexed. l2[1] is 5, not the first element.
- [x] `l2[0][1]`
      Correct! l2[0] extracts the first inner list `["blue", "red"]`, and `[1]` extracts `"red"`.
- [ ] `l2[[0]][1]`
      Double brackets are not valid indexing syntax in Python.

## Q: How do you delete the third element from a list?
lang: r
- [ ] `List2[3] <- FALSE`
      rm() removes variables, not list elements. Use List2[[3]] <- NULL.
- [x] `List2[[3]] <- NULL`
      Correct! Assigning NULL to a list element with [[ ]] removes it completely.
- [ ] `rm(List2[[3]])`
      rm() removes variables, not list elements. Use List2[[3]] <- NULL.

## Q: How do you remove the third element (index 2) from a Python list `l`?
lang: python
- [ ] `l[2] = None`
      Assigning None keeps the element and replaces its value; it does not remove the index.
- [x] `del l[2]` or `l.pop(2)`
      Correct! `del l[2]` or `l.pop(2)` removes the element and shortens the list length.
- [ ] `l.remove(2)`
      l.remove(x) searches for the value 2, not index 2.

# Quiz: Dataframes
id: dataframes

## Q: What is the most important difference between a dataframe and a matrix?
lang: r
- [ ] Dataframes can be larger than matrices
      The key difference is data types: matrices contain only one type, dataframes can mix.
- [x] Dataframes can contain different data types in different columns; matrices only one type throughout
      Correct! A dataframe can mix types column by column — a matrix cannot.
- [ ] Matrices always have column names, dataframes do not
      The key difference is data types: matrices contain only one type, dataframes can mix.

## Q: What is the fundamental difference between a Pandas DataFrame and a 2D NumPy array?
lang: python
- [ ] DataFrames can store numeric data, while NumPy arrays cannot
      Both store numeric data efficiently.
- [x] DataFrames allow heterogeneous column types with labeled axes; standard NumPy arrays are homogeneous
      Correct! DataFrames hold columns of differing dtypes with named index/columns; 2D arrays hold a single dtype.
- [ ] 2D NumPy arrays cannot be indexed by rows
      NumPy arrays support row and column slicing.

## Q: How many fruits does `Fruit <- c(TRUE, TRUE, FALSE, TRUE, FALSE)` contain, and which function do you use?
lang: r
- [ ] 2, with `length(Fruit)`
      length() returns the total length (5). sum() counts the TRUE values.
- [x] 3, with `sum(Fruit)`
      Correct! sum() on a logical vector counts the TRUE values (TRUE = 1). There are 3 fruits.
- [ ] 5, with `sum(Fruit)`
      length() returns the total length (5). sum() counts the TRUE values.

## Q: How many fruits does `fruit = pd.Series([True, True, False, True, False])` contain, and which method counts them?
lang: python
- [ ] 5, with `fruit.count()`
      .count() counts all non-null values (which is 5).
- [x] 3, with `fruit.sum()`
      Correct! .sum() treats True as 1 and False as 0, giving 3.
- [ ] 2, with `len(fruit)`
      len(fruit) gives the total length (5).

## Q: What does `merge(Students, Full_Names)` do by default?
lang: r
- [ ] All rows of both dataframes are merged; missing values filled with NA
      merge() default = Inner Join (only matching rows). Use all=TRUE to keep everything.
- [x] Only rows that appear in both dataframes are kept (Inner Join)
      Exactly! Default all=FALSE = Inner Join. Only rows present in both are kept.
- [ ] The dataframes are stacked on top of each other
      merge() default = Inner Join (only matching rows). Use all=TRUE to keep everything.

## Q: What does `pd.merge(students, full_names)` do by default?
lang: python
- [ ] It performs an outer join keeping all rows and filling with NaN
      The default parameter is `how='inner'`.
- [x] It performs an inner join, keeping only rows with matching keys in both DataFrames
      Correct! `pd.merge` defaults to `how='inner'`, retaining only the intersection of keys.
- [ ] It concatenates rows vertically
      Vertical concatenation is done using `pd.concat([df1, df2])`.

# Quiz: Introduction to Bioinformatics
id: intro-bioinfo

## Q: According to Pauline Hogeweg (1978), what is the definition of bioinformatics?
lang: both
- [ ] The hardware architecture designed to process high-throughput genomic data
      Hogeweg defined bioinformatics in 1978 from an information-processing perspective.
- [x] The study of informatic processes in biotic systems
      Correct! Hogeweg defined it in 1978 as the "study of informatic processes in biotic systems".
- [ ] The exclusive statistical analysis of clinical trials in human populations
      Bioinformatics spans broader biotic systems and biological information processing.

## Q: What is the main goal of a Genome-Wide Association Study (GWAS)?
lang: both
- [ ] To assemble de novo sequencing reads without a reference genome
      GWAS is focused on phenotypes, specifically finding links between variants and traits.
- [x] To link specific DNA variants with traits or diseases across cohorts
      Correct! GWAS identifies statistical associations between genomic variants and phenotypes or diseases.
- [ ] To visualize high-dimensional single-cell data using UMAP
      UMAP is a dimensionality reduction method, not the core goal of GWAS.

## Q: What trend describes the historical development of sequencing costs since 2001?
lang: both
- [ ] Sequencing costs decreased at the exact same rate as Moore's Law
      Moore's Law halves roughly every 18 months, but NGS outpaced it significantly.
- [x] Sequencing costs dropped significantly faster than Moore's Law (especially after ~2007)
      Correct! With high-throughput Next-Generation Sequencing, costs dropped much faster than Moore's Law predicted.
- [ ] Sequencing costs have remained constant per human genome since 2001
      Sequencing costs fell drastically from around $100M to under $1,000 per human genome.

# Quiz: Data Analysis Workflow
id: data-analysis-steps

## Q: Which step belongs to descriptive data analysis rather than predictive data analysis?
lang: both
- [ ] Fitting a linear regression model to predict clinical outcome
      Predicting values via regression is part of predictive modeling.
- [ ] Training a machine learning classifier on multi-omics data
      Training predictive classifiers is part of predictive data analysis.
- [x] Cleaning data and visualizing distributions using boxplots or histograms
      Correct! Cleaning data, exploring distributions, and visual summaries belong to descriptive data analysis.

## Q: Why is data cleaning (e.g. gene identifier mapping) a crucial first step in biology?
lang: both
- [ ] Because data frames only load if all gene IDs are numeric integers
      Gene IDs can be strings/characters, but ambiguous naming causes mismatches during integration.
- [x] Because genes often have multiple aliases and databases use different naming standards
      Correct! Genes often have many historical aliases (e.g. MECOM, EVI1, PRDM3), requiring standardization.
- [ ] Because missing values are automatically replaced with random genes by standard loaders
      Missing values evaluate to NA/NaN; standard packages do not automatically invent labels.

## Q: What is the primary purpose of Principal Component Analysis (PCA) during data exploration?
lang: both
- [ ] To impute missing expression values with median values
      PCA is a dimensionality reduction and ordination technique, not an imputation tool.
- [x] To reduce dimensionality and capture major sources of variation across samples
      Correct! PCA reduces high-dimensional data (e.g. 25,000 genes) to a few dimensions while capturing major variance.
- [ ] To test whether continuous variables follow a normal distribution
      Normality of univariate distributions is tested using tests like Shapiro-Wilk, not PCA.

# Quiz: Computational Notebooks and Reproducibility
id: computational-notebooks

## Q: What is a key advantage of writing an R Markdown (`.Rmd`) document over working solely in the R console?
lang: r
- [ ] R Markdown makes code execute 10 times faster than the R console
      R Markdown uses the same R engine; speed is not the primary difference.
- [x] It allows dynamic, reproducible reports combining narrative text, executable code, and plots
      Correct! R Markdown combines documentation, code execution, and resulting figures into reproducible reports.
- [ ] Code typed directly in the console is permanently saved to disk automatically
      Console commands are ephemeral and lost after closing RStudio unless scripted.

## Q: Which tool is used under the hood to compile `.Rmd` files into markdown (`.md`) before Pandoc creates the final document?
lang: r
- [ ] `devtools`
      devtools is used for package development in R.
- [x] `knitr`
      Correct! knitr executes the embedded R code chunks and converts `.Rmd` into `.md`, which Pandoc then renders.
- [ ] `CRAN`
      CRAN is the package repository network, not a document converter.

## Q: What is the purpose of the code chunk header `{r setup, include = FALSE}` in R Markdown?
lang: r
- [ ] It hides the entire HTML output from the viewer
      It only applies settings and hides output for that specific chunk.
- [x] It executes initial configuration/libraries without printing the code or output in the report
      Correct! `include = FALSE` runs the chunk (e.g. setting knitr options or loading libraries) but hides code and output.
- [ ] It permanently disables R execution for all subsequent chunks
      Subsequent chunks execute normally unless explicitly set otherwise.

## Q: What is a key advantage of writing a Jupyter Notebook (`.ipynb`) over working solely in an interactive REPL?
lang: python
- [ ] Jupyter Notebooks make Python execution 10 times faster than the terminal
      Jupyter uses the standard IPython kernel under the hood; execution speed is not the primary difference.
- [x] It allows dynamic, reproducible workflows combining narrative Markdown, executable code cells, and inline plots
      Correct! Jupyter Notebooks integrate rich text narrative, executable Python code, and inline figures into an interactive and shareable document.
- [ ] Code typed directly into the standard Python REPL is permanently saved to disk automatically
      Terminal REPL sessions are ephemeral and lost after closing the shell unless saved in a script.

## Q: Which tool is used in the Python ecosystem to export and convert `.ipynb` notebooks into formats like HTML, Markdown, or PDF?
lang: python
- [ ] `pip`
      pip is the package installer for Python, not a notebook conversion engine.
- [x] `nbconvert`
      Correct! nbconvert executes or parses `.ipynb` files and converts them into various static formats (HTML, Markdown, PDF, LaTeX).
- [ ] `PyPI`
      PyPI is the Python Package Index repository, not a document compilation utility.

## Q: How do you suppress the textual return value of a line (e.g. `<matplotlib.axes...>` above a plot) in a Jupyter Notebook?
lang: python
- [ ] By wrapping the entire cell inside an `include=False` tag
      Cell tags can be used for export configurations, but are not the standard inline way to suppress statement output.
- [x] By adding a semicolon `;` at the end of the plotting statement or calling `plt.show()`
      Correct! Appending `;` suppresses the expression display output in IPython/Jupyter, as does explicitly concluding with `plt.show()`.
- [ ] By commenting out the `import matplotlib.pyplot as plt` line
      Commenting out the import statement will cause a NameError when calling plotting functions.      Try length(List1["color"]) vs. length(List1[["color"]]) in RStudio!
- [x] `List1["color"]` returns a list of length 1; `List1[["color"]]` returns the content (the vector) directly
      Exactly! Single [ ] returns a list, double [[ ]] returns the actual content.
- [ ] `List1[["color"]]` returns a list; `List1["color"]` returns the content
      Try length(List1["color"]) vs. length(List1[["color"]]) in RStudio!

## Q: How do you access the second position of the first element of `List2 <- list(c("blue", "red"), 5, TRUE)`?
- [ ] `List2[1][2]`
      List2[1] returns a list — use List2[[1]] to extract the vector first.
- [x] `List2[[1]][2]`
      Correct! First use [[ ]] to get the vector, then [2] for the second element.
- [ ] `List2$1[2]`
      List2[1] returns a list — use List2[[1]] to extract the vector first.

## Q: How do you delete the third element from a list?
- [ ] `List2[3] <- FALSE`
      rm() removes variables, not list elements. Use List2[[3]] <- NULL.
- [x] `List2[[3]] <- NULL`
      Correct! Assigning NULL to a list element with [[ ]] removes it completely.
- [ ] `rm(List2[[3]])`
      rm() removes variables, not list elements. Use List2[[3]] <- NULL.

# Quiz: Dataframes
id: dataframes

## Q: What is the most important difference between a dataframe and a matrix?
- [ ] Dataframes can be larger than matrices
      The key difference is data types: matrices contain only one type, dataframes can mix.
- [x] Dataframes can contain different data types in different columns; matrices only one type throughout
      Correct! A dataframe can mix types column by column — a matrix cannot.
- [ ] Matrices always have column names, dataframes do not
      The key difference is data types: matrices contain only one type, dataframes can mix.

## Q: How many fruits does `Fruit <- c(TRUE, TRUE, FALSE, TRUE, FALSE)` contain, and which function do you use?
- [ ] 2, with `length(Fruit)`
      length() returns the total length (5). sum() counts the TRUE values.
- [x] 3, with `sum(Fruit)`
      Correct! sum() on a logical vector counts the TRUE values (TRUE = 1). There are 3 fruits.
- [ ] 5, with `sum(Fruit)`
      length() returns the total length (5). sum() counts the TRUE values.

## Q: What does `merge(Students, Full_Names)` do by default?
- [ ] All rows of both dataframes are merged; missing values filled with NA
      merge() default = Inner Join (only matching rows). Use all=TRUE to keep everything.
- [x] Only rows that appear in both dataframes are kept (Inner Join)
      Exactly! Default all=FALSE = Inner Join. Only rows present in both are kept.
- [ ] The dataframes are stacked on top of each other
      merge() default = Inner Join (only matching rows). Use all=TRUE to keep everything.

# Quiz: Introduction to Bioinformatics
id: intro-bioinfo

## Q: According to Pauline Hogeweg (1978), what is the definition of bioinformatics?
- [ ] The hardware architecture designed to process high-throughput genomic data
      Hogeweg defined bioinformatics in 1978 from an information-processing perspective.
- [x] The study of informatic processes in biotic systems
      Correct! Hogeweg defined it in 1978 as the "study of informatic processes in biotic systems".
- [ ] The exclusive statistical analysis of clinical trials in human populations
      Bioinformatics spans broader biotic systems and biological information processing.

## Q: What is the main goal of a Genome-Wide Association Study (GWAS)?
- [ ] To assemble de novo sequencing reads without a reference genome
      GWAS is focused on phenotypes, specifically finding links between variants and traits.
- [x] To link specific DNA variants with traits or diseases across cohorts
      Correct! GWAS identifies statistical associations between genomic variants and phenotypes or diseases.
- [ ] To visualize high-dimensional single-cell data using UMAP
      UMAP is a dimensionality reduction method, not the core goal of GWAS.

## Q: What trend describes the historical development of sequencing costs since 2001?
- [ ] Sequencing costs decreased at the exact same rate as Moore's Law
      Moore's Law halves roughly every 18 months, but NGS outpaced it significantly.
- [x] Sequencing costs dropped significantly faster than Moore's Law (especially after ~2007)
      Correct! With high-throughput Next-Generation Sequencing, costs dropped much faster than Moore's Law predicted.
- [ ] Sequencing costs have remained constant per human genome since 2001
      Sequencing costs fell drastically from around $100M to under $1,000 per human genome.

# Quiz: Data Analysis Workflow
id: data-analysis-steps

## Q: Which step belongs to descriptive data analysis rather than predictive data analysis?
- [ ] Fitting a linear regression model to predict clinical outcome
      Predicting values via regression is part of predictive modeling.
- [ ] Training a machine learning classifier on multi-omics data
      Training predictive classifiers is part of predictive data analysis.
- [x] Cleaning data and visualizing distributions using boxplots or histograms
      Correct! Cleaning data, exploring distributions, and visual summaries belong to descriptive data analysis.

## Q: Why is data cleaning (e.g. gene identifier mapping) a crucial first step in biology?
- [ ] Because R code only runs if all gene IDs are numeric integers
      Gene IDs can be characters, but ambiguous naming causes mismatches during integration.
- [x] Because genes often have multiple aliases and databases use different naming standards
      Correct! Genes often have many historical aliases (e.g. MECOM, EVI1, PRDM3), requiring standardization.
- [ ] Because missing values are automatically filled with random genes by R
      R marks missing values with NA; it does not automatically impute them.

## Q: What is the primary purpose of Principal Component Analysis (PCA) during data exploration?
- [ ] To replace missing expression values with median values
      PCA is a dimensionality reduction and ordination technique, not an imputation tool.
- [x] To reduce dimensionality and capture major sources of variation across samples
      Correct! PCA reduces high-dimensional data (e.g. 25,000 genes) to a few dimensions while capturing major variance.
- [ ] To determine whether gene lengths are normally distributed
      Normality of univariate distributions is tested using tests like Shapiro-Wilk, not PCA.

# Quiz: R and R Markdown
id: rmarkdown

## Q: What is a key advantage of writing an R Markdown (`.Rmd`) document over working solely in the R console?
- [ ] R Markdown makes code execute 10 times faster than the R console
      R Markdown uses the same R engine; speed is not the primary difference.
- [x] It allows dynamic, reproducible reports combining narrative text, executable code, and plots
      Correct! R Markdown combines documentation, code execution, and resulting figures into reproducible reports.
- [ ] Code typed directly in the console is permanently saved to disk automatically
      Console commands are ephemeral and lost after closing RStudio unless scripted.

## Q: Which tool is used under the hood to compile `.Rmd` files into markdown (`.md`) before Pandoc creates the final document?
- [ ] `devtools`
      devtools is used for package development in R.
- [x] `knitr`
      Correct! knitr executes the embedded R code chunks and converts `.Rmd` into `.md`, which Pandoc then renders.
- [ ] `CRAN`
      CRAN is the package repository network, not a document converter.

## Q: What is the purpose of the code chunk header `{r setup, include = FALSE}` in R Markdown?
- [ ] It hides the entire HTML output from the viewer
      It only applies settings and hides output for that specific chunk.
- [x] It executes initial configuration/libraries without printing the code or output in the report
      Correct! `include = FALSE` runs the chunk (e.g. setting knitr options or loading libraries) but hides code and output.
- [ ] It permanently disables R execution for all subsequent chunks
      Subsequent chunks execute normally unless explicitly set otherwise.
