#' ---
#' title: "Interpreting Contextual and Compositional Effects"
#' geometry: paperheight=5in,paperwidth=8in,margin=0.5in
#' author: ''
#' output: 
#' # bookdown::tufte_book2
#'   bookdown::tufte_handout2
#' # bookdown::pdf_document2
#' # header-includes:
#' #    - \usepackage{setspace}
#' #    - \usepackage{pdfpages}
#' #    - \usepackage{fancyhdr}
#' #    - \pagestyle{fancy} 
#' #    - \raggedright
#' #    - \usepackage{booktabs}
#' #    - \usepackage{multirow}
#' #    - \usepackage{setspace}
#' #    - \usepackage{subcaption}
#' #    - \usepackage{caption}
#' #    - \usepackage{tikz}
#' #    - \usepackage{float}
#' #    - \usepackage{setspace}
#' ---
#' <!--
#' \AddToShipoutPicture{%
#'   \AtTextCenter{%
#'     \makebox[0pt]{%
#'       \scalebox{6}{%
#'         \rotatebox[origin=c]{60}{%
#'           \color[gray]{.93}\normalfont CONFIDENTIAL}}}}}
#' \newcommand{\Var}{\mathrm{Var}}
#' \newcommand{\E}{\mathrm{E}}
#' -->
#+ include=FALSE
# https://bookdown.org/yihui/rmarkdown/tufte-figures.html
# fig.fullwidth = TRUE, with fig.width and fig.height, out.width
# https://www.statmethods.net/RiA/lattice.pdf
# 
#+ setup, include=FALSE 
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
#'
#' # Introduction
#' 
#' This is an example using only the public school data from the
#' 'hs' data set in 'spida2'.
#' 
#' We will see that:
#' 
#' > Including the contextual mean of 'ses' in each school in the model with
#' > `cvar(ses, id)` along with 'ses' itself allows you to estimate both the
#' > within-school and the between-school 'effects' of 'ses'.
#' 
#' Consider three fixed effects models along with a random intercept:
#' 
#' - `mathach ~ 1 + ses + cvar(ses, school)`
#' - `mathach ~ 1 + dvar(ses, school) + cvar(ses, school)`
#' - `mathach ~ 1 + ses`
#'
#' \clearpage
#' 
#' # Setup
#' 
#+ include=TRUE,echo=TRUE
library(spida2)
library(nlme)
library(car)
#' \clearpage
#' 
#' # 4 models
#' 
fit_contextual <- 
  hs %>% 
  subset(Sector == 'Public') %>% 
  lme(mathach ~ 1 + ses + cvar(ses, school), ., random = ~ 1 | school)

fit_compositional <- 
  hs %>% 
  subset(Sector == 'Public') %>% 
  lme(mathach ~ 1 + dvar(ses,school) + cvar(ses, school), ., random = ~ 1 | school)

fit_single_predictor <- 
  hs %>% 
  subset(Sector == 'Public') %>% 
  lme(mathach ~ ses, ., random = ~ 1 | school)

fit_pooled <- 
  hs %>% 
  subset(Sector == 'Public') %>% 
  lm(mathach ~ ses, .)

  
#' \clearpage
#' 
#' # Contextual model
#' 
summary(fit_contextual)$tTable
#' \clearpage
#' 
#' # Compositional model
#' 
summary(fit_compositional)$tTable
#' \clearpage
#' 
#' # Single predictor model
#' 
summary(fit_single_predictor)$tTable
#' \clearpage
#' 
#' # OLS pooled model
#' 
summary(fit_pooled) $ coefficients  # for lm fits
#' \clearpage
#' 
#' # Comparison of coefficients
#' 
compareCoefs(fit_contextual, fit_compositional, fit_single_predictor, fit_pooled)
#' \clearpage
#'
#' # Estimating compositional effect from the contextual model and vice-versa 
#'
wald(fit_contextual, 
     rbind(
       "within effect"        = c(0,1, 0),
       "contextual effect"    = c(0,0, 1),
       "compositional effect" = c(0,1, 1)))

wald(fit_compositional,
     rbind(
       "within effect"        = c(0,1, 0),
       "contextual effect"    = c(0,-1,1),
       "compositional effect" = c(0,0, 1)))
#'
#' \clearpage
#' 
#' # Practical Implications for Statistical Analyses
#'
#' Notes:
#' 
#' - Thinking about _between effects_ by using the contextual variable `cvar(X, cluster)` is only meaningful 
#'   if the cluster means
#'   of X vary systematically between groups. With a __balanced variable__ where the the values
#'   of X are the same in each group, there is no _between effect_ to estimate
#'   since you can't estimate the 'effect' of a constant (unless you can
#'   justify dropping the intercept term). So don't bother with 'cvar' for a
#'   balanced variable.
#' - Introducing `cvar(X, cluster)` has two main purposes:
#'   1. to be able to estimate the between-cluster relationship, and
#'   2. to be able to estimate the within-cluster relationship in a way that
#'      is unbiased by the between-cluster relationship.
#' - For model parsimony you might want to consider dropping the 
#'   contextual variable. You can drop the _contextual variable_ if
#'   if the true _contextual effect_ is zero. You can test this hypothesis
#'   with the coefficient of `cvar(X, cluster)` in the model  
#'   `Y ~ X + cvar(X, cluster)`    
#'   Note that this is __NOT__ the same as
#'   testing the coefficient of `cvar(X, cluster)` in the model  
#'   `Y ~ dvar(X, cluster) + cvar(X, cluster)`
#' - Some analysts will first fit:  
#'   `Y ~ X + cvar(X, cluster)`  
#'   then consider whether the coefficient of   
#'   `cvar(X, cluster)` is small
#'   enough to warrant dropping it.  
#'   If they don't drop it, they would switch to the equivalent model  
#'   `Y ~ dvar(X, cluster) + cvar(X, cluster)`  
#'   which, usually, has better numerical properties due to lower collinearity.
#' - Often, a motivation to get an unbiased estimate of the within-effect is
#'   that it estimates the 'effect of X' controlling for potential confounders,
#'   measured or not, known or not, that are constant within level-1 units.
#'   Thus, including a contextual mean may provide an unbiased estimate of the 
#'   within-cluster causal effect of X.  
#' 
