library(spida2)
knitr::opts_chunk$set(comment = ' ')
#' 
library(latticeExtra)
tab(hs, ~ school)
xyplot(mathach ~ ses | school, hs)


#' Consider the model: 
fit <- lm(mathach ~ ses + cvar(ses, school), hs)
wald(fit)
#'
#' 1. Draw a diagram showing the estimated relationship
#'    between 'mathach' and 'ses' for values of ses
#'    ranging from -2 to 2, for:
#' 
#'    a. a school with mean ses equal to 0, and for
#'    b. a school with mean ses equal to 1. 
#' 
#'    Be sure to indicate clearly where the estimated
#'    coefficients in the model appear in the diagram.
#' 
#' 2. In what sense is the model:
#' 
fit2 <- lm(mathach ~ dvar(ses, school) + cvar(ses, school), hs)
#'
#' equivalent to the former model. Explain clearly.
#'  
