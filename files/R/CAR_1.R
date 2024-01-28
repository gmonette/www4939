#' ---
#' title: 'CAR: Chapter 1'
#' author:  ''
#' date:  ""
#' fontsize: 12pt
#' header-includes:
#' - \usepackage{amsmath}
#' - \usepackage{geometry}
#' - \geometry{papersize={6in,4in},left=.2in,right=.2in,top=.1in,bottom=.1in}
#' - \newcommand{\var}{\mathrm{Var}}
#' output:
#'   pdf_document:
#'     toc: true
#'     number_sections: true
#'     toc_depth: 3
#'     highlight: tango
#' urlcolor: blue
#' ---
#' This version rendered on `r format(Sys.time(), '%B %d %Y %H:%M')` \newline
#' Based on scripts created for
#' J. Fox and S. Weisberg (2019) An R Companion to Applied Regression, 3rd Edition
#+ knitting, include=FALSE
# defaults if knitting
knitr::opts_chunk$set(comment=" ", error = TRUE, fig.width = 6, fig.height = 3.4)
if(.Platform$OS.type == 'windows') windowsFonts(Arial=windowsFont("TT Arial"))
options(width = 60)
#' Load the package written for this textbook:
library(car)
#'
#' This script introduces a number of principles in R. Understanding
#' these principles goes a long way towards helping you become a 
#' productive user of R. The name of each principle is shown in
#' __bold__. You can search through 
#' [The R Language Definition](https://cran.r-project.org/doc/manuals/r-release/R-lang.html)
#' to pursue questions that arouse your curiosity.
#' 
#' Post questions and comments on Piazza.
#' 
#' # Arithmetic and basic objects
#' 
#' Operators grouped in reverse order of __precedence__
#' 
2 + 3 # addition
2 - 3 # subtraction

-3    # unary minus (binary: two arguments, unary: one argument)

2*3   # multiplication
2/3   # division

2/0
2/Inf
Inf - Inf
2^3   # exponentiation
#'
#' Examples
#'
4^2 - 3*2
4 ^ 2-3 * 2  # are spaces important in arithmetic expressions?

1 - 6 + 4  # with equal precedence operations 
           # are executed from left to right
1 + 4 - 6

4^2 - 3*2
(4^2) - (3*2)
4^ (2 - 3)*2  # what happens here?

(4 + 3)^2  
4 + 3^2

-2--3    # unary minus
-2 - -3
-2 - - 3
 
-3*-2 
#'
#' Which has higher precedence: 
#' exponentiation or unary minus?
#' 
#' Some systems, e.g. Excel, follow the opposite order of precedence
#'
-3^2 
0-3^2
(-3)^2
#'
#' Integer division
#'
10 %/% 3
#'
#' Modulo arithmetic: remainder 
#' 
10 %% 3
3 * (10 %/% 3) + 10 %% 3 # why?!
#'
#' ## Extended arithmetic
#' 
1/0
#'
Inf - 1
Inf + Inf
Inf * 2
Inf - Inf
0/0
#' 
#' ## Complex numbers too
#' 
0i
1i
#'
#' Euler's identity
exp(1)
exp(1)^(1i*pi)
exp(1)^(1i*pi) + 1  # complex machine 0
#'
#' ## How numbers are printed
#' 
1.23456789 
1.23456789 * 10^8  
1.23456789e8  # same number in scientific notation  

1.23456789 * 10^10 
1.23456789 * 10^12 


1.23456789 * 10^-4 
1.23456789 * 10^-5 
1.23456789 * 10^-10 
#'
#' ## Example of using options and restoring prior state
#'
opts <- options(scipen = 15)  # penalty 'against' scientific notation

1.23456789 
1.23456789 * 10^8 
1.23456789 * 10^10 
1.23456789 * 10^12 


1.23456789 * 10^-4 
1.23456789 * 10^-5 
1.23456789 * 10^-10 

