#' ---
#' title: 'MATH 4939 Quiz 3'
#' date: 'February 3, 2021'
#' author: ''
#' fontsize: 12pt
#' ---
#+ include=F
library(spida2)
dd <- data.frame(x = c(1, 8, 10, 12,13, 14, 16), y = c(2.5, 1.1, 2.3, 2.7, 6.2, 4.2, 5.1), ord = rnorm(7))
dd <- sortdf(dd, ~ ord)
dd$label <- LETTERS[1:7]
dd$ord <- NULL
#' 
#' __There are two questions on this quiz. Each is worth 5 marks.__
#' 
#' __Question 1:__
#' 
#' Consider the following scatterplot with 7 observations:
#+ echo=F 
with(dd, plot(y ~ x, type = 'n'))
with(dd, text(x,y,label))
#' 
#' The following plot is the Residual-Leverage plot
#' for the regression of y on x:
#+ include=F
fit <- lm(y ~ x, dd)
#+ echo=F
plot(fit, which = 5)
#' 
#' Three points are labelled, 1, 2, and 5, in the Residual-Leverage plots.
#' 
#' Identify which point in the original plot corresponds to each of these
#' three points, e.g. perhaps 1 = G, etc. and justify your choice for each
#' point.
#' 
#' __Question 2:__
#' 
#' This is a scatterplot displaying 100 observations on two variables, x and y.
#' 
#+ include=F
set.seed(123)
dd <- data.frame(x= 10 + 5*rnorm(100))
dd <- within(
  dd,
  {
    y <- 20 -x + 2*rnorm(x)
  }
)
#+ echo = F   
plot(y~x,dd)
#'
#' a) Estimate the slope and the standard error of the estimate of the 
#'    slope of the 
#'    regression of y on x. Show or explain the method you used.
#' b) Estimate the variance covariance matrix of x and y. 
#'    Show or explain the method you used method.