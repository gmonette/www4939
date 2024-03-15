#' ---
#' title: "Mixed model selection and diagnostics"
#' author: ""
#'
#' - Example of 'stepwise' model selection by pruning higher order interactions
#' - 
#'
install.packages('HLMdiag')
library(HLMdiag)
?covratio


library(spida2)
library(nlme)
library(latticeExtra)
dropone

dd <- hsfull
names(dd)

dd <- within(dd,
             {
               Sex_school <- cvar(Sex, school)
               ses_school <- cvar(ses, school)
               Minority_school <- cvar(Minority, school)
               
             })
fit <- lme(mathach ~ ses * ses_school * Sex * Sex_school *Sector, dd, random = ~ 1 + ses|school,
           control = list(msVerbose = T, msMaxIter = 1000, returnObject = T))
summary(fit)
xyplot(mathach ~ ses | Sector, dd)

fit <- lme(mathach ~ ses * ses_school * Sex * Sex_school *Sector, dd, random = ~ 1 + I(ses - 10)|school,
           control = list(msVerbose = T, msMaxIter = 1000, returnObject = T))
summary(fit)
xyplot(mathach ~ ses | Sector, dd)
#
# LRT for random effect of SES
# Note: same FE model, different RE model so can use anova on default REML fits
# 
fit2 <- lme(mathach ~ ses * ses_school * Sex * Sex_school *Sector*Minority, dd, random = ~ 1 |school,
           control = list(msVerbose = T, msMaxIter = 1000, returnObject = T))
summary(fit2)
anova(fit2, fit)
#
# Therefore: no sign of evidence for variation in ses slope
#
# Try random effect of Sex
# 
fits <- lme(mathach ~ ses * ses_school * Sex * Sex_school *Sector, dd, random = ~ 1 + Sex|school,
            control = list(msVerbose = T, msMaxIter = 1000, returnObject = T))
summary(fits)
anova(fits, fit2)
intervals(fits)
#
# Therefore: some evidence of a different sex gap between schools
#
#'
#' 'Stepwise' model identification
#'
#' We started with at 




fit <- lme(mathach ~ ses * Sex * Sex_school *Sector, dd, random = ~ 1 + Sex|school,
           control = list(msVerbose = T, msMaxIter = 1000, returnObject = T))
summary(fit)
getG(fit)
xyplot(mathach ~ ses | Sector, dd)

# 
# lower interaction?
# 
fit <- lme(mathach ~ (ses + Sex + Sex_school +Sector)^3 , dd, random = ~ 1 + Sex|school,
           control = list(msVerbose = T, msMaxIter = 1000, returnObject = T))
summary(fit)
wald(fit, ":.*:")

fit <- lme(mathach ~ (ses + Sex + Sex_school +Sector)^2 , dd, random = ~ 1 + Sex|school,
           control = list(msVerbose = T, msMaxIter = 1000, returnObject = T))
summary(fit)
wald(fit, "[el]:")

fit <- lme(mathach ~ (ses + Sex + Sex_school +Sector)^2 , dd, random = ~ 1 + Sex|school,
           control = list(msVerbose = T, msMaxIter = 1000, returnObject = T))
summary(fit)
wald(fit, "[el]:")



