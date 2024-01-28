#' ---
#' title: "Regression in R"
#' author: "Georges Monette"
#' date: "January 2024"
#' fontsize: 12pt
#' header-includes:
#' - \usepackage{amsmath}
#' - \usepackage{geometry}
#' - \geometry{papersize={6in,4in},left=.2in,right=.2in,top=.1in,bottom=.1in}
#' - \newcommand{\var}{\mathrm{Var}}
#' - \raggedright
#' output:
#'   bookdown::html_document2:
#'     highlight: tango
#'     toc: true
#'     toc_depth: 5
#'   prettydoc::html_pretty:
#'     theme: hpstr
#'     highlight: github
#'     toc: true
#'     toc_depth: 5
#'   pdf_document:
#'     toc: true
#'     number_sections: true
#'     toc_depth: 3
#'     highlight: tango
#' # bibliography: ../common/bib.bib
#' link-citations: yes
#' ---
#' <!--
#' TO DO:
#'
#' - add rglwidget
#' - add cv to choose models
#' - add effects plot
#' -
#' -->
#' <!-- Combined from Regression in R and Understanding output in Regression last in R_Notes/DEN -->
#+ install, include=FALSE
#+ install, include=FALSE, eval = FALSE
# To run this file with R Markdown by clicking on File|Knit Document in RStudio
# you may need to install some packages and download a data set:
if(FALSE){
  install.packages(c('devtools','car','Hmisc','latticeExtra',
                     'rgl','magrittr','vcd','RColorBrewer',
                     'knitr'))
  remotes::install_github('gmonette/spida2')
  remotes::install_github('gmonette/p3d')
}
#+ setup, include=FALSE
## read data and set up libraries
server <- 'blackwell.math.yorku.ca'
library(knitr)
opts_chunk$set(cache=FALSE,message=FALSE,comment="|  ")    # for information see http://yihui.name/knitr/options#chunk_options
library(spida2)
library(magrittr)
#'
#' # Understanding Regression
#'
#' To really understand regression, you need to be able to
#' approach a problem from many different angles. I can think of
#' at least 8 representations that complement each other. To
#' master regression you need to know how to go from one
#' representation to another and you need to know how to work
#' within the right representation to think about your problem
#' and to solve it.
#'
#' Here are eight ways of thinking about regression. Some are
#' very powerful for developing the mathematical theory of
#' regression, other are best suited to visualize the
#' interpretation of coefficients for a particular application.
#'
#' ## 1. Statistical: the matrix formulation of a model
#'
#' $$
#'   Y = X \beta + \epsilon,\: \epsilon \sim N(0,\sigma^2)
#' $$
#'   and all the theory that follows, e.g.
#' $$
#'   Var(\hat{\beta}) = \sigma^2 \left( X'X \right)^{-1}
#' $$
#' $$
#'   \hat{Y} = X(X'X)^{-1}X' Y = P_X Y
#' $$
#' where $P_X$ is the matrix of the orthogonal projection of
#' $\mathbb{R}^n$ onto $\textrm{span}(X)$.
#'
#' ## 2. Mathematical: the formula for the model
#'
#' $$
#' y_i = \beta_0 + \beta_1 x_i + \beta_2 x_i^2 + \beta_3 z_i +
#' \beta_4 x_i z_i + \epsilon_i
#' $$
#' $$
#' \frac{\partial E(y)}{\partial x} = \beta_1 + 2\,\beta_2 x + \beta_4 z
#' $$
#'
#' ## 3. Computing: commands and algorithms that fit the model
#'
#+ warn = FALSE
library(car)
fit <- lm(income ~  education * type, data = Prestige)
summary(fit)
#'
#' ## 4. Graphical: data space
#'
library(car)
library(lattice)
xyplot(income ~ education | type, Prestige,
       type = c('p','r','smooth'))
#'
#' ## 5. Graphical: beta space
#'
library(spida2)
library(latticeExtra)
layer <- latticeExtra::layer  # to avoid masking from tidyverse

fit <- lm(income ~  education + women, data = Prestige)
summary(fit)
plot(rbind(cell(fit),0),type= 'n',
  xlab = expression(beta[education]),
  ylab = expression(beta[women]))
lines(cell(fit,dfn=2), type = 'l', col = 'blue')
lines(cell(fit,dfn=1), type = 'l', col = 'red')
abline(h=0)
abline(v=0)
points(c(0,0), pch = 18)
#' **Figure:** Confidence ellipse for two parameters jointly.
#' The blue ellipse has 95% coverage in 2 dimensions and its
#' perpendicular shadows onto the vertical and horizontal axes
#' form Scheffe 95% confidence intervals for testing in a space
#' of dimension 2. The similar shadows of the red ellipse provide
#' ordinary 95% confidence intervals.
#'
#' ## 6. Graphical (different definition!): Path diagram of variables
#'
#' ![Figure: Hypothetical causal graph of relationships among variables](graph.PNG)
#'
#' ## 7. Geometric: Hilbert space representation of variables or 'variable space'
#'
#' ![Figure: Variable Space: Hilbert space representation of variables in which each point represents a variable](HilbertSpace.PNG)
#'
#' ## 8. Most important: Real world interpretation
#'
#' The most important representation is the interpretation of the
#' model in the real world. Real world factors, such as the
#' design, the nature of random assignment, the nature of random
#' selection are fundamental in determining the interpretation of
#' the model and on the strategy for model development, selection
#' and interpretation.
#'
#' This is where you determine the nature of the data:
#' __observational or experimental__, and the nature of the
#' questions: __predictive or causal__ or descriptive.
#'
#' # Review of the matrix formulation and the general linear hypothesis (GLH)
#'
#' $$ Y = X \beta + \varepsilon $$
#' where
#'
#' 1. $Y$ is a vector of length $n$ representing $n$ observations
#'    on a 'response' or 'dependent' variable,
#'
#' 2. $X$ is a $n \times p$ matrix representing $n$ observations
#'    on each of $p$ 'predictor' or 'independent' variables.  The
#'    first column frequently consists of 1's.
#'
#' 3. $\beta$ is a vector of $p$ parameters whose values are
#'    unknown and some aspect of which we wish to estimate. If the
#'    first column of $X$ consists of 1's it is customary to number
#'    the elements of $\beta$ starting from 0: $\beta = (\beta_0,
#'    \beta_1, ... , \beta_{p-1})'$.
#'
#' 4. $\varepsilon$ is a vector of length $n$ representing
#'    'errors' or 'residuals' that are not directly observed.
#'
#' If $X$ is of full column rank (i.e. $\mathrm{rank}(X) = p$)
#' and if we assume that $\varepsilon \sim N_n( 0, \sigma^2 I)$
#' where $I$ is the $n \times n$ identity matrix, and if $rank(X)
#' = p$, then the **UMVUE** (Uniformly minimum variance unbiased
#' estimator) of $\beta$ is
#' $$ \hat{\beta} = (X'X)^{-1}X'Y $$
#' with $E(\hat{\beta}) = \beta$ and $Var(\hat{\beta}) = \sigma^2
#' (X'X)^{-1}$
#'
#' ## Linear hypotheses
#'
#' We can estimate or test hypotheses concerning one or more
#' linear combinations of the $\beta$s by forming a $h \times p$
#' hypothesis matrix $L$ and estimating the function of
#' parameters:
#' $$
#' \eta = L \beta
#' $$
#'
#' ### Exercise:
#'
#' 1. Why would we want to estimate a number of linear hypotheses simultaneously?
#'    Are the individual estimates of parameters different is we estimate them
#'    simultaneously? What difference does it make?
#'
#' ### Example:
#'
#' For a model with three parameters: $\beta = (\beta_0, \beta_1,
#' \beta_2)'$ we can simultaneously estimate the sum and
#' difference of $\beta_1$ and $\beta_2$ as follows.
#'
#' Letting
#' $$
#' L = \left[ \begin{array}{ccc} 0 & 1 & 1 \\ 0 & 1 & -1 \end{array} \right]
#' $$
#' we get
#' $$
#' \begin{aligned}
#' \eta  = \left[\begin{array}{c} \eta_1 \\ \eta_ 2 \end{array} \right]
#' &= L \beta \\
#' &= \left[ \begin{array}{ccc} 0 & 1 & 1 \\ 0 & 1 & -1 \end{array}\right]
#'     \left[ \begin{array}{r} \beta_0 \\ \beta_1 \\ \beta_2 \end{array} \right] \\
#'  & = \left[ \begin{array}{c} \beta_1+\beta_2  \\ \beta_1 - \beta_2\end{array} \right]
#' \end{aligned}
#' $$
#'
#' ## Estimation and tests
#'
#' Letting
#' $$
#' \hat{\eta} = L \hat{\beta}
#' $$
#' we have
#' $$
#' E(\hat{\eta}) = E(L \hat{\beta})= L E(\hat{\beta})= L \beta
#' $$
#' and
#' $$
#' Var(\hat{\eta}) = \sigma^2 L (X'X)^{-1} L'
#' $$
#' If $L$ is of full row rank $h$ and $X$ is of full column rank
#' we can test the hypothesis
#' $$
#' H_0: \eta = L \beta = 0
#' $$
#' against the alternative that $\eta \neq 0$ (i.e. that
#' $\eta_i \neq 0$ for at least one $i$) by using the null
#' distribution:
#' $$
#' \begin{aligned}
#' \hat{\eta}' \left( \widehat{Var} (\hat{\eta}) \right)^{-1} \hat{\eta}
#' &=  \frac{\hat{\beta}'L' \left( L (X'X)^{-1} L' \right)^{-1} L \hat{\beta}}{s_e^2}\\
#' &\sim h \times F_{h,\nu}
#' \end{aligned}
#' $$
#' where $s_e$  is the 'residual standard error':
#' $$
#' s_e^2 = \frac{|| Y - X \hat{\beta} ||^2}{\nu}
#' $$
#' with $\nu = n - p$ the degrees of freedom for the estimate
#' $s_e^2$ of $\sigma^2$ and
#' $F_{h,\nu}$ is the $F$ distribution with $h$ and $\nu$ degrees
#' of freedom.
#'
#' ### Notes
#'
#' 1. If the rows of $L$ are not linearly independent then it
#'    isn't possible to invert $L(X'X)^{-1}L'$ but an equivalent
#'    hypothesis can be formed by replacing $L$ with a matrix
#'    whose rows form a basis of the row space of $L$.
#'
#' ### Exercises:
#'
#' 1. Two $L$ matrices with the same row space test equivalent
#'    simultaneous hypotheses (**Could you prove this?**).
#' 2. For example, the hypothesis above is equivalent to the
#'    hypothesis that $\beta_1 = \beta_2 = 0$. **Why?**
#'
#' # Interpreting Regression Coefficients: Smoking and Life Expectancy
#'
#' With complex models:
#'
#' 1. most regression coefficients in the standard output
#'    are of little interest and
#' 2. most interesting questions are not answered with the
#'    standard regression coefficients.
#'
#' Why do we pay attention to regression output? Because it may
#' make some sense for very simple additive models -- but even
#' then it is fraught with subtle traps most analysts do not
#' understand.
#'
#' We will illustrate these with the Smoking and Life Expectancy
#' example using country-level data in 2004.
#'
dall <- read.csv(paste0("http://",server,"/data/Smoking3.csv"), stringsAsFactors = TRUE)
#
# Note: R version 4 no longer converts character input to 'factors', so
# we need to request this explicitly
#
dd <- subset( dall, sex == 'BTSX') # subset of a data frame: BTSX means Both Sexes

