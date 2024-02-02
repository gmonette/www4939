#'
#'  Some references for the lattice package: 
#'  
#' - [Advanced graphics with the lattice package - R in Action, Second Edition: Data analysis and graphics with R](https://livebook.manning.com/book/r-in-action-second-edition/bonus-chapter-23-advanced-graphics-with-the-lattice-package/126) 
#' 
library(spida2)
library(lattice)
library(latticeExtra)

head(hs)
xyplot( mathach ~ ses, hs)
xyplot( mathach ~ ses, hs, groups = Sex)
xyplot( mathach ~ ses, hs, groups = Sex, auto.key = T)
xyplot( mathach ~ ses, hs, groups = Sex, 
        auto.key = list(space = 'right'))
# exercise create a girl/boy/coed variable
xyplot( mathach ~ ses | Sector, 
        up(hs, ~school, all =T), groups = Sex, 
        auto.key = list(space = 'right'))
xyplot( mathach ~ ses | Sex, hs, 
        groups = Sector, type = 'p',
        auto.key = list(space = 'right'))
xyplot( mathach ~ ses | Sex, hs, groups = Sector,
        type = 'r',                                 # r for regression
        auto.key = list(space = 'right'))
xyplot( mathach ~ ses | Sex, hs, groups = Sector,
        type = 'p',                                 # p for points
        auto.key = list(space = 'right'))  +    # to overlay plots
xyplot( mathach ~ ses | Sex, hs, groups = Sector,
        type = 'r',                                 # r for regression
        auto.key = list(space = 'right'))
# 
# You can change colors, etc. in xyplot but the changes won't affect auto.key
# 
xyplot( mathach ~ ses | Sex, hs, groups = Sector,
        pch = 16, col = c('#00FFFFFF', '#FF00FFFF'),  # RGB + ALPHA (transparency)
        auto.key = list(space = 'right'))

# td and gd: gd sets up gg-like plots,

gd( pch = 16, col = c('#00FFFFFF', '#FF00FFFF'))
p <- xyplot( 
  mathach ~ ses | Sex, hs, groups = Sector,
  auto.key = list(space = 'right'))
p
#
# Colors
# 
pals('blue')
# 
# Note that second level covers the first, which is a problem if plot is dense
# 
gd( pch = 21, col = c('#00FFFF88', '#FF00FF88'))  # using transparency
p
p + glayer(panel.lmline(...))
gd(lwd = 4,  col = c('#00FFFF88', '#FF00FF88'))
p + glayer(panel.lmline(...))
#
# What happens if you use 'layer'
#
#' this is text 
#

#- fig.width=8
p + layer(panel.lmline(...))   # layer does not use groups, only panels
#
#  One panel per school
#
xyplot(mathach ~ ses | school, hs )
xyplot(mathach ~ ses | factor(school), hs , groups = Sex)
#
#  Let's get back to defaults
#
graphics.off()
xyplot(mathach ~ ses | factor(school), hs , groups = Sex)
#
# Plotting fitted curves
# 
# Let's put Catholic and Public schools together
# 
hsm <- within(
  hs,
  {
    id <- paste(Sector, school)
  }
) 
xyplot(mathach ~ ses | id, hsm , groups = Sex)
?xyplot
xyplot(mathach ~ ses | id, hsm , groups = Sex, 
       par.strip.text = list(cex=2))  # oops
xyplot(mathach ~ ses | id, hsm , groups = Sex, 
       par.strip.text = list(cex=.1))  # re-oops
xyplot(mathach ~ ses | id, hsm , groups = Sex, 
       par.strip.text = list(cex=.6))  # just right?
xyplot(mathach ~ ses | id, hsm , groups = Sex,
       skip = rep(c(F,T,F), c(21,3,30)),
       layout = c(8,6),               # breaks convention
       par.strip.text = list(cex=.6))  
xyplot(mathach ~ ses | id, hsm , groups = Sex,
       skip = rep(c(F,T,F), c(21,3,30)),
       layout = c(8,6),               # breaks convention
       between = list(y =c(0,0,.3,0,0,0)),
       par.strip.text = list(cex=.6))  
xyplot(mathach ~ ses | id, hsm , groups = Sex,
       # skip = rep(c(F,T,F), c(21,3,30)),
       layout = c(7,6),               # breaks convention
       between = list(y =c(0,0,.3,0,0,0)),
       par.strip.text = list(cex=.6),
       auto.key = list(space = 'right'))  
td(cex = .6)
xyplot(mathach ~ ses | id, hsm , groups = Sex,
       # skip = rep(c(F,T,F), c(21,3,30)),
       layout = c(7,6),               # breaks convention
       between = list(y =c(0,0,.3,0,0,0)),
       par.strip.text = list(cex=.5, font =4),
       auto.key = list(space = 'right'))  

# ordering schools by mean ses within each Sector
hsm <- within(
  hsm,
  {
    id <- factor(paste(Sector, school))
    id <- reorder(id, ses)
  }
)
xyplot(mathach ~ ses | id, hsm , groups = Sex,
       # skip = rep(c(F,T,F), c(21,3,30)),
       layout = c(7,6),               # breaks convention
       between = list(y =c(0,0,.3,0,0,0)),
       par.strip.text = list(cex=.6),
       auto.key = list(space = 'right'))  