opts
options(opts)  # restoring previous state
#'
#' To see more options in base R use `?options`
#' 
#' ## Printing with `format`
#'
format(1.23456789 * 10^10)
format(1.23456789 * 10^10, big.mark = ',')
format(123456789.1234, big.mark = ',')
format(123456789.1234, big.mark = ',', nsmall = 2)
#' 
#' adding a dollar sign:
#' 
paste0('$',format(123456789.1234, big.mark = ',', nsmall = 2))
#'
#' For more possibilities, see `?format` and `?prettyNum`.
#' For people who know C, see `?formatC`
#' 
#' ## typeof
#' 
#' Every object in R has a 'type' that identifies its
#' internal representation. You can find the type 
#' with the 'typeof' function.
#' 
#' Let's see the types of things we've seen so far:
#' 
typeof(1:4)
typeof(4)   # looks like an integer
typeof(4L)   # In 4L, L stands for L i.e. a 64 bit integer
typeof(4L + 3L)  
typeof(4L + 3)
typeof(Inf)
typeof(options) # fancy term for a function with baggage
typeof(1.23456789)
typeof(paste0)
typeof('$')
typeof(typeof)
typeof(opts)  
#' 
#' # Calling Functions
#'
log(100)
log(100, base = 10) # why is this different? 
#' 
#' For the 'log' function, the second argument is optional
#' because it has a default value. 
#' 
#' What do you think the default value is?
#' 
log10(100) # equivalent
#'
#' Functions have arguments.
#'
# the possible arguments and their names and defaults, if any
args("log") # the possible arguments and their 
            # names and defaults, if any
args("+") # operators are functions too
args("format")
args("args")
args("library")
#' 
#' - In a language like C, you need to supply every argument
#'   when you call a function. Thank goodness you don't need
#'   to do that in R.
#' - Arguments can be supplied by position and/or by name
#' - Names can be abbreviated as far as possible to avoid ambiguity
#' 
log(100, b=10) # 'b' will do. Why?
#' 
#' An argument can be optional even if it doesn't
#' have a default value provided that value of the argument
#' is not used as the function is evaluated.
#' 
log(100, 10) # arguments can be supplied by name or by position
#'
#' # Vectors and Variables
#'
c(1, 2, 3, 4, NA, 6)  # c: combine or catenate or concatenate 
1:4 # integer sequence
4:1 # descending
-1:2 # negative to positive
0-1:2 # why is this different? Could you explain why on a test???

seq(1, 4) # equivalent to 1:4
seq(2, 8, by = 2) # specify interval between elements
seq(0, 1, by = 0.1) # noninteger sequence
seq(0, 1, length = 11) # specify number of elements

