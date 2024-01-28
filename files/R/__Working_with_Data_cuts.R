##' ## Convert from wide to long (tall) format ----
#' 
#' Since reshaping longitudinal data efficiently is an important operation in the analysis of 
#' longitudinal and hierarchical data the <tt>spida2</tt> package has two functions, <tt>tolong</tt>
#' and <tt>towide</tt> to facilitate the process.
#' 
#' Reshaping is easiest when variable names are formatted appropriately which may be quite
#' easy with regular expressions.
#' 
#' Look at help files for <tt>tolong</tt> and <tt>towide</tt> in the spida2 package for examples on the use
#' of these functions.
#' 
#' Suppose subjects A, B are observed on varying occasions, measuring variables
#' x and y in different locations of the brain. The following data set is in
#' 'long' format with with respect to time -- observations 
#' at different times for the same subject are on different
#' rows -- but in long format with respect to
#' time -- different times for the same subject are on different rows.
#' 
#' Different methods of analysis require the data to be in different formats.
#' For example, using multivariate analysis to perform a repeated measures
#' analysis requires the data to be in wide form with respect to time. Longitudinal
#' analysis with mixed models requires the data to be in long form.
#' 
#' We can use `tolong` to reformat the data
#' so that it is long with respect to both time and location
#' in preparation for a multilevel analysis.
#' 
dd <- data.frame( subject = c('A','A','B'),
                  time = c(1,2,1), 
                  y.left = 1:3, y.right = 1:3, 
                  x.left= 1:3, x.right = 11:13, x.middle = 21:23 
                  )
dd
#' 
#' In the variable names, the period ('.') is only used to separate
#' the generic variable names (x and y) from the location. The variable
#' names are in the right form for a direct transformation of the data frame.
#' 
#' However, `tolong`, by default, will use a variable named `time` to record the
#' locations. We need to change the default so `tolong` will not clobber the existing
#' variable `time`.
#' 
tolong(dd, sep = '.') # uses 'time' as default name for occasion variable
# Specify new 'timevar' to avoid clobbering 'time':
dl <- tolong(dd, sep = '.', timevar = "location") 
dl
#' 
#' Note that all variable names that don't contain the separator are 'location-invariant'
#' variables. Their values are repeated in each row in the long data frame that 
#' corresponds to a single row in
#' the original wide data frame.
#' 
#' We can go back and forth, more or less, with the following:
#' 
dw <- towide(dl, idvar = 'id', timevar = 'location', sep = '_')
dw
#' 
#' `towide` combines all rows with the same value of `id`.
#' Variables that vary within `id` are expanded using 
#' values of `timevar` to create an extension to the names
#' of variables. 
#' 
#' The `idvar` parameter can take more than one variable name. In that
#' case `towide` will combine all rows with the same unique combination
#' of values of variables identified in `idvar`.
#' 
#' We can make the data frame wide with respect to time also:
#' 
dww <- towide(dw, idvar = 'subject', timevar = 'time', sep = '.') 
dww
#'
##' ### Exercise ----
#'  
#' Make `dww` long with respect to location but wide with respect to time.
#' Hint: To make the exercise interesting, you might want to use regular expressions 
#' to modify variable names in `dww`.
#' 
#' <!-- TODO(georges) add material -->
#' 
#' 


summary(fit)
summary(fitbin)

###############################################
tab__(Titanic, ~  Class + Sex + Survived, pct = c(1,2)) %>% 

  
  tab__(Titanic, ~  Class + Sex + Age + Survived, pct = c(1,2,3))

  barchart(ylab = 'percentage of passengers',
           horizontal = FALSE,
           ylim = c(0,100), layout = c(2,2),
  		   scales = list(x=list(rot=45)),
           auto.key=list(space='right',title='survived', reverse.rows = T))

#' 
#' 
    temp_m <- capply(temp, sid, mean)
