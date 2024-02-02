#' ---
#' title: "Dealing with Heteroskedasticity"
#' subtitle: "R-side Variance Modeling" 
#' geometry: paperheight=4.25in,paperwidth=8in,margin=0.5in
#' author: ''
#' # bibliography: bib.bib
#' output: 
#'   bookdown::pdf_document2
#' ---   
#' \newcommand{\Var}{\mathrm{Var}}
#' \newcommand{\E}{\mathrm{E}}
#' \newcommand{\N}{\mathrm{N}}
#' \pagenumbering{arabic}
#+ include=FALSE
# https://bookdown.org/yihui/rmarkdown/tufte-figures.html
# fig.fullwidth = TRUE, with fig.width and fig.height, out.width
# https://www.statmethods.net/RiA/lattice.pdf
# 
#+ setup2, include=FALSE 
knitr::opts_chunk$set(
  fig.width=7, 
  fig.height=4, 
  fig.fullwidth=TRUE,
  #  echo=FALSE,
  #  include=FALSE,
  echo=TRUE,
  include=TRUE,
  comment = '  '
)
#- setup, include=FALSE 
knitr::opts_chunk$set(comment='     ')
#-
library(nlme)
library(spida2)
library(lattice)
library(latticeExtra)
library(latex2exp)
#'
#' # Generating a data set
#' 
#' Pay equity data set for a hypothetical university with two 
#' faculties: Medicine and Arts with a higher level and 
#' variance in Medicine vs Arts and a different gender gap
#' 
dd <- expand.grid(Faculty = c("Arts", "Med"), Sex = c("F","M"), n = 1:400)
set.seed(1233)
dd <- within(
  dd,
  {
    Age <- 45 + 5 * (Faculty == "Arts") + 5 * (Sex == "M") + 15 * rnorm(n)
    ..esal <- 100 + 20 * (Faculty == 'Med') +
      (4 + .3 *(Sex == "M") + .5 * (Faculty == "Med")) * (Age - 30)
    ..sdsal <- 10 + 10 * (Faculty == "Med") + .2 * (Age - 30)
    Base <- ..esal + ..sdsal * rnorm(n)
    keep <- Age > 28 & Age < 80
    ..sdsal <- NULL
    ..esal <- NULL
  }
)
tab(dd, ~ Faculty + Sex +keep)
dd <- subset(dd, keep)
save(dd, file = 'salary.rda')
#'
#' # Analysis
#'
load('salary.rda', verbose = TRUE)
xqplot(dd)
xyplot(Base ~ Age | Faculty, dd, groups = Sex,
       auto.key = T)

fit <- lm(Base ~ Age * Faculty * Sex, dd)
summary(fit)
for(i in c(1,2,3,5)) {
   plot(fit, which = i, add.smooth=T, mfcol = c(1,1))
}
plot(fit, 1)
plot(fit, 2)
plot(fit, 3)
plot(fit, 5)
xyplot(resid(fit) ~ fitted(fit)|Faculty * Sex, dd) %>% 
  useOuterStrips
#'
#' Functions in nlme to deal with heteroskedasticity:
#' 
#' Overview:
?varClasses
#' 
#' - varExp: exponential of a covariate or yhat
#' - varPower: power of a covariate or yhat
#' - varConstPower: constant + power of a covariate or yhat
#' - varConstProp: constant + proportion of a covariate or yhat
#' - varIdent: different variance in different subgroups
#' - varFixed: fixed weights given by a covariate
#' - varComb: combination of variance functions
#' - You can also build your own but count on spending a days
#'   figuring out how to do it
#' 
#' 
fit <- gls(Base ~ Age * Faculty * Sex, dd)  # re fit with gls model
#'
pred <- with(dd, pred.grid(Faculty, Sex, Age = seq(30,75,1)))
ww <- as.data.frame(wald(fit, pred = pred))
head(ww)
xyplot(coef ~ Age | Faculty, ww, groups = Sex,
       type = 'l', auto.key = list(space='right'))
xyplot(coef ~ Age | Faculty, ww, groups = Sex,
       type = 'l', auto.key = list(space='right'),
       fit = ww$coef,
       lower = ww$L2,
       upper = ww$U2,
       subscripts = TRUE) +
  glayer(panel.band(...))
#'
#' Analyzing the Gap
#'  
Lmale <- subset(ww, Sex == 'M')$L
Lfemale <- subset(ww, Sex == 'F')$L
Lgap <- Lmale - Lfemale
wgap <- wald(fit, 
             Lgap, 
             data = subset(ww, Sex == 'F', select = c(Faculty,Age)))
wgap
wgap <- as.data.frame(wgap)     
head(wgap)
xyplot(coef ~ Age | Faculty, wgap, 
       type = 'l', auto.key = list(space='right'))
xyplot(coef ~ Age | Faculty, wgap, 
       type = 'l', auto.key = list(space='right'),
       ylab = 'Wage gap (male - female)',
       fit = wgap$coef,
       lower = wgap$L2,
       upper = wgap$U2,
       subscripts = TRUE) +
  layer(panel.band(...)) +
  layer(panel.grid(h=-1,v=-1)) +
  layer(panel.abline(h=0)) 
#' 
#' # Models with heterosckedasticity
#' 
fitconpower <- gls(Base ~ Age * Faculty * Sex, dd,
                   weights = varConstPower(form = ~fitted(.)|Faculty))
summary(fitconpower)
fitpower <- update(fit, weights = varPower(form = ~fitted(.)|Faculty))
fitgroups <- update(fit, weights = varIdent(form = ~ 1 | Faculty))
anova(fit , fitgroups, fitpower, fitconpower)
library(car)
compareCoefs(fit, fitgroups, fitpower, fitconpower)
#'
#' # Revisiting the gap
#'
wgap2 <- wald(fitconpower, 
             Lgap, 
             data = subset(ww, Sex == 'F', select = c(Faculty,Age)))
wgap2
wgap2 <- as.data.frame(wgap2)     
head(wgap2)
xyplot(coef ~ Age | Faculty, wgap2, 
       type = 'l', auto.key = list(space='right'))
xyplot(coef ~ Age | Faculty, wgap2, 
       type = 'l', auto.key = list(space='right'),
       ylab = 'Wage gap (male - female)',
       fit = wgap2$coef,
       lower = wgap2$L2,
       upper = wgap2$U2,
       subscripts = TRUE) +
  layer(panel.fit(..., alpha = .2)) +
  layer(panel.abline(h=0)) +
  layer(panel.grid(h=-1,v=-1)) -> plhet
plhet

xyplot(coef ~ Age | Faculty, wgap, 
       type = 'l', auto.key = list(space='right'),
       ylab = 'Wage gap (male - female)',
       fit = wgap$coef,
       lower = wgap$L2,
       upper = wgap$U2,
       subscripts = TRUE) +
  layer(panel.fit(..., col = 'pink',alpha=.5)) +
  layer(panel.abline(h=0)) +
  layer(panel.grid(h=-1,v=-1)) -> plnohet
plnohet

c(plhet, plnohet)
#'
#' __Question:__ Where are the bands wider and where are they narrower when incorporating
#' heteroskedasticity in the model? Do the patterns you see make sense? Note the blue bands
#' use heteroskedasticity and the pink ones don't.
#'
     