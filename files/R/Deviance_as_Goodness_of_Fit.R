#' ---
#' title: "When is Deviance Goodness of Fit -- and When It's Not!"
#' date: 'March 17, 2020'
#' author: 'G. Monette'
#' fontsize: 12pt
#' header-includes:
#' - \usepackage{amsmath}
#' - \usepackage{geometry}
#' - \geometry{papersize={6in,4in},left=.2in,right=.2in,top=.1in,bottom=.1in}
#' - \newcommand{\var}{\mathrm{Var}}
#' - \raggedright
#' output:
#'   pdf_document:
#'     toc: yes
#'     highlight: tango
#' ---
#'
#+ include=FALSE
knitr::opts_chunk$set(comment='    ')
#'
#' In discussions a few days ago it became apparent that there
#' might be confusion over the use of residual deviance as
#' a measure of goodness of fit (GOF).  
#' 
#' Consider the following logistic regression predicting
#' whether a family in Bangladesh switched the well from
#' which it obtained water as a function of the amount of
#' arsenic in its original well:
#' 
library(car)
library(spida2)
head(Wells)
xqplot(Wells)
fit <- glm(switch ~ arsenic, Wells, family = binomial)
summary(fit)
Anova(fit)
AIC(fit)
logLik(fit)
#'
#' It's tempting to look at the residual deviance of 
#' 4008.6 on 3018 degrees of freedom as an indicator of
#' the goodness of fit of the model but the fact is that
#' a logistic model can give a 'perfect' fit, yet still have
#' a very large residual deviance as we show below. 
#'  
#' In general,
#' the residual deviance of a particular model has no meaning
#' in itself. It can only be used in comparisons with other 
#' models using exactly the same data. There is one exception:
#' when the data can be modeled with a 
#' __saturated model__ that fits the data perfectly and has 
#' a deviance of zero. 
#' 
#' Specifically, the meaningful uses of deviance are to:
#' 
#' - perform a likelihood-ratio-test of a hypothetical null
#'   model against a larger alternative model fitting the same
#'   data whose parameter
#'   space includes the null model parameter space as a subset.
#'   You perform the test by subtracting the deviance of the
#'   larger model from that of the smaller model and comparing
#'   the result with a $\chi^2$ distribution with appropriate
#'   degrees of freedom.
#' - use the deviance to compute the AIC or the BIC for the model,
#'   which have no interpretation in themselves but can be used
#'   for comparison with AICs or BICs of other models that have
#'   be fitted on exactly the same data. (Beware of missing data
#'   in the predictors used in one model but not the other
#'   which can result in models being fitted on 
#'   different subsets of the data.)
#'   
#' In both of these examples the individual model deviances
#' need not have any interpretation in themselves, only when
#' substracted from other deviances.
#' 
#' There is one situation in which the residual deviance does
#' have a useful interpretation. That is when the formulation and
#' parametrization
#' of the model allows for a __saturated model__ that gives a
#' _perfect fit._ The residual deviance for the saturated model
#' is 0 and the residual deviances of smaller models are actually
#' comparisons of the smaller model with the saturated model.
#' 
#' Thus, the residual deviances don't have a meaning in themselves.
#' They only have a meaning because they happen to provide
#' comparisons with the largest feasible model. 
#' 
#' Although logistic regression with a 0/1 response cannot
#' be formulated directly in a form that has a saturated model,
#' it is possible to reshape the data so there is a saturated
#' model __provided all predictors are categorical.__
#' 
#' A logistic regression on categorical predictors can be 
#' formulated in four ways:
#' 
#' - the usual logistic regression with a 0/1 response.
#' - aggregated data with frequencies for all combinations
#'   of levels of the response and of the predictors using
#'   a weighted logistic regression.
#' - aggregated data by combinations of levels of the
#'   predictors with a matrix of frequencies of 
#'   'successes' and 'failures' used in a binomial 
#'   regression with a _logit_ link.
#' - a special log-linear model saturated on the predictors
#'   but with varying dependencies between the response
#'   category and the predictors categories.
#'   
#' The last two have full models that are saturated models and
#' the residual deviances of non-full models provided comparisons
#' with the saturated models. However, the residual deviances
#' for the first two forms cannot be interpreted except in 
#' comparison with other models.
#' 
#' The examples below show how to simulate logistic data with
#' categorical predictors and how to transform data from one form
#' to another. They show how differences in residual deviance
#' are consistent between data representations but the
#' absolute values only have clear interpretations in cases
#' with saturated models.
#' 
library(spida2)
library(car)
library(lattice)
library(latticeExtra)
library(boot)
#'
#' # Simulation 
#' 
#' Simulating logistic data with categorical predictors
#'  
sim <- function(n = 100, p = 0.5, na = 2, nb = 2) {
  df <- expand.grid(
    a = paste0('a',seq_len(na)),
    b = paste0('b',seq_len(nb)))
  df <- within(df, 
               {
                 p <- rep(p, length.out = nrow(df))
                 n <- rep(n, length.out = nrow(df))
               })
  df <- df[rep(1:nrow(df), df$n),]
  df$y <- rbinom(nrow(df), 1, df$p)
  df
}
set.seed(1273)
dd <- sim(p = c(.2,.6,.6,.1))
head(dd)
tab(dd, ~ y + a + b)
tab(dd, ~ y + a + b, pct = c(2,3))
#'
#' # Method 1: 
#' 
#' Regressing response as 0/1 variable
#'
#' This is the only way available if there is
#' even a single continuous predictor with
#' distinct values since you can't aggregate
#' over rows.

