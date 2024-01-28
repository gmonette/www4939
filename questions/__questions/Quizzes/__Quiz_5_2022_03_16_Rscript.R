#' ---
#' geometry: width=3in
#' ---
#' 
library(spida2)
library(nlme)
dd <- as.data.frame(subset(Orthodont, Sex == 'Female'))
head(dd, 2)
fit <- lme(distance ~ age, dd, random = ~ 1 + age | Subject)
summary(fit)


#' 
#' 1. Calculate the estimated $G$ matrix from this output.
#' 2. Find the estimated standard deviation of the individual random regression
#'    lines when age is equal to 10.
#' 3. At what age is this standard deviation minimized?
#' 