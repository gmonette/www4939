#' ---
#' title: "Working with Data"
#' subtitle: "MATH 4939 -- Winter 2020"
#' date: "January 2020"
#' author: "Georges Monette"
#' fontsize: 12pt
#' header-includes:
#' - \usepackage{amsmath}
#' - \usepackage{geometry}
#' - \geometry{papersize={6in,4in},left=.2in,right=.2in,top=.1in,bottom=.1in}
#' - \newcommand{\var}{\mathrm{Var}}
#' - \raggedright
#' output:
#'   pdf_document:
#'     toc: true
#'     number_sections: true
#'     toc_depth: 3
#'     highlight: tango
#' bibliography: math4939.bib
#' link-citations: yes
#' ---
#' This version rendered on `r format(Sys.time(), '%B %d %Y %H:%M')` \newline
#+ knitting, include=FALSE
# defaults if knitting
knitr::opts_chunk$set(comment=" ", error = TRUE, fig.width = 6, fig.height = 3.5)
if(.Platform$OS.type == 'windows') windowsFonts(Arial=windowsFont("TT Arial"))
options(width = 65)
if(FALSE) {
  # Download bibliography file:
  #
  # BEWARE: If you have created your own 
  # file named 'math4939.bib' in the current working directory
  # the following commands will overwrite it.
  #
  # You need to run these commands manually using Ctrl-Return
  # since they are in a 'FALSE' conditional expression.
setwd(spida2::here()) # sets the working directory to the
  # directory in which you have saved this file.
download.file(
  "http://blackwell.math.yorku.ca/MATH4939/common/math4939.bib", 
  'math4939.bib') 
}
#' 
#' # Introduction
#' 
#' These notes are a work in progress meant to supplement
#' material in @fox2019r. The focus is using data to answer
#' simple questions that only require simple tools.
#' 
#' There is a [\underline{collection of exercises}](http://blackwell.math.yorku.ca/MATH4939/questions/m4939_questions_2020.html) 
#' on R many of which are related to this material.
#'
#' Questions, links and discussions concerning this material can
#' take place on Piazza. There's a copy of this document on
#' Piazza that you can edit to
#' 
#' - correct errors
#' - improve or add to the presentation
#' - add relevant exercises. To add exercises, precede them with
#'   a 'level 3' heading: '### Exercises'
#'
#' We use the following packages in this script which 
#' you may need to install if you haven't already:
#+ eval=FALSE
if(FALSE) {
  # install these manually if you need to:
  install.packages('haven')
  install.packages('tidyverse')  # might take a long time
  install.packages('readxl')
  install.packages('devtools')
  install.packages('car')
  install.packages('magrittr')
  install.packages('latticeExtra')
  install.packages('alr4')
  devtools::install_github('gmonette/spida2')
}
#'
#' Play with the basic R functions listed in 
#' [\underline{Hadley Wickham's chapter on vocabulary}](http://adv-r.had.co.nz/Vocabulary.html).
#' Write a script that illustrates the use of these functions.
#' 
##' # Data Input ----
#' 
##' ## From a package ----
#'
#' The Davis data set in the 'car' package on measured versus reported height:
#' 
library("car") # loads car and carData packages
class(Davis)
brief(Davis)
library(spida2)
xqplot(Davis) # uniform quantiles
xqplot(Davis, ptype = 'n')  # normal quantiles
#'
# if not installed: install.packages('alr4')
data("Challeng", package="alr4")
brief(Challeng)
#'
##' ## From vectors ----
#'
cooperation <- c(49, 64, 37, 52, 68, 54, 61, 79, 64, 29,
    27, 58, 52, 41, 30, 40, 39, 44, 34, 44)

(condition <- rep(c("public", "anonymous"), c(10, 10)))
(sex <- rep(rep(c("male", "female"), each=5), 2))

rep(5, 3)
rep(c(1, 2, 3), 2)

rep(1:3, 3:1)

Guyer1 <- data.frame(cooperation, condition, sex)
brief(Guyer1)

Guyer2 <- data.frame(
  cooperation = c(49, 64, 37, 52, 68, 54, 61, 79, 64, 29,
                  27, 58, 52, 41, 30, 40, 39, 44, 34, 44),
  condition = rep(c("public", "anonymous"), c(10, 10)),
  sex = rep(rep(c("male", "female"), each=5), 2)
)
identical(Guyer1, Guyer2)
#'
#' The structure of a data frame:
#' 
#' - a __list__ in which each element has the same length
#'
str(Guyer1)
#' 
#'
##' ## From a text file ----
#' 
##' ### From a remote site ---- 
#'
#' If the the values in the file are separated by arbitrary white space
#' use the __read.table__ function. 
Duncan <- read.table(
  file="https://socialsciences.mcmaster.ca/jfox/Books/Companion/data/Duncan.txt", 
  header=TRUE)
brief(Duncan)  # a 'car' function that prints first 3 and last 2
               # rows along with the type of each variable
#' 
##' ### Locally ---- 
#' 
#' We're going to download this text file from John Fox's website to
#' illustrate what it looks like when reading a local file:
#' 
download.file(
  "https://socialsciences.mcmaster.ca/jfox/Books/Companion/data/Duncan.txt", 
  "Duncan.txt")
Duncan <- read.table("Duncan.txt", header = TRUE)
brief(Duncan) 
xqplot(Duncan)
# use: ?Duncan for more information
#'
##' ## Excel files ----
##' 
##' ### CSV files ----
#' 
#' One way to read a single Excel spreadsheet is to save it 
#' from Excel as a comma-separated-values (CSV) file from Excel.
#' You can then read it with the __read.csv__ function that works
#' like 'read.table' except that 'header = TRUE' is the default
#' and fields are separated by commas (,). If a field contains
#' a comma then it must be enclosed in quotes. You don't need to
#' worry about this. Excel takes care of creating an appropriate
#' file and 'read.csv' takes care of reading it. 
#' 
#' For more advanced work, look at the help file for __read.table__.
#' 
#' ### Reading worksheets from an Excel file ----
#' 
#' The Hadleyverse uses 'tibbles': data frames with extra information
#' and an aversion to factors and rownames 
#'
#' I believe that currently the __readxl__ package in CRAN may be
#' __(but see some reservations below)__
#' the most effective way to read Excel worksheets directly.
#' 
#' The 'readxl' package is part of the 'tidyverse' (which is
#' part of what's often referred to as the 'Hadleyverse' after
#' Hadley Wickham who started it). The Hadleyverse adds a lot
#' of functionality to R and redoes much of R's basic 
#' functions. Some people think of it as a new dialect of R,
#' a bit like American English compared with British English.
#' It's controversial whether one should invest effort learning
#' basic R or whether one should jump into the Hadleyverse
#' from the start. Hadley Wickam's excellent on-line book,
#' _Advanced R_ whose 
#' [\underline{first edition is on line}](http://adv-r.had.co.nz/)
#' explores the depths of 'base' R, which are complex enough
#' to require an extensive treatment for anyone who aspires
#' to be creative with the language, either in base R or
#' in the Hadleyverse.
#' 
library("tidyverse")  # loads all of the tidyverse packages
#'
#' Note how 'tidyverse' masks many functions including
#' functions in 'base' packages. This can break code that
#' uses these functions. Having a look at the list of masked
#' function, I notice 'some' in 'car' that I use so, to
#' set things straight, I can redefine 'some'  to make sure
#' that we use the version in 'car':
#' 
some <- car::some
#' 
#' This stores a local version 'car::some' in the global 
#' environment which R searches before looking in 'tidyverse'.
#' This is the list of places where R searches for objects
#' when they are called from the command line:
#' 
search()
#' 
#' You can see that packages are searched in the reverse
#' order in which they were loaded.
#' 
Duncan.tibble <- as_tibble(Duncan)
print(Duncan.tibble, n=5)  # note print() method
brief(Duncan.tibble)
brief(as.data.frame(Duncan.tibble))
#' 
#' - If `file.xlsx` is an Excel file and you
#'   want to read the second worksheet that uses 'NA' for missing
#'   values, use:<br> `dd <- read_excel('file.xlsx', sheet = 2,
#'   na = 'NA')`
#' - If you want to read an Excel file on a web server (e.g.
#'   blackwell), some functions that read files, e.g. `read.csv`,
#'   will accept the URL instead of a path to a local file.
#'   However, at this time, `read_excel` requires a local path.
#'   Thus, you need to download the file before reading it with
#'   `read_excel`. The usual way to download a file within R uses
#'   the `download.file` function. However, the default way to
#'   download binary Excel files, may corrupt the file. Try using
#'   the 'curl' method as illustrated below. This may not be
#'   necessary on Macs. Please let us know on Piazza!
#' - There are two xlsx files on blackwell:
#'     - 'file.xlsx': a small Excel file with clean data except 
#'       that a numerical value was entered as '$1,000.00'
#'     - 'file2.xlsx': same as above except that there is an 
#'       'invisible' single blank in the first column of the row
#'       after the actual data.  `read_excel` will interpret this
#'       as an NA by default and create an entire row of NA
#'       values.  Also, some entries are blank and some entries
#'       have been indicated as NAs by entering 'NA'. These
#'       common irregularities in Excel files can create havoc
#'       unless you are ready to deal with them.
#'       
#' Run this code line by line:
#+ 
library(readxl)
dir <- 'http://blackwell.math.yorku.ca/MATH4939/R/'
download.file(paste0(dir,'file.xlsx'),'_file.xlsx', 
              method = 'curl') # download to _file.xlsx 
                               # to avoid overwriting 
