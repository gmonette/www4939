#' 
#' # Relationship between Leverage and Mahalanobis Distance in Predictor Space
#' 
#' Given a data matrix $X$, the 'full' $n \times p$ data matrix including an intercept
#' has the form $[1 X]$ where $1$ is a $n \times 1$ column of $1$s.
#'
#' The vector of leverages in a regression in which the predictor variables are
#' given by $X$ plus an intercept term is the diagonal of the projection
#' matrix (often known as the 'hat matrix') onto the linear space spanned
#' by the unit vector and the columns of $X$, ${\cal L}(1,X)$.
#'
#' Under the assumption that $[1 X]$ is of full column rank:
#' $$
#' \begin{aligned}
#' H & = [1 X]\left([1 X]'[1 X]\right)^{-1}[1 X]' \\
#'   & =  [1 X]
#'   \begin{pmatrix}
#'   n & 1'X \\
#'   X'1 & X'X
#'   \end{pmatrix}
#'   ^{-1}[1 X]' \\
#' \end{aligned}
#' $$
#' As a projection matrix, $H$ is invariant under location scale transformations
#' of the data matrix $X$. Replacing $X$ with $X_c$ in which each column
#' is centered so that $X'_c 1 = 0$
#' $$
#' \begin{aligned}
#' H & = [1 X_c]\left([1 X_c]'[1 X_c]\right)^{-1}[1 X_c]' \\
#'   & =  [1 X_c]
#'   \begin{pmatrix}
#'   n & 0 \\
#'   0 & X'_cX_c
#'   \end{pmatrix}
#'   ^{-1}[1 X_c]' \\
#'   & = \frac{1}{n} 1 1' + X_c(X'_cX_c)^{-1}X'_c \\
#'   & = \frac{1}{n} 1 1' + \frac{1}{n} X_c\Sigma_X^{-1}X'_c \\
#' \end{aligned}
#' $$
#' The diagonal elements of $X_c\Sigma_X^{-1}X'_c$ are the squares of Mahalanobis
#' distances of individual observations
#' standardized by the maximum likelihood estimate of variance
#' using division by $n$.
#'
#' Thus, using the diagonal elements:
#'
#' $$
#' h_{ii} = \frac{1}{n} (1 + Z_i^2)
#' $$
#'
#' This is a result that is valid for linear multiple regression for any
#' number of predictor variables with an intercept term.
#' In simple regression, $p = 1$ and $Z_i$, with an appropriate sign,
#' is simply the the 'Z-score' for $i$th predictor observation.
#'
#' # Some consequences
#'
#' 1. It is easily shown that
#'    $\sum_i h_{ii} = 1 + p$:
#'    $$\begin{aligned}
#'    \sum_i h_{ii} & = \tr(H) \\
#'    & = \tr \left( [1 X]\left([1 X]'[1 X]\right)^{-1}[1 X]'\right) \\
#'    & = \tr  \left( \left([1 X]'[1 X]\right)^{-1}[1 X]' [1 X]\right)\quad \textrm{since} \tr(AB) = \tr(BA)\\
#'    & = \tr I_{(p+1) \times (p+1)} \\
#'    & = p+1
#'    \end{aligned}$$
#'    so that:
#'    $$\sum_{i=1}^n Z_i^2 = np$$
#'    and
#'    $$\overline{Z_i^2} = p$$
#'    which concords with expectation since $Z_i^2$ has a distribution that
#'    is approximately $\chi^2_p$.
#' 2. We also know that $\frac{1}{n} \le h_{ii} \le 1$ so that
#'    $$0 \le Z_i^2 \le n-1$$
#' 3. If $X$ is a $n \times p$ matrix of predictor variables in a least-squares
#'    regression, then $Z_i$ is the Mahalanobis distance of the $i$th case
#'    in __predictor__ space.
#' 4. The 'residual-leverage' plot, which is the fourth plot produced by the 'plot'
#'    command in R applied
#'    to 'lm' objects, plots $h_{ii} = \frac{1 + Z_i^2}{n}$ on the horizontal axis.
#' 5. Mahalanobis distance is the generalization of the univariate Z-score to
#'    all dimensions. Strictly speaking, in one dimension, Mahalanobis distance is
#'    the _absolute value_ of the Z-score.
#' 6. The ellipse in predictor space:
#'    $${\cal E}_r = \left\{ x \in \mathbb{R}^p : (x -\bar{x})'\hat{\Sigma}_X^{-1} (x -\bar{x}) = r^2 \right\}$$
#'    contains the points (if any) with leverage equal to $\frac{1}{n}(1 + r^2)$
#' 7. The concept works for _linear regression in $\beta$s_ even if not
#'    linear in the predictors.
#'     
#' To compute Mahalanobis distance, you can write your own function, or you
#' can consider the 'mahalanobis' function in base R.
#' 
#' For illustration, the following plot shows the predictor data ellipses
#' of radii 1, 2 and 3, corresponding to Mahalanobis distances of 1, 2, and 3,
#' and leverages of `r (1 +1^2)/20`,  `r (1 +2^2)/20`, and `r (1 + 3^2)/20` since $n=20$.
#'
#'
#+ echo=FALSE,warning=FALSE,message=F
library(car)
library(p3d)
library(spida2)
# dim(coffee)
fit.coffee <- lm(Heart ~ Coffee, data=coffee)
fit.both   <- lm(Heart ~ Coffee + Stress, data=coffee)
Init3d(cex=1.2)
Plot3d( Heart ~ Stress + Coffee, coffee,
        #	col="blue", 
        surface=FALSE, fit="linear", surface.col="lightblue", 
        grid.lines=10, sphere.size=0.6)