# dd$region has a level with 0 observations
tab(dd, ~ region)
dd <- droplevels(dd)
tab(dd, ~ region)

dd$LifeExp <- dd$lifeexp.Birth # Life expectancy at birth
dd$LE <- dd$LifeExp
dd$smoke <- dd$consumption.cigPC # cigarette consumption
                                 # per adult per year
dd$HE <- dd$HealthExpPC.Tot.ppp  # health expenditures per capita
                                 # in US$ PPP
dd$hiv <- dd$hiv_prev15_49  # prevalence of HIV in
                            # population 15 to 49
dd$special <- ifelse(
        dd$country %in% c('Angola','Sierra Leone',
                          'Equatorial Guinea'),
        1,
        0)  # indicator variable for 3 outlying countries
head(dd)
#+ first_regression
fit.hiv2 <- lm( LifeExp ~
                  log(HE) * (smoke + I(smoke^2)) + hiv+special,
                dd,
                na.action = na.exclude)
summary(fit.hiv2)
#'
#' Do we need curvature in 'smoke'?
#'
wald(fit.hiv2)
wald(fit.hiv2, '2') # using '2' as a regular expression
#' How about interaction?
wald(fit.hiv2, ':')
#'
#' Create a prediction data frame over which to estimate fitted
#' values. We will look at countries with low hiv and exclude
#' outliers.
#'
pred <- expand.grid(
  HE = c(50,150,500, 1000, 1500, 5000),
  smoke = seq(10,2000,20),
  hiv = 0,
  special = 0)
#'
#' Finding $\hat{Y}$ over a grid of values:
#'
pred$yhat <- predict(fit.hiv2, newdata = pred)
gd(lwd = 2) # no groups
gd(lwd = c(2,2)) # groups
xyplot(yhat ~ smoke | factor(HE), pred, type = 'l',
       layout = c(6,1))
xyplot(yhat ~ smoke , groups = factor(HE), pred, type = 'l',
       auto.key=list(space='right'))
#'
#' It's a good idea to make the order in the legend match the
#' physical location in the graph, as much as feasible.
#'
xyplot(yhat ~ smoke , groups = factor(HE), pred, type = 'l',
       auto.key=list(space='right', lines = T, points = F,
                     reverse.rows = TRUE))
#'
#' Suppose we want to estimate the slope of these fitted curves:
#' i.e. the 'effect'of an additional cigarette as a function of
#' health expenditures and amount smoked.
#'
#' We start with the mathematical formula for the model:
#'
#' Letting $\eta = E(y|HE,Smoke,HIV,Special)$
#' $$
#' \begin{aligned}
#' \eta = &\beta_0
#' +\beta_1 \times ln(HE) \\
#' & +\beta_2 \times Smoke \\
#' & +\beta_3 \times Smoke^2 \\
#' & +\beta_4 \times HIV \\
#' & +\beta_5 \times Special \\
#' & +\beta_6 \times ln(HE) \,Smoke \\
#' & +\beta_7 \times ln(HE) \,Smoke^2
#' \end{aligned}
#' $$
#'
#' To understand the interpretation of the coefficients
#' $\beta_i$, we differentiate $\eta$ with respect to each of the
#' independent variables:
#'
#' $$
#' \begin{aligned}
#' \frac{\partial \eta}{\partial HE} & = \beta_1 \frac{1}{HE}+\beta_6 \frac{Smoke}{HE}
#' + \beta_7  \frac{Smoke^2}{HE} \\
#' \frac{\partial \eta}{\partial Smoke} & = \beta_2 + 2 \beta_3 Smoke +\beta_6 ln(HE)
#' + 2 \beta_7 Smoke\, ln(HE) \\
#' \frac{\partial \eta}{\partial HIV} & = \beta_4 \\
#' \frac{\partial \eta}{\partial Special} & = \beta_5 \\
#' \frac{\partial^2 \eta}{\partial HE^2} & = \beta_1 \frac{-1}{HE^2}+\beta_6 \frac{-Smoke}{HE^2}
#' + \beta_7  \frac{-Smoke^2}{HE^2} \\
#' \frac{\partial^2 \eta}{\partial Smoke^2} & =  2 \beta_3 \\
#' \frac{\partial^2 \eta}{\partial HE \, \partial Smoke} & = \beta_6 \frac{1}{HE}
#' + 2 \beta_7  \frac{Smoke}{HE} \\
#' \end{aligned}
#' $$
#'
#' Thus $\beta_2$ is the **partial derivative** of $\eta$ with
#' respect to $Smoke$ when $ln(HE) = Smoke = 0$.
#'
#' When $ln(HE) = 5$ and $Smoke = 4$, the partial derivative of
#' $\eta$ with respect to $Smoke$ is
#'
#' $$
#'   \frac{\partial \eta}{\partial Smoke} =
#'   \beta_2 + 8 \beta_3 +5 \beta_6
#'    + 40 \beta_7
#' $$
#' whose estimator is
#' $$
#'   \hat{\beta_2} + 8 \hat{\beta_3}  +5 \hat{\beta_6}
#' + 40 \hat{\beta_7}
#' $$
#' which we can express as a linear transformation of the
#' $\hat{\beta}$ vector.
#' Letting
#' $$
#' L = \left[ {\begin{array}{*{20}{c}}0&0&1&8&0&0&5&{40}
#' \end{array}} \right]
#' $$
#' we have:
#' \[\hat{\phi} = L \hat{\beta} =
#' \left[ {\begin{array}{*{20}{c}}0&0&1&8&0&0&5&{40}\end{array}}
#' \right]\widehat {\left[ {\begin{array}{*{20}{c}}{{\beta _0}}
#' \\{{\beta _1}}\\{{\beta _2}}\\{{\beta _3}}\\{{\beta _4}}
#' \\{{\beta _5}}\\{{\beta _6}}\\{{\beta _7}}\end{array}}
#' \right]}\]
#' If we wish to simultaneously estimate the 'effect' of Smoke
#' and the 'effect' of HE given values of HE and Smoke, we can
#' form the $L$ matrix:
#' $$
#' L = \left[ {\begin{array}{*{20}{c}}
#'           0 & 0 & 1 & 2\, Smoke & 0 & 0 & ln(HE) & 2\,
#'               Smoke \, ln(HE) \\
#'           0 & 1 & 0 & 0       & 0 & 0 &
#'               \frac{Smoke}{HE} &\frac{Smoke^2}{HE}
#'           \end{array}} \right]
#' $$
#' and
#' $$
#' \hat{\phi} = L \hat{\beta}
#' $$
#' In this case $\hat{\phi}$ is a column vector of length 2.
#'
#' In both cases, inference about $\phi$ uses the fact that
#' $$
#' Var(\hat{\phi}) = L Var(\hat{\beta}) L'
#' $$
#' and
#' $$
#' Var(\hat{\beta}) = \sigma^2 (X'X)^{-1}
#' $$
#' With a normal linear model in which
#' $$
#' Y = X \beta + \epsilon, \:\epsilon \sim N(0,\sigma^2 \,I)
#' $$
#' we have that
#' $$
#' \left( {\hat{\phi} - \phi} \right)'\left( {s^2 L(X'X)^{-1} L'} \right)^{-1}
#' \left( {\hat{\phi} - \phi} \right)    \sim h \times F_{h,\nu}
#' $$
#' where $h$ is the number of rows of $L$
#' (assuming that $L$ is of full row rank) and $\nu = n - p$
#' where $n$ and $p$ are the number of rows and columns of $X$
#' respectively, again assuming that $X$ is of full  column rank.
#'
#' We can compute these quantities in R from a fitted model. Note
#' how the 'evalq' function evaluates an expression at the values
#' given in the list provided as the 'envir' argument.
#+
L <- evalq( rbind(
c( 0,0,1, 2*smoke, 0 ,0 , log(HE), 2*smoke*log(HE)),
c( 0,1,0, 0      , 0,       0, smoke / HE, smoke^2/HE)),
    envir = list( smoke = 4, HE = exp(5)))
