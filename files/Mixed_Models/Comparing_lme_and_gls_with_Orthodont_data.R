library(nlme)
library(spida2)
d <- Orthodont
d %>% 
  within(
    {
      time <- capply(age,Subject,rank)
    }
  ) -> d
head(d)
fitd <- lme(distance ~ age * Sex, d, random = ~ 1 + age|Subject)
fitd2 <- lme(distance ~ age * Sex, d, random = ~ 1 |Subject, corr = corAR1(form = ~ time| Subject))
summary(fitd)
summary(fitd2)

fitdg <- gls(distance ~ age * Sex, d, corr = corSymm( form = ~ time | Subject),
             weights = varIdent(form = ~ 1 | time))
library(car)
compareCoefs(fitd, fitd2,fitdg)
summary(fitd)
wald(fitd, 'Sex')
summary(fitdg)
wald(fitdg, 'Sex')
getV(fitd) %>% {.[[1]]} %>% svd(nu=0, nv=0)
getV(fitd2)%>% {.[[1]]}%>%  svd(nu=0, nv=0)
getV(fitdg)%>%  svd(nu=0, nv=0)
   
library(spida2)
pred <- with(d, spida2::pred.grid(age, Sex))
pred$fitd <- predict(fitd, newdata = pred, level = 0)
pred$fitdg <- predict(fitdg, newdata = pred)
pred$fitd2 <- predict(fitd2, newdata = pred, level = 0)

library(latticeExtra)
xyplot(fitd + fitdg + fitd2 ~ age|Sex, pred,  type = 'l', auto.key = T)

