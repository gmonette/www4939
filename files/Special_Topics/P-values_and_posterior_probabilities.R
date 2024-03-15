#' ---
#' title: "P-values and posterior probabilities"
#' author: ""
#' date: ""
#' output: bookdown::html_document2
#' geometry: paperwidth=6in,paperheight=4in,margin=0.3in
#' ---
#+ include=FALSE
html <- FALSE
html <- TRUE
#' \raggedright
#' \newcommand{\tr}{\operatorname{trace}}
#'
#' 
#'  mu_alt = sqrt(n) * mu
#'  
# dd <- expand.grid(sig = seq(1,10,.5), mu_alt = c(1,2,4,10,16,20)) 
dd <- expand.grid(sig = seq(1,10,.5), mu_alt = seq(.1,10,.1)) 
dd$p <- with(dd, 10^(-sig))
dd$power05 <- with(dd, pnorm(qnorm(.05, lower.tail = FALSE), mean = mu_alt, lower.tail = FALSE))

# dd <- expand.grid(p=seq(.0001,.1,.0001), power05 = c(.5,.6,.7,.8,.85,.9,.95,.99)) 
# ....

#' 
#' z statistic has a n(0,1) distribution under H0 and a n(0,mu_alt) under HA
#' 
#' post prob with even prior odds is
#' 
post <- function(p, mu_alt, priorH0 = .5) {
  crit <- qnorm(p,lower.tail = FALSE)
  (dnorm(crit)*priorH0)/((dnorm(crit)*priorH0) + (dnorm(crit, mu_alt)*(1-priorH0)))
}

post(.005,2)
#'
dd$post <- mapply(post, dd$p, dd$mu_alt)
dd$post95 <- mapply(post, dd$p, dd$mu_alt, priorH0 = .95)
head(dd)
library(latticeExtra)

xyplot(post ~ p, dd, groups = mu_alt, type = 'l', auto.key=T, #ylim = c(0,.5),
       scales = list(x = list(log=T, equispaced.log = F)))+
  layer(panel.abline(h = .05))
#+ fig
#| fig.cap="Posterior Probability with even prior odds",  
#| width="100%"
xyplot(post ~ p, dd, groups = 100*round(power05,3), type = 'l', 
       auto.key=list(reverse.rows=F), 
       ylim = c(0,.5),
       scales = list(x = list(log=T, equispaced.log = F)))+
  layer(panel.abline(h = .05))

#+ fig
#| fig.cap="Posterior Probability with prior odds favoring H0 19:1",  
#| width="100%"
xyplot(post95 ~ p, dd, groups = 100*round(power05,3), type = 'l', 
       auto.key=list(reverse.rows=F), 
       ylim = c(0,.5),
       scales = list(x = list(log=T, equispaced.log = F)))+
  layer(panel.abline(h = .05))
#' 
#' Conclusion: Under the best circumstances you need a p-value in the 
#' vicinity of less than 0.0005 to get a posterior of guilt > .95
#' to counter a presumption of innocence of guilt < .05.
#' 
#' 
#' 