download.file(paste0(dir,'file2.xlsx'),'_file2.xlsx', 
              method = 'curl')
dt <- read_excel('_file.xlsx')
dt2 <- read_excel('_file2.xlsx')
dt 
#' Note that '\$1,000.00' was read as a numerical value!
#' 'read.csv' would not do this. See exercises for a way of
#' cleaning up a numeric variable that was entered with
#' extraneous symbols ($) and a thousands separator.
dt2 
#' Note that the '.' was interpreted as a character value and
#' turned 'Age' into a character variable. With `read.csv` the
#' '.' would have been interpreted as a missing data by default.
#' See 
#' [\underline{this site}](https://docs.oracle.com/cd/E19455-01/806-0169/overview-9/index.html)
#' for the various possibilities used in different countries.  It
#' is easy to use regular expressions (see below) to fix amounts
#' entered in a different format. Also, the symbol used for the
#' radix (the decimal separator) can be specified as the `dec`
#' argument to `read.csv`.
dt2$Age <- as.numeric(as.character(dt2$Age))
dt2
#' To get rid of the blank row
dt2 <- subset(dt2, !is.na(Name))
dt2
#'
#' The files `dt` and `dt2` are tibbles with categorical
#' variables represented as character vectors.
#' 
class(dt)
sapply(dt, class)
#' 
#' You can turn them into data frames with factors
#' for categorical variables as follows:
#' 
dt <- as.data.frame(as.list(dt))
class(dt)
sapply(dt, class)
dt

dt2 <- as.data.frame(as.list(dt2))
class(dt2)
sapply(dt2, class)
dt2
#'
#' Sometimes, <tt>read_excel</tt> will report a warning like:
#' <tt>... expecting numeric: got ...</tt>. This happens when
#' <tt>read_excel</tt> has decided that a column is numeric based
#' on its inspection of the top entries but then encounters
#' non-numeric data. The remedy is to read the file as character
#' and to modify the entries that need to be modified.  See the
#' [\underline{section below}](#regular-expressions-to-replace-strings-within-string-variables)
#' on using regular expressions to fix variables __without
#' touching the original data__.
#' 
#' Reread the data this way:
#+ eval=FALSE
dt2 <- read_excel('_file.xlsx', na = 'NA', col_type = rep('text', ncol(dt2)))
dt2 <- as.data.frame(as.list(dt2))
#' All variables will now be factors.
#' You need to go through them and modify them as needed.
#' If a variable <tt>x</tt>, say, should be numeric, and __does not need any editing__, you can fix it with:
#+ eval=FALSE
z <- as.numeric(as.character(dd$x))  # note that 'as.character' is ESSENTIAL
z # have a look
dd$x <- z # if everything is ok
#' If a variable needs editing, for example suppose student numbers that should have 9 digits
#' have been entered in a variety of ways: '123 456 789', or '123-456-789', or '#12346789' 
#' or with the wrong number
#' of digits, you could do this:
#' 
#+ eval=FALSE
dd$x.orig <- dd$x  # keep the original in case you need to go back and check
z <- as.character(dd$x)
# Have a look:
z
z <- gsub('[ -]','', z)  # remove all blanks and hyphens. 
    # Note that the hyphen must be first or last in the brackets, 
    # otherwise it denotes a range, i.e. '[A-Z]' matches any
    # capital letter.
z <- sub('^#','', z)  # remove leading # signs,'^' is an 'anchor' matching the beginning of the string
z # have another look
table(nchar(z))
# If valid data must have a length of 9:
z9 <- nchar(z) == 9
z <- ifelse(z9, as.numeric(z), NA)
dd$x <- z # Fixed! Invalid input is NA
#'
#' There are a number of packages to write Excel files:
#' 
#' - openxlsx
#' - writeXLS
#' 
#' Post your experiences on Piazza.
#'
##' ### Annoyance in 'readxl' ----
#' 
#' Using <tt>read_excel</tt> to read a file with 9-digit student 
#' numbers as text because some were 
#' entered incorrectly by students converted numbers to 
#' scientific notation: '123456789E0' for no apparent
#' reason because they were read as 'text'.
#' The transformation back to numeric variables works correctly 
#' for 9 digits. One would need
#' to experiment with more digits in the input.  It's annoying 
#' that the string is altered in a way
#' that seems unnecessary. 
#' 
##' ### A wrapper for 'readxl' ----
#' 
#' From 
#' [\underline{this thread on stackoverflow}](http://stackoverflow.com/questions/31633891/specifying-column-types-when-importing-xlsx-data-to-r-with-package-readxl)
#' here is a function that reads an Excel file and make every
#' variable a character variable to avoid problems with variables
#' that you want to read as characters although the top of the
#' data set contains only values that `read_excel` considers
#' numeric. There is isn't a single argument to `read_excel` to
#' request that all variables be read as characters. Instead, you
#' need to know the number of variable to repeat the `col_types`
#' argument as many times as there are columns. That is, the
#' authors did not build in recycling! This function first finds
#' out how many variable there are so it can then call
#' `read_excel` with a correct `col_types` argument.
#'
Read_excel<-function(file, sheet, ...)
{
  library("readxl")
  num.columns <- length(readxl:::xlsx_col_types(file, sheet = sheet, n = 1))
  readxl::read_excel(file, sheet = sheet,
                                     col_types = rep("text", num.columns),...)
}
#' 
##' ## Read sheets from an SPSS file ----
#' 
#' SPSS files have long been a problem for R but there is a
#' relatively recent package, 'haven', on CRAN that seems to do
#' an excellent job. It uses R attributes to store SPSS variable
#' labels and correctly transforms SPSS date into R objects of
#' class 'Date'. Be aware that it is common in SPSS to have
#' user-defined missing values. By default all these values are
#' converted to 'NA' in R but the distinct values are likely to
#' be informative. Use the argument, 'user_na = TRUE' to recover
#' missing value labels. Like 'read_excel', 'read_sav' creates a
#' 'tibble' but the trick that works with Excel files of using
#' 'as.data.frame(as.list(...))' to turn it into a standard data
#' frame does not work here. You might have to some surgery on
#' the variables in some cases.
#' 
#' __Warning:__ Some functions, e.g. 'lm' may treat a categorical
#' variable as a numeric variable producing embarrassingly
#' non-sensical results.
#' 
#+ eval=FALSE
library(haven)
path <- system.file('examples', 'iris.sav', package = 'haven') 
     # get the path to a system file
path
dd <- haven::read_sav(path)
head(dd)  # a tibble
class(dd)
fit <- lm(Petal.Width ~ Species, dd)
summary(fit)  # Species is numerical
ds <- as.data.frame(as.list(dd))
head(ds) # Species is still numerical
# You are not expected to understand the next line ... yet!
dd$Species <- factor(names(attr(dd$Species,'labels'))[dd$Species]) 
     # complicated fix 
str(dd$Species) # now it's a factor!
fit <- lm(Petal.Width ~ Species, dd) 
     # treats 'Species' as a factor with correct levels
summary(fit)  

