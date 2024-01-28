#' ---
#' title: "Hadley Wickham Advanced R, Table of Contents"
#' subtitle: ""
#' date: ""
#' author: ""
#' output:
#'   html_document:
#'     toc: true
#'     toc_float: 
#'       collapsed: false
#'     toc_depth: 2
#'     theme: readable
#' bibliography: ../common/math4939.bib
#' link-citations: yes
#' ---
#+ include=FALSE
library(knitr)
k <- knitr::knit_exit
library(kableExtra)
library(magrittr)
library(citr)
options(
  list(
    citr.bibliography_path='../common/math4939.bib',
    citr.use_betterbiblatex = TRUE))
#' This version: `r format(Sys.time(), '%B %d %Y %H:%M')`
#'       
#' These are links to the chapters and sections of Hadley Wickham's
#' first edition of [Advanced R](http://adv-r.had.co.nz/Introduction.html) 
#' 
#' At the end of most sections
#' you will find a number of exercises. 
#' They can be hard to spot because it's easy to scroll over
#' them into the next section. 
#' Sometimes it's easier to click on the next section and scroll up to 
#' find the exercises. 
#' In many chapters you will find an introductory quiz that has answers at the end of
#' the chapter.
#' 
#' - [Data structures](http://adv-r.had.co.nz/Data-structures.html)
#'     - Quiz
#'     - [Vectors](http://adv-r.had.co.nz/Data-structures.html#vectors)
#'     - [Attributes](http://adv-r.had.co.nz/Data-structures.html#attributes)
#'     - [Matrices and arrays](http://adv-r.had.co.nz/Data-structures.html#matrices-and-arrays)
#'     - [Data frames](http://adv-r.had.co.nz/Data-structures.html#data-frames)
#'     - [Answers to the quiz](http://adv-r.had.co.nz/Data-structures.html#data-structure-answers)
#' - [Subsetting](http://adv-r.had.co.nz/Subsetting.html)
#'     - Quiz
#'     - [Data types](http://adv-r.had.co.nz/Subsetting.html#data-types)
#'     - [Subsetting operators](http://adv-r.had.co.nz/Subsetting.html#subsetting-operators)
#'     - [Subsetting and assignment](http://adv-r.had.co.nz/Subsetting.html#subassignment)
#'     - [Applications](http://adv-r.had.co.nz/Subsetting.html#applications)
#'     - [Answers to the quiz](http://adv-r.had.co.nz/Subsetting.html#subsetting-answers)
#' - [Vocabulary](http://adv-r.had.co.nz/Vocabulary.html )
#'     - No exercises but great list of useful functions
#' - [Style](http://adv-r.had.co.nz/Style.html)
#'     - Also no exercises but excellent reading
#' - [Functions](http://adv-r.had.co.nz/Functions.html)
#'     - Quiz
#'     - [Functions components](http://adv-r.had.co.nz/Functions.html#function-components)
#'     - [Lexical scoping](http://adv-r.had.co.nz/Functions.html#lexical-scoping)
#'     - [It's all function calls](http://adv-r.had.co.nz/Functions.html#all-calls)
#'     - [Function arguments](http://adv-r.had.co.nz/Functions.html#function-arguments)
#'     - [Special calls: infix and replacement functions](http://adv-r.had.co.nz/Functions.html#special-calls)
#'     - [Return values](http://adv-r.had.co.nz/Functions.html#return-values)
#'     - [Answers to the quiz](http://adv-r.had.co.nz/Functions.html#function-answers)
#' - [OO (Object-Oriented) essentials](http://adv-r.had.co.nz/OO-essentials.html)
#'     - Quiz
#'     - [Base types versus classes](http://adv-r.had.co.nz/OO-essentials.html#base-types)
#'     - [S3 OO system](http://adv-r.had.co.nz/OO-essentials.html#s3)
#'     - [S4 - if you're the type who plans to climb Everest](http://adv-r.had.co.nz/OO-essentials.html#s4)
#'     - [RC - ditto?](http://adv-r.had.co.nz/OO-essentials.html#rc)
#'     - [Which one to use?](http://adv-r.had.co.nz/OO-essentials.html#picking-a-system)
#'     - [Answers to the quiz](http://adv-r.had.co.nz/OO-essentials.html#oo-answers)
#' - [Environments](http://adv-r.had.co.nz/Environments.html)
#'     - Quiz
#'     - [Basics](http://adv-r.had.co.nz/Environments.html#env-basics)
#'     - [Recursion](http://adv-r.had.co.nz/Environments.html#env-recursion)
#'     - [Function environments](http://adv-r.had.co.nz/Environments.html#function-envs)
#'     - [Binding](http://adv-r.had.co.nz/Environments.html#binding)
#'     - [Explicit environments](http://adv-r.had.co.nz/Environments.html#explicit-envs)
#'     - [Answers to the quiz](http://adv-r.had.co.nz/Environments.html#env-answers)
#' - [Debugging and defensive programming](http://adv-r.had.co.nz/Exceptions-Debugging.html)
#'     - Quiz
#'     - [Techniques](http://adv-r.had.co.nz/Exceptions-Debugging.html#debugging-techniques)
#'     - [Tools](http://adv-r.had.co.nz/Exceptions-Debugging.html#debugging-tools)
#'     - [COnditions handling](http://adv-r.had.co.nz/Exceptions-Debugging.html#condition-handling)
#'     - [Defensive programming](http://adv-r.had.co.nz/Exceptions-Debugging.html#defensive-programming)
#'     - [Answers to the quiz](http://adv-r.had.co.nz/Exceptions-Debugging.html#debugging-answers)
#' - [Functional programming](http://adv-r.had.co.nz/Functional-programming.html)
#'     - [Motivation](http://adv-r.had.co.nz/Functional-programming.html#fp-motivation)
#'     - [Anonymous functions](http://adv-r.had.co.nz/Functional-programming.html#anonymous-functions)
#'     - [Closures -- lambda functions](http://adv-r.had.co.nz/Functional-programming.html#closures)
#'     - [Lists of functions](http://adv-r.had.co.nz/Functional-programming.html#lists-of-functions)
#'     - [Case study: numerical integration](http://adv-r.had.co.nz/Functional-programming.html#numerical-integration  )
#' - [FUnctionals (functions of functions)](http://adv-r.had.co.nz/Functionals.html)
#'     - [lapply](http://adv-r.had.co.nz/Functionals.html#lapply)
#'     - [sapply, vapply, Map, mapply, mclapply, mcMap](http://adv-r.had.co.nz/Functionals.html#functionals-loop)
#'     - [Matrices and data frames](http://adv-r.had.co.nz/Functionals.html#functionals-ds)
#'     - [Lists](http://adv-r.had.co.nz/Functionals.html#functionals-fp)
#'     - [Mathematical functionals](http://adv-r.had.co.nz/Functionals.html#functionals-math)
#'         - e.g. integrating, finding roots, optimizing
#'     - [loops that should not be avoided](http://adv-r.had.co.nz/Functionals.html#functionals-not)
#'     - [example: family of functions](http://adv-r.had.co.nz/Functionals.html#function-family)
#' - [Function operators](http://adv-r.had.co.nz/Function-operators.html)
#' - [Programming on the language: Non-Standard Evaluation](http://adv-r.had.co.nz/Computing-on-the-language.html)
#'     - [Capturing expressions](http://adv-r.had.co.nz/Computing-on-the-language.html#capturing-expressions)
#'     - [NSE in 'subset'](http://adv-r.had.co.nz/Computing-on-the-language.html#subset)
#'     - [Scoping](http://adv-r.had.co.nz/Computing-on-the-language.html#scoping-issues)
#'     - [Calling from another function](http://adv-r.had.co.nz/Computing-on-the-language.html#calling-from-another-function)
#'     - [Substitute](http://adv-r.had.co.nz/Computing-on-the-language.html#substitute)
#'     - [NSE downside](http://adv-r.had.co.nz/Computing-on-the-language.html#nse-downsides)
#' - [Expressions](http://adv-r.had.co.nz/Expressions.html)
#'     - [Structure of expressions](http://adv-r.had.co.nz/Expressions.html#structure-of-expressions)
#'     - [Names](http://adv-r.had.co.nz/Expressions.html#names)
#'     - [Calls](http://adv-r.had.co.nz/Expressions.html#calls)
#'     - [Capture the current call](http://adv-r.had.co.nz/Expressions.html#capturing-call)
#'     - [Pairlists](http://adv-r.had.co.nz/Expressions.html#pairlists)
#'     - [Parsing and deparsing](http://adv-r.had.co.nz/Expressions.html#parsing-and-deparsing)
#'     - [Walking the Abstract Syntax Tree](http://adv-r.had.co.nz/Expressions.html#ast-funs)
#' - [Domain Specific Languages](http://adv-r.had.co.nz/dsl.html)
#' - [Performance](http://adv-r.had.co.nz/Performance.html)
#'     - [Why R is slow](http://adv-r.had.co.nz/Performance.html#why-is-r-slow)
#'     - [Microbenmarking](http://adv-r.had.co.nz/Performance.html#microbenchmarking)
#'     - [Language performance](http://adv-r.had.co.nz/Performance.html#language-performance)
#'     - [Implementation performance](http://adv-r.had.co.nz/Performance.html#implementation-performance)
#'     - [Faster versions of R](http://adv-r.had.co.nz/Performance.html#faster-r  )
#' - [Profiling](http://adv-r.had.co.nz/Profiling.html)
#' - [Memory](http://adv-r.had.co.nz/memory.html)
#' - [Rcpp: C++ in R](http://adv-r.had.co.nz/Rcpp.html)
#' - [C interface in R](http://adv-r.had.co.nz/C-interface.html)
#' 
#' 
#' 
#' 
#' # References
#'