rep(2, times = 10)  # 'rep' for 'repeat'
rep(c('a','b'), times= 5) # recycling repeat
rep(c('a','b'), length.out = 5)
rep(c('a','b'), each = 5)  # not recycling, each repeated 5 times 
rep(c('a','b'), times = c(5,2)) # like 'each' different times
rep(c('a','b'), c(5,2)) # what's the default second argument?
#'
#' ## Operations on vectors
#'
3 * c(1, 2, 3, 4)  # scalar multiplication as in linear algebra
c(1, 2, 3, 4) / 2
#'
#' Dividing a vector by a vector: Is this like linear algebra?
#' 
c(1, 2, 3, 4) / c(4, 3, 2, 1)
#'
#' What happened? __element-wise operations__. Many operations
#' are applied element by element.
#' 
#' Applying a function to a vector:
#'
log(c(0, 0.1, 1, 10, 100), base=10)
#'
#' Many functions in R are __vectorized__. Sometimes for more
#' than one argument:
#' 
log(c(2,10,100), base = c(2,10,100)) 
#'
#' What happens if you do something that doesn't make sense, like
#' adding a long vector to a short vector:
#' 
c(1, 2, 3, 4) + c(4, 3) # no warning! What happens?
#'
#' R usually assumes that you must know what you are doing and tries to
#' do something reasonable. Here R applied what's known as the
#' __recycling__ principle: recycle the shorter vector as many times
#' as necessary to provide value to match the longer vector.
#'
#' However, if the length of the longer vector is not a multiple of
#' the length of the shorter vector, R starts to worry about you
#' and gives you a warning:
#' 
c(1, 2, 3, 4) + c(4, 3, 2) # R thinks maybe you made a mistake
#'
#' ## Creating and naming objects
#'
x <- c(1, 2, 3, 4) # assignment -- does not print result
x # prints value of x
(x <- c(1, 2, 3, 4)) # assigns and prints at the same time
#'
#' Why not `=` instead of `<-`? (pronouced 'gets').
#' 
#' We used `=` to assign arguments to parameters 
#' when calling functions.
#' 
#' Actually, `=` works ... most of the time. But stick with `<-`.
#' Your fingers will get used to it. 
#'
#' R uses three symbols for three distinct operations that
#' are all represented with `=` in most other languages. The third,
#' which we will see soon, is logical `=` which is denoted `==` in R. 
#' 
#' I still regularly make the mistake of typing `=` when I should
#' have typed `==`.
#' 
x/2  # equivalent to c(1, 2, 3, 4)/2
(y <- sqrt(x))  # assign AND print
#'
#' ## Random number generation
#'
set.seed(372291)  # for reproducibility (chosen randomly) 
(x <- rnorm(100))  # 100 standard normal random numbers
#' 
#' Many distributions are in base R: 
#' e.g. 'norm', 'exp', 'poisson', student', 
#' 't', 'cauchy', 'f', etc.
#' 
#' The 'extraDistr' package and others have many more. 
#' 
#' To generate random numbers from a distribution, prepend
#' the name with and __r__:
#' 
rf(10, df1 = 2, df2 = 10)
#' 
#' To get the density for a continuous distribution) or 
#' the probability for a discrete distribution, prepend the name
#' with a __d__ for density. Note that the probability in the case
#' of a discrete distribution is indeed a density with respect
#' to counting measure. 
#' 
dnorm(0)
dnorm(seq(-3,3,1))
xs <- seq(-4, 4, by = .05)
plot(xs, dnorm(xs), type = 'l')
#'
#' Prepend with a __p__ for the cumulative distribution function
#' 
plot(xs, pnorm(xs), type = 'l')
lines(xs, dnorm(xs), type = 'l')
#' 
#' To get a quantile from a probability, the inverse CDF,
#' prepend the distribution name with a __q__
#' 
#' Note the ubiquitous summary function:
#'
summary(x)
#'
#' We will see much more about it when we take up OOP. 
#'
#' ## Character objects
#'
(words <- c("To", "be", "or", "not", "to", "be"))
typeof(words)
paste(words, collapse=" ")
paste(words)
paste(words, words)
paste('Variable', 1:10)
paste('Variable', 1:10, sep = '_')
paste('Var', 1:10, sep = '')
paste0('Var', 1:10)   # same as sep = ''
#'
#' Take a column of $ amounts and format accordingly
#' 
(amts <- c(123.45,123456.78,12345678.912))
paste0('$', format(amts, big.mark = ',', nsmall = 2))
#' __OOPS__:
#' Look up help on format with '?format' and discover
#' the 'trim' argument.
#' 
paste0('$', format(amts, big.mark = ',', nsmall = 2, trim = TRUE))
#' That's better!
#'
#' ## Logical values
#'
(logical.values <- c(TRUE, TRUE, FALSE, TRUE))
typeof(logical.values)
#' 
#' Actually R uses '3-valued' logic
#'
(logical.values <- c(TRUE, TRUE, FALSE, NA, TRUE))

!logical.values # unary not
logical.values | FALSE  # binary or -- note that FALSE gets recycled
logical.values & FALSE  # binary and
logical.values | TRUE  # binary or -- note that FALSE gets recycled
logical.values & TRUE  # binary and
logical.values == FALSE  # equals
logical.values != FALSE  # not equals
logical.values == TRUE  # equals
logical.values != TRUE  # not equals
#'
#' Did the 'NA" always result in 'NA' in the corresponding position?
#' If not, why not? Could you explain why on a test?
#'
#' ## Truth tables
#' 
y <- c(TRUE, FALSE, NA)
y
names(y)   # the names attribute of x is NULL

names(y) <- as.character(y) # use 'names' replacement function
                            # to give y names
