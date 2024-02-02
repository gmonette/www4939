library(spida2)
library(car)
dim(hs)
head(hs)
     
hs <- within(
  hs,
  {
    ses_mean <- capply(ses, school, mean, na.rm = T)
    ses_sd <- capply(ses, school, sd, na.rm = T)
    m_rank <- capply(-mathach, school, rank)
    overall_rank <- rank(-mathach)
    slope <- capply(1:nrow(hs), school, function(ind){
      coef(lm(mathach ~ ses, hs[ind,]))['ses']
    })
    ses_z <- capply(ses, school, scale)
  }
)
head(hs)
some(hs)
hsu <- up(hs, ~ school, agg = ~ Sex)
dim(hsu)
hsu
up(hs, ~ school + Sex)
tab(hs, ~ school)

mat <- matrix(1:24, 6)
school <- c(1,1,2,3,3,3)
tapply( 1:nrow(mat), school, function(ind) nrow(mat[ind,,drop=F]))

mat
mat[c(4,6),]
mat[4,]