data.Ell3d(col="lightblue",alpha=.2)
Lines3d( y = 'min', zx = with( coffee, dell( Coffee, Stress)), lwd=1, color="red")
Lines3d( y = 'min', zx = with( coffee, dell( Coffee, Stress, radius = 2)), lwd=1, color="red")
Lines3d( y = 'min', zx = with( coffee, dell( Coffee, Stress, radius = 3)), lwd=1, color="red")
# Lines3d( x = 'min', zy = with( coffee, dell( Coffee, Heart)), lwd=2, color="blue")
# Fit3d(fit.coffee, col="blue", alpha = .2)
Fit3d(fit.both, col = 'red', alpha = .2)
spinto(-45,15)
rglwidget()
#' 
#' The next plot also shows the predictor data ellipses
#' of radii 1, 2 and 3, corresponding to Mahalanobis distances of 1, 2, and 3,
#' and leverages of `r (1 +1^2)/20`,  `r (1 +2^2)/20`, and `r (1 + 3^2)/20` since $n=20$
#' but in a quadratic regression.  Note that although the __predictors__ are not normally
#' distributed, the ellipse captures the first and second moments of the predictors, and
#' the least-squares linear regression only depends on the first and second moments.
#'
#+ echo=FALSE,warning=FALSE,message=F
set.seed(73899)
data.frame(x = seq(0,3.8,.2)) %>% 
  within(
    {
      x2 <- x^2
      y <- 1 + x + .2*x2 + .3 * rnorm(x)
    }
  ) -> dd
# dim(dd)
fit <- lm(y ~ x + x2, dd)
Init3d(cex=1.2)
Plot3d( y ~ x + x2, dd,
        #	col="blue", 
        surface=FALSE, fit="linear", surface.col="lightblue", 
        grid.lines=10, sphere.size=0.6)

data.Ell3d(col="lightblue",alpha=.2)
Lines3d( y = 'min', zx = with( dd, dell( x2, x)), lwd=1, color="red")
Lines3d( y = 'min', zx = with( dd, dell( x2, x, radius = 2)), lwd=1, color="red")
Lines3d( y = 'min', zx = with( dd, dell( x2, x, radius = 3)), lwd=1, color="red")
# Lines3d( x = 'min', zy = with( coffee, dell( Coffee, Heart)), lwd=2, color="blue")
# Fit3d(fit.coffee, col="blue", alpha = .2)
Fit3d(fit, col = 'red', alpha = .2)
spinto(-45,75)
rglwidget()
#+ eval=FALSE, echo=FALSE
# for playing with:
X[1:10,] %>% {mahalanobis(., colMeans(.), cov(.))} %>% sum
X <- t(matrix(rnorm(1000),4))
dim(X)
?mahalanobis
mh <- mahalanobis(X,colMeans(X), cov(X))
str(mh)
sum(mh)
cov
library(spida2)
cov(X[1:4,]) %>% svd

X[1:10,] %>% {mahalanobis(., colMeans(.), cov(.))} %>% sum
X[1:10,] %>% {mahalanobis(., colMeans(.), cov(.))} %>% sum