y
#' Truth tables
outer(y, y, '|')   # note the value of "TRUE | NA"
outer(y, y, '&')
outer(y, y, '==')
outer(y, y, '!=')
#' 
#' Example of logical expressions
#'  
1 == 2
1 != 2
1 <= 2
1 < 1:3   # recycling
3:1 > 1:3
3:1 >= 1:3  
TRUE & c(TRUE, FALSE)     # logical AND
c(TRUE, FALSE, FALSE) | c(TRUE, TRUE, FALSE)  # logical OR
#' 
#' Logical vectors used in 'ifelse' statement
#' 
(z <- x[1:10]) # first 10 elements of x
z < -0.5 # is each element less than -0.5?
z > 0.5  # is each element greater than 0.5
z < -0.5 | z > 0.5  #  < and > are of higher precedence than |
abs(z) > 0.5  # absolute value, equivalent to last expression
#' 
#' The 'ifelse' function has three arguments:
#' 
#' - all three are vectors
#' - the first is a logical vector
#' - the second gives values for positions where 
#'   the first is true
#' - the third gives values where the first is false
#' 
ifelse( abs(z) > 0.5, z, 0) # note that 0 get recycled
#' 
#' We can also use a logical vector to __select__ elements of a 
#' vector:
#' 
abs(z) > 0.5 # which values of z satisfy |z| > 0.5
z
z[abs(z) > 0.5] # select values of z for which |z| > 0.5
z[!(abs(z) > 0.5)] # values z for which |z| <= 0.5
#'
#' ## Special logical operators ``&&`` and ``||`` 
#'
#' - Work only on single expressions, not vectors
#' - Only evaluate what they need to determine the result
#' 
TRUE && FALSE   # works only on single expressions, not vectors
TRUE || FALSE   # only evaluates what it needs to determine result
#'
#' __QUESTION:__ Explain what happens here
#' 
log(-1)
TRUE || log(-1)  
FALSE || log(-1)
#' 
#' ## How __coercion__ works in R
#' 
#' What happens when you try to do something that isn't quite right
#' with an object?
#' 
sum(c(T,F,F,T)) # logical gets coerced to numeric
#' TRUE becomes 1 and FALSE becomes 0 
sum(!c(T,F,F,T))
#'
#' This is very useful if you want the count the number of elements
#' of a vector that satisfy a condition. For example, how many numbers
#' in 'x' are greater than 1.96 in absolute value:
#' 
sum(abs(x) > 1.96)
#' 
#' ... and what proportion?
#' 
sum(abs(x) > 1.96) / length(x)
#'
#' What happens when you catenate things that are of different types? 
#' Vectors can only contain elements of the same type.  
#' We'll soon see how to use a __list__ that
#' can contain elements of different types.
#' 
c("A", FALSE, 3.0) 
c(10, FALSE, -6.5, TRUE)
#'
#' ## The hierarchy of atomic types: promotion and demotion
#' 
#' - logical  (lowest)
#' - numeric:
#'   - integer
#'   - double
#'   - complex
#' - character  (highest)
#' 
#' All the elements of a vector must be of the same type so if you
#' try to mix types in a vector, the 'lower' types get __coerced__
#' (i.e. __promoted__) to the 'higher' types
#' 
c(TRUE, 1, 'one') # all get coerced to character
c(TRUE,1i)        # all get coerced to complex
c(TRUE,1i, 'one') # what should happen here?      
#'
#' __QUESTION__: Try to guess the difference between the result
#' evaluated from the following 2 lines. Note that the innermost
#' expressions need to be evaluated first.
#' 
#+ eval=FALSE
c(c(TRUE, 2), 'dog') 
c(TRUE, c(2, 'dog')) 
#' 
#' ## Explicit coercion
#' 
as.logical(2)
as.character(2)
as.integer(2.5)
as.integer(2.9)   # truncation, not rounding
round(2.5)   # What's happening?
round(3.5)
typeof(round(2.5))
as.complex(2)
as.numeric('2')
as.numeric('two')
#' 
#' ## Implicit coercion
#' 
4 + TRUE
#' 'TRUE' got __promoted__ to numeric
#' 
4 & FALSE
#' 4 got __demoted__ to logical
#' 
1 == TRUE # does 1 get demoted, or TRUE get promoted?
#' 
#' # Selecting elements of a vector
#'
#' ## Selecting by position with positive numbers
#' 
x[12]             # 12th element
words[2]          # second element
logical.values[3] # third element