#' 
#' ## Referring to variables in a data frame ----
#'
#' Data frames have two personalities: 
#' 
#' - list of variable (each of same length)
#' - matrix of entries like a spreadsheet so entries can
#'   be referred to by row and column
#'   
str(Duncan)
#'
#' Fully qualified name
#'
Duncan$prestige     # using the '$' (select) operator
#'
#' 3rd row, 4th columns 
#'
Duncan[3, 4]
#'
#' All rows, 4th column
#'
Duncan[ , 4]
#'
#' Refer to column by name
#'
Duncan[ , "prestige"]
#'
#' Using the 'with' function so names are interpreted within the
#' data frame
#'
with(Duncan, prestige)
with(Duncan, mean(prestige))
#'
##' # Subsetting data frames ----
#'
#' `%in%` is very useful to subset rows of a data frame.
#'
#' The following also illustrates inline `read.csv` and the 
#' 'magrittr' pipe: `%>%`
#' 
library(spida2)
library(car)
library(magrittr)  # for pipes
#'
df <- read.csv(text = 
'
name,    age,   sex,   height
John Smith,     32,     M,       68
Mary Smith,     36,     F,       67
Andrew Smith Edwards, 42,  M,    71
Paul Jones,     31,     M,       65
"Smith, Mary",    33,   F,       32
')
df
#' 
#' Using `subset` with `%in%`
#' 
subset(df, name %in% c('John Smith','Paul Jones'))
#'
#' Implicit drop = FALSE: The resulting factor
#' still has the original levels (sometimes you want this)
#' 
subset(df, name %in% c('John Smith','Paul Jones'))$name
#'
#' Use droplevels to get drop = TRUE, and get rid
#' of original levels.
#' 
subset(df, name %in% c('John Smith','Paul Jones')) %>% 
  droplevels %>%
  .$name
#'
#' Using regular expressions and logical subsetting
#'
subset(df, grepl('Smith', name))   # Smith anywhere
subset(df, grepl('Smith$', name))  # Smith at end of string
#'
##' ## match: associative array ----
#'
#' __%in%__ is a special case of __match__ but it's much more
#' intuitive. Skip this if you prefer.
#' 
#' match(x, table, nomatch) # returns the position of each 
#'                          # x matched exactly in table
match(c('e','b','a','z','ee','A'), letters)
match(c('e','b','a','z','ee','A'), letters, 0)
match(c('e','b','a','z','ee','A'), letters, 0) > 0
c('e','b','a','z','ee','A') %in% letters
#' 
#' can use match to translate
#' 
LETTERS [match(c('a','s','w', 'else'), letters)]
LETTERS [match(c('a','s','w', 'else'), letters, 0)]
#'
##' ## recycling principle ----
#'
#' if a vector is too short, just recycle
#' 
c(1, 2, 3, 4) + 1
c(1, 2, 3, 4) + c(4, 3)     # no warning if multiple fits
c(1, 2, 3, 4) + c(4, 3, 2)  # produces warning otherwise
c(1, 2, 3, 4)[T] # T is recycled to length 4. Why?
c(1, 2, 3, 4)[1] # But 1 is not recycled
#'
##' ## making vectors: rep and seq ----
#'
#' flexible: note how differently it works if the 
#' second argument is a vector:
#'
rep(1:4, 5)  # recycle vector
rep(1:4, 1:4) # repeat each element
rep(1:4, each = 5) # repeat each element
#' like:
rep(1:4, c(5,5,5,5))
#'
#' `seq` is similar to `:` but with more options
#'
1:5
seq(1, 5)
seq(1, 5, 0.5)
seq_along(letters) # generates a sequence of 
                   # indices for a vector or list
#'
#' The __seq_along__ and the __seq_len__
#' functions are useful in __for loops__.
#' Consider the difference between using 'seq_along(x)' and
#' '1:length(x)' if 'x' has length 0 which can easily
#' happen inside a function.
#'  
x <- 1:10
x <- x[FALSE]
x
#' or
x <- 1:10
x <- x[0]
x
#'
1:length(x) # probably not what you want in a for loop
seq_along(x)
#'
##' # apply and friends ----
#'
#' `apply` is the easy one, applied to slices of a mattrix or array
#'
#' `apply(m, MARGIN, FUN, ...)`; MARGIN is a vector with the dimensions
#' to be projected onto
#'
a <- array(1:24, c(2,3,4))
a
apply(a, 1, sum)
apply(a, c(2,3), sum)
a[1,1,1] <- NA
apply(a, c(2,3), sum)
apply(a, c(2,3), sum, na.rm = T) # extra arguments to sum
#'
##' ## lapply: do the same thing to each element of a list ----
#'
#' A data frame is an important example of a list.
#'
#' Suppose you have a data frame with many numeric variables
#' recording temperatures in Celsius and you need to transform
#' them to Farenheit
#'
df <- read.csv(text=
'
city,     day1,  day2,  day3
Montreal,   20,    25,    30
Toronto,    23,    26,    19
New York,   28,    35,    32
')
df
sapply(df, class) # returns a vector if it can
lapply(df, class) # always returns a list
#'
##' ## Simple function ----
#'
#' Simple function for now, later we'll use a generic function
#' and methods
#' 
to_farenheit <- function(x) {
  if(is.factor(x) || !is.numeric(x) ) x # why 'is.factor'?
  else 32 + (9/5)*x
}
to_farenheit
lapply(df, to_farenheit) # but this is a list
as.data.frame(lapply(df, to_farenheit))
#'
##' # Multilevel data ----
#'
##' ## Extensions of apply functions ----
#'
library(spida2)
library(lattice)
library(latticeExtra)
#'
#' Data on math achievement tests in high schools in US
#'   1977 students in 40 schools: 21 Catholic and 19 Public
#' variables:
#'    - school id
#'    - mathach math achievement
#'    - ses socioeconomic status
#'    - Sex: Female Male
#'    - Minority status: Yes or No
#'    - Size of the school
#'    - Sector: Catholic or Public
#'    - PRACAD: priority given to acacemics in school
#'    - DISCLIM: disciplinary climate of school
head(hs)
#' Note that the first use of 'hs' copies 'hs' from spida2.
#' Changes that you make are only local.
#' If you want to get the original back from spida2, use:
data(hs)
#' or, if it's necessary to be more specific:
data(hs, package = 'spida2')
dim(hs)
xqplot(hs)
xyplot(mathach ~ ses, hs)
xyplot(mathach ~ ses, hs) + layer(panel.lmline(...))
xyplot(mathach ~ ses | school, hs) + layer(panel.lmline(...))
xyplot(mathach ~ ses | school, hs, strip = FALSE) + 
  layer(panel.lmline(...))
xyplot(mathach ~ ses | school, hs,
       groups = Sex, strip = FALSE,
       auto.key = T) +
  glayer(panel.lmline(...))
#'
#' Note: Two types of variables:
#'
#' - student-level variables vary from student to student:
#'     - Synonyms: micro or level 1 variables
#' - school-level variables vary from school to school
#'   but constant within schools
#'     - Synonyms: macro or level 2 variables, contextual variable
#' - could have additional levels: School Board, State, etc.
#'
#' We can use the tapply function to get information on individual schools
#'
tapply(hs$mathach, hs$school, mean)
#'
#' tapply(Y, id, function, extra arguments):
#'
#' - apply 'function' to each chunk of 'Y' created by levels of 'id',
#' - use 'id' for names
#'
library(latticeExtra)
tapply(hs$mathach, hs$school, mean)  %>% histogram
tapply(hs$mathach, hs$school, mean)  %>% densityplot
#'
#' But often it's more useful to have the result incorporated back
#' into the data set. We can use `spida2::capply`
#'
hs <- 
  within(hs, {
    mathach_mean <- capply(mathach, school, mean)
  }
  ) 
head(hs)
some(hs)  # random selection of rows (from car)
#'
#' Like tapply but return a vector that has the same shape as Y
#'
#' Creative use of functions gives broad possibilities
#'
#' How variable is mathach in each school?
#'
hs <- within(
  hs,
  {
    mathach_sd <- capply(mathach, school, sd)
    ses_sd <- capply(ses, school, sd)
  }
)
#'
#' These variables can be called 'sample computed contextual' variables
#' because they would be different for a different sample.
#'
#' `capply` can also be used for within-school transformations that are
#' do not produce contextual variables.
#'
#' e.g. within-school ranks
#' 
hs <- within(
  hs, 
  {
    mathach_rk <- capply(mathach, school, rank)
  }
)
some(hs)
#'
#' within-school deviations
#'
hs <- within(
  hs, 
  { 
    mathach_dev <- mathach - capply(mathach, school, mean)
    ses_dev <- ses - capply(ses, school, mean)
  }
)
some(hs)
lm(mathach_dev ~ ses_dev, hs)
lm(mathach_dev ~ ses_dev, hs) %>% summary
lm(mathach ~ ses + factor(school), hs) %>% summary
#'
#' Other contextual variables:
#'
#' Proportion of women in each school
#'
hs <- within(
  hs,
  {                       
    female_prop <- capply(Sex == 'Female', school, mean)
  }
)
some(hs)
#'
#' School-level data set:
#'
#' Normally, the data set will be at the 'finest' level of the data,
#' here students.
#'
#' If each student had been measured on more than one occasion then the
#' finest level would be the 'occasion'
#'
#' But many analyses and graphic displays use the data at a higher level
#'
up(hs, ~ school)  # one row per school with level 2 (and higher) variables
#'
up(hs, ~ school) %>% xyplot(mathach_sd ~ mathach_mean, .)
up(hs, ~ school) %>% xyplot(mathach_sd ~ mathach_mean | Sector, .)
up(hs, ~ school) %>% xyplot(mathach_sd ~ mathach_mean | Sector, .) +
  layer(panel.lmline(...))
#' 
#' Aggregating some variables that vary within schools
#' 
up(hs, ~school, ~Sex )
#'
#' So far, recap:
#'
#' hs: level 1 data set, 'long' data set
#' up(hs, ~ school): level 2 data set, 'short' data set
#'
#' What if you want to add new level 2 data to the level 1 data set
#'
states <- read.csv(text=
'
school,state
1317,New York
1906,New York
2208,New York
2458,New York
2626,New York
2629,New York
2639,New York
2658,New York
2771,New York
3013,New York
3610,Oregon
3992,Oregon
4292,Oregon
4511,Oregon
4530,Oregon
4868,Oregon
5619,Oregon
5640,Oregon
5650,Oregon
5720,West Virginia
5761,West Virginia
5762,West Virginia
6074,West Virginia
6484,West Virginia
6897,West Virginia
7172,West Virginia
7232,West Virginia
7342,West Virginia
7345,West Virginia
7688,South Dakota
7697,South Dakota
7890,South Dakota
7919,South Dakota
8531,South Dakota
8627,South Dakota
8707,South Dakota
8854,Vermont
8874,Vermont
9550,Vermont
9586,Vermont
')
states  # note that this is fictional
#'
#' Merging states into hs
#'
dm <- merge(hs, states, by = 'school', all.x = T)  # left outer join ??
dim(dm)
some(dm)
#'
##' ## Merge examples ----
#'
grades <- read.table(header = TRUE, text = 
'
student course     gp
John    Calculus   3.5
Mary    Algebra    3.9
Paul    Calculus   3.2
John    Statistics 3.9
John    Algebra    3.9
Mary    Statistics 4.0
')
grades

courses <- read.table(header = TRUE, text = 
'
course   credits
Calculus       6
Algebra        3
Statistics     3
')
courses

email <- read.table(header = T, text = 
'
student email
John    john123
Paul    paul456
Walter  wally6
')
email
#'
##' ### Calculate GPA ----
#'
#' 1. need weights
#'
grades <- merge(grades, courses, by = 'course', all = T)
grades
grades$gp_tot <- with(grades, capply(gp * credits, student, sum))
grades$credit_tot <- with(grades, capply(credits, student, sum))
#'
#' 2. weighted average
#'
grades$gpa <- with(grades, gp_tot / credit_tot)

up(grades, ~ student)
grade_report <- up(grades, ~ student)
grade_report
#'
#' 3. merge with email
#'
merge(grade_report, email, by = 'student')  
          # inner join, only students in BOTH files
merge(grade_report, email, by = 'student', all = T)  
          # outer join, students in EITHER files
merge(grade_report, email, by = 'student', all.x = T)  
          # all rows in first file
#'
#' Other way of using capply on data frames but not efficient
#' with very large files
#'
grades$gpa2 <- capply(grades, grades$student, with, sum(gp*credits)/sum(credits))
up(grades, ~ student)
#'
#' Create transcripts
#'
#' Add course average to student file
#'
grades$course_average <- 
  with(grades, capply(gp, course, mean)) # no weights! why?
#'
#' List of transcripts
#'
split(grades, grades$student)
#'
##' # The many ways of referring to variables ----
#'
#' A confusing aspect of R is that there are many ways to refer to an object
#'
#' - name: if an object is in the current environment
#'
grades
#'
#' - selecting from a data frame (FQN: fully qualified name)
#'
grades$student
grades[['student']]
grades['student'] # but this is the data frame with the variable
#'
#' - by name using with or within
#'
with(grades, student)
grades <- within(grades, {
  gpa3 <- capply(gp * credits, student, sum)/capply(credits, student, sum)
})
grades
#'
#' - as argument to a function
#'
sum(grades$credits)
#'
#' - formula
#'
tab(grades, ~ student)
#'
#' - name in a data frame that is another argument
#'
xyplot(mathach ~ ses, hs, group = Sex)
#' Note: in this example mathach and ses are referrenced by a formula
#' interpreted in hs but 'Sex' is interpreted by name interpreted with `hs`
#'
#' - by name in a character string
#'
merge(grades, courses, by = 'course')  # can't just use: by = course
#'
#' Why so many ways that seem -- and are -- completely inconsistent
#' 
#' Because R is an evolving language that tries to be backward
#' compatible.
#'
#' In the early days (of S) data frames didn't even exist.
#' To run a regression you needed the X matrix and the y vector and
#' use 'lsfit(X,y)'.
#'
#' Formulas, environments, etc. were all added gradually. 
#' When a new idea, formulas for example, is added to R, 
#' many people writing packages think it's cool and 
#' start using it. So a lot of packages written since 2000 
#' make heavy use of formulas to refer to variables.
#' But the old original functions often don't. 
#'
#' Some additions really catch on, e.g. pipes: `%>%`, which
#' are just a few years old. 
#'
##' # OOP: Object-oriented programming ----
#'
#' - 'generic function': a function that selects another function
#'   to perform a task. The selection is based ont the 'class'
#'   of the object that is the lifirst argument of the
#'   generic function.
#' - 'method': a function called by a generic function depending
#'   on the class of the object.
#'
#'  __Example:__
#'
to_farenheit
#'
#' Omesh (a student in 2018) asked 'why can't we write it to use it on a data frame?'
#' But we would also like to use it on variables because sometimes
#' it won't be every numeric variable that's a temperature in C.
#'
#' First: note that the objects we work on have 'classes'
#'
class(2.3)
class(1:2)
class(factor('a'))
class('ab')
class(df)
#'
#' Note that, in contrast with 'is.numeric', classes distinguish
#' between numeric and factor.
#'
#' Generic function:
#'
to_farenheit <- function(x,...) {
  UseMethod('to_farenheit')
}
#'
#' 'to_farenheit' will look at the class of X and use one
#' of the following methods.
#'
#' Methods:
#'
to_farenheit.numeric <- function(x,...) {
  32 + (9/5)*x
}

to_farenheit.default <- function(x,...) {
  x  # for any other class
}

#'
#' But what about data frames??
#'
to_farenheit.data.frame <- function(x,...) {
  as.data.frame(lapply(x, to_farenheit))
}
#'
#'  Let's try this out
#'
to_farenheit(0)
to_farenheit(37)
to_farenheit(-273.15)
to_farenheit(100)
to_farenheit(factor(0))
to_farenheit(c('absolute zero','boiling point'))
df
class(df)
to_farenheit.data.frame(df)
to_farenheit(df)
#'
#' I can use 'to_farenheit' to do 'anything'!!
#'
methods(to_farenheit)
#'
#' The above illustrate creating a 'generic function' and
#' 'methods' for existing classes: here 'numeric', 'integer',
#' 'default' and 'data.frame'
#'
#' If an object has a class attribute, e.g. data.frames, then the
#' value of the attribute is its class.
#'
#' If it doesn't have a class attribute then it has an implicit
#' class depending on its type and structure. For example,
#' matrices has the class "matrix" whether their content is
#' numeric or character. However, for a vector, class is
#' 'integer' for an integer, 'numeric' for a double, 'character'
#' for a character.
#' 
#' Is there an underlying logic to it all? 
#' 
##' ## Creating a new class ----
#'
#' I can define new methods for other classes
#'
##' ### Creating a class and methods for existing generics ----
#'
#' Many functions are 'generic', e.g. print, summary
#'
#' So when you create a new statistical methods you can write
#' a function that creates a new class
#'
#' then you can write methods for your new class
#'
#' e.g. lm
#'
fit <- lm(day1 ~ day2, df)
class(fit)
print(fit)
summary(fit)
#' 
#' what function is actually used?
#'
methods(class = 'lm')
#' 
#' great way to get ideas about what to do with an object!
#' 
getS3method('print','lm') # most methods are 'S3', a few are 'S4'
getS3method('summary','lm')
#'
#' Suppose you create a new kind of object, e.g. 'wald'
#' 
w <- wald(fit)
class(w)
#' 
#' Usually created by a 'contructor' function of the same name
#' Note the last thing the function does:
#' 
wald
#' 
#' What can we do with a 'wald' object?
#' 
methods(class='wald')
coef(w)
as.data.frame(w)
w  # prints
rpfmt(w)
cell(w) # ???
#' if you want to see the method:
spida2:::coef.wald  # if you know where it is
getAnywhere(coef.wald)
getS3method('coef','wald')
#' 
##' # Data wrangling ----
#' 
##' ## Regular Expressions to replace strings within string variables ----
#' 
#' Expertise with regular expressions is 
#' [\underline{one of the most valuable skills}](https://xkcd.com/208/)
#' you can learn for data manipulation. 
#' 
#' Here's a [\underline{site you can use to experiment with regular expressions}](http://www.regexr.com/).
#' Add it to your R editing bookmarks.
#' 
#' Contribute questions, links and comments to Piazza.
#' 
#' Here's a useful summary prepared by Jeff Lee in the Winter 2016 class. Most descriptions of
#' regular expressions make them look extremely complicated. You can get along 
#' with a few basic ideas that are very flexible and that have sufficed for 
#' 99.9% of my problems. 
#' 
##' ### Basic Regular Expressions ----
#' 
#' Using regular expressions is a way to alter, search, count, adjust texts or strings of characters.
#' 
#' There are 3 main groups of R functions that use regular expressions that we will look at.
#' <pre>
#' grep, grepl, grepv 
#' sub, gsub 
#' regexpr, gregexpr
#' </pre>
#' First look at the function <tt>grep</tt>
x <- c("Hello", "He", "Hel", "hello", "hel1")
grep("hel", x)
#' As you can see, <tt>grep</tt> returns the index of all elements of <tt>x</tt> that contain "hel".
#' It does not return the index of  "Hello" because <tt>grep</tt> is case sensitive. 
#' 
#' We say the _pattern_ <tt>"hel"</tt> _matches_ substrings in the target.  
#' To ignore the case, we can use:
grep("hel", x, ignore.case = T)
#' A similar effect is achieved by using square brackets: <tt>[]</tt>, which signify 'match
#' any one character in the list'.
grep("[Hh]el", x)
#' Suppose you want to know how many of these elements of <tt>x</tt> contain <tt>"hel"</tt>
#' or <tt>"Hel"</tt>
length(grep("[hH]el", x))
#' If you want to see the actual strings matched instead of their indices, use
grep("[Hh]el", x, value = TRUE)
#' or, with spida2:
library(spida2)
grepv("[Hh]el", x)
#' Finally if you want a logical index vector:
grepl("[Hh]el", x)
#'
##' ### Taking a closer look at gsub ----
#' 
#' <tt>gsub</tt> and <tt>sub</tt> are great ways to modify substrings in a reproducible way. 
#' For example, you can use them to modify variable names in a way that will work when
#' you receive an updated version of a data set. In most data sets, you will
#' have variables names that are acronyms or short forms and you may want to replace those 
#' variable names with
#' something that people will understand.
#' 
#' The difference between <tt>sub</tt> and <tt>gsub</tt> is that <tt>sub</tt> 
#' will replace only the first match in each string, 
#' <tt>gsub</tt> (g stands for global) will 
#' replace all matches. Compare:
sub("l","WWW", x)
gsub("l","WWW", x)
#' 
#' The most difficult part about regular expressions is the syntax. 
#' These are helpful websites with information on syntax. 
#' 
#' * [\underline{Quick-Start: Regex Cheat Sheet}](http://www.rexegg.com/regex-quickstart.html)
#' * [\underline{Regular Expressions in R by Albert Y. Kim}](https://rstudio-pubs-static.s3.amazonaws.com/74603_76cd14d5983f47408fdf0b323550b846.html)
#' * [\underline{RegExr}](http://www.regexr.com/) to interactively try out regular expressions
#' 
#' There's a thorough treatment at [\underline{Microsoft's Regular Expression Language -- Quick Reference}](https://msdn.microsoft.com/en-us/library/az24scfc(v=vs.110).aspx)
#' 
#' Also you can get help in R:
#+ eval=FALSE
?regex
?gsub
#' 
#' There are many special characters that let you do almost anything you want with regular 
#' expressions. Here are the most important ones:
#' 
#' * Special characters: All characters match themselves except the special characters:
#'   <tt>. $ ^ { [ ( | ) * + ? \\</tt>. Also <tt>} ]</tt> are special characters when they close 
#'   a matching brace
#'   and <tt>-</tt> is a special character when it appears within square brackets.
#' * Special matching characters:
#'      * <tt>.</tt>: a period matches any single character
#'      * <tt>[abc]</tt>: matches any single character in the list
#'      * <tt>[A-Z]</tt>: matches a single character in the range A to Z. If you want to include
#'        a hyphen as matching character, it must come first, e.g. `[-a-z]`.
#'      * <tt>[A-Za-z0-9]</tt>: matches any single alphanumeric character
#'      * <tt>[^a-z]</tt>: matches any single character that is NOT a lower case letter. The caret
#'        <tt>^</tt> at the beginning of the bracketed list negates the rest of the list. A caret anywhere
#'        else is just a caret.
#'      * `(` and `)` can be used to form sub groups. `(` are not `)` matched. To match a parenthesis
#'        you need to 'escape' it: `"\\(a\\)" in a string in R. 
#'      * `|` means "or": `(a|b)c` is the same as `[ab]c`
#' * Anchors:
#'      *  `^` matches the beginning and `$` matches the end of a string. Thus 
#'         `"^and"` matches only strings that start with "and", while 
#'         `"and$"` matches
#'         only strings that end with "and".  To only get exact matches, i.e. strings that are
#'         exactly equal to "and", use both `"^and$"`, e.g. `"^match this exactly$"`.
#' * Quantifiers: how many repeats of the previous match:
#'      * `*` matches the previous match 0 or more times
#'      * `+` matches the previous match one or more times
#'      * `?` matches the previous match zero or one time
#'      * `{n}` matches the previous match exactly n times
#'      * `{n,m}` matches the previous match n to m times
#'      * `{n,}` matches the previous match at least n times
#'      * `{,m}` matches the previous match at most m times
#'   Quantifiers are 'greedy' in the sense that they will match as much of the string as they can.
#'   Adding `?` to a quantifier makes it 'lazy'. It will match as few occurences as possible.
#' 
##' ### Common Regular Expressions ----
#' 
#' ".*": the '.' means any single character and '*' means zero or more of the previous match. So this is the 'universal' match. It matches anything? 
some_names <- c('Mary Jones', 'Bush, George H. W.', 'George W. Bush', "Capote,Truman")
sub(".*", "OhOh", some_names)
#' 
#' A powerful tool for substitution is the 'backreference' `\\N` where `N` is a single
#' digit from 1 to 9.  In a replacement string `\\N` refers to the Nth parenthesized 
#' expression in the pattern. For example:
x <- c('Wong, Rodney','Smith,   John', 'Robert Jones')
sub("^([^, ]+), +([^ ]*)$", "\\2 \\1", x)
#' Parsing
#' Using parentheses to match substrings to change their order in the replacement string.
sub(
  "^([^,]*), ?(.*)$",
  "\\2 \\1", 
  some_names)
#' 
#' ### Quiz question ---- 
#' 
#' - What is the purpose of `' ?'` in the regular expression above?
#' - What would happen if we used `' *'` instead?
#' 
#' Important application: Changing the form of variable names 
#' in preparation for restructuring from wide to long format
#' 
var_names <- c('id','Gender','Age', 'T1_data', 't2_date', 'T3_date', 'T1_pulse', 'T2_pulse', 'T3_pulse')
var_names
#' fix 'data':
modified_names <- sub('data$','date', var_names)
modified_names
#' reorder variable name and time:
modified_names <- sub("^([tT])([0-9])_(.*)$","\\3__\\2", modified_names)
modified_names # note that names that don't match the pattern are left unchanged
#' 
#' In order to match a special character it needs to be escaped with a backslash '\\' before the
#' character.
#' 
s <- ("HEL$LO")
s
gsub("$", replacement = ".", s) # $ matches the end of the string
gsub("\\$", replacement = ".", s) # \\$ matches the actual $
#'
#' As you can see, using two back slashes will actually replace $ with a period
#' In a string in R you need to use two backslashes to produce one backslash, i.e.
#' you need to escape the escape.
#' 
y <- c("hello123","hello213","hel2222lo","llo he123" )
gsub(".*2", "--", y)
gsub(".*2", "", y) # Note that "" will delete the match
#' This will remove everything up to and including a 2 in each string. 
#' As you can see in hel2222lo, it removes 
#' the last 2.
gsub("^hel2","4939", y)
#' The ^ will replace everything that starts with hel2. In this case only the 3rd word started with hel2 so
#' it replaces it with 4939.
gsub("213$","4939", y)
#' The $ will replace everything that ends with 213. In this case only the 2nd word ended with 213 so
#' it replaces it with 4939.
gsub("\\bhe","4939", y)
#' The double backslash b will replace everything that starts at with 'he' on words instead of strings. 
#' In this case, every word had a 'he' in this case.
gsub("hel*1", "4939", y)
#' The * will replace anything that matches at least 0 times. In this case, the last word matches hel and 1
#' matches 0 times.
#' 
#' The special character <tt>|</tt> allows alternative choices. It matches either what comes
#' before the <tt>|</tt> or what comes after it.
gsub("hel|213", "4939", y)
#' The <tt>|</tt> is an 'or' feature. This pattern will replace anything with a <tt>hel</tt> or <tt>213</tt>.
#' If it can match either <tt>hel</tt> and <tt>213</tt>
#' it will replace both.
#'
#' Note that you can use and mix quantifiers and operators together.
#' Perhaps the most common combination is <tt>.*</tt> which matches anything
#'
##' ### Taking a look at regexpr ----
#' 
y <- c("hello123","hello213","hel2222lo","llo he123","zork")
regexpr("he(.*)", y)
#' <tt>regexpr</tt> returns the position of the first character
#' matched.<br>
#' 
#' <tt>attr(,"match.length")</tt> is the number of characters
#' matched in each string, -1 if no match.
regexpr("hel(.*)", y)
#' As you can see, the 4th word does not have <tt>hel</tt> in it.
gregexpr("he(.*)", y)
#' <tt>gregexpr</tt> will return a list of all the matches. 
#' 
##' # Reshaping Data ----
#' 
#' I have to reshape data almost every time I see a client. In
#' fact some clients come to see me just to have their data
#' reshaped. I need to keep it fast and simple.
#' 
#' Most serious data errors I encounter come from mishaps in
#' attempting to reshape data by hand, for example, by cutting
#' and pasting portions of worksheets in Excel.   
#' 
#' I encounter two major reasons for reshaping data:
#' 
#' 1. Longitudinal data and hierarchical data 
#'    (where each subject may be seen and measured more than
#'    once) needs to be in different shapes (long or wide) for
#'    different methods of analysis. Traditional multivariate
#'    methods expect wide data and newer mixed model approaches
#'    require long data.
#'    
#' 2. Categorical data needs to be in different forms; 
#'    long (one row per observation), aggregated, or tabular for
#'    different analyses (logistic regression, binomial
#'    regression or log-linear modeling).
#'    
#' The shape in which you get the data must not determine your
#' method of analysis. You need to be able to go back and forth
#' easily among data shapes to use the analyses you wish to
#' apply.
#' 
#' _A longitudinal example:_ This is a simple example from a
#' pretend medical study in which each subject is seen on a
#' varying number of visits. This is the data set in __long__
#' form.
#' 
##' ## Long form ----
#' 
dlong <- read.table(strip.white = T, header = TRUE, text = 
"
sid  name   visit date         sex      sysbp temp
1    Sam    1     2019-01-21   male     124   36.5
1    Sam    2     2019-03-15   male     129   36.8
2    Joan   1     2019-02-10   female   115   37.1
3    Kate   1     2018-06-16   female   132   37.3
3    Kate   2     2018-09-03   female   139   36.7
3    Kate   3     2019-04-20   female   138   36.9
")
#' 
dlong    
#' 
#' We can identify four types of variables:
#' 
#' 1. a __subject id__ variable that uniquely identifies each 
#'    subject. Names are not usually adequate for this purpose
#'    since two subjects could share the same name. A good
#'    example in a university setting is the student number.
#' 2. a __time index__ variable consisting of small integers that, 
#'    for each subject, identifies the _visit_ or _occasion_.
#' 3. __Value__ variables that are measurements or characteristics 
#'    of subjects or of visits. They fall into two classes:
#'     a. __Time-varying__ (or __visit-level__) variables that 
#'        can vary from visit to visit.
#'        In this example, these are: _date, sysbp_ and _temp_.
#'     b. __Time-invariant__ (or _subject-level__) variables that 
#'        remain the same within each subject from visit to
#'        visit. In this example these are: _name_ and _sex_.
#'        Sometimes, a variable may appear to be time-invariant
#'        in the observed data but would be time-varying if one
#'        had observed more data.
#' 
#' Note:
#' 
#' 1. The __subject id__ by __time index__ combinations should be 
#'    unique although it is possible to have deeper indexing. For
#'    example, if each visit has two phases: _am_ and _pm_, then
#'    there could be a deeper indexing variable, _phase_ with
#'    values _am_ and _pm_. Then the combinations of the
#'    __subject id__ by __time index__ by __phase index__ would
#'    need to be unique.
#' 2. It is not necessary to have all possible combinations in the data.
#' 3. The groups of rows belonging to the same subject are often
#'    called __clusters__.
#' 
##' ## Wide form ----
#' 
#' Here's the same data in __wide__ form with one row per
#' subject. Sorry the input is too wide for the screen.\newpage
#' 
dwide <- read.table(strip.white = T, header = TRUE, text = 
"
sid name sex    date_1     date_2     date_3     sysbp_1 sysbp_2 sysbp_3 temp_1 temp_2 temp_3
1   Sam  male   2019-01-21 2019-03-15 NA         124     129     NA      36.5   36.8   NA
2   Joan female 2019-02-10 NA         NA         113     NA      NA      37.1   NA     NA
3   Kate female 2018-06-16 2018-09-03 2018-04-20 132     NA      138     37.3   36.7   36.9
")
dwide
#'
#'
##' ## Relational data base form ----
#' 
#' In an RDB, this data would be represented by two _relations_
#' (data frames) which can be merged as needed for analyses.
#'
#' One relation contains time invariant variables and the second
#' contain time-varying variables plus the subject id variable
#' (called a __key__) needed to link the time-varying variables
#' with the time-invariant variables.
#' 
#' Instead of re-entering from scratch, we'll start using the
#' tools in 'spida2'
library(spida2)
#' The time-invariant variable relation contains the following.
dti <- up(dlong, ~sid)
dti
#' 
#' The time-varying relation is:
#' 
dtv <- subset(dlong, select = !(names(dlong) %in% names(dti)[-1])) 
dtv
#' Note that the 'select' argument of the 'subset' function
#' selects variables.
#'
#' You can get the long file back with:
#' 
merge(dti, dtv, all = T)
#' 
#' I encourage researchers who use Excel for data entry to keep
#' their data in multiple spreadsheets, one for each data level
#' as in a relational data base. This reduces errors in data
#' entry and updating.  The principle is that __if you need to
#' correct the value of a variable you should only have to do it
#' in one place__.
#'
#' Keeping separate spreadsheets for different data levels makes
#' this possible. For example, if you need to correct the
#' spelling of a name, you only need to make the correction in
#' one place. Currently, I find that the best way to read Excel
#' spreadsheets is with the 'read_excel' function in the 'readxl'
#' package.
#' 
##' ## From Wide to Long ----
#' 
#' The __tolong__ function in the 'spida2' package relies on the
#' form of the variable names to transform the wide data frame to
#' a long form. The function looks for a _separator_ between the
#' name of the value variable and the _time index_. The default
#' is '_' which can be changed with the 'sep' argument. The
#' default name created for the _time index_ variable is 'time'.
#' 
dwide
tolong(dwide)
#'
#' It's best to specify a name for the _time index_. Otherwise,
#' if a variable named 'time' already exists it will get
#' clobbered by 'tolong'.
#'
#' Also, the new 'id' variable generated by 'tolong' refers to
#' the row numbers of the input data frame. If a variable named
#' 'id' already exists and has unique values, 'tolong' will use
#' that variable. You can specify a variable name as the id
#' variable
#' 
dtolong <- tolong(dwide, timevar = 'visit', idvar = 'sid')
dtolong
#'
#' It's often useful to reorder longitudinal data, e.g. for plotting:
#' 
sortdf(dtolong, ~ sid/visit)
#' 
#' When the variables are not conveniently named we can often use
#' regular expressions to transform the names into a form that
#' works with 'tolong'.  See the additional material on regular
#' expressions in the [extra notes](CAR_2_Extra_Notes.pdf).
#'  
##' ## From Long to Wide ----
#' 
#' This is a bit trickier because there are no clues from the
#' form of the variable names that some are subscripted. We need
#' to specify the __id__ variable and the __time index__
#' variable.
#'
#' Standard reshape functions also expect you to indicate which
#' veriables are time-varying so that only those variables get
#' indexed in the wide form. With a large dataset this can be an
#' enormous amount of work, which the 'towide' function gets the
#' computer to do for you. The function identifies which
#' variables are time-varying and which are not and only the
#' time-varying variables get expanded by indexing.
#' 
towide(dlong, idvar = 'sid', timevar = 'visit')
#'
##' ## More examples ----
#'
#' Many sources of global data let you retrieve data from various 
#' countries by variable. After concatenating the raw data
#' for the various variables, you get something that looks like
#' this:
#' 
dd <- read.table(header=T,text="
country    variable   1990 1991 1992 1993
Canada     population   20   21   24   26
Mexico     population   50   52   53   54
Canada     income       10   12   12   11
Mexico     income       30   31   33   34
")
dd
#'
#' Note how 'read.table' prepended an 'X' to the years since 
#' a valid variable names can't start with a number.
#' 
#' We need to get the variable names in the right form for
#' 'tolong'. The 'easy' way is to use regular expressions.
#' 
names(dd) <- sub('^X', 'value__', names(dd))
dd
#' 
#' The regular expression '^X' matches a capital X at the
#' begining of a string. Wherever it is found, it gets replaced
#' by 'year__'. I'm in the habit of using a repeated underscore,
#' '__', as a seperator to avoid conflicts with other underscores
#' in variable names.
#'
#' Now we're ready for the first step:
#' 
dl <- tolong(dd, sep = '__', timevar = 'year') 
dl
#' 
#' Now, our 'id' or __key__ uses the combination of two
#' variables: _country_ and _year_ because we want one row for
#' each of those combinations.
#' 
#' Also, our 'timevar' is 'variable':
#' 
d2 <- towide(dl, idvar = c('country','year'), timevar = 'variable')
d2
#' 
#' We don't need the 'id_..' variables and we rename the value
#' variables:
#' 
d2 <- d2[, - grep('^id_', names(d2))]
d2
names(d2) <- sub('^value_','', names(d2))
d2
#' 
#' ... and you are ready to do some analyses.
#' 
#'
##' ## Variables and years in long form ----
#' 
#' Another common format for global health 
#' has both variables and time in long form.
#' 
dd <- read.table(header=TRUE, text = "
country   year   variable    value country.code  rownum  
Canada     2001    atemp       20   CAN           1
Canada     2002    atemp       23   CAN           2
US         2001    atemp       23   USA           3
US         2002    atemp       23   USA           4
Canada     2001    wind       120   CAN           5
Canada     2002    wind       123   CAN           6
US         2001    wind       123   USA           7
US         2002    wind       123   USA           8
Canada     2001    rain       220   CAN           9
Canada     2002    rain       223   CAN           10
US         2001    rain       223   USA           11
US         2002    rain       223   USA           12
")
(dw <- towide(
  dd, 
  idvar = c('country','year'), 
  timevar = 'variable'))
#
# to keep only the variable name as a name
#
names(dw) <- sub('^value_','', names(dw))
dw
#
# to get rid of other time varying variable
#
dw <- dw[, - grep('_', names(dw))]
dw
#' 
#' 
##' ## Working with long data frames ----
#'
#' One advantage of working with long (as opposed to wide) data
#' is the ease with with which you can do calculations using the
#' __clusters__ much more easily if you have the right tool.
#' 
#' Using the original long data frame:
dlong 
#' 
#' we would like to have the variables in different columns and
#' the years in different rows.
#'
#' We create a long data frame with respect to year and then a
#' wide one with respect to variable, suppose we want to create
#' new variables for the mean 'sysbp' and 'temp' for each
#' subject.
#'
#' The __capply__ function does this. It applies a function to
#' the values of a variable in each cluster  and returns a result
#' that has the right form to be added as a variable to the data
#' frame.
#' 
dlong2 <- within(
  dlong, {
    temp_m <- capply(temp, sid, mean)
  }
) 
dlong2
#' 
#' __capply__ applies the function _mean_ to each _cluster_ of
#' values of _temp_ defined by a common value of _sid_ and
#' returns a result that has the right shape to be added to the
#' data frame.  Note that, in contrast with _SAS_, the order of
#' rows in the data frame doesn't matter. That is, clusters don't
#' have be in contiguous rows. Also, in contrast with _tapply_,
#' the function does not have to return a single value.
#' 
dlong2 <- within(
  dlong2, 
  {
    sysbp_m <- capply(sysbp, sid, mean)
    sysbp_rank <- capply(sysbp, sid, rank)
    temp_rank <- capply(temp, sid, rank)
    temp_sd <- capply(temp, sid, sd)
  }
) 
dlong2
#' 
#' The variable 'temp_sd' is a measure of the variability in their 
#' temperature. This way be a variable of interest. Once it has
#' been computed in the long file, it is available for analysis
#' in models at the subject level, with:
#' 
up(dlong2, ~sid)      
#'
#' The long file often provides a much easier way to create
#' new subject-level variables than working with the original data
#' in wide form.
#' 
##' ## Reshaping categorical data ----
#' 
#' Purely categorical data (in which all variables are
#' treated as categofical) can be represented in many ways.
#' 
#' 1. Frequency table well suited for log-linear analysis
#' 2. Subject-level long data frame with one observation per
#'    subject for logistic regression
#' 3. Aggregated data frame with a frequency variable for
#'    Poisson models
#' 4. Data frame with frequencies wide on one variable for
#'    binomial or multinomial analyses
#'    
#' We use the 'Titanic' table in base R. It's an array with
#' class 'table' so functions that have methods for 
#' the class 'table' will use those methods. The table cells
#' contain the frequecies for each outcome.
#' 
##' ### Tabular data ----
#' 
Titanic
#'
#' A different view: a flattened table:
ftable(Titanic)
dimnames(Titanic)
#' Permuting the dimensions of the array:
ftable(aperm(Titanic, c('Class','Sex','Survived','Age')))
dim(Titanic)  # 4-dimensional array
#' 
#' The 'tab' function in 'spida2' operates on tables
#' to show marginal distributions.
#' 
tab(Titanic, ~ Sex)
tab(Titanic, ~ Sex + Age) # frequencies
tab(Titanic, ~ Sex + Age, pct = 1) # row percentages
tab(Titanic, ~ Sex + Age, pct = 2) # column percentages
#' To suppress margins, use the variants 'tab_' and 'tab__'
tab_(Titanic, ~ Sex)
tab_(Titanic, ~ Sex + Age) # frequencies
tab_(Titanic, ~ Sex + Age, pct = 1) # row percentages
tab__(Titanic, ~ Sex + Age, pct = 1) # row percentages
#' 
#' The ouput lends itself well to barcharts
#' 
tab_(Titanic, ~ Sex + Age)  %>% barchart(auto.key=T)

tab__(Titanic, ~  Sex + Class + Survived, pct = c(1,2)) %>% 
  barchart(ylab = 'percentage of passengers',
           horizontal = FALSE,
           ylim = c(0,100), layout = c(5,1),
           scales = list(x=list(rot=45)),
           auto.key=list(space='right',title='survived', reverse.rows = T))

tab_(Titanic, ~  Class + Sex + Survived, pct = c(1,2)) %>% 
  barchart(ylab = 'percentage of passengers',
           horizontal = FALSE,
           ylim = c(0,100), layout = c(3,1),
           scales = list(x=list(rot=45)),
           auto.key=list(space='right',title='survived', reverse.rows = T))
#'
##' ### Making marginal tables ----
#'
tab(Titanic, ~ Sex + Survived)
tab(Titanic, ~ Sex + Survived, pct = 1)
tab(Titanic, ~ Sex + Survived, pct = 1)  %>% 
  round(1)
tab(Titanic, ~ Sex + Survived + Age, pct = c(1,3)) %>% 
  round(1) 
tab(Titanic, ~ Sex + Survived + Age, pct = c(1,3)) %>% 
  round(1) %>% 
  ftable
tab(Titanic, ~ Sex + Age + Survived, pct = c(1,2)) %>% 
  round(1) %>% 
  ftable
#'
##' ## Frequency data frame ----
#'
#' From table to frequency data frame:
Titanic.df <- as.data.frame(Titanic)
brief(Titanic.df)
#'
#'
##' ## Individual data frame ----
#' 
#' One row per subject (i.e. passenger)
#'
indices <- rep(1:nrow(Titanic.df), Titanic.df$Freq)
Titanic.ind <- Titanic.df[indices,]
Titanic.ind$Freq <- NULL
brief(Titanic.ind)
dd <- droplevels(subset(Titanic.ind, Class != 'Crew'))
(fit <- glm(Survived ~ Class * Sex * Age, Titanic.ind,
           subset = Class != 'Crew', family = binomial))
(fit <- glm(Survived ~ Class * Sex * Age, 
           dd, family = binomial))
fit2 <- glm(Survived ~ (Class + Sex + Age)^2, 
           dd, family = binomial)
summary(fit2)
summary(fit)  # Why NAs? What next?
Anova(fit)
anova(fit, fit2)
#'
##' ## Frequency data frame with response variable on rows ----
#'
brief(Titanic.df)
Titanic.wide <-
  towide(Titanic.df, 
       idvar = c('Class','Sex','Age'),
       timevar = 'Survived')
fitbin <- glm(
  cbind(Freq_No,Freq_Yes) ~  Class * Sex * Age, 
  Titanic.wide, subset = Class != "Crew",
  family = binomial)
Anova(fitbin)
summary(fitbin)
#' Compare with:
Anova(fit)
summary(fit)

##' # Using R Script with Markdown ----
#' 
#' [\underline{Here's a posting}](http://deanattali.com/2015/03/24/knitrs-best-hidden-gem-spin/)
#' that describes quite well the difference between an R Markdown
#' script (with extension .Rmd) and a .R script with Markdown.
#' The main advantages of the latter are expressed well:
#' 
#' 1) you don't need to transform your original .R script
#'    manually into a .Rmd script and 
#' 2) the same script can be run interactively in R
#'    and be used to generate a clean report.
#' 
#' One problem is that <tt>Ctrl-Shift-K</tt> produces diagnostics
#' that refer to line numbers in the <tt>.Rmd</tt> file, whose
#' numbering can be very different from that of the <tt>.R</tt>
#' file. When this happens you can 'knit' the <tt>.R</tt> file in
#' a way that keeps the intermediate <tt>.Rmd</tt> file by using
#' the command:
#' <pre>
#'      rmarkdown::render("YourFile.R", clean = FALSE)
#' </pre>
#' This will leave the 
#' intermediate files in your directory so you can interpret error messages.
#' 
##' # Attributes ----
#' 
#' The attributes of an object work like Post-it notes 
#' on the object. When functions use the object, they 
#' can consult the attributes to decide how to use it.
#' 
#' For example, a matrix is stored as a long vector
#' recording the contents of the matrix column by column.
#' The object itself has no information about the dimension
#' of the matrix. The contents of a 3 by 4 matrix could just
#' as easily be a 2 by 6 matrix or a 1 by 12 matrix or, indeed,
#' just a vector of length 12. Functions that use the object
#' as a matrix know what to do with the 12 numbers because of the 
#' 'dim' attribute.
#' 
m <- matrix(1:12, 3, 4)
colnames(m) <- letters[1:4]
rownames(m) <- LETTERS[1:3]
attributes(m)
#' Many attributes are set by the function creating the object.
#' For example the dim attribute is set by the 'matrix' function:
m <- matrix(1:12, 3, 4)
attributes(m)
#' 
#' Many attributes can also be set by __replacement__ functions
#' and they can be read by the cognate regular function of the 
#' corresponding mame. For example, you can read and change the shape 
#' of a matrix with the 'dim' functions.
#' 
dim(m)
m
dim(m) <- c(2,6)
m
#' 
##' ### Exercises ---- 
#' 
#' 1. What happens if you try to set a dimension that doesn't
#'    doesn't correspond to the size of the matrix?
#' 2. What happens to column and row names if you change
#'    the dimension of a matrix?
#'    
#' Other familiar functions that read attributes of a matrix
#' are 'nrow', 'ncol', 'row', 'dimnames'. A very important
#' attribute used for OOP is the 'class' attribute.
#' 
#' See also the 'attr' and its replacement to create and read
#' new attributes. 
#' 
#' Here are the attributes of the 'Guyer1' data frame.
attributes(Guyer1)
#'
dim(Guyer1)
#'
##' # Traps and Pitfalls ----
#' 
#' Contribute traps and pitfalls on Piazza 
#' 
#' Some of these observations may change as R develops. It would
#' be a good idea to add the version of R in which each behaviour
#' was observed.
#' 
##' ## Factors ----
#'
#' Many of the tricky silent traps are encountered in the use of
#' factors.
#' 
##' ### Transformation of factors to characters or codes ----
#' 
#' In its raw form, a factor is a vector of integers that
#' provides indices into a vector of 'levels' for the factor. The
#' levels are attached as an attribute to the factor.
#' <pre>
#' >fac <- factor( c('c','a','a','b',NA,'c'))
#' 
#' > unclass(fac)
#' [1]  3  1  1  2 NA  3
#' attr(,"levels")
#' [1] "a" "b" "c"
#' </pre>
#'
#' A factor vector can be coerced to its character form or to its
#' numerical indices:
#' 
#' <pre>
#' > as.character(fac)
#' [1] "c" "a" "a" "b" NA  "c"
#' > as.numeric(fac)
#' [1]  3  1  1  2 NA  3
#' </pre>
#' 
#' Most functions operating on factors use either the factor's
#' character form or its numerical form. In most cases, the form
#' used is the only sensible one and there are no surprises.
#' Sometimes the result is not what the user expected and
#' mysterious bugs or outright errors can be produced.
#'
##' ### Factors transformed to character ----
#' 
#' The following functions use the character form of the factor:
#'
#' <pre>
#' > matrix(fac,3)
#'      [,1] [,2]
#' [1,] "c"  "b" 
#' [2,] "a"  NA  
#' [3,] "a"  "c" 
#' 
#' > sub('a','A',fac)
#' [1] "c" "A" "A" "b" NA  "c"
#' 
#' > grep("a",fac, value = T)
#' [1] "a" "a"
#' </pre>
#'
##' ### Factors transformed to numeric ----
#' 
#' The following functions use the numeric form. In the first
#' case (indexing) that might seem to be the only sensible
#' interpretation. However, since it is possible to index by name
#' in R, a user could intend to use the character values of a
#' factor to index names but end up with an entirely different
#' result.
#'
#' In the second case, ('rbind'), the use of numeric values seems
#' contrary to expectation considering the behaviour of 'matrix'
#' above.
#' 
#' <pre>
#' > c('one','two','three')[fac]
#' [1] "three" "one"   "one"   "two"   NA      "three"
#'
#' > rbind(fac)
#'     [,1] [,2] [,3] [,4] [,5] [,6]
#' fac    3    1    1    2   NA    3
#' </pre>
#' 
#' Then using 'rbind' with a factor and a character, the coercion
#' of the factor to character occurs __after__ extracting the
#' numeric codes.
#'
#' <pre>
#' > rbind(fac, 'a')
#'     [,1] [,2] [,3] [,4] [,5] [,6]
#' fac "3"  "1"  "1"  "2"  NA   "3" 
#'     "a"  "a"  "a"  "a"  "a"  "a"
#' </pre>
#'
##' ### Factors operations that return a factor ----
#' 
#' Some operators on factors return a factor:
#' 
#' <pre>
#' > fac:fac
#' [1] c:c  a:a  a:a  b:b  <NA> c:c 
#' Levels: a:a a:b a:c b:a b:b b:c c:a c:b c:c
#' </pre>
#' 
##' ### Other special factor pitfalls ----
#'  
#' Special pitfalls can occur when attempting to transform a
#' factor whose levels are character representations of numbers
#' into a numeric object:
#' 
#' <pre>
#' > facn <- factor( c(1,10,2))
#' > facn
#' [1] 1  10 2 
#' Levels: 1 2 10
#' </pre>
#' 
#' Note in passing that the levels have been ordered numerically
#' instead of lexicographically, as would have been the case if
#' the argument to 'factor' had been <tt>c('1','10','2')</tt>.
#' Thus the 'factor' function is 'numeric-smart'. facn' almost
#' seems numeric but it is not:
#'
#' <pre>
#' > facn + 1
#' [1] NA NA NA
#' Warning message:
#' In Ops.factor(facn, 1) : + not meaningful for factors
#' </pre>
#'
#' either 'as.character' nor 'as.numeric' returns the original
#' numeric vector:
#'
#' <pre>
#' > as.character(facn)
#' [1] "1"  "10" "2" 
#' > as.numeric(facn)
#' [1] 1 3 2
#' </pre>
#'
#' To get the original numeric vector, one must compose both:
#'
#' <pre>
#' > as.numeric(as.character(facn))
#' [1]  1 10  2
#' </pre>
#' 
#' or, one can define a function:
#'
#' <pre>
#' > num <- function(x) as.numeric(as.character(x))
#' > num(facn)
#' [1]  1 10  2
#' </pre>
#'
##' ### 'drop' doesn't work with subset ----
#' 
#' <pre>
#' zz <- subset( dd, !(id %in% c('A,'B')), drop = TRUE)
#' </pre>
#' 
#' doesn't drop levels in 'id' (as it should?). Instead, use:
#' 
#' <pre>
#' zz <- droplevels(subset( dd, !(id %in% c('A,'B'))))
#' </pre>
#' 
#'
##' ## `diag` can be tricky ----
#'
#' If you use `diag` in a function to get the main diagonal of a
#' matrix (not necessarily square) you might get a bug if
#' you happen to have a $1 \times 1$ matrix represented by a scalar (vector of length 1)
#' because:
#'
m <- matrix(1:12,3)
m
diag(m)
m <- 3.2
diag(m) # Why?
#' 
#' If you want to use `diag` in a way that won't give you
#' an identity matrix when the argument happens to be a 
#' scalar, the safe way is:
#' 
diag(as.matrix(m)) # gives you what you want in any case
#' 
#' Here's another example where 'diag' can fail.
#' 
#' Many algorithms using eigenvalue or singular value
#' decompositions (with 'eigen' or 'svd') form a diagonal matrix
#' with the vector of eigen/singular values using the 'diag'
#' function, e.g.
#'  
#' <pre>    
#'   > X <- matrix(rnorm(30),10)
#'   > sv <- svd(X)
#'   > d.inv <- 1/(sv$d[sv$d>0])
#'   > rk <- length(d.inv)
#'   > Xginv <- sv$v[1:rk,] %*% diag(d.inv) %*% t(sv$u[1:rk,])
#' </pre>
#'    
#' This will fail if the rank of X is equal to 1 since, in that
#' case, `diag(d.inv)` will be an identity matrix of dimension
#' 'floor(d.inv)', while what is needed is a 1 x 1 matrix with a
#' single element 'd.inv'. One solution is to use:
#'  
#' <pre>    
#'   > Xginv <- sv$v[1:rk,] %*% diag(d.inv, nrow = length(d.inv)) %*% t(sv$u[1:rk,])
#' </pre>
#'
#' Another is to use the fact that _matrix_ premultiplication by
#' a diagonal matrix is the same as _scalar_ premultiplication by
#' the vector of diagonal elements. This is so because
#' multiplying the vector by the matrix causes the vector to be
#' recycled to the length of the matrix and pairwise scalar
#' multiplication takes place column by column for the matrix.
#'  
#' <pre>  
#'   > Xginv <- sv$v[1:rk,] %*% (d.inv * t(sv$u[1:rk,]))
#' </pre>
#' 
#' Note that extra parentheses are needed because these
#' multiplications are not associative.
#' 
##' ## Reading and Writing Data Files ----
#' 
##' ### NA as a valid value (the Namibia problem) ----
#' 
#' Many commands that read data files, e.g. read.csv and read.xls
#' in the package gdata, will, by default, treat the string 'NA'
#' as a missing value whether it occurs in a character or a
#' numeric variable. In numeric variables, blanks are also turned
#' into missing values.  If 'NA' occurs as a valid value, for
#' example the two-character ISO country code for Namibia, then
#' you may use the argument 'na.strings = NULL' to ensure that
#' 'NA' is not turned into a missing value. However, NA's used to
#' indicate missing numeric values will now be interpreted as
#' valid character values and numeric variables with NA's will be
#' read as factors.
#'
##' ## Prediction ----
#' 
##' ### Prediction with nlme ----
#' 
#' To get 
#' <pre>
#'   fit <- lme( y ~ x , data = dd, random = ~ 1 |id, na.action = na.omit)
#'   pp <- predict(fit, data = dd, level = 0)
#' </pre>
#' to produce <tt>pp</tt> of length equal to 'nrow(dd)', 
#' you can use the following combination of 'na.action's:
#' <pre>
#'   fit <- lme( y ~ x , data = dd, random = ~ 1 |id, na.action = na.exclude)
#'   pp <- predict(fit, data = dd, level = 0, na.action = na.pass)
#' </pre>
#' 

#' 
#' ### Exercises
#' 
#' 1. What is the difference between the result of:<br>
#'    `fac <- factor(letters)`<br>
#'    `levels(fac) <- rev(letters)`<br>
#'    and<br>
#'    `fac <- factor(letters, levels = rev(letters))`
#'    
##' # Useful Techniques and Tricks ----
#' 
#' Contribute "how to's" and useful tricks on Piazza.
#' 
##' ## Changing all variables to characters in a data frame ----
#' 
#' When data frames are being manipulated only as data sets, not
#' for immediate statistical analyses, it is often convenient to
#' have all variables as characters to avoid problems due to the
#' inconsistent behaviour of factors. A very easy way to do this,
#' if <tt>dd</tt> is a data frame:
#+ eval=FALSE
dd[] <- lapply(dd, as.character)
#' Any side effects? 
#' 
#' * Some variable attributes may be lost with <tt>as.character</tt>.
#'    
##' # References ----
#'     
