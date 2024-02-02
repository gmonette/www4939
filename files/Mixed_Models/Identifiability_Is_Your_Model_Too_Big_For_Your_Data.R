#' ---
#' title: "Identifiability of the Random Effects Model"
#' subtitle: "Is Your Model Too Big for Your Data?"
#' ---
#- include=FALSE
knitr::opts_chunk$set(comment = "   ", error = TRUE)
#-
library(nlme)
library(spida2)
#' 
#' 
set.seed(123)
dd <- expand.grid(id = 1:10000, time = c(-1,1))
# 
# setting parameters
# 
gamma = c(1,2)
G <- cbind(c(2,.5),c(.5,1)) # check: is this a variance matrix?
sigma <- 0.1
# 
# Note:
# 
Z <- cbind(1, c(-1,1))
Z
V <- Z %*% G %*% t(Z) + sigma^2 * diag(2)
V
# 
# To generate Us we need a function to factor G 
# but you could use the package 'mvtnorm' to generate
# multivariate normal observations. 
# 
rightfactor <- function(G) {
  # Warning: this only works correctly if G is non-negative definite
  fac <- svd(G, nu = 0) # G = UDV' with D nnd diagonal and V orthogonal
  sqrt(fac$d) * t(fac$v)
}
#
# Check:
#
crossprod(rightfactor(G)) 
# 
# Generating u's and epsilons
# 
K <- length(unique(dd$id))
Us <- matrix(rnorm(K*2), K, 2) %*% rightfactor(G)
Eps <- sigma * rnorm(K*2)
# 
# Out of curiosity:
# 
var(Us)
var(Eps)
#
# Finishing our data frame:
#
dd <- within(
  dd,
  {
    y <- cbind(1, time) %*% gamma + 
      rowSums(cbind(1, time) * Us[id,]) +  # check that this works
      Eps
  }
)
#
# Fitting a model:
#
fit <- lme(y ~ time, dd, random = ~ 1 + time | id)
summary(fit)
intervals(fit)
#
# Compare these confidence intervals with the true values
#
sqrt(diag(G))
cov2cor(G)
sigma
#
# How close is V?
#
getV(fit)
V
getV(fit)[[1]] - V
#
# How close is R?
#
getR(fit)
getR(fit)[[1]] - sigma^2 * diag(2) 
#
# How close is G?
#
getG(fit)
unclass(getG(fit)) - G
#
# Moral:
# 
# You need to check the random part of the model for identifiability.
# 
# Exercise:
# 
# - Rerun the example using different random seeds. You will find a number
#   of different results with the same parameters and model:
#   - non-convergence
#   - convergence but intervals(fit) will give an error because the 
#     Hessian matrix is singular
#   - convergence to results that don't give correct estimates of G and R
# - Generate the example above but with 3 time points, -1, 0 and 1.
# - Try the following model on 
# 
# Here's another model that shouldn't work, but does:
fit <- lme(y ~ 1 + time, dd, random = ~ 1 | id, corr = corAR1(form = ~ 1|id))
# Note
summary(fit)
# 
# Good exam question: analyze the model above for identifiability
# 
# Here's a model that works but doesn't capture the randomness in the
# generating process:
# 
fit <- lme(y ~ 1 + time, dd, random = ~ 1 | id)
summary(fit)
intervals(fit)
# 
# Note that V is constrained to be diagonal and isn't fitting the true V
# 
getV(fit)
#'
#' # A solution for 'shortitudinal' data
#'
#' If you have data that is measured at relatively integer valued time points
#' you can consider using 'gls' to generate identifiably a correct V matrix.
#' 
#' 'gls' only allows:
#' 
#' - correlation argument: 
#'   - e.g. `corr = corAR1(form = ~time | id)` where 'time' must be integer valued
#'   - `corr = corSymm(form = ~time |id)` to get the same correlation everywhere. 
#'     This produces almost the same V matrix as `lme ... random = ~ 1 |id`
#'   - 'time' should take on consecutive integers. Some clusters can miss
#'     some times but no time should be missing in all clusters.
#' - weights argument allowing heteroskedasticity
#'   - `weights = varIdent(form = ~ 1 | time)` will allow different variances
#'     at different times.
#'
#' Combining correlation and weights allows you to fit an identifiably
#' parametrized V matrix.   
#
head(dd)
tab(dd, ~ time)
dd$occ <- as.integer(1 + with(dd, (time +1)/2))
tab(dd, ~ occ)
fit_gls <- gls(y ~ 1 + time, dd, 
           weights = varIdent(form = ~ 1 | occ),
           correlation = corSymm(form = ~ occ | id))
summary(fit_gls)
getV(fit_gls)
getR(fit_gls)
getG(fit_gls)
#
#' Note: This approach allows you to fit an identifiably parametrized model
#' on repeated measures data with a full multivariate variance matrix. 