x[6:15]       # elements 6 through 15
x[c(1, 3, 5)] # 1st, 3rd, 5th elements
#'
#' __QUESTION:__ What happens if you go too far?
#' 
words[10]
x[100000]
logical.values[9]
#'
#' Although all these NA's look the same, they are subtly
#' different
#' 
#' ## Selecting by omission of positions with negative numbers
#'
x[-(11:100)] # omit elements 11 through 100
letters  # this object comes with R
letters[-c(1,5,9,15,21)] # what have we done?
#'
#' ## Selecting with a logical vector
#'
v <- 1:4
v[c(TRUE, FALSE, FALSE, TRUE)]

vowels <- c('a','e','i','o','u')
letters %in% vowels  # a very useful operator
letters[!(letters %in% vowels)]

`[`(v,c(T,F,T,F))   # Everything that happens is a function!
`[`(v,c(T,F))   # What's happening here??
v[c(T,F)]
#' 
#' ## Selecting with names
#' 
#' Vectors can get named:
#' 
(age <- c(10, 9, 15, 16))
names(age) <- c('Paula','Imran','Angela','Jiwon') # replacement fn
age
#'
#' Selecting by name
#' 
age['Angela']
age['George']
age[c('Jiwon','Paula')]
age[c(NA,'Paula')]
names(age)

names(age) %in% c('Bob', 'Paula', 'Imran')
age[ names(age) %in% c('Bob', 'Paula', 'Imran') ]
age[ !names(age) %in% c('Bob', 'Paula', 'Imran') ]
#' Example of a __regular expression__
#' 
#' '^A' matches a capital A at the beginning of a string
#' 
#' 'grepl' stands for global regular expression print logical
grepl('^A', names(age)) 
age[ grepl('^A', names(age)) ]

sort(names(age))
age[ sort(names(age)) ]
#' 
#' ## Selecting elements of a matrix
#' 
#' A __matrix__ is like a vector but with two dimensions. If the
#' dimension is higher, it's called an __array__.
#'
mat <- matrix(1:12, nrow = 3, ncol = 4)
mat # notice that it got filled column by column
#' 
#' A matrix can have rownames and columns names
#' 
rownames(mat) <- c('Algebra','Analysis','Geometry')
colnames(mat) <- c('2013','2014','2015','2016')
mat
dim(mat)
nrow(mat)
ncol(mat)
sum(mat)
#' 
#' Selecting elements is much like vector except that we have
#' two dimensions. Look at the following carefully to see what's
#' happening. Notice what happens if a dimension is blank.
#' 
mat[2,4]
mat[2,5]  # different from vectors
mat[c(2,3),]  # blank means: take everything
mat[c(2,3), 1:4]  # blank means: take everything
mat[c(2,3),3] # Oops! a dimension got dropped
#'
#' Dropping a dimension might seem like no big deal but
#' it's one of the things that early designers regret
#' adopting as a default. If your matrix is buried in
#' a function and it drops a dimension that might 
#' spell hidden trouble when the function tries to 
#' multiply it by another matrix.
#' 
mat[c(2,3), 3, drop = FALSE] 
#' 
#' Using 'drop' is the safe way within functions where you don't
#' know whether the selecting vector might have length 1 or 0 
#' when the function is called.
#' 
mat[c('Algebra','Geometry'),c(2014,2015)] # Need characters
mat[c('Algebra','Geometry'),c('2014','2015')] # Good
mat[c('Algebra','Geometry'),c(NA,'2014','2015')] # NA tilts

