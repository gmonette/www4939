#' ---
#' title: "Lord's Paradox: A Simulation"
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
#' # Data
#'
set.seed(123)
dw <- expand.grid(n= 1:1000, cafeteria = c("Regular","Diet"))
                                           
dw <-
  within(
    dw,
    {
      latent_weight <- 120 + 50 * (cafeteria == 'Diet') + 30 * rnorm(nrow(dw))
      weight_1 <- latent_weight + 10 * rnorm(nrow(dw))
      weight_2 <- latent_weight + 10 * rnorm(nrow(dw))
      id <- paste0(cafeteria,':',n)
      latent_weight <- NULL
    }
  )
head(dw)
xyplot(weight_2 ~ weight_1, dw, groups = cafeteria, alpha = .5)

xyplot(weight_2 ~ weight_1, dw, groups = cafeteria, alpha = .5, pch = '.') +
  glayer(panel.dell(...)) +
  glayer(panel.lmline(...))

#' \clearpage
#'
#' # Using pretest as a covariate
#'
#
fit.lm <- lm(weight_2 ~ weight_1 + cafeteria, dw)  
summary(fit.lm)
#' \clearpage
#'
#' # Longitudinal analysis
#'
names(dw)    # check that names are ok for tolong
dl <- tolong(dw, sep = '_')
head(dl)

fit.lme <- lme(weight ~ time * cafeteria, dl, random = ~ 1 | id )
summary(fit.lme)
#' \clearpage
#'
#' # Using Gain Score: Difference in Difference analysis (DinD)
#'
dw$ gain <- with(dw, weight_2 - weight_1)
fit.gain <- lm(gain ~ cafeteria, dw)
summary(fit.gain)
#' \clearpage
#'
#' # Caution: Using Gain Score with Pretest
#' 
#' A model that fits better but gives the wrong answer
#'
fit.gain.pretest <- lm(gain ~ cafeteria + weight_1, dw)
summary(fit.gain.pretest)
#' 
#' If you just look for a model that fits well without understanding the
#' consequences, you would have definitely preferred this last one.
#' 
anova(fit.gain, fit.gain.pretest)