L
#+
#' $\hat{\beta}$:
#+
coef(fit.hiv2)
#+
#' $\hat{\phi} = L \hat{\beta}$:
#+
(phihat <- L %*% coef(fit.hiv2))
#+
#' $s^2 (X'X)^{-1}$:
#+
vcov(fit.hiv2)
#+
#' $\hat{Var}(\hat{\phi}) = L (s^2 (X'X)^{-1}) L'$:
#+
(Vphihat <- L %*% vcov(fit.hiv2) %*% t(L))
#+
#'
#' To test the hypothesis that $\phi = 0$, we have
#'
#' $F = \hat{\phi}'\left({ \hat{Var}(\hat{\phi})}\right) ^{-1}
#' \hat{\phi}/h$
#+
(Ftest <- (t(phihat) %*% solve(Vphihat) %*% phihat)/2)
1-pf(Ftest,2, fit.hiv2$df.residual)
pf(Ftest,2, fit.hiv2$df.residual, lower.tail = FALSE)
#+
#' Note how rounding error is reduced by using the 'lower.tail'
#' parameter.
#'
#' ## Functions to test linear hypotheses
#'
#' The functions 'lht' in the 'car' package and 'wald' in the
#' 'spida2' package can be used to test General Linear
#' Hypotheses.
#'
#'+
require(car)
lht(fit.hiv2,L)
wald(fit.hiv2, L)
#'
#' The 'lht' function can take a right-hand side to test
#' hypotheses of the form $H_0: \phi = \phi_0$. 'wald' can only
#' test $H_0 : \phi = 0$. The 'wald' function can handle $L$
#' matrices whose rows are not linearly independent. For example,
#' in some uses of 'wald', the 'L' matrix is the whole design
#' matrix.
#'
#' The second argument of the 'wald' matrix can be a regular
#' expression that is matched against the names of terms in the
#' model.  All terms matched by the regular expression are
#' simultaneously tested.  Thus one can test the 'overall'
#' significance of an independent variable by testing whether all
#' terms containing that variable are equal to 0. One can also
#' use this approach to test higher-order interactions.
#'
wald(fit.hiv2, "smoke")   # is there statistical evidence
                          # that 'smoke' improves prediction?
wald(fit.hiv2, "HE")      # ditto for HE
wald(fit.hiv2, ":")       # ditto for interactions?
wald(fit.hiv2, "2)" )     # ditto for quadratic terms?
#+
#'
#' ## Strategies to simplify models
#'
#' There are many strategies for potentially simplifying large
#' models. The resulting model will depend on the strategy.
#'
#' One is to attack higher-order interactions and simplify the
#' model by dropping groups of interactions that are not
#' significant but, initially, leaving main effects and
#' lower-order interactions.  In many situations there are
#' obvious moderator variables whose interactions should not be
#' dropped as aggressively as those of other variables for which
#' oversimplification to an additive model may be more innocuous.
#' Remember the consequences of dropping an interaction. Main
#' effects become weighted averages of conditional effects,
#' weighted by inverse variance.
#'
#' Another approach is to drop all terms for selected independent
#' variables if they are not sufficiently significant in an
#' overall test.
#'
#' The two approaches can be combined depending on the role of
#' variables and the goals of the analysis.
#'
#' The choice of approach should be guided by many factors: which
#' null hypotheses are likely to be reasonable, the interpretive
#' value of having a simple additive model versus the added
#' validity of estimating conditional effects that are not
#' averaged over levels of variables that may be important, etc.
#' There's a good discussion of these problems in
#' @snijder2012multilevel.
#'
#' ## Estimating effects over a grid
#'
#' In a model with interactions and non-linear functions of some
#' independent variables, it is often interesting to characterize
#' how effects (partial derivatives) and inferences about effects
#' vary over a range of predictors.
#'
#' The 'effects' package (@fox2009effect) allows easy
#' visualization of predicted values as a variables changes
#' keeping other variables constant. For other variables that
#' interact with the variable whose effect is visualized, the
#' interacting variables are kept constant at a number of
#' selected values. The package is very effective for the easy
#' visualization of moderately complex models with interactions.
#'
#' The same can be achieved but much more laboriously with the
#' 'Lfx' function in the 'spida2' package (@monette2018spida2).
#' With the 'Lfx' function it is possible to estimate derivatives
#' of all orders and features of general parametric splines with
#' the 'gsp' function.
#'
#' The 'Lfx' function generates an expression which can then be
#' edited to generate large $L$ matrices. The result of the wald
#' test applied to this $L$ matrix can be transformed into a data
#' frame for plotting with error bands.
#'
#' The following illustrates the use of the 'Lfx' function.
#+
Lfx(fit.hiv2)
#+
#' The expression generated by 'Lfx' can be edited to generate
#' desired effects. The result is then fed back to 'Lfx' along
#' with a data frame on which to evaluate the edited expression.
#' Note that the 'M' functions preserved the shape of multi-term
#' blocks in the design matrix so that multiplying them by 0 is a
#' way of generating a block of 0s of the right dimension. In the
#' following, we edit the expression to estimate the effect of
#' smoking by differentiating with respect to 'smoke':
#+
pred <- expand.grid(
  HE = c(50,150,500, 1000, 1500, 5000),
  smoke = seq(10,2000,20),
  hiv = 0,
  special = 0)
head(pred)  # first 6 lines of 'pred'
#'
#' Predicted values as a function of HE and smoke
#'
#' Use the list created above and edit it by differentiating each
#' term with respect to 'smoke' to get the marginal 'effect' of
#' an extra unit of 'smoke':
#'
Lfx(fit.hiv2)
#'
#' Differentiated:
#'
L <- Lfx(fit.hiv2,
     list( 0,
           0 * M(log(HE)),
           1 ,
           1 * M(I(2*smoke)),
           0 * hiv,
           0 * special,
           1 * M(log(HE)) * 1,
           1 * M(log(HE)) * M(I(2*smoke))
     ), pred)
dim(L)
head(L)
ww <- wald(fit.hiv2, L)
ww <- as.data.frame(ww)
head(ww)
#'
#' More informative labels:
#'
ww$HEfac <- factor(ww$HE)
levels(ww$HEfac) <- paste("Health Exp/Cap:",levels(ww$HEfac))
#'
#' Doing this preserved the order of factor levels
#'
tab(ww, ~ HEfac + HE)
#'
#' Levels are in numerical order when creating a factor from a
#' numeric object! This was not always so! We are taking the
#' derivative with respect to 'smoke' of these functions:
#'
xyplot( coef ~ smoke, ww, groups = HE,
        auto.key = list(columns = 3, lines = T,
                        points = F),type = 'l')
xyplot( coef ~ smoke | HE, ww, type = 'l')
xyplot( coef ~ smoke | HEfac, ww, type = 'l')
#' **Figure 1:** Change in Life Expectancy associated with an
#' increase in cigarette consumption of 1 cigarette per day per
#' capita for different levels of health expenditures per capita
#' per year (US$).
#'
#' With labels that are more informative:
#'
#+ echo=FALSE,fig.align='left'
library(latticeExtra)
gd(lwd=2)
xyplot(
  I(365*coef) ~ I(smoke/365), ww, groups = HE, type = 'l',
  xlim = c(0,5.5),
  ylab =
    "Change in predicted LE per additional cigarette per day",
  xlab = "cigarettes per capita per day",
  auto.key = list(
    lines = T, points = F, space = 'right',
    title = "Health Exp. / Cap.",cex.title = 1))
#'
#' Confidence bands:
#'
xyplot( I(365*coef)  ~ I(smoke/365) | HEfac,
       data = ww, type = 'n',
       xlim = c(0,5.5),
       ylab = "Change in predicted LE per additional cigarette",
       xlab = "cigarettes per capita per day",
       fit = 365*(ww$coef),
       lower = 365*(ww$coef - ww$se),
       upper = 365*(ww$coef + ww$se),
       subscripts = T,
       as.table = T) +
  layer(panel.fit(...,alpha = .3)) +
  layer( panel.abline( h = 0, lwd = 1))
#'
#' Transforming to 'meaningful' coefficients: cigarettes per day
#'
## Double checking our previous calculation:
ptest <- expand.grid(smoke = 4, HE = exp(5), hiv = 0, special = 0)

(L2 <- Lfx( fit.hiv2,
      list( 0,
            0 * M(log(HE)),
            1 ,
            1 * M(I(2*smoke)),
            0 * hiv,
            0 * special,
            1 * M(log(HE)) * 1,
            1 * M(log(HE)) * M(I(2*smoke))
      ), ptest))
wald(fit.hiv2, list("At smoke = 4, HE = 148.4"=L2))