mat[c('Algebra','Geometry'),-3] 
mat[c('Algebra','Geometry'),-(1:4)] # a columnless matrix
mat[-(1:3),] 
mat[-(1:3),-(1:4)] 
#' 
#' # Operators are functions
#'
#' Chambers' dictum (main early creator of S at Bell Labs)
#' 
#' - __Everything that exists is an object__
#' - __Everything that happens is a function call__
#' 
1 + 2 # `+` is a binary operator
`+`(1,2)  # but really a function with two arguments
#' Note: to call an object with a weird name, just
#' put its names in backticks.
#' 
#' # Valid object names in R
#' 
#' What names are valid?
#' 
#' You can use:
#' 
#' - letters, case-sensitive
#' - numbers
#' - underline
#' - period
#' - must start with a letter or period but
#'   not a number or underline
#' - the first non-period character must 
#'   not be a number
#' 
#' __QUESTION:__ Which of the following 
#' assignments use valid names?
#'
#' 1. `a_very_long_name <- 0`
#' 1. `_tmp <- 2`
#' 1. `.tmp <- 2`
#' 1. `..val <- 3`
#' 1. `.2regression <- TRUE`
#' 1. `._2_val <- 'a'`
#'
#' # Writing your own functions
#' 
#' It's easy in R to write your own functions and to build up
#' a toolbox over time. You can document your functions in a package
#' and share it with other users.
#'
mean(x)
sum(x)/length(x)
#' 
#' Here's a very simple function that duplicates an existing one:
#' 
myMean <- function(x){
    sum(x)/length(x)
}
myMean(x)
#'
y # defined earlier as sqrt(c(1, 2, 3, 4))
myMean(y)
myMean(1:100)
myMean(sqrt(1:100))

mySD <- function(x){
    sqrt(sum((x - myMean(x))^2)/(length(x) - 1))
}
mySD(1:100)
sd(1:100) # check
typeof(mySD)
#'
#' Functions are 'first-class' objects in R
#'
mySD
myMean

letters
mySD(letters)
#'
#' # Quick overview of basic regression and plots in R
#'
#' 'Duncan' is a data frame (the term used in R to 
#' refer to the kind of object used to contain a data set)
#' in the 'car' package. Since we 
#' loaded the 'car' package (with 'library(car)') we can use
#' 'Duncan' typing its name.
#' 
head(Duncan, n=10) # U.S. data set from the 50s, first 10 lines
dim(Duncan)

summary(Duncan) 
library(spida2)  # install with devtools::install_github('gmonette/spida2')
xqplot(Duncan)   # uniform quantile plots
xqplot(Duncan, ptype = 'n')   # normal quantile plots
#'
#' ## Referencing variables in data frames
#'
#' We will see this again later
#' 
#' Fully qualified name 
hist(Duncan$income)
#' using the 'with' function: the second argument is 
#' evaluated in the data frame
with(Duncan, hist(income))
#'
#' using 'attach'  -- __ very highly deprecated__
#' e.g. [this blog post](https://www.r-bloggers.com/to-attach-or-not-attach-that-is-the-question/)
#' 
#' 
attach(Duncan)
hist(income)
detach(Duncan)
#' 
#' Many 'recent' (past 25 years) modelling functions 
#' and graphic functions in R use __formulas__. 
#' When a model or a graph is defined by a formula,
#' the data frame in which the terms of the formula
#' are to be found
#' is an argument of the function.
#'
scatterplotMatrix( ~ prestige + education + income,
                   data = Duncan, id = list(n=3))
#' 
#' Fitting a least-squares regression model
#'  
(Duncan.model <- lm(prestige ~ education + income, 
                      data = Duncan))
#'
#' Estimated coefficients and other results of the regression:
#'
summary(Duncan.model)
#'
#' Four important plots to check the regression:
#'
plot(Duncan.model, id.n = 5, ask = FALSE)
#'
#' The density of the studentized residuals:
#'
densityPlot(rstudent(Duncan.model))
#'
#' Quantile plot of residuals:
#'
qqPlot(Duncan.model, id = list(n = 3))
#'
#' Outliers:
#'
outlierTest(Duncan.model)

influenceIndexPlot(Duncan.model, vars = "Cook",
    id = list(n=3))

influenceIndexPlot(Duncan.model, vars = "hat",
    id = list(n=3))
#'
#' ## Added-variable plots
#' 
#' Also know in PROC REG in SAS as 'partial regression leverage plots'
#' not to be confused with partial residual plots 
#' (better described as 'component plus residual plots') 
#' although the are often called that.
#' 
avPlots(Duncan.model, ~ education,
    id=list(cex=0.75, n=3, method="mahal"))
#'
#' Imagine the following plot is a simple scatterplot
#' between two variables. What do you see?
#' 
avPlots(Duncan.model, ~ income,
    id=list(cex=0.75, n=3, method="mahal"))
