#' ---
#' title:      "How Harmful is Smoking?"
#' date:       "January 2024"
#' author:     "Georges Monette"
#' output:
#'   html_document:
#'     toc: true
#'     toc_float: false
#'     theme: readable
#'     fig.width: 12
#'     fig.height: 10
#' bibliography: mm.bib
#' link-citations: yes
#' ---
#' (Updated: `r format(Sys.time(), '%B %d %Y %H:%M')`)
#' 
#+ include=FALSE
knitr::opts_chunk$set(comment="  ", error = TRUE)
if(.Platform$OS.type == 'windows') windowsFonts(Arial=windowsFont("TT Arial")) 
interactive <- FALSE  # do not run interactive code
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





Init3d(cex=2)
{
  Plot3d( Life ~ Cigarettes + Health_Exp | Continent, dd)
  spin(0,0,0)
  Axes3d()
}
################
fg()
Id3d(pad = 1)

Coffee
fit <- lm( Life ~ Cigarettes, dd)
summary(fit)
wald(fit)

# What does the regression look like?

Fit3d(fit, lwd = 5, col = 'blue')

fitlin2 <- lm(Life ~ Cigarettes + Health_Exp, dd)
Fit3d(fitlin2, lwd=5, col = 'red')

fitlin3 <- lm(Life ~ Health_Exp, dd)
Fit3d(fitlin3, lwd=5, col = 'green')

Pop3d()
# But the relationship is not really linear

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
# Controlled for Health $$ ?
# Have unconfounded the effect of Smoking??
# Hardly.
#
fithealth <- lm(Life ~ Health_Exp, dd)
Fit3d(fithealth, col = 'magenta')
fithealth2 <- lm(Life ~ Health_Exp + log(Health_Exp), dd)
Fit3d(fithealth2, col = 'red')
Pop3d(2)


fith <- lm( Life ~ Cigarettes + log(Cigarettes)
            + Health_Exp 
            + log( Health_Exp),dd)

Fit3d(fith)
Id3d()
fith <- lm( Life ~ Cigarettes 
            + Health_Exp 
            + log( Health_Exp),dd)

dd$us <- with(dd, 1*(Country == "United States"))
fith2 <- lm( Life ~ Cigarettes + log(Cigarettes)
            + Health_Exp + us 
            + log( Health_Exp),dd)

summary(fith2)
Fit3d(fith2, other.vars = list(us = 0), col = 'pink')


summary(fith)
Fit3d(fith, col = 'red')
#
# Apparently: 
#
# There is less confounding as we improve
# the model for the potential confounder, Health_Exp,
# but we, presumably, are far from having
# found a reasonable model to estimate
# the causal effect of smoking: individually or
# ecologically.
#
# EXERCISE: See what happens when you control for other factors,
# e.g. Continent
#
head(dd)
fitr <- lm(Life ~ Cigarettes + Continent, dd)
summary(fitr)
Pop3d(8)
Fit3d(fitr)
Fit3d(fit)
Pop3d()
