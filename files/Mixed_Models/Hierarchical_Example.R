#' ---
#' title: "Small hierarchical example"
#' ---
#' 
#' For some information on using Rmarkdown in R scripts like this one (Roxygen style)
#' see 
#' [3.3 Render an R script to a report](https://bookdown.org/yihui/rmarkdown-cookbook/spin.html).
#' 
#' 
library(spida2)
setwd_here()    # set working directory to directory containing this file
                # so executing line-by-line and knitting (Alt  F  C)
                # will have the same effect.
# 
# You need to run the following commands line by line
# to create the file 'xy.rda' before you can 'render'
# the file with Ctrl-Shift-K OR Alt f c (in sequence, not together)
#
# plot(c(0,20), c(0,30), type = 'n')
# xy <- locator(24)
# plot(xy)
# save(xy, file = 'xy.rda')  # save version in a permanent file
load('xy.rda', verbose = T)  # load version saved in 'xy.rda'

dd <- data.frame(id = rep(letters[1:6], each = 4), xy)
names(dd)[c(2,3)] <- c('dose','symptoms')

library(lattice)
library(latticeExtra)

td(lwd = 2, pch = 16, cex = 1.2) # sets graphical parameters

xyplot(symptoms ~ dose, dd, 
       groups = id,
       type = 'b',
       auto.key = list(space = 'right', lines = T))

#' 
#' Plotting data
#' 
xyplot(symptoms ~ dose, dd, 
       groups = id,
       type = 'b',
       auto.key = list(space = 'right', lines = T))
#' 
#' With marginal ellipse
#' 
xyplot(symptoms ~ dose, dd, 
       groups = id,
       type = 'b',
       auto.key = list(space = 'right', lines = T)) +
  layer(panel.dell(..., col = 'red', lwd = 2))
#' 
#' With marginal ellipse and pooled regression line
#'
fit.pooled <- lm(symptoms ~ dose, dd) 
head(dd)
dd$fit.pooled <- predict(fit.pooled)
#'
#'  Easier way to accumulating plots so:
#'  
#'  - no cutting and pasting
#'  - changes devolve to later plots
#'
p <- xyplot(symptoms ~ dose, dd, 
       groups = id,
       type = 'b',
       auto.key = list(space = 'right', lines = T)) +
  layer(panel.dell(..., col = 'red', lwd = 2)) +
  xyplot(fit.pooled ~ dose, dd, type = 'l', lwd = 2, col = 'red')
p  # this does the actual plotting

#'
#' With conditional additive model 
#'
fit.additive <- lm(symptoms ~ dose + id, dd)
dd$fit.additive <- predict(fit.additive)
  head(dd)      
p2 <- p + 
  xyplot(fit.pooled ~ dose, dd, type = 'l') +
  xyplot(fit.additive ~ dose, dd, groups = id, type = 'l', col = 'red', lwd = 2)
p2
#'
#' Between model
#' 
#' - Note use of 'capply' for 'contextual apply'
#' 
dd <- within(
  dd,
  {
    dose_m <- capply(dose, id, mean)
    symptoms_m <-  capply(symptoms, id, mean)
  }
)
head(dd)

fit.between <- lm(symptoms_m ~ dose_m, dd)  # note that each point is repeated
                                            # as many times as there are
                                            # observations in each group
dd$fit.between <- predict(fit.between)

p3 <- p2 +
  xyplot(symptoms_m ~ dose_m, dd, type = 'p', cex = 2, col = 'black', pch = 16)
p3
#'
(
  p4 <- p3 +
    (xyplot(symptoms_m ~ dose_m, dd, type = 'p', cex = 2, col = 'black', pch = 16) +
    layer(panel.dell(..., col = 'black',lwd = 2))) +
    xyplot(fit.between ~ dose_m, dd, type = 'l',  col = 'black', lwd = 2) 
)

#'
#' Explore conditional models:
#' 

fit.conditional <- lm(symptoms ~ id * dose, dd)
summary(fit.conditional)  # can you interpret each parameter by showing
                          # where it goes on the plot below
#'
#' Same model, different parametrization
#'
fit.conditional2 <- lm(symptoms ~ id / dose - 1, dd)
summary(fit.conditional2) # can you interpret each parameter by showing
                          # where it goes on the plot below

#'
#' Adding the conditional fits
#'
dd$fit.conditional <- predict(fit.conditional)
(
  p5 <- p4 +
  xyplot(fit.conditional ~ dose, data = dd, groups = id, type = 'l', col = 'blue', lty =1)
)
  

