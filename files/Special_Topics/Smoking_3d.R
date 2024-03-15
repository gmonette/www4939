#' ---
#' title:      "How Harmful is Smoking?"
#' date:       "September 2023"
#' author:     "Georges Monette"
#' output:
#'   html_document:
#'     toc: true
#'     toc_float: false
#'     theme: readable
#'     fig.width: 12
#'     fig.height: 10
#' # bibliography: mm.bib
#' link-citations: yes
#' ---
#' (Updated: `r format(Sys.time(), '%B %d %Y %H:%M')`)
#' 
#+ include=FALSE
library(knitr)
opts_chunk$set(comment="  ", error = TRUE)
if(.Platform$OS.type == 'windows') windowsFonts(Arial=windowsFont("TT Arial")) 
interactive <- FALSE  # do not run interactive code
library(rgl)
setupKnitr(autoprint = TRUE)
# Using rglwidget:
# [User Interaction in WebGL (updated)](https://cran.r-project.org/web/packages/rgl/vignettes/WebGL.html)
#
#'
#' Get the lastest versions:
#'
# devtools::install_github('gmonette/p3d')
# devtools::install_github('gmonette/spida2')

library(p3d)  
library(spida2) 

data(Smoking2)
dd <- Smoking2
head(dd)
dim(dd)

dd$Cigarettes <- dd$Smoking/365.25
dd$Life <- dd$LE
dd$Health_Exp <- dd$HE

Init3d(cex=1)



Plot3d( Life ~ Cigarettes + Health_Exp | Continent, dd)
spinto()
Axes3d()
################
fg()
Id3d(pad = 1)

fit <- lm( Life ~ Cigarettes, dd)
summary(fit)
wald(fit)

# What does the regression look like?

Fit3d(fit, lwd = 3)
rglwidget()
#'
#'  But the relationship is not really linear

fitsq <- lm( Life ~ Cigarettes+I(Cigarettes^2), dd)
summary(fitsq)
Fit3d(fitsq, lwd = 3, col = 'red')
Pop3d(4)


# Id3d(pad=1)

fg()

# "Controlling" for Health $$

spinto(-90)

fit1 <- lm( Life ~ Cigarettes, dd)
summary(fit1)
Fit3d(fit1, alpha = .5)

fitlin <-  lm( Life ~ Cigarettes 
               + Health_Exp 
               ,dd)
Fit3d(fitlin, col = 'cyan')
#
# Controlled for Health?
# 
# - Have we unconfounded the effect of Smoking??
# - Hardly.
#
fith <- lm( Life ~ Cigarettes 
      + Health_Exp 
      + log( Health_Exp),dd)

summary(fith)
Fit3d(fith, col = 'red')

#'
#' Apparently: 
#'
#' There is less confounding as we improve
#' the model for the potential confounder, Health_Exp,
#' 
#' But we, presumably, are far from having
#' found a reasonable model to estimate
#' the causal effect of smoking: individually or
#' ecologically.
#'
#' EXERCISES: 
#' 
#' - See what happens when you control for other factors,
#'   e.g. Continent.
#' - Discussion: What does this illustrate about analyzing
#'   data to assess health risks associated with behavioural or environmental factors?
#'
#'
