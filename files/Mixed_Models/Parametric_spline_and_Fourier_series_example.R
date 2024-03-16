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
  Nobs <- 7      # observations per subject
  
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

#'
#' Note: one observation every two years on each person
#' 
#' Between-person and within-person variation in sleep
#' 

fit <- lme(sleep ~ 1, dd, random = ~1 |id)
summary(fit)

#'
#' define a parametric spline using years as unit to avoid large numbers
#'

sp <- function(y) {
  gsp(y, knots = c(-.5,0,.5), degree = c(0,1,1,0), c(0, -1, 0))
}

seq(-2,2,.1) %>% matplot(., sp(.), type ='b')
sp(seq(-2,2,.1))

#'
#' Use years as time units
#' 

dd <- within(dd,
           {
             datey <- date /365
             birthy <- birth_date / 365
           })



fit <- lme(sleep ~ sp(datey - birthy) , dd, random = ~ 1 | id)
summary(fit)
#'
#' Create a prediction data frame to show model prediction
#'
pred <- data.frame(datey = seq(-2,2,.01), birthy = 0)
pred$fit <- predict(fit, newdata = pred, level = 0)

xyplot(fit ~ I(12*datey), pred, type = 'l', lwd = 2,
       xlim = c(-12,12),
       ylab = "Mean maternal hours of sleep",
       xlab = "Time pre or post birth (in months)") +
  layer_(panel.grid(h=-1,v=-1))
#'
#' To add error bounds, since 'predict' won't provide them for 'lme' models
#'
ww <- as.data.frame(wald(fit, pred = pred))

plotbands <- function(ww,...) {
xyplot(coef ~ I(12*datey), ww, type = 'l', lwd = 2,
       xlim = c(-12,12),
       ...,
       lower = ww$L2,             # added for panel.fit
       upper = ww$U2,             # added for panel.fit
       subscripts = T,            # added for panel.fit
       ylab = "Mean maternal hours of sleep with 95% confidence bands",
       xlab = "Time pre or post birth (in months)") +
    layer_(panel.grid(h = -1, v = -1)) +
    layer(panel.fit(..., alpha = .2))
}
plotbands(ww)
plotbands(ww, ylim = c(7,9))

#' 
#' Try a different spline
#'

sp2 <- function(y) gsp(y, c(-1,-.5, 0, .5, 1), c(0,2,3,3,2,0), c(1,1,-1,1,1))

fit2 <- lme(sleep ~ sp2(datey - birthy) , dd, random = ~ 1 | id)
summary(fit2)

pred$fit2 <- predict(fit2, newdata = pred, level = 0)
with(pred, plot(datey, fit2, type = 'l'))

ww <- as.data.frame(wald(fit2, pred = pred))
plotbands(ww)
plotbands(ww, ylim = seq(7.2,9,.2))


#'
#'   
#' fit and fit2 have different FE models so we must refit 
#' 
#' We can compare these models with AIC or BIC but 
#' the p-value should not be interpreted since the
#' neither model is nested in the other
#' 
anova(update(fit, method = "ML"), update(fit2, method = "ML"))
#'
#' Results: AIC favours the smaller model
#' 
#' The positions of knots can be estimated by trial and error
#' and could be estimated more formally using non-linear models,
#' which we might take up later.
#'
#' Adding seasonal effects with sin/cos pair harmonics
#'
#'
Sin <- function(x) cbind(sin(x), cos(x))
#
fit3 <- lme(sleep ~ sp2(datey - birthy) + Sin(2*pi*datey) , dd, random = ~ 1 | id)

#'
#' We can force _lme_ to return an object:
#'

fit3 <- lme(sleep ~ sp2(datey - birthy) + Sin(2*pi*datey) , dd, random = ~ 1 | id,
            control = list(returnObject = TRUE))
#'
#' but it's generally better to try an alternative optimizer
#'

fit3o <- lme(sleep ~ sp2(datey - birthy) + Sin(2*pi*datey) , dd, random = ~ 1 | id,
            control = list(opt = 'optim', msVerbose = T, verbose = T, returnObject = T))
#'
#' with the same result:
#'
car::compareCoefs(fit3,fit3o)
#'
#' Also using 'ML' can give convergence:
#'
fit3 <- lme(sleep ~ sp2(datey - birthy) + Sin(2*pi*datey) , dd, random = ~ 1 | id, method = 'ML')
#'
#' Compare estimated models
#'
summary(fit3)
summary(fit3o)
getG(fit3)
getG(fit3o)
getR(fit3)
getR(fit3o)
#'
#' Estimating seasonal pattern:
#'

preds <- data.frame(datey = seq(0,2,.01))
preds$birthy <- preds$datey - 2     # to move birth out of the way

preds$fit3 <- predict(fit3, newdata = preds, level = 0)

with(preds, plot(datey, fit3, type = 'l'))

ww <- as.data.frame(wald(fit3o, pred = preds))

xyplot(coef ~ datey, ww, type = 'l',
       lower = ww$L2,
       upper = ww$U2,
       subscripts = TRUE) +
  layer(panel.fit(...))

ww <- as.data.frame(wald(fit3o, pred = pred))

xyplot(coef ~ datey, ww, type = 'l',
       lower = ww$L2,
       upper = ww$U2,
       subscripts = TRUE) +
  layer(panel.fit(...))
#'
#' Combines seasonal and birth effects showing predicted patterns
#' for a birth on January 1.
#'
#' To isolate seasonal and birth effects we would need to
#' reparameterize the model to allow unlinking the variable used
#' for calendar date from the variable used for 
#' time pre/post birth.
#' 
#' This is left as an exercise. (Challenge: medium)
#'
#' 
#' Fitting higher harmonics
#' 
fit4 <- lme(sleep ~ sp2(datey - birthy) + 
              Sin(1 * 2 * pi * datey) + 
              Sin(2 * 2 * pi * datey) +
              Sin(3 * 2 * pi * datey)
              , dd, random = ~ 1 | id)
summary(fit4)
#'
#' We can test higher harmonics with a Wald test or with a LR test
#'
wald(fit4, 'Sin\\(3')
wald(fit4, 'Sin\\([23]')
wald(fit4, 'Sin\\([123]')
#'
anova(update(fit3, method = 'ML'), update(fit4, method = "ML"))
#'
#' Note how close the p-values are from the two tests
#'