#'
#' ### Exercises
#'
#' 1. Carry out a similar process to estimate the 'effect' of
#'    health expenditures per capita.
#' 2. Study the relative contribution of private versus public
#'    health expenditures on life expectancy.
#' 3. Explore the 'effects' package and compare its functionality
#'    with 'Lfx'
#'
#' ## Wald tests vs Likelihood Ratio Tests (LRT)
#'
#' Let's consider a test for the need for a quadratic term in
#' 'smoke'. There are two terms in the model that contain the
#' quadratic term and a test to remove it involves more than one
#' parameter.  We need a test of
#' $$
#' H_0: \beta_3 = \beta_7 = 0
#' $$
#' We cannot simply test each hypothesis $H_0: \beta_3  = 0$ and
#' $H_0: \beta_7 = 0$ separately. We will see many examples where
#' individual hypotheses are not significant, yet a joint
#' hypothesis is highly significant. This is not a example of
#' this phenomenon since the p-value for each hypothesis is
#' small. Nevertheless, a test of a joint hypothesis needs to be
#' carried out correctly.  We consider two ways: a Wald test and
#' a Likelihood Ratio Test executed with the 'anova' function, a
#' clear misnomer.
#'
#' __Wald test using indices of coefficients__
#'
wald(fit.hiv2, c(4,8))
wald(fit.hiv2, list("Quadratic in smoke" =c(4,8)))
#'
#' __Wald test using regular expression__
#'
wald(fit.hiv2, "2")
#'
#' __Likelihood ratio test__
#'
#' We need to fit the 'null' model
#'
fit0 <- update(fit.hiv2, .~ log(HE)*smoke + hiv + special)
summary(fit0)
#'
#' Then compare the null model with the 'full' model:
#'
#' By default, 'anova' uses an F distribution for the LRT
#' taking advantage of the linear Gaussian model.
#'
anova(fit0, fit.hiv2)
#'
#' Using the general asymptotic distribution, chi-square, for the
#' LRT gives a slightly different but very close result:
#'
anova(fit0, fit.hiv2, test="LRT")
#+
#'
#' The Wald test and the LRT using the F statistics give
#' identical results. This is the luxury of working with a
#' Gaussian homoskedastic independent linear model.
#'
#' ### Exercises
#'
#' 1. Explore the pros and cons of Wald tests versus Likelihood
#'    Ratio Tests. Construct an example where they give entirely
#'    different results.
#'
#' ## Interpreting sequential tests
#'
#' __Type 1: sequential tests__
#'
anova(fit.hiv2)  # sequential - Type 1 tests
#'
#' __Type 2: Each term added last except for higher-order interactions__
#'
require(car)
Anova(fit.hiv2)  # Type 2 is default
#'
#' __Type 3: Each term added last__
#'
#' Note that 'Type 1' and 'Type 2' sums of squares are
#' interpreted consistently (as far as I've seen) in different
#' packages. 'Type 3', however, has quite different
#' interpretations. Each variable, or group of variables in the
#' case of a factor with 3 or more levels, is added last but
#' different packages set the other variables at different
#' values. Some set them at their 0 values and others set them at
#' their mean values. What does car::Anova do?
#'
require(car)
Anova(fit.hiv2, type = 3)
#'
#' Type 3 is identical to regression output except that it uses
#' equivalent F tests and a single test for terms with multiple
#' degrees of freedom
#'
summary(fit.hiv2)
#'
#' ## Working with factors
#'
#' Controlling for WHO regions provides a non-trivial example of
#' the use of factors in regression.
#'
#' When you create a data frame in R, non-numeric variables are
#' automatically turned into **factors**.  Factors are both a
#' strength of R and a frequent source of annoyance and
#' confusion. See
#' [traps and pitfalls with factors](http://scs.math.yorku.ca/index.php/R/Traps_and_pitfalls#Factors).
#'
#' Let's create a small data frame to illustrate how factors
#' work:
#+
set.seed(147)
sdf <- data.frame( x = c(1:7,6:10),
             g = rep(c('a','b','c'),c(2,5,5)),
             stringsAsFactors = TRUE)
sdf
sdf$y <- with(sdf, x + c(1,0,2)[g]+.5* rnorm(12))
sdf
unclass(sdf$g)    # the innards of g
#'
#' g is actually a numeric variable consisting of indices into a
#' vector of 'levels'.
#'
sfit <- lm( y ~ x + g, sdf)
summary(sfit)
#+
#' Note:
#'
#' - There is no term called 'ga' although there are 3 levels:
#'   'a', 'b' and 'c'
#' - The 'missing' level, 'a', is called the **reference level**
#' - Each term shows a comparison with the reference level
#'
#' To work out what the coefficients for 'gb' and 'gc' mean, you
#' need to look at the X matrix:
#+
model.matrix(sfit, na.action = na.exclude)
model.matrix(~ x + g, sdf)
model.matrix(~ g, sdf)
#+
#' If you work through the model:
#' $$
#' E(y|x,g) = \beta_0 + \beta_x x + \beta_{gb} gb + \beta_{gc} gc
#' $$
#' where $gb = 1$ if $g=b$ and 0 otherwise, and $gc = 1$ if $g=c$
#' and 0 otherwise, you see that
#'
#' 1. $\beta_{gb}$ is the difference between the expected level
#'    for group 'b' versus the reference group 'a' keeping x
#'    constant and
#' 2. $\beta_{gc}$ is the same comparison for group 'c' compared
#'    with the reference group 'a'.
#+
#' Plotting fits within groups and panels using latticeExtra:
#'
#' See more elegant but perhaps less flexible approaches in
#' the 'car' and in the 'effects' package by John Fox
pred <- expand.grid( x = 0:13, g = levels( sdf$g))
#'
#' The values over which we want to see predicted lines
#' every combination of x and g
#'
pred  <- merge( sdf, pred, all = T) # merge with data
pred$y1 <- predict(sfit, newdata = pred) # the predicted value
pred <- sortdf(pred, ~ x) # order so lines won't be interrupted
require(latticeExtra)
require(spida2)
gd(cex=2, lty=1:3,  # this gives control over line styles,
                    # colour, etc.
   pch = 16:18,
   col = c('red','blue','magenta'),
   lwd =2)  # from spida2
xyplot( y ~ x , pred, groups = g ,
        auto.key = list(columns = 3,lines = T),
        y1 = pred$y1, subscripts = T,
        sub =
  "compare adjusted and unadjusted differences between groups") +
  glayer( panel.lines( x, y1[subscripts],...,type = 'l')) +
  layer( panel.abline( v = c(0,3), col = 'grey')) +
  glayer( panel.abline( h = mean(y,na.rm=T),...))
## an alternative ... but
xyplot( y ~ x, sdf, groups = g, type = c('p','r'))
#'
#' ### Exercises:
#'
#' 1. Draw by hand the values of estimated coefficients in the plot.
#' 2. How would you estimate the differences between horizontal lines?
#' 3. Does 'g' matter?
#'
#+
summary(sfit)  # p-values not significant
#'
#' __But__
#'
wald(sfit, "g")  # simultaneous test that both are 0: different answer!
#'
#' __Using the GLH (General Linear Hypothesis)__
#'
Lmu.6 <-list( "at x = 6" = rbind(
 'g = a' = c(1,6,0,0),
 'g = b' = c(1,6,1,0),
 'g = c' = c(1,6,0,1)))
Lmu.6
wald(sfit, Lmu.6)
Ldiff <- rbind(
 'b - a' = c(0,0,1,0),
 'c - a' = c(0,0,0,1),
 'c - b' = c(0,0,-1,1))
Ldiff
wald(sfit,Ldiff)
wald(sfit, 'g')
#+
#'
#' This illustrated the crucial point that separate tests of
#' $$
#' H_0: \beta_1 = 0
#' $$
#' and
#' $$
#' H_0: \beta_2 = 0
#' $$
#' can yield very different 'conclusions' that a test of the
#' joint hypothesis:
#' $$
#' H_0: \beta_1 = \beta_2 = 0
#' $$
#'
#' Later, we will see how the relationship between confidence
#' ellipses(oids) and tests makes this clear.
#'
#' ### Reparametrization to answer different questions
#'
sdf$g2 <- relevel(sdf$g, 'b')  # makes 'b' the reference level
fitr <- lm( y ~ x + g2, sdf)
summary(fitr)
fitr2 <- lm( y ~ x + g2 -1 , sdf)   # dropping the intercept
summary(fitr2)
fitr3 <- lm( y ~ I(x-6) + g2 -1 , sdf)   # recentering x
summary(fitr3)   # compare with earlier
wald(sfit, Lmu.6)
#+
#' ### Equivalent models
#'
#' What makes the last three models equivalent?
#+
summary(lm( model.matrix(fitr) ~ model.matrix(sfit)-1))
   # note the Resid. SE
#+
#' Each model matrix spans exactly the same linear space. Thus
#' their columns are just different bases for the same space and
#' the $\beta$s for one model are just a linear transformation of
#' the $\beta$s for the other model.
#'
#' ### Exercise:
#'
#' What do the coefficients estimate in each of the following
#' models?. Indicate how each coefficient is related to the first
#' graph shown below.
#'
#' __Factor alone: g - 1__
#'
summary( fit1 <- lm( y ~ g - 1, sdf))
    # an example where '=' would not work
model.matrix(fit1)
summary( fit2 <- lm( y ~ x + g - 1, sdf))
    # an example where '=' would not work
model.matrix(fit2)
#+
#' __Factor with interaction: g * x__
#'
#+
sfit2 <- lm( y ~ g * x, sdf)
summary(sfit2)
#+
#' From which you might conclude that 'nothing is significant'!
#'
#' This illustrates that it is often wrong *wrong* **wrong** to
#' form conclusions on the basis of scanning p-values in
#' regression output.
#'
#' __Factor nesting continuous variable: g / x - 1__
#'
#'
sfit3 <- lm( y ~ g / x - 1 , sdf)
summary(sfit3)
#'
#' __Plotting the fitted model:__
#+
pred$y2 <- predict( sfit2, newdata = pred)
xyplot( y ~ x, pred, groups = g, type = c('p','r'))
# or
xyplot( y ~ x, pred, groups = g,
  subscripts = T, y2 = pred$y2, y1 = pred$y1) +
