#' ---
#' title: 'Paik-Agresti Diagrams'
#' author: ''
#' date: 'January 2020'
#' ---
#+ include=FALSE
knitr::opts_chunk$set(comment="  ", error = TRUE)
#'
#' A Paik-Agresti diagram let you see the marginal (unconditional) relationship
#' between two binary variables and their conditional relationship, conditioning
#' on another categorical variable in the same diagram.
#' 
#' The height of the marginal line is a weighted average of the heights of
#' the conditional lines. The weights are the number of observations
#' for each point on the conditional lines.
#' 
#' By representing the weights by the size of a circle around each point, the
#' Paik-Agresti diagram makes it easy to see how and when Simpson's
#' Paradox (the slope of the conditional lines has a sign opposite to that
#' of the marginal line) can occur.
#'
library(asbio)  # install.packages('asbio')
library(spida2) # devtools::install_github('gmonette/spida2')
library(magrittr)  # install.packages('magrittr') # to use 'pipes' (%>%) with Ctrl-Shift-M
#'
#' # Sentences for murder convictions in Florida 
#' 
#' The following dataset records whether the death penalty was pronounced in
#' 674 homicide trials in the state of Florida from 1976-1987.
#' The data set shows the verdict, and the defendant's and victim's race. 
#' 
#' See [Radelet, M. L., and G. L. Pierce (1991)](https://www.ncjrs.gov/App/Publications/abstract.aspx?ID=134288)
#' Choosing those who will die: 
#' race and the death penalty in Florida. Florida Law Review 43(1):1-34.
#' 
data(death.penalty) # from Agresti 2012 
death.penalty

#'
#' The relationship between defendant's race and penalty:
#' 

tab( count ~ verdict + d.race, death.penalty)
tab( count ~ verdict + d.race, death.penalty, pct = 2)  %>%  round(2)

#'
#' Conditional counts: conditioning on race of victim
#' 

tab( count ~ verdict + d.race + v.race, death.penalty)
tab( count ~ verdict + d.race + v.race, death.penalty, pct = c(2,3))  %>%  round(2)

#'
#' Paik-Agresti diagram 
#' 

paik(verdict ~ d.race + v.race, counts = count, data = death.penalty, 
     leg.title = "Victims race", xlab = "Defendants race", 
     ylab = "Proportion receiving death penalty")

#'
#' # Berkeley admissions 
#' 
#' The following data shows admissions in 1973 to graduate programmes
#' at Berkeley by department A, B, C, D, E, gender and outcome
#' 

bad <- read.table(header=T, text = "
Dept  Gender  Status   count
A     Male    Admitted  512
A     Male    Denied    313
A     Female  Admitted   89
A     Female  Denied     19
B     Male    Admitted  313
B     Male    Denied    207
B     Female  Admitted   17
B     Female  Denied      8
C     Male    Admitted  120
C     Male    Denied    205
C     Female  Admitted  202
C     Female  Denied    391
D     Male    Admitted  138
D     Male    Denied    279
D     Female  Admitted  131
D     Female  Denied    244
E     Male    Admitted   53
E     Male    Denied    138
E     Female  Admitted   94
E     Female  Denied    299
F     Male    Admitted   22
F     Male    Denied    351
F     Female  Admitted   24
F     Female  Denied    317
")
bad

#'
#' Marginal counts: not conditioning on department
#' 

tab(bad, count ~ Gender + Status)
tab(bad, count ~ Gender + Status, pct = 1) %>% round(2)

#'
#' Conditional counts: conditioning on department
#' 

tab(bad, count ~ Gender + Status + Dept)
tab(bad, count ~ Gender + Status + Dept, pct = c(1,3))  %>% round(2)

#'
#' Paik diagram
#' 

paik( Status ~ Gender + Dept,  data = bad) # 'paik' expects 'counts' to be called 'count' in data.frame

bad$Status <- factor(bad$Status, levels = c('Denied','Admitted')) # changes ordering of levels in factor

paik( Status ~ Gender + Dept,  data = bad)

#' But does this mean that Berkeley is not 'discriminating' against female applicants?