#'
#' In multiple regression, the AVP is the closest you 
#' come to seeing what drives the estimation of 
#' each regression coefficient.
#'
#' ## Component-plus-residual plots
#' 
#' Also known as partial residual plots. These tend to be more
#' widely used but often less informative than AVPs
#' 
crPlots(Duncan.model, ~ education, id = list(n=3))
crPlots(Duncan.model, ~ income, id = list(n=3))
#'
#' Non-constant variance test
#'
ncvTest(Duncan.model)
ncvTest(Duncan.model, var.formula = ~ income + education)
#'
#' Position of row names
#'
whichNames(c("minister", "conductor"), Duncan)
#'
duncan.model.2 <- update(Duncan.model, subset = -c(6, 16))
#' 
#' An alternative approach that uses the '%in%' operator
#' to creae a logical vector
#' 
outliers <- names(Duncan) %in% c("minister", "conductor")
#'
duncan.model.2 <- update(Duncan.model, subset = !outliers)
#'
summary(duncan.model.2)
#' 
#' Comparing coefficients with and without outliers:
#' 
compareCoefs(duncan.model, duncan.model.2)
#'
#' Type of predictor
#'
summary(Duncan$type)

summary(Duncan$prestige)

summary(Duncan)
#'
#' Model with interaction
#'
summary(lm(prestige ~ education + income, data = Duncan))

class(Duncan$type)
class(Duncan$prestige)
class(Duncan)

duncan.model <- lm(prestige ~ education + income, data=Duncan)
class(duncan.model)
#'
#- # Basics of Object-Oriented Programming in R ------
#' # Basics of Object-Oriented Programming in R
#' 
#' What happens when you use the function 'summary' on an 'lm' model:
#' 
summary(duncan.model)
#' 
#' A __generic function__:
#' 
summary
#'
#' Class of 'duncan.model':
#' 
class(duncan.model)
#'
#' A __method__ for the 'lm' __class__ for the generic function
#'
args(summary.lm)
#'
#' The real work happens in the special function
#' that is the method for the generic function 'summary'
#' for the 'lm' class.
#'
summary.lm
#'
#' This is R's basic form of Object-Oriented-Programming (OOP).
#' It's what makes it possible for R to have grown through the work
#' of different contributors working relatively independently.
#' 
#' If you create a new statistical method that produces a special
#' kind of object, you don't have to request that 'summary' be changed
#' to work on your object. You just give your object a class
#' and write a summary method for it.
#' 
#' - __summary__ is the __generic__ function
#' - __summary.lm__ is a __method__ for this generic function
#' - __lm__ is the __class__ that this methods works on
#'   
#' All the __methods__ for the generic function __summary__, i.e.
#' all the classes that __summary__ works on.
#' 
methods(summary)
getAnywhere('summary.ppr')
#' 
#' All the methods that work on class 'lm':
#' 
methods(class = 'lm')
getAnywhere('logLik.lm')
#'
#' ## Creating your classes and methods
#'  
#' Here's latest discovery of a new statistical method: Use the
#' median to 'fit' data!
#' 
silly <- function(x) {
    ret <- median(x)
    class(ret) <- 'silly'
    ret
}
fit <- silly(x)
fit
class(fit)
#' I write a __method__ for the __summary__ generic function for
#' the __class__ 'silly'. 
summary.silly <- function(fit) {
    cat('This is the fitted value from the silly method: ')
    cat(fit,'\n')
    invisible(fit)
}
#' See what it does:
summary(fit)
#'
#' When I called the 'summary' function, it
#' checked the class of its first argument, 'fit'.
#' 
#' Finding that the class was 'silly', summary looks for 
#' a function called 'summary.silly' and uses that function.
#' This is called __dispatching__. If 'summary.silly'
#' hadn't existed summary would have used 'summary.default'.
#' 
#' For example, when you use 'glm' 
#'
mod.mroz <- glm(lfp ~ ., family=binomial, data=Mroz)
class(mod.mroz)
summary.glm
#'
#' # Loops in R
#'
#' You almost never need to use a for loop in R.
#' 
#' Let's see why:
#' 
#' __Most functions and operators are already vectorized.__
#' 
#' In C, if you want to add two vectors, you need to do this:
#' 
(x <- 1:5)
(y <- 11:15)

