
library(spida2)
library(nlme)
#'
#' 
#' Let Y and X be numerical variables and let G be a factor.   
#' Let Yr and Xr be the residuals of Y and X regressed on G.  
#' Let Xh be the least-squares predictor of X using G. Note that `X = Xh + Xr`.  
#' All the following models except one must produce the same
#' least-squares coefficient for the effect of X or Xr.
#' 
#' 1. Which model may produce a different coefficient? Explain why briefly.
#' 2. In the list below, choose 6 pairs of models that produce the same coefficient for X or Xr
#'    and state which model in each pair would result in the smaller SE for the effect of X or Xr, or whether
#'    the SEs would be equal. Justify briefly. A rough sketch is acceptable. 
#' 
#' a) `Y ~ X + G`
#' c) `Yr ~ Xr`
#' a) `Y ~ Xr + G`
#' b) `Y ~ X`
#' d) `Y ~ Xr`
#' e) `Y ~ X + Xh`
#' f) `Y ~ X + Xh + Zg` where Zg is a G-level numerical variable that is constant within levels of G.
#' 
#' 
knitr::knit_exit()
#' 

head(hs)
dd <- subset(hs, Sector == 'Public')
dd$female <- with(dd, 1*(Sex == 'Female'))
fit <- lme(mathach ~ Sex + ses, dd, random = ~ 1 + Sex | school,
           control = list(msMaxIter=200, msVerbose = T))
fit2 <- lme(mathach ~ ses, dd, random = ~ 1 | school,
           control = list(msMaxIter=200, msVerbose = T))
fit <- lme(mathach ~ ses + cvar(ses, school),
           data = hs,
           random = ~ 1 + dvar(ses, school) | school)
summary(fit)                               
#' 
#' ## Quiz 9
#' 
#' 1. Draw lines showing
#'    the expected value of _mathach_ as a function 
#'    of _ses_ for a school whose mean _ses_ is equal
#'    to 0 and for a school whose mean _ses_ is equal to 1.
#'    Label axes clearly so the position of the lines is not
#'    ambiguous.
#' 2. What is the estimated variance of the 
#'    __expected value__ of _mathach_ for a student whose
#'    _ses_ = 2 in a school whose mean _ses_ is equal to 1.    
#' 3. What is the estimated variance of the 
#'    __value__ of _mathach_ for a student whose
#'    _ses_ = 2 in a school whose mean _ses_ is equal to 1.    
#'    
#'
knitr::knit_exit()
#'
summary(fit)                  
anova(fit,fit2)

dd <- as.data.frame(subset(Orthodont, Sex == 'Female'))
head(dd,2)
fit <- lme(distance ~ age, dd, random = ~ 1 + age | Subject,
           correlation = corAR1(form = ~ 1| Subject))
summary(fit)

