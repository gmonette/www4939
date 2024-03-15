#' ---
#' title: "Using parametric splines and Fourier series for seasonal effects"
#' author: ""
#' ---
#'
#+ include=FALSE
knitr::opts_chunk$set(error=TRUE,comment='   ')
#' - Using parametric splines for piece-wise polynomial curves
#' - and Fourier series for seasonal effects
#' 
#' Data set simulates data from Statistics Canada NPHS from 1994 to 2011.
#' Participants were surveyed every 2 years for up to 7 occasions.
#' 
#' Some participants happened to give birth during the study but
#' since data was collected every two years there was little data
#' on individual longitudinal sleep patterns before and after birth.
#' 
#' However, using mixed models with a parametric model for sleep
#' behaviour before and after birth, it's possible to 'stitch'
#' trajectories together to get a picture of individual
#' predicted sleep trajectories. 
#'
library(spida2)
library(nlme)
library(latticeExtra)

#'
#'
#' Hypothetical perinatal 'birth effect' on maternal sleep
#' relative to days before and after birth

birth_effect <- function(d, plus = 1, minus = 1) {
  ifelse(d < -180, 0,
         ifelse(d < 0, plus * (.5 -.5* cos(pi*(d+180)/180)),
                ifelse(d < 180, - minus * (.5 -.5* cos(pi*(d+180)/180)), 0)
         )
  )
}
# test
seq(-365,365) %>% plot(., birth_effect(.), type = 'l')

#'
#' Generate a data set
#' 
#' Note that many women in the NPHS gave birth more than once.
#' Here there is only one birth recorded per person.
#'

# sample(100000, 1)
{
  set.seed(4728)
  Nid <- 1000    # number of subjects
  Nobs <- 7      # observartions per subject
  
  expand.grid(id = 1:Nid, obs = 1:Nobs) %>%  # basic skeleton for data set 
    within(
      {
        
        # date id registered
        reg_date <- sample(Nobs * 365, Nid, replace = TRUE)[id]  # generating one value per id
        
        # dates id observed (approx every 2 years)
        date <- reg_date + obs*2*365 + sample(365, length(id), replace = TRUE)  # generating one value per observation
        
        birth_date <- reg_date + sample(365*14, Nid, replace = TRUE)[id]       # date giving birth
        
        ..plus <- runif(Nid)[id]      # extra sleep pre birth
        ..minus <- runif(Nid)[id]     # less sleep after birth
        ..birth_effect <- birth_effect( date - birth_date, ..plus, ..minus)
        
        ..seasonal <- .5 * cos(2*pi*(date-30)/365)
        ..sd_between <- 1
        ..sd_within <- .5
        
        sleep <- 8 + ..sd_between * rnorm(Nid)[id] + ..sd_within * rnorm(id) +
          ..birth_effect + ..seasonal
        
        ..plus <- ..minus <- ..birth_effect <- ..seasonal <- ..sd_between <- ..sd_within <- NULL
        
      }
    ) %>% 
    sortdf(~id/date)-> dd
}
head(dd)

xqplot(dd)

xyplot(sleep ~ date, dd, groups = id, type = 'l')
xyplot(sleep ~ I(date-birth_date), dd, groups = id, type = 'l')

# Note: one observation every two years on each person

fit <- lme(sleep ~ 1, dd, random = ~1 |id)
summary(fit)

# define a parametric spline using years as unit to avoid large numbers

sp <- function(y) {
  gsp(y, knots = c(-.5,0,.5), degree = c(0,1,1,0), c(0, -1, 0))
}

seq(-2,2,.1) %>% matplot(., sp(.), type ='b')
sp(seq(-2,2,.1))

# use years as time units

dd <- within(dd,
           {
             datey <- date /365
             birthy <- birth_date / 365
           })

fit <- lme(sleep ~ sp(datey - birthy) , dd, random = ~ 1 | id)
summary(fit)

pred <- data.frame(datey = seq(-2,2,.01), birthy = 0)
pred$fit <- predict(fit, newdata = pred, level = 0)
with(pred, plot(datey, fit, type = 'l'))

#'
#' Try a different spline
#'

sp2 <- function(y) gsp(y, c(-1,-.5, 0, .5, 1), c(0,2,3,3,2,0), c(1,1,-1,1,1))

fit2 <- lme(sleep ~ sp2(datey - birthy) , dd, random = ~ 1 | id)
summary(fit2)

pred$fit2 <- predict(fit2, newdata = pred, level = 0)
with(pred, plot(datey, fit2, type = 'l'))

#'
#' fit and fit2 have different FE models so we must refit 
#' with ML to do LRT test
#' 
anova(update(fit, method = "ML"), update(fit2, method = "ML"))
#'
#' Adding seasonal effects with sin/cos pair harmonics
#'
#'
Sin <- function(x) cbind(sin(x), cos(x))
#
fit3 <- lme(sleep ~ sp2(datey - birthy) + Sin(2*pi*datey) , dd, random = ~ 1 | id)
summary(fit3)

preds <- data.frame(datey = seq(0,2,.01))
preds$birthy <- preds$datey - 2

preds$fit3 <- predict(fit3, newdata = preds, level = 0)

with(preds, plot(datey, fit3, type = 'l'))

#' Fitting higher harmonics
#' 
fit4 <- lme(sleep ~ sp2(datey - birthy) + Sin(pi * 2 * datey) + Sin(2 * pi * 2 * datey) , dd, random = ~ 1 | id)

summary(fit4)

wald(fit4, 'Sin\\(2')
wald(fit4, 'Sin')
preds <- data.frame(datey = seq(0,2,.01))
preds$birthy <- preds$datey - 2

preds$fit3 <- predict(fit3, newdata = preds, level = 0)

with(preds, plot(datey, fit3, type = 'l'))