glayer( panel.xyplot( x, y2[subscripts], ..., type = 'l'))
# or
xyplot( y ~ x, pred, groups = g,
  ylim = c(0,13), auto.key = T,
  subscripts = T, y2 = pred$y2, y1 = pred$y1) +
glayer( panel.xyplot( x, y2[subscripts], ..., type = 'l')) +
layer( panel.abline( v = c(0,6)))
#'
#' The model is:
#' $$
#' \begin{aligned}
#' E(y|x,g) = & \beta_0 + \beta_x x + \beta_{gb} gb +
#'    \beta_{gc} gc\\
#' & + \beta_{x:gb} x \times gb + \beta_{x:gc} x \times gc \\
#' \end{aligned}
#' $$
#' Taking partial derivatives, we see that $\beta_{gb}$ is the
#' difference between between group 'b' minus group 'a' when $x =
#' 0$. There might not be strong evidence of differences between
#' groups outside the range of the data.
#'
#' What would happen if we were to explore the difference between
#' group 'b' and group 'c' when $x = 6$:
#+
L.bc.6 <- rbind( 'c - b|x=6'=
             c(0,0,-1,1,-6,6))
wald( sfit2, L.bc.6)
#+
#' We could also do this by reparametrizing:
#+
sfit2.x6 <- lm( y ~ I(x-6) * relevel(g,'b'), sdf)
summary(sfit2.x6)
#+
#' Here are some other ways of exploring the model:
#+
wald(sfit2, ":")
wald(sfit2, "g")
wald(sfit2, "x")
#+
#' Using type 2 Anova gives you tests for 'g' and 'x' that assume
#' that higher-order interactions involving 'g' and 'x' are all
#' 0.  Note that the error term used is the error term for the
#' full model including interactions.  This can lead to
#' inconsistencies with tests based on a model in which
#' interactions has been dropped.
#+
Anova(sfit2)   # type 2 anova
Anova(sfit)    # here the gain in degrees of freedom
               # outweighs the increase in SSE
#+
#'
#' ## Using Lfx with factors
#'
#' The 'M' function associated with 'Lfx' can generate code to
#' test for differences between factor levels
#+
Lfx(sfit2)
#+
#' The idea is to use the 'Lfx' expression to difference and then
#' to apply to a data frame.
#+
dpred <- expand.grid(x = 0:12,
                     g = levels(sdf$g) ,
                     g0 = levels(sdf$g))
dim(dpred)
some(dpred)
#'
#' we don't need to compare g with g0 with the same levels
#' and we only need comparisons in one direction (perhaps not)
#'
dpred <- subset( dpred, g0 < g)
dim(dpred)
some(dpred)
Lfx(sfit2)
#'
#' 'difference' g - g0, just like differentiating wrt to g
#' except that 'M' function generates differences
#'
Lmat <- Lfx( sfit2,
         list( 0,
               0 * x,
               1 * M(g,g0),
               1 * x * M(g,g0)
       ), dpred)
Lmat
wald(sfit2, Lmat)
ww <- as.data.frame(wald(sfit2, Lmat))
head(ww)
ww$gap <- with(ww, paste( g, '-', g0))
xyplot( coef ~ x | gap, ww)
td( col = c('black', 'blue','blue'), lty = 1, lwd = 2)
xyplot( coef +I(coef+2*se) + I(coef-2*se) ~ x | gap,
        ww, type = 'l') +
layer_( panel.abline( h = 0))
#'
#'  or
#'
xyplot( coef +I(coef+2*se) + I(coef-2*se) ~ x | gap,
        ww, type = 'l',
        ylab = "Estimated difference plus or minus 2 SEs",
        xlim = c(0,12)) +
  layer_( panel.abline( h = 0))
#'
#'  or
#'
gd(col = 'blue')
xyplot( coef  ~ x | gap, ww, type = 'l',
        ylab = list("differences between response levels", cex = 1.3, font = 2),
        xlim = c(0,12),
        ylim = c(-20,20),
        upper = ww$coef + 2* ww$se,
        lower = ww$coef - 2* ww$se,
        subscripts = T) +
  layer(panel.fit(...)) +
  layer_( panel.abline( h = 0))
#'
#' Note that if the significant gap between 'c' and 'b' around
#' $x=6$ is a question inspired by the data and not a 'prior'
#' hypothesis, then some adjustment should be made for
#' **multiplicity**.
#'
#' ### Exercises
#'
#' 1. Explore how to modify the appearance of the 'strips', i.e.
#'    where it says 'c - b'
#' 2. Plot approximate '95% confidence bands' for each group with
#'    +/- 2 SEs
#' 3. Plot approximate '95% prediction bands' for each group.
#'
#' reset the random seed:
#'
set.seed(NULL)
#'
#'
#' ## Using WHO regions as predictors of Life Expectancy
#'
#+
fitr <- lm( LifeExp ~
              (smoke + I(smoke^2)) * region + hiv + special, dd)
summary(fitr)
wald(fitr,":")
wald(fitr,"2):")

#'
#'  Using data values for prediction instead of creating a
#'  separate prediction data frame: This can work with
#'  curvilinear models if the data is sufficiently dense.
#'

dd$yq <- predict( fitr, dd)
xyplot( LifeExp ~ smoke | region, dd)
# reorder for nice lines:
dd <- dd[order(dd$region,dd$smoke),]
xyplot( LifeExp ~ smoke | region,
        dd, subscripts = T, yq = dd$yq)  +
  layer( panel.xyplot( x, yq[subscripts],...,
                       type = 'b', col = 'red'))
#'
#' presents a problem because of missing hiv values.
#'
#' Try again keeping non-missing data together to avoid interrupting lines
#'
dd <- dd[order(is.na(dd$yq),dd$region,dd$smoke),]
xyplot( LifeExp ~ smoke | region,
        dd, subscripts = T, yq = dd$yq)  +
  layer( panel.xyplot( x, yq[subscripts],...,
                       type = 'b', col = 'red'))
#+
#'
#' Including Health Expenditure:
#'
#+
fitrhe <- lm(
  LifeExp ~
    (smoke + I(smoke^2)) * region * log(HE) + hiv + special,
  dd)
summary(fitrhe)
length(coef(fitrhe))
#'
#' Should have > 380 observations using Harrell's rules of thumb
#' for valid regression
#'
wald(fitrhe, ":")
wald(fitrhe, "2")
wald(fitrhe, "2|:.*:") # quadratic terms and 3 and
                       # higher way interaction
fitr2 <- lm( LifeExp ~
               (smoke + log(HE) + region)^2 + hiv + special, dd)
summary(fitr2)
wald(fitr2, ':')
wald(fitr2, 'HE):|:log')
fitr3 <- lm( LifeExp ~
               region* smoke + log(HE)+ hiv + special, dd)
summary(fitr3)
wald(fitr3, ":")
wald(fitr3, 'region')
wald(fitr3, 'HE')
Anova(fitr3)
anova(fitr3)
wald(fitr3, 'smoke')
library(p3d)
Plot3d(LifeExp ~  smoke + HE | region, dd)

Fit3d( fitr3, other.vars=list(hiv=0,special=0))
#
#  Id3d(par=2, labels = dd$country)
#
par3d(windowRect=c(10,10,700,700))
rglwidget()
# rgl.snapshot('regions.png')
#+
#' <!-- ![3d](regions.png)  -->
#'
#' ### Exercise
#'
#' 1. Explore this data further producing informative graphs.
#'
#' # Exploring Regression Using R
#'
#' The following is an example of exploring data using regression
#' in R. But it's very unrealistic.
#'
#' Real data analysis does not start with a neat rectangular data
#' set.
#'
#' Hadley Wickham: "Data analysis is the process by which data
#' becomes understanding, knowledge and insight"
#'
#' The process involves much more than running regressions:
#'
#' - subject matter understanding
#' - getting data
#' - tidying the data
#' - formulating research questions
#' - transforming data to variables for analysis
#' - exploratory visualization
#' - deciding on a starting model
#'   - not too big, not too small
#'   - includes key variables based on subject matter and questions
#' - modeling fitting
#' - model diagnostics
#' - refining the model: dropping some terms and adding others
#' - formulating parameter functions for estimation and testing
#' - interpreting results
#' - GO BACK and iterate a varying number of previous steps in various orders
#'
#'
#' ## Interactive 3D
#'
Init3d(cex=1)
ds <- dd
ds$Life <- ds$LE
ds$Cigarettes <- ds$smoke
ds$Health <- ds$HE
ds$area <-ds$region
ds$area <- tr(ds$region,
              c("AFR", "AMR", "EMR", "EUR", "SEAR", "WPR"),
              c("Africa","South Asia","Other")[c(1,3,3,3,2,3)])


Plot3d( Life ~ Cigarettes + Health |region,ds)
fg()
spinto()
Axes3d()
#  Id3d()
fit <- lm( Life ~ Cigarettes, ds)
summary(fit)
wald(fit)
Fit3d(fit, lwd = 3)
fitsq <- lm( Life ~ Cigarettes+I(Cigarettes^2), ds)
Fit3d(fitsq, lwd = 3, col = 'red')
spin(0,0,0)
#  Id3d(pad=1)
# Id3d("Canada")
# Id3d("United States")
par3d(windowRect=c(10,10,700,700))
rglwidget()  # rgl.snapshot('quadsmoke.png')
Pop3d(2)
#'
#' <!-- ![Fig-quadsmoke](quadsmoke.png) -->
#'
#' ### Controlling for Health
#'
spin(-90,0,0)