#' 
# Switching long and wide variables
# Multiple variables in 'idvar'
#  
 dd                 
 names(dd) <- sub("^X","val__", names(dd)) # use '__' in case '_' is used elsewhere                
 dd
 dl <- tolong(dd, sep = '__', timevar = 'year')
 dl
 dw <- towide(dl, idvar = c('country','year'), 
        timevar = 'variable')
 dw
 dw[grep('^id_',names(dw))] <- NULL
 dw
 names(dw) <- sub("^val_","", names(dw))
 dw

 
 
 
 
 
 #
#  A function to flip years and variables
#
flip <- function(data, rowvar = 'country', 
                 colfmt = '[0-9]{4}$', 
                 varname = 'variable', sep = '__') {
    names(data) <- sub(
         paste0("^.*(",colfmt,')'), 
         paste0("value",sep,"\\1"), 
         names(data))
    dl <- tolong(data, sep = "__", timevar = 'year', idvar = "XXXX")
    dw <- towide(dl, timevar = varname, idvar = c(rowvar, 'year'), sep = '__')
    dw <- dw[, - grep("^XXXX", names(dw))]
    names(dw) <- sub(paste0('value',sep), '', names(dw))
    dw
}     
flip(dd)


#     
# Mixture of time-varying and time-invariant variables
#

dl <- data.frame(subject = c('A','A','A','B','B','C','C'), 
                 time = c(1,2,3,1,2,1,3),
                 sex = c('male','male','male','female','female','male','male'),
                 y = c(10,10,10,11,11,12,12), # accidentally time-invariant
                 x = c(20,21,22,25,26,18,19)) # time-varying
dl
towide(dl, idvar = 'subject', timevar = 'time')  
towide(dl, idvar = 'subject', timevar = 'time', add.invariants = FALSE)  

# multiple time variables: e.g. month, day

dl <- data.frame(subject = c('A','A','A','B','B','C','C'), 
                 month = c(1,1,3,2,2,1,3),
                 day =   c(10,15, 2, 3, 9, 20, 2),
                 sex = c('male','male','male','female','female','male','male'),
                 y = c(10,10,10,11,11,12,12), # accidentally time-invariant
                 x = c(20,21,22,25,26,18,19)) # time-varying
# need single time variable
dl
dl$date <- with(dl, as.Date(paste0(month,'-',day),'%m-%d'))  # uses the current year
dl
dw <- towide(dl, idvar = 'subject', timevar = c('date'))
dl2 <- tolong(dw, sep = '_')
sortdf(dl2, ~ subject/time)









## End(Not run)



   data(hs)
    dim( hs )
    hsu <- up( hs, ~ school )
    dim( hsu )

    # to also get cluster means of cluster-varying numeric variables and modes of factors:

    hsa <- up( hs, ~ school , all = TRUE )

    # to get summary proportions of cluster varying factors:

    up( cbind( hs, model.matrix( ~ Sex -1 , hs)), ~ school, all = T)

    # Similar using 'agg'
    
    up(hs, ~school, agg = ~ Sex)
    
    ## To plot a summary between-cluster panel along with within-cluster panels:

    hsu <- up( hs, ~ school, all = TRUE)
    hsu$school <- ' between'  # space to make it come lexicographically before cluster names

    require( lattice )
    xyplot( mathach ~ ses | school, rbind(hs,hsu),
        panel = function( x, y, ...) {
            panel.xyplot( x, y, ...)
            panel.lmline( x, y, ...)
        } )
        
    ## To create a data frame grouped by predictors with frequency variables for each
    ## level of a response variable for analysis with a binomial glm with goodness of fit
    ## based on the deviance
    
    hsa <- up( hs, ~school, agg = ~ Sex)
    head(hsa)
    fit <- glm(cbind(Sex_Female, Sex_Male) ~ Sector, hsa, family = binomial)
    summary(fit) # the residual deviance provides a goodness of fit test
    