# oops
hsm <- within(
  hsm,
  {
    id1 <- factor(paste(Sector, school))
    id <- reorder(id1, ses + I(Sector == 'Public')*1000)
  }
)
levels(hsm$id)
tab(hsm, ~ id)
xyplot(mathach ~ ses | id, hsm , groups = Sex,
       # skip = rep(c(F,T,F), c(21,3,30)),
       layout = c(7,6),               # breaks convention
       between = list(y =c(0,0,.3,0,0,0)),
       par.strip.text = list(cex=.6),
       auto.key = list(space = 'right'))  
#
# Showing fitted lines, no matter how complicated the 
# model is:
#
fit <- lm(mathach ~ id * (ses + I(ses^2)) -1, hsm)  
summary(fit)
wald(fit, 'ses\\^2')  
wald(fit, ':')  # maybe don't need interaction?  Which means??
#
# Making a data frame with all combinations of predictor
# values you want to plot:
# 
# - Usual solution in R uses 'expand.grid'
# - Made easier with the following function 'pred.grid'
#   now in the the spida2 package but you would need to 
#   reinstall spida2
#
pred.grid <- function(...) {
  nams <- as.character(as.list(substitute(list(...)))[-1L])
  x <- list(...)
  names(x)[names(x) == ''] <- nams[names(x) == '']
  x <- lapply(x, unique)
  do.call(expand.grid, x)
}
#
# Now we use pred.grid to create a prediction data frame:
#
# You just need to name the categorical variables in hsm that 
# you need for the model. For numeric variables, provide
# a sequence of values that will produce smooth curves
# when the predicted values are plotted.
# 
pred <- with(hsm, pred.grid(id, ses = seq(-4,3,.1)))
head(pred)
dim(pred)   # has every combination of id and values for 'ses'

# add the predicted value (I like to use the same name as the fitted model)
pred$fit <- predict(fit, newdata = pred)
head(pred)
# Note: if you fitted a glm model, you might want to use 'type = "response'", e.g.
pred$fit <- predict(fit, newdata = pred, type = 'response')
#
# Now we can plot the points and the fitted model
#
xyplot(mathach ~ ses | id, hsm , groups = Sex,
       # skip = rep(c(F,T,F), c(21,3,30)),
       layout = c(7,6),               # breaks convention
       between = list(y =c(0,0,.3,0,0,0)),
       par.strip.text = list(cex=.6),
       auto.key = list(space = 'right')) +
  xyplot(fit ~ ses | id, pred, type = 'l') # takes defaults from last plot
#
# If you want to compare with a quintic
#

fit2 <- lm(mathach ~ id * poly(ses, 5, raw = TRUE), hsm)  
summary(fit2)   # probably overfitting!

pred$fit2 <- predict(fit2, newdata = pred)  # we can use 'pred' since it's the same predictors

xyplot(mathach ~ ses | id, hsm , groups = Sex,
       # skip = rep(c(F,T,F), c(21,3,30)),
       layout = c(7,6),               # breaks convention
       between = list(y =c(0,0,.3,0,0,0)),
       par.strip.text = list(cex=.6),
       auto.key = list(space = 'right', lines = T))  +
  xyplot(fit ~ ses | id, pred,  type = 'l', col = 'black')+
  xyplot(fit2 ~ ses | id, pred, type = 'l', col = 'blue')

anova(fit, fit2)  
#
# Importing information from hs into a prediction data frame
# 
# Suppose you also wanted each school's Sector in the 'pred'
# data frame.
# 
# You can't use: 
# 
pred_bad <- with(hsm, pred.grid(id, Sector, ses = seq(-3,3,.01)))
#
# Why not??
# 
# Here's an easy way with the 'up' function
# 
pred <- with(hsm, pred.grid(id, ses = seq(-3,3,.01)))   # as before
dim(pred)
head(pred)
# 
#  Merge with Sector and other Level-2 variables
# 
pred <- merge(pred, up(hsm, ~id), by = 'id', all.x = TRUE)   # left join
dim(pred)                 # same number of rows
head(pred)                # extra variables
#
# Now we use predicted lines for models that use Sector
#
fit3 <- lm(mathach ~ poly(ses,2,raw=TRUE) * Sector ,  hs)
pred$fit3 <- predict(fit3, newdata = pred)
pred <- sortdf(pred, ~ ses)
xyplot(mathach ~ ses | id, hsm , groups = Sex,
       # skip = rep(c(F,T,F), c(21,3,30)),
       layout = c(7,6), 
       between = list(y =c(0,0,.3,0,0,0)),
       par.strip.text = list(cex=.6),
       auto.key = list(space = 'right', lines = T))  +
  xyplot(fit3 ~ ses | id, pred,  type = 'l', col = 'blue', lwd = 2)


# Exercise:
# 
# - Plot fitted lines for models that use Sector and Sex
# - Experiment with a variety of models and presentations
#'
#' Add plotting ideas and tricks to Piazza
#'