fitlin <- lm( Life ~ Cigarettes + Health, ds)
summary(fitlin)
fith <- lm( Life ~ Cigarettes + Health + log( Health),ds)
Fit3d(fitlin, col = 'pink')
Fit3d(fith, col = 'red')
Pop3d(2)
#'
#' ## A more interesting model?
#'
#' 1. Health Expenditures
#' 2. Proportion provided through government
#'
#'
ds$propGovt <- with(ds, govt/total) # proportion of health exp.
                                    # from Govt
Plot3d( Life ~ Health + propGovt |area, ds)
fg()
Axes3d()
spin(-10,15,0)
par3d(windowRect=c(10,10,700,700))
rglwidget()  # rgl.snapshot('health-pgovt.png')
#'
#' <!-- ![Fig-health-pgovt](health-pgovt.png)  -->
#'
#' Try something that looks sensible:
#'
#' The relationship between Life Expectance and Health
#' Expentitures per capita and the proportion of health
#' expenditures funelled through the government
#'
#'
ds$propGovt <- with(ds, govt/total)
                    # proportion of health exp. from Govt

fit <- lm( Life ~ (Health + log(Health) + propGovt)  * area , ds,
          na.action = na.exclude)
summary(fit)
Plot3d( Life ~ Health + propGovt | area, ds)
Fit3d( fit)
spin(13,15,10)
par3d(windowRect=c(10,10,700,700))
rglwidget()  # rgl.snapshot('health-pgovt-fit.png')
#'
#' <!-- ![hpfit](health-pgovt-fit.png) -->
#'
#' **Question:** Is this model too big for the data?
#'
#' **Should we drop Health expenditures?**
#'
#' None of the coefficients relating to Health are significant.
#'
#' Can we conclude that "Health" does not add to the predictive power of this
#' model?
#'
#' #### Type II SS
#'
#' Type II sums of squares are slightly less prone to massive
#' misinterpretation since each test %>% satistifies the POM.
#'
Anova(fit)  # Type II:
            # slightly less prone to massive misinterpretation
#'
#' ### Simultaneous tests of groups of coefficients:
#'
wald(fit, "Health")
#'
#' __Note:__
#'
#' In the above, note that the overall evidence is __VERY strong__ although
#' individual p-values not even significant
#'
#' I cannot sufficiently stress the importance of the principle this illustrates.
#'
#' 100% of beginning graduates students in statistics programs will fall into the trap of
#' mis-interpreting p-values in regression output. It's as bad a professional
#' error as a doctor amputating the wrong leg.
#'
#' ## Two valid tests:
#'
#' The Likelihood Ratio Test and the Wald test:
#'
#' Null model:
#'
fit0 <- lm( Life ~ propGovt  * area , ds,
            na.action = na.exclude)
#'
#'  __OR__ you can use 'update':
#'
fit0 <- update( fit, . ~ propGovt * area)
summary(fit0)
#'
#' __1) LRT:__
#'
anova( fit, fit0)
#'
#' __2) Wald test:__
#'
#' - Doesn't require fitting a new model -- works for linear parameters, not
#'   necessarily so good for non-linear parameters
#' - Tests the simultaneous hypotheses that ALL coefficients are = to 0 simultaneously
#'   -- which is equivalent to dropping Health entirely:
#'
wald(fit, "Health")
#'
#' Note that the F-values are identical -- which works in the case of OLS regression with normal error but
#' rarely otherwise.
#'
#' ## Explore interactions
#'
#' There many approaches to simplifying a model. The most
#' widespread is to trim down non-significant interactions.
#'
#' If you do this it is vital to never drop a group of terms
#' unless you either:
#'
#' 1. do it one term at a time making sure that you observe the
#'    principle of marginality ([see the Appendix for more on the
#'    principle of
#'    marginality](#notes-on-the-principle-of-marginality)) as
#'    you go along, or
#' 2. you only drop groups of terms when you have tested them
#'    **as a group**.
#'
#' We could refit and use LRTs or we can use Wald tests:
#'
wald(fit, ":")  # Use REGULAR EXPRESSION matching
                # to test whether there's any evidence of interaction
#'
#' Explore how regular expressions work:
#'
?regex
#'
#' Testing all interactions that involve 'Health'
wald(fit, "Health.*:")
#' Testing all interactions that involve 'Govt' (always to check
#' to make sure that you captured exactly the right terms)
wald(fit, "Govt:")
#'
#' ### Some comments on reading a model
#'
#' #### Table of coefficients and p-values:
#'
summary(fit)
#'
#' **Problems and limitations:**
#'
#' 1. Except for very simple models this is generally misleading
#'    and not meaningful
#' 2. Very few know how to interpret these correctly, even
#'    statisticians
#' 3. The p-value answers how much evidence is there that this
#'    term adds to the model when all other terms are already in the
#'    model.
#' 4. Only one degree of freedom per coefficient: never asks
#'    whether groups of terms are significant which is essential
#'    with categorical factors with 3 or more levels.
#' 5. Often it's meaningless to change one term keeping others
#'    constant, e.g. `x` if `x^2` is also in the model.
#' 6. Terms that are marginal to higher order interactions have a
#'    specific conditional interpretation that is generally just a
#'    very small and arbitrary part of the picture.
#' 7. The interpretation of tests does not respect the principle
#'    of marginality.
#'
#' #### Type I (sequential) Tests and Sums of Squares
#'
anova(fit)
# The results depend on the order of the terms.
anova(update(fit, . ~ area * (propGovt + log(Health) + Health)))
#'
#' **Notes:**
#'
#' 1. Each p-values asks whether there's evidence that each terms
#'    adds **to the previous terms** listed in the model.
#' 2. Interpretation of tests respects marginality since
#'    interactions are listed after their included main effects and
#'    sub-interactions.
#' 3. Factors with multiple degrees of freedom are tested
#'    jointly.
#'
#' #### Type II Tests and Sums of Squares
#'
Anova(fit)
#'
#' **Notes:**
#'
#' 1. Terms within a 'level' are each added last respecting
#'    marginality. e.g. each main effect is added last among main
#'    effects but not including higher-order interactions that
#'    contain the effect.
#' 2. Main effects are interpretable as test of significance
#'    under assumption that there are no interactions.
#'
#' #### Type III Tests and Sums of Squares
#'
#' 1. Popularized by SAS and SPSS
#' 2. No universal definition so can be misleading
#' 3. With interactions, main effects are averages over levels of
#'    interacting variables which can be misleading if groups sizes
#'    are unequal.
#' 4. Loved by many researchers, deprecated by most statisticians
#'    ... like pie charts.
#'
Anova(fit, type = 3)   # Type III Anova: Very popular but ....!
#'
#' #### Alternative -- or supplementary -- approaches
#'
#' Answer specific questions.
#'
#' e.g. None of the above are equivalent to Wald test for 'OVERALL SIGNIFICANCE':
#'
wald(fit, "Health")
wald(fit, "area")
wald(fit, "propGovt")
#'
#' ## Regression diagnostics -- quick
#'
#' #### Traditional
#'
plot(fit)
#' produces 4 plots
#'
#' 1) resid ~ fit
#' 2) normal quantiles of residuals  -- Why would this matter???
#'    GEQ. What can it mean if observed residuals are not normal?
#'    Clue: Why would you expect them to be normal anyways?
#' 3) scale-location for heteroscedasticity
#' 4) Residual vs leverage plot -- will see deeper meaning of
#'    this plot
#'
#' points with high Cook's distance might have strong influence
#' on fitted vals
#'
#' Note: added-variable plots = partial residual leverage plots
#'
avPlots(fit) # look at these as if they
             # were simple regression plots
avPlots(fit, id =list(n = 3))
avPlot(fit, 'propGovt', id =list(n = 10))
#'
#' Interactively, you can use:
#'
#' `avPlot(fit, 'propGovt', id.method = "identify")`
#'
#' ### Visualize fit for diagnostics
#'
#' In 3D
#'
Plot3d( Life ~ Health + propGovt | area, ds)
Fit3d( fit , resid = T)
#  Id3d()  # outliers?
#'
#'
#' 2D
#'
summary(ds)
#'
#' Create a prediction data frame with values for which you want
#' to predict model with observed values for Health and area but
#' controlling for propGovt
#'
#' #### 3 ways:
#'
#' 1. easiest: use data BUT need to control for propGovt
#' 2. Generate cartesian product of values of predictors: but
#'    hard to generate conditional ranges
#' 3. Create prediction data set with original data augmented by
#'    extra points
#'
#'
#' #### 1. add predicted values to data frame
#'
ds <- sortdf( ds, ~ Health)
pred1 <- rbind(ds,NA,ds,NA, ds,NA, ds,NA, ds, NA)
    # to set five values for predicted propGovt
pred1$propGovt <- rep(seq(.1,.9,by=.2), each = nrow(ds)+1)

pred1$Life.fit <- predict(fit, newdata = pred1)

#'
#' In 'panels':
#'
xyplot(Life ~ Health | area, ds)
gd() # ggplot2 look-alike

xyplot(Life ~ Health | area, ds)
xyplot(Life ~ Health | area, ds, layout = c(1,3))
xyplot(Life ~ Health | area, ds, layout = c(1,3)) +
  xyplot( Life.fit ~ Health | area, pred1, groups = propGovt,
          type = 'l')

gd(lwd = 2)
(p <- xyplot(Life.fit ~ Health | area,
             pred1, groups = propGovt,
             type = 'l',
             auto.key = list(space='right',
                             lines = T, points = F,
                             title = 'Prop. Govt',
                             cex.title = 1)))