fit0 <- glm(y ~ 1, dd, family = binomial) 
fita <- glm(y ~ a + b, dd, family = binomial) # additive model
fiti <- glm(y ~ a * b, dd, family = binomial) # interaction model
summary(fit0)
summary(fita)
summary(fiti)

anova(fit0, fita, fiti, test = 'LRT')

AIC(fit0, fita, fiti)
BIC(fit0, fita, fiti)
#'
#' Predicted probabilities and log odds
#'
dd$phat <- predict(fiti, type = 'response')
dd$lo__interaction <- predict(fiti, type = 'link')
dd$lo__additive <- predict(fita, type = 'link')

gd(pch = 16)
xyplot(phat ~ a, dd, groups = b, type = 'b',
       auto.key = list(columns = 2, lines = T))
#'
#' Reshape data set to plot both models
#'
pred <- tolong(dd, sep = '__', timevar = 'model')
some(pred)
xyplot(lo ~ a | model, pred, groups = b, type = 'b', 
       ylab = 'log odds',
       auto.key = list(columns = 2, lines = T))
#' __Figure:__ Estimated log odds for an additive model
#' and a model with interaction.
#'  
logit <- function(p) log(p/(1-p))
expit <- function(lo) 1/(1 + exp(- lo))
#'
#' Plotting probabilities on log odds scale
#'

gd(lwd = 2)
xyplot(lo ~ a | paste(model, 'model'), pred, groups = b, type = 'b', 
       ylab = 'probability on log odds scale',
       scale = list(
         y = list(at = logit(seq(0,1,.05)),
                  labels = seq(0,1,.05))),
       auto.key = list(columns = 2, lines = T))
#' __Figure:__ Estimated probability plotted on
#' a log-odds scale for an additive model
#' and a model with interaction.
#'  
xyplot(expit(lo) ~ a | paste(model, 'model'), pred, groups = b, type = 'b', 
       ylab = 'probability of y = 1',
       auto.key = list(columns = 2, lines = T))
#' __Figure:__ Estimated probability for an additive model
#' and a model with interaction.
#'  
#' ## Exercise
#' 
#' What difference does it make whether you plot 
#' probabilities on a log-odds scale on a probability scale?
#' The difference is very slight in this case.
#'
#' # Leave-one-out (LOO) cross-validation
#'
library(boot)
cv.glm(dd, fiti)[-4]
glm.diag.plots(fiti)
#'
#' # Aggregated with frequencies as weights
#'
#' Aggregated data within each combination
#' of levels of y, a and b:

ddag <- as.data.frame(tab__(dd, ~ y + a + b))
ddag
#'
#' Fitting models on aggregated data
#'
fitag0 <- glm(y ~ 1, ddag, family = binomial, weights = Freq)
fitaga <- glm(y ~ a + b, ddag, family = binomial, weights = Freq)
fitagi <- glm(y ~ a * b, ddag, family = binomial, weights = Freq)
summary(fitag0)
summary(fit0)
summary(fitaga)
summary(fita)
summary(fitagi)
summary(fiti)
#'
#' Compare Likelihood ratio tests 
#'
anova(fitag0, fitaga, fitagi, test = 'LRT')
anova(fit0, fita, fiti, test = 'LRT')
AIC(fitag0, fitaga, fitagi)
AIC(fit0, fita, fiti)
#' 
#' Note how BIC use the 'wrong' n:
#' 
BIC(fitag0, fitaga, fitagi)
BIC(fit0, fita, fiti)
#'
#' # Binomial model with logit link 
#'
ddg <- as.data.frame(tab__(dd, ~ y + a + b))
ddg 
ddw <- towide(ddg, timevar = 'y', idvar = c('a','b'))
ddw$ymat <- with(ddw, cbind(Freq_0, Freq_1))

fitb0 <- glm(ymat ~ 1, ddw, family = binomial)
fitba <- glm(ymat ~ a + b, ddw, family = binomial)
fitbi <- glm(ymat ~ a * b, ddw, family = binomial)
summary(fitb0)
summary(fitba)
summary(fitbi)
#' 
#' ## Comparisons
#' 
#' Null models
#' 
summary(fitb0)
summary(fitag0)
summary(fit0)
#'
#' Additive models
#'
summary(fitba)
summary(fitaga)
summary(fita)
#'
#' Interaction models
#'
summary(fitbi)
summary(fitagi)
summary(fiti)
#'
#' Compare Likelihood ratio tests 
#'
anova(fitb0, fitba, fitbi, test = 'LRT')
anova(fitag0, fitaga, fitagi, test = 'LRT')
anova(fit0, fita, fiti, test = 'LRT')
#'
#' Compare AIC
#'
AIC(fitb0, fitba, fitbi)
AIC(fitag0, fitaga, fitagi)
AIC(fit0, fita, fiti)
#' 
#' Note how BIC use the 'wrong' n:
#' 
BIC(fitb0, fitba, fitbi)
BIC(fitag0, fitaga, fitagi)
BIC(fit0, fita, fiti)
#'
#' ## Exercise: 
#' 
#' Perform log-linear model analyses and compare results.
#' 
#'
