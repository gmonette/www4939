library(spida2)
library(lattice)
library(latticeExtra)

head(hs)
xyplot( mathach ~ ses, hs)
xyplot( mathach ~ ses, hs, groups = Sex)
xyplot( mathach ~ ses, hs, groups = Sex, auto.key = T)
xyplot( mathach ~ ses, hs, groups = Sex, 
        auto.key = list(space = 'right'))
xyplot( mathach ~ ses | Sector, hs, groups = Sex, 
        auto.key = list(space = 'right'))
xyplot( mathach ~ ses | Sex, hs, groups = Sector 
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
       par.strip.text = list(cex=.6),
       auto.key = list(space = 'right'))  

# ordering schools by mean ses
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
    id <- factor(paste(Sector, school))
    id <- reorder(id, ses + I(Sector == 'Pulic')*1000)
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
# model is
#
fit <- lm(mathach ~ id * (ses + I(ses^2)), hsm)  
summary(fit)
wald(fit, '2')  
wald(fit, ':')  # maybe don't need interaction?  Which means??

pred <- expand.grid(id = unique(hsm$id), ses = seq(-3,3,.1))
head(pred)
dim(pred)
pred$fit <- predict(fit, newdata = pred)

xyplot(mathach ~ ses | id, hsm , groups = Sex,
       # skip = rep(c(F,T,F), c(21,3,30)),
       layout = c(7,6),               # breaks convention
       between = list(y =c(0,0,.3,0,0,0)),
       par.strip.text = list(cex=.6),
       auto.key = list(space = 'right'))  +
  xyplot(fit ~ ses | id, pred, type = 'l')

#