#'
#' Some colour palettes you can choose from.
#' display.brewer.all()
#' Note that the first group consists of 'progressive' palettes,
#' the second group of categorical palettes (one is 'paired') and
#' the third group of 'bipolar' palettes. Note that yellow often
#' doesn't work for lines that blend into the background so you
#' might have to avoid palettes that include yellow for some
#' purposes.
gd(lwd = 2, col = brewer.pal(5,"Spectral"))
p  # replots with new parameters
gd(lwd = 2, col = brewer.pal(5,"Set1"))
p
gd(lty = 1)
p
p + xyplot(Life ~ Health | area, ds)
#'
#' Probably better with log(Health)
#'
(p <- xyplot(Life.fit ~ log(Health) | area,
             pred1, groups = propGovt,
             type = 'l',
             auto.key = list(space = 'right',lines = T,
                             points = F, title = 'Prop. Govt',
                             cex.title = 1)))

p + xyplot(Life ~ log(Health) | area, ds)
#'
#' BUT NEVER NEVER USE axes that are not meaningful
#'
#' Your work will be written off as incomprehensible!
#'
#' Also: use meaningful labels
#'
update(p,
       xlab = "Health expenditures per capita in $US (log scale)",
       ylab = "Life expectancy (both sexes)",
       layout = c(1,3),
       scales = list( x = list(
         at = log(c(30,100,300,1000,3000,8000)),
         labels = c(30,100,300,1000,3000,8000)))) +
  xyplot(Life ~ log(Health) | area, ds)

#'
#'
#'  Dropping some observations: BEWARE
#'
#'  Two ways:
#'
#'  1) Drop from data set and refit
#'  2) Add parameters for dummy variables for observations to
#'     drop and refit
#'
#' Suppose we want to drop "Equatorial Guinea"
#'
#' CAUTION: this needs good reflection BUT we often should
#' approach this like a sensitivity analysis: e.g. "would it make
#' a big difference if I dropped this point?"
#'

ds$EqG <- 1*(ds$country == "Equatorial Guinea")

fit2 <- lm( Life ~
              (Health + log(Health) + propGovt) * area + EqG, ds,
            na.action = na.exclude)
#'
#' __OR__
#'
fit2 <- update(fit, . ~ . + EqG)
summary(fit2)

Fit3d(fit2, other.vars = list( EqG = 0))
spin(-2,18,10)
par3d(windowRect=c(10,10,700,700))
rglwidget()  # rgl.snapshot('dropEqG.png')
#' <!-- ![dropEqG](dropEqG.png) -->
#'
#' **Figure X:** Note the change in the fitted surface for Africa
#' when Equatorial Guinea is dropped from the model.
#'
#' ## Asking questions:
#'
#' ### Can we simplify the model?
#'
#' Often this process focuses on the initial regression parameter
#' and asks which ones 'can we drop'? Often starting with highest
#' order interactions and working in.
#'
#' [**BEWARE THE PRINCIPLE OF MARGINALITY**](#notes-on-the-principle-of-marginality)
#'
#' **In general (i.e. 99.9% of the time)** DO NOT eliminate a
#' term without also eliminating all higher-order terms to which
#' the term is *marginal*.  e.g. 'Health' is marginal to
#' 'Health:area', and 'Health:area' would be marginal to
#' 'Health:propGovt:area'. Otherwise the resulting model loses
#' invariance with respect to changes of origins of interacting
#' variables.
#'
#' Here's a model that seems to tell a different story but it's
#' perfectly equivalent. The individual terms estimate different
#' aspects of the model, but the models as a whole are equivalent
#' and produce the same fitted values.
#'
fit2.eq <- lm( Life ~
                 area/(Health + log(Health) + propGovt)  + EqG -1,
               ds, na.action = na.exclude)
anova(fit2, fit2.eq)
AIC( fit2, fit2.eq)
summary(fit2)
summary(fit2.eq)

Anova(fit2)
Anova(fit2.eq)

wald(fit2, "th:|th):")
#'
#' **Question:** Under what conditions would two seemingly
#' different models produce exactly the same fit (i.e. predicted
#' values of Y)?
#'
#' ### Asking specific questions
#'
#' **What question does each coefficient answer and how can
#' we get answers to the questions we want?**
#'
#'  **PRINCIPLE**
#'
#'  Except with very simple models, raw regression output
#'  generally answers few meaningful questions AND most important
#'  questions are rarely answered by raw regression output
#'
#' **Interpreting $\beta$s:**
#'
#' Each term involving 'area' is a comparison with the
#' **REFERENCE LEVEL** when **ALL VARIABLES IN HIGHER ORDER
#' INTERACTING TERMS are set to 0**.
#'
#' Each term involving 'area' is a comparison with the
#' **REFERENCE LEVEL** (Africa because it's the level that isn't
#' showing) when **ALL VARIABLES IN HIGHER ORDER INTERACTING
#' TERMS are set to 0**.
#'
#' The model is:
#'
#' $$
#' \begin{aligned}
#' Y &= \beta_0 + \beta_1 Health + \beta_2 ln(Health) +
#'   \beta_3 propGovt\\
#' & + \beta_4 area_{Other} + \beta_5 area_{South Asia}\\
#' & + \beta_6 EqG \\
#' & + \beta_7 Health \times area_{Other} + \beta_8 Health
#'   \times area_{South Asia}\\
#' & + \beta_9 ln(Health)\times area_{Other} +
#'   \beta_{10} ln(Health)\times area_{South Asia} \\
#' & + \beta_{11} propGovt  \times area_{Other} +
#'   \beta_{12} propGovt \times area_{South Asia} \\
#' & + \varepsilon
#' \end{aligned}
#' $$
#'
#' where $\varepsilon \sim N(0,\sigma^2)$ independently of
#' predictors.
#'
#' **Note:**  Here we encounter the vital difference between
#' assumptions that can be checked and assumptions that can't be
#' checked. We are assuming that
#'
#' 1) errors are normal,
#' 2) they have the same variance for each observation, and
#' 3) they are independent of predictors.
#'
#' The first two assumptions can be checked with diagnostics, the
#' third, in general, cannot. In econometrics it's recognized as
#' a key assumption related to the 'exogeneity' of the predictors
#' and the causal interpretation of the model. For a further
#' treatment of this question see @murnane2010methods and
#' @pearl2018book.
#'
#' ## Understanding coefficients
#'
#' Q: What does $\beta_1$ mean?
#'
#' A: It's the expected change in $Y$ when you change $Health$ by
#' one unit keeping all other terms constant --- **BUT THAT'S
#' IMPOSSIBLE**
#'
#' We'll have more luck with $\beta_3$: It's the expected change
#' in $Y$ when you change $progGovt$ by one unit keeping all
#' other terms constant, i.e. when all variables that interact
#' with $propGovt$ are equal to 0.
#'
#' i.e. when $area_{Other} = area_{South Asia} = 0$
#'
#' i.e. **in Africa**
#'
#' So we have a clear interpretation: it's the expected change in
#' Life Expectancy using our model to compare a hypothetical
#' country where health expenditures are entirely supported by
#' the government with a hypothetical country in which they are
#' entirely private **in Africa**.
#'
#' This is not obvious to a casual user of regression and most
#' surely not to most clients and readers of academic journals.
#'
#' ### How can we get answers to meaningful questions?
#'
#' You're in luck. Calculus comes in handy.
#'
#' What's the 'effect' (a very misused word and I'm still looking
#' for a better one) of increasing Health expenditures by 1
#' dollar?
#'
#' $$
#' \begin{aligned}
#' \frac{\partial{E(Y)}}{\partial{Health}} &= 0 \times \beta_0 +
#'   \beta_1  + \beta_2 \frac{1}{Health} + 0 \beta_3 \\
#' & + 0 \times \beta_4  + 0 \times  \beta_5 \\
#' & + 0  \times \beta_6  \\
#' & + \beta_7  area_{Other} + \beta_8  area_{South Asia}\\
#' & + \beta_9 \frac{area_{Other}}{Health}  + \beta_{10} \frac{area_{South Asia}}{Health}  \\
#' & + 0 \times  \beta_{11}  + 0  \times \beta_{12} \\
#' &= L \beta
#' \end{aligned}
#' $$
#' where
#' $$
#' L= \left[ \begin{array}{ccccccccccccc}
#' 0 & 1 & \frac{1}{Health} & 0 & 0 & 0 & 0 &
#'  area_{Other} & area_{South Asia}
#'  &  \frac{ area_{Other}}{Health} & \frac{area_{South Asia}}{Health}  &
#'  0 & 0
#' \end{array} \right]
#' $$
#' and
#' $$
#' \beta = \left[ \begin{array}{c}
#' \beta_0 \\
#' \beta_1 \\
#' \beta_2 \\
#' \beta_3 \\
#' \beta_4 \\
#' \beta_5 \\
#' \beta_6 \\
#' \beta_7 \\
#' \beta_8 \\
#' \beta_9 \\
#' \beta_{10} \\
#' \beta_{11} \\
#' \beta_{12} \\
#' \end{array} \right]
#' $$
#' which we can estimate with
#' $$
#' \hat{\eta} = L \hat{\beta}
#' $$
#'
#' **NOTE:** This does not seem to depend on $propGovt$! Is this
#' reasonable? What should we do about that?
#'
#' **Exercise:** Explore what could be done with $propGovt$.
#'
#' $\hat{\beta}$ is obtained with:
coef(fit2)
#' To estimate the marginal effect of Health Expenditures in
#' 'Other' when Health expenditures = 100:
#'
Lmat <- cbind( 0,1,1/100,0,0,0,0,   1, 0 , 1/100, 0,0,0)
Lmat
Lmat %*% coef(fit2)
#' We could write matrix expression to get the variance, F-test,
#' p-values etc., but it's already been done with the 'wald'
#' function in 'spida2'. Other packages also have functions that
#' do this, e.g. 'lht' in the 'car' package.
wald(fit2, Lmat)
#' How could we mass produce this?
ex <- expression( cbind( 0,1,1/Health,0,0,0,0,
                         area == "Other", area == "South Asia",
                         (area == "Other")/Health,
                         (area == "South Asia")/Health,
                         0,0))