# Adding 2 vectors:

z <- rep(0, length(x))   # create an object to hold the result
i <- 1 # initialize the index
while(i <= 5) {
    z[i] <- x[i] + y[i]
    i <- i + 1   # increment the index
}
z # et voila
#'
#' What does it mean to say that the '+' operator is vectorized?
#' 
z <- x + y   # much easier
z 
#'
#' Here's a simple problem: 
#' 
#' From a matrix, for each row, count the number of entries greater than 4
#' 
#' Create a matrix:
#' 
set.seed(123345)
mat <- matrix(sample(0:10, 30, replace = TRUE), nrow = 5)
mat
#'
#' Using for loops:
#'
count <- rep(0, 5)      # initialize count
for(i in 1:5) {         # index over rows
    for(j in 1:6) {      # index over columns
        if(mat[i,j] >4) count[i] <- count[i] + 1   # increment counter
    }
}
count
# check
mat
#'
#' ## Using 'apply' functions in R
#'
#' R is OO so we can work directly with things like vectors and matrices
#'
#' Suppose we had a function that can count how many elements of a 
#' vector are greater than 4
#' 
g4 <- function(x) {
    sum(x > 4)
}
g4(1:10)
#'
#' Use __apply:__ works on dimensions of an array, e.g. rows or columns of a matrix
#'
apply(mat, 1, g4) # the '1' says apply the function g4 to each **row**
#'
#' If you wanted to apply it to each column:
#'
apply(mat, 2, g4)
#'
#' Another way is to use the fact that '<' is vectorized:
#'
mat > 4
apply(mat > 4, 1, sum)
#'
#' Note that 'apply' takes 3 or more arguments:
#' 
#' 1. matrix or array
#' 2. dimension(s) to define dimensions (facets, rows, columns, etc.) of the array to work on 
#' 3. a function to apply to each object 
#'
#' The fact that a function is an ordinary argument of a 
#'
#' There are many other 'apply' functions that work on difference kinds
#' of objects:
#' 
#' - lapply on lists or vectors: returns a list
#' - sapply on lists of vectors: returns a vector if it can
#' - mapply applies a function to lists of arguments
#' - Map does something similar
#' - do.call applies a function to a list of arguments
#' - capply in spida2 applies a function to chunks of values of an argument, 
#'   the chunks are defined by the values of another argument.
#'   
#' Experienced R programmers rarely use for loops (sometimes they are useful)
#' and tend to use 'apply' functions instead.
#' 
#' ## Examples of lapply and sapply
#' 
#' A data frame is like a list of its variables
#' 
#' 
#' Suppose you would like to make sure that every factor is turned into 
#' a character variable
#' 
dd <- carData::Prestige
dim(dd)
head(dd)
class(dd)
# how to get the class of each variable?
sapply(dd, class)
sapply(dd, typeof)  # works variable by variable and returns a vector
lapply(dd, typeof)  # works variable by variable and returns a list

lapply(dd, function(x) if(is.factor(x)) as.character(x) else x)
as.data.frame(lapply(dd, function(x) if(is.factor(x)) as.character(x) else x))
#'
#' Pipes %>%
#'
#' Sends the output of one command as the first argument of the next command
#'
library(spida2)
lapply(dd, function(x) if(is.factor(x)) as.character(x) else x) 
as.data.frame(lapply(dd, function(x) if(is.factor(x)) as.character(x) else x)) 
sapply(lapply(dd, function(x) if(is.factor(x)) as.character(x) else x) , class)
#' 
#' Using pipes
#' 
lapply(dd, function(x) if(is.factor(x)) as.character(x) else x) %>% 
    as.data.frame
lapply(dd, function(x) if(is.factor(x)) as.character(x) else x) %>% 
    as.data.frame %>% 
    sapply(class)
#'
#' Other trick to replace dd
#' 
dd[] <- lapply(dd, function(x) if(is.factor(x)) as.character(x) else x) 
dd # note that dd is still a data.frame and not a list
sapply(dd, class)