ex
with( list(Health=100, area = "South Asia"), eval(ex))

pred <- expand.grid( Health = seq(30,4000,10),
                     area = levels(ds$area))
head(pred)
tail(pred)
dim(pred)
head(with(pred, eval(ex)))

ww <- wald(fit2, with(pred, eval(ex)))
str(ww)
head(as.data.frame(ww))
pred <- cbind( pred, as.data.frame(ww))
head(pred)
gd(lwd=2)
xyplot(coef ~ Health, pred, groups = area,type= 'l',
       auto.key=list(space = 'right'))

xyplot(coef ~ Health|area, pred, groups = area, type = 'l',
       auto.key = list(space='right'),
       subscripts = T,
       lower = pred$coef - 2* pred$se,
       upper = pred$coef + 2* pred$se,
       layout = c(1,3)) +
  glayer( gpanel.fit(...))

#'
#' Make labels and axes interprettable for presentation:
#'
xyplot(I(100*coef) ~ log(Health), pred, groups = area,type= 'l',
       auto.key=list(space='right', lines = T, points = F),
       ylab =
"Estimated change in LE associated with a $100 increase in Health Exp.",
       xlab = "Health expenditures per capita in $US (log scale)",
       scales = list( x = list(
         at = log(c(30,100,300,1000,3000,8000)),
         labels = c(30,100,300,1000,3000,8000))))
#'
#' Limit plot to ranges in each Area:
#'
#' 1. create a small data set with ranges
dsr <- ds
#' @. max within each area
dsr$max <- with(dsr, capply( Health, area, max, na.rm = T))
#' @. min withing each area
dsr$min <- with(dsr, capply( Health, area, min, na.rm = T))
#' @. summary data frame with variables that are 'area invariant'
dsr <- up(dsr, ~ area)  # keeps 'area' invariant variables only
dsr
#' @. merge back into pred
predr <- merge(pred, dsr[,c('area','max','min')], all.x = T)
#' @. keep values of Health that are within range
predr <- subset( predr, (Health <= max) & ( Health >= min))
head(predr)
#'
#' ### Plotting fitted values and bands
#'
#' If you define arguments **fit**, **lower** and **upper** in
#' 'xyplot', they will be available to 'gpanel.fit' to draw the
#' fitted line and confidence or predictions bands.
#'
#'
xyplot(I(100*coef) ~ log(Health), predr, groups = area,type= 'l',
       auto.key=list(space='right', lines = T, points = F),
       ylab =
"Estimated change in LE associated with a $100 increase in Health Exp.",
       lower = 100*(predr$coef - 2* predr$se),
       upper = 100*(predr$coef + 2* predr$se),
       sub= "Estimated change in LE with standard error bands",
       xlab = "Health expenditures per capita in $US (log scale)",
       scales = list( x = list(
         at = log(c(30,100,300,1000,3000,8000)),
         labels = c(30,100,300,1000,3000,8000)))) +
    glayer(gpanel.fit(...))

xyplot(I(100*coef) ~ log(Health)|area, predr, groups = area,
       type = 'l',
       auto.key=list(space='right', lines = T, points = F),
       ylab = "Additional years of Life Expectancy",
       xlim = c(-5,15),
       layout = c(1,3),
       lower = 100*(predr$coef - predr$se),
       upper = 100*(predr$coef + predr$se),
       xlab = "Health expenditures per capita in $US (log scale)",
       scales = list( x = list(
         at = log(c(30,100,300,1000,3000,8000)),
         labels = c(30,100,300,1000,3000,8000)))) +
  glayer(gpanel.fit(...))
#' __Figure:__ Additional years of life expectancy associated
#' with a $100 (U.S.) increase in health expenditures per capita
#' per year, in three world regions as a function of the current
#' level of health expenditures. The bands show the standard
#' error of estimation.
#'
#' #### Exercises
#'
#' 1. Redo the above plot showing relationship of LE with a 1%
#'    increase in Health Expenditures.
#' 2. What happens if you introduce the possibility of
#'    interaction between health expenditures and $propGovt$?
#' 3. How do things change if we do a regression that gives more
#'    weight to larger countries? How should we do this?
#' 4. Compare Africa and South Asia: Is there evidence of a
#'    difference between LE adjusted for Health Expenditures and
#'    propGovt. Prepare an appropriate plot.
#' 5. Same for South Asia and "Other".
#'
#' ### In the future:
#'
#' We will explore the 'Lfx' function in 'spida2' and the 'sc'
#' function for generalized splines generated by the 'gsp'
#' function.
#'
#' # Appendices
#'
#' ## Notes on the Principle of Marginality
#'
#' The principle of marginality (POM) came up in class recently
#' and it occurred to me that there might be confusion arising
#' from the distinction between the requirements for:
#'
#' 1) A model to satisfy the POM, and
#'
#' 2) A null hypothesis specified by setting a set of terms to
#' zero to satisfy the POM.
#'
#' In a linear model with main effects and interactions of
#' various orders, a model satisfies the POM if, for any
#' interaction in the model, all included lower-order
#' interactions and main effects are also in the model. In other
#' words, the model is closed under taking _margins_ where we
#' think of A:B as a margin of A:B:C, for example. Note that the
#' intercept is considered a 0-th order effect and must be
#' included if anything else is included.
#'
#' A hypothesis that sets some parameters to 0 in a model that
#' satisfies the POM, itself satisfies the POM provided the
#' resulting $H_0$ model also satisfies the POM.
#'
#' That's why the requirements for the set of terms that are set
#' to 0 seems to be the reverse of the requirements for a model.
#' For any given term set to zero in the hypothesis, all
#' higher-order terms in the model that include the given term
#' must also be set to zero. Otherwise, the null model would
#' include those higher-order terms without including the given
#' term which would result in a null hypothesis that violates the
#' POM.
#'
#' Thus the requirement for the set of terms set to zero is the
#' 'reverse' of the requirement for models. The set of terms set
#' to zero must be closed under taking interactions that are in
#' the full model.
#'
#' Note that the main significance of the POM is that predicted
#' values ($\hat{Y}$) for a model that satisfies the POM are
#' invariant under location-scale transformations of numerical
#' variables and non-singular recodings of categorical variables.
#'
#' Hypotheses that satisfy the POM result in a test statistic,
#' hence p-value, that is invariant under those same
#' transformations and recodings.
#'
#' So, if you stick to models and hypotheses that satisfy the
#' POM, you don't need to worry that your conclusions would have
#' been different if you had measured temperature in degrees
#' Celsius instead of Farenheit or whether you had used a
#' different category as a reference level for a factor.
#'
#' Wald tests performed by specifying a regular expression to be
#' matched in a model's terms will usually satisfy the POM
#' because, if a regular expression matches a term, it will also
#' match higher-order terms that contain that term.
#'
#' This is true for tests of interactions with e.g. `wald(fit,
#' ":")` for all interactions or `wald(fit, ':.*:")` for two-way
#' and higher-order interactions, and for test of any particular
#' effect, e.g. `wald(fit, 'X')` provided one checks that the
#' regular expression does not match unintended terms.
#'
#' Of course, you will be interested in estimating many
#' parameters whose values do depend on the units used and the
#' reference level. But those will be parameters addressing
#' specific questions. For example in a model Y ~ X*G where X is
#' continuous and G has three levels: A, B and C, you may want to
#' estimate the difference in the rate of change with respect to
#' X (which does depend on the units of X) comparing levels C and
#' B. The exact hypothesis to test whether this is a particular
#' value will not satisfy the POM because the estimate will
#' depend on the units of X and the coding of the factor G.  This
#' is okay because it obeys the principle of "you know what you
#' are doing". The general rule is:
#'
#' ___Never violate the POM unless you know what you are doing!___
#'
#' ## Safe version of function
#'
#' From a post by Deepayan Sarkar re modifying a complex call
#' to a linear call to fit a line within panels.
#'
#' Pay particular attention to the way `plm`
#' uses `match.call` to capture the call and then
#' modifies it before using `eval` to evaluate it
#' again.
#'
#' <pre>
#' p + geom_point(size=2) + facet_wrap(~three) +
#'     stat_smooth(method="lm", formula=y~poly(x,2))
#' </pre>
#' but one problematic group is enough to make a whole panel fail.
#'
#' Other than rewriting StatSmooth$compute_panel to protect each per-group call, a workaround could be to replace method="lm" by a safe wrapper, e.g.,:
#'
#' <pre>
#' plm <- function(formula, data, ...)
#' {
#'     ocall <- match.call(expand.dots = TRUE)
#'     ocall[[1]] <- quote(lm)
#'     fm <- try(eval(ocall, parent.frame()), silent = TRUE)
#'     if (inherits(fm, "try-error"))
#'     {
#'         ocall[[2]] <- y ~ x
#'         fm <- eval(ocall, parent.frame())
#'     }
#'     fm
#' }
#'
#' p + geom_point(size=2) + stat_smooth(method=plm, formula=y~poly(x,2))
#' </pre>
#'
#' ## Simple reshape according to Deepayan Sarkar
#'
#'
#'
#' # References
#'
