#' ---
#' title: 'New 4939 Questions 2020'
#' date: "January 2020"
#' author: ""
#' output:
#'   html_document:
#'     toc: true
#'     toc_float: true
#'     number_sections: true
#'     theme: readable
#' ---
#' 
#' These questions have been inspired by many sources. 
#' 
##+ 1 # The meaning of $p$-values ----
#' # The meaning of $p$-values
#' 
#' The purpose of the assignment is to explore the meaning of p-values. 
#' Before starting stop and reflect on what it means for
#' an experiment to 'achieve' a p-value of 0.049. 
#' What meaning can we give to the quantity '0.049'?  How is it related 
#' to the probability that the
#' null hypothesis is correct?
#' 
#' To keep things very simple suppose you want to test 
#' $H_0: \mu =0$ versus $H_1: \mu \neq 0$ and 
#' you are designing
#' an experiment in which you plan to take a sample of
#' independent random variables, $X_1, X_2, ... , X_n$ 
#' which are iid $\textrm{N}(\mu,1)$, 
#' i.e. the variance is known to be equal to 1.
#' You plan to use the usual test based on $\bar{X}_n$ 
#' rejecting $H_0$ 
#' for values of $\bar{X}_n$ that are far from 0.
#' 
#' An applied example would be testing for a change 
#' in value of a response when all subjects are submitted 
#' to the same conditions and
#' the measurement error of the response is known. In that example
#' $X_i$ would be the 'gain score', i.e. post-test response minus 
#' the pre-test response exhibited by the $i$th subject.
#' 
#' Let the selected probability of Type I error be $\alpha = 0.05$. 
#' Consider collecting samples of size $n$ where $n$ equals one
#' of the following:
#' 
#' | $i$     | $n$     |
#' |:--------:|:-------:|
#' |   1      |  10     |
#' |   2      |  20     |
#' |   3      |  100    |
#' |   4      |  200    |
#' |   5      |  1,000  |
#' |   6      | 10,000  |
#' 
#' Consider using the following values of $\mu_j$:
#'
#' | $j$ | $\mu_j$ |  Cohen's terminology for effect size: $\mu_j/\sigma$ |
#' |:----------------:|:-------:|:--------------------:|
#' |   1              |  0.2    | small effect size    |
#' |   2              |  0.5    | medium effect size   |
#' |   3              |  0.8    | large effect size    |
#' |   4              |  1      |                      |
#' |   5              |  5      |                      |

#' 1. What is the probability that $p \le 0.05$ if $H_0: \mu = 0$ is true? 
#' 2. What is the probability that $p \le 0.05$ if $\mu = \mu_j$?
#' 3. What is the power of this test if $\mu = \mu_j$?
#' 4. Suppose that you collect the data and that 
#'    the observed $p$-value is 0.049. What can you say about the 
#'    probability that $H_0$ is true?
#' 5. Suppose that, before running the experiment, 
#'    you were willing to give $H_0$ and $H_1:  \mu = \mu_j$
#'    equal probability. 
#'    What is the probability that $H_0$ is true  given that 
#'    you have performed the experiment and obtained $p = 0.049$.
#' 6. Hypothesis testing is often presented as a process 
#'    that parallels that of determining guilt in a criminal process.
#'    We start with a presumption of innocence, 
#'    i.e. that $H_0$ is true, We then hear evidence and consider whether
#'    it contradicts the presumption of innocence 
#'    'beyond a reasonable doubt.'  
#'    Suppose we quantify the presumption of 
#'    innocence to mean that $P(H_0) \ge .95$. 
#'    How small an observed $p$-value do you need 
#'    to obtain in order to 'flip' the presumption of 
#'    innocence to 'guilt beyond a reasonable doubt' 
#'    if that is defined as $P(H_0 | \mathrm{data}) \le .05$. 
#' 7. What $p$-value would we need if the presumption of 
#'    innocence and guilt beyond a reasonable doubt correspond to $P(H_0) \ge 0.999$ 
#'    and $P(H_0|data) \le 0.001$?
#' 8. Courts have often adopted a criterion of $p < 0.05$ in imitation of the common practice among many researchers. 
#'    Comment on the possible consequences.
#'     
#' To delve more deeply into these issues you can read @wassersteinASAStatementValues2016 
#' and @wassersteinMovingWorld052019. Concerns about $p$-values have been
#' around for a long time, see @schervishValuesWhatThey1996. For a short
#' overview see @berglandRethinkingPValuesStatistical2019. 
#' Two very important papers are by John Ioannidis 
#' [@ioannidisWhyMostPublished2005, @ioannidisWhatHaveWe2019]. 
#' 
#' For an entertaining take on related issues
#' see @oliverLastWeekTonight2016 (warning: contains 
#' strong language and political irony that many could consider offensive -- watch
#' at your own risk!).
#' 
##+ 2 # Merge: relational data base operations 1 ----
#' # Merge: relational data base operations 1
#'  
#' <!-- from Advanced_R_Notes_2_Data_Structures.R: data.frame merge -->
#' Let<pre>
#' d1 <- data.frame(id = c('a','a','b','c'), grade = c(1,2,1,3))
#' d2 <- data.frame(id = c('a','c','c','d'), year = c(3,1,3,4)) 
#' </pre>
#' Describe the differences between the outputs of the following commands:<br>
#' 
#' a.  ``merge(d1,d2)`` 
#' b.  ``merge(d1,d2, all.x = TRUE)`` 
#' c.  ``merge(d1,d2, all.y = TRUE)``     
#' d.  ``merge(d1,d2, all = TRUE)``     
#'
#' # Merge: Concatenating rows of slightly different data frames
#' 
#' Two research assistants have collected data for a study.
#' The two RAs worked with different subjects each gathered
#' their data into a spreadsheet. All of the important variables
#' have the same name and the same definitions but each RA has
#' also collected data on a few unique variables for that RA.
#' Also, the order of the columns is different in the two studies.
#' 
#' a. Create two small data frames to illustrate this kind of situation.
#' b. How could you use 'merge' to easily concatenate the two data frames by rows
#'    keeping each distinct row in the original data frames and keeping
#'    the unique variable names with values filled with NAs for subjects
#'    from whom the value was not present in the data.
#'  
##+ 3 # Merge: relational data base operations 2 ----
#' # Merge: relational data base operations 2
#' 
#' Let<pre>
#' d1 <- data.frame(id = c('a','a','b','c'), grade = c(1,2,1,3))
#' d2 <- data.frame(id = c('a','c','c','d'), year = c(3,1,3,4)) 
#' </pre>
#' Find out what the following terms mean and show how to
#' achieve each operation using 'merge'. Hint: the last two 
#' operations
#' are much easier if you first create a new variable in each
#' data frame to serve
#' as a 'key' (i.e. the argument of 'id' in the call to 'merge')
#' in each data frame. (Note: the 'key' is the set of variables
#' used to match the rows of the two data frames. These are either
#' the variable names provided as arguments to the 'key' parameter
#' or, by default, the intersection of the vectors of 
#' variable names in each data frame.)
#' 
#' a.  inner join    
#' b.  outer join    
#' c.  left join    
#' d.  right join
#' e.  cross join    
#' f.  concatenation of rows
#' 
##+ 4 # Answering questions with data ----
#' # Answering questions with data
#' 
#' Use the 'Vocab' data set in the 'car' package.
#' It records a vocubulary score for over 30,000
#' subjects tested over the years between 1974 and 2016.
#' 
#' Explore the following questions. Use appropriate
#' tables and graphs to explain your findings.
#' 
#' 1. Consider the distribution of education. Are there
#'    any salient features for this distribution? 
#' 2. What can you say about any trends in vocabulary
#'    scores over time? Do the trends, if any,
#'    appear to differ by gender?
#' 3. What can you say about any trends in education
#'    levels over time? Do the trends, if any,
#'    appear to differ by gender?
#' 4. What can you say about male/female differences
#'    in vocabulary scores when you adjust for education?
#'    Is the relationship constant or changing over time?
#'    If it is changing, how can you describe the
#'    nature of the change?  
#'
##+ 5 Questions on factors in R ----  
#' # Questions on factors in R
#' 
#' Some of these questions illustrate important potential pitfalls 
#' in using factor variables.
#' As a result, some developers eschew them and prefer to work with character
#' variables as much as possible. Factors, however, they are invaluable for
#' many statistical applications since they allow the creation of different orderings
#' of the values in a character vector, which is often important in statistical
#' modeling.
#' 
#' 1. Describe the difference, if any, and if so why, between
#'    the following:
#'    
#'    a. ``factor(c(1, 2, 10))``
#'    b. ``factor(as.character(c(1, 2, 10)))``
#'    
#' 2. Suppose ``x <- factor(c(1, 2, 10))``. Write a function
#'    that would allow you to recover 
#'    the original values, 1, 2 and 10, from a factor like ``x``? Why does
#'    ``as.numeric(x)`` not work?
#'    
#' 3. Let ``f1 <- factor(c('a','b','c'))`` and ``f2 <- factor(c('A','B','C'))``.
#'    What's the matter with the result of the expression
#'    <pre>
#'    ifelse(f1 == 'a', f1, f2)
#'    </pre>
#'    Explain why it fails to produce characters as a result.
#'    Fix it so it does.
#'    
#' 4. __Indexing with factors:__ Consider
#'    <pre>
#'    df <- data.frame(c = 1:3, a = 11:13, b = 21:23)
#'    fac <- factor(c('a','b','c'))
#'    df[[fac[1]]]
#'    df[[as.character(fac[1])]]
#'    </pre>
#'    Explain why the last two lines of the code above produce different results.
#'    
#' 5. What happens to a factor when you modify its levels with the `levels<-` replacement function?
#'    Give examples to illustrate your answer. 
#' 
##+ 6 Questions on the R language ----
#' # Questions on the R language
#'
#' 1. Describe the main differences between the four taxonomies of objects in R:
#'    typeof, mode, storage.mode and class.
#'    
#' 2. Let `x <- letters`. What is the class and mode of `x`? Let `y <- as.factor(x)`. 
#'    What is the class and mode of `y`? 
#'    Why does this make sense ... or not?
#'    
#' 3. A factor is a kind of object used to represent character variables
#'    for statistical analysis. Add a factor to the list used to display
#'    the classifications of atomic objects above.
#'    Play with some factors and use `str` to
#'    explain the curious values returned by `typeof`, `mode`, `storage.mode`
#'    and `class` for a factor.  
#'    
#' 4. What makes is.vector() and is.numeric() fundamentally different to is.list() and is.character()?
#'    From [Wickham: Advanced R](http://adv-r.had.co.nz/Data-structures.html#vectors)
#'    
#' 5. Why is 1 == "1" true? Why is -1 < FALSE true? Why is "one" < 2 false?
#'    From [Wickham: Advanced R](http://adv-r.had.co.nz/Data-structures.html#vectors)
#' 
#' 6. Why is the default missing value, NA, a logical vector? What’s special about logical vectors? (Hint: think about c(FALSE, NA_character_).) 
#'    From [Wickham: Advanced R](http://adv-r.had.co.nz/Data-structures.html#vectors)
#'    
#' 7. Does `-1:2` produce the same result as `0-1:2`? Why or why not? 
#'
#' 8. Which of the following 
#'    assignments use valid names?
#'    <pre> 
#'    a_very_long_name <- 0
#'    _tmp <- 2
#'    .tmp <- 2
#'    ..val <- 3
#'    .2regression <- TRUE
#'    ._2_val <- 'a'
#'    </pre>   
#'    
##+ 7 # Questions on selection in R ----
#' # Questions on selection in R
#' 
#' 1. Suppose<br>
#'    `x <- 1:5`<br>
#'    What is the difference between `x[NA]` and `x[NA_integer_]`? Why? Hint: It may have something to do with
#'    the recycling rule.
#' 
##+ 8 # Questions on data frames and data manipulation in R ----
#' # Questions on data frames and data manipulation in R
#'
#' 1. Let<br> 
#'    `d1 <- data.frame(id = c('a','a','b','c'), grade = c(1,2,1,3))`<br>
#'    `d2 <- data.frame(id = c('a','c','c','d'), year = c(3,1,3,4))` <br>
#'    Describe the differences between the outputs of the following commands:<br>
#'    `merge(d1,d2)`<br>    
#'    `merge(d1,d2, all.x = TRUE)`<br>    
#'    `merge(d1,d2, all.y = TRUE)`<br>    
#'    `merge(d1,d2, all = TRUE)`<br>
#' 
#' 2. What attributes does a data frame possess? 
#'    From [Wickham: Advanced R](http://adv-r.had.co.nz/Data-structures.html#data-frames)    
#'    
#' 3. What does as.matrix() do when applied to a data frame with columns of different types?
#'    From [Wickham: Advanced R](http://adv-r.had.co.nz/Data-structures.html#data-frames)    
#'    
#' 4. Can you have a data frame with 0 rows? What about 0 columns?
#'    From [Wickham: Advanced R](http://adv-r.had.co.nz/Data-structures.html#data-frames)    
#' 
#'    
##+ 9 # Questions on graphics in R ----
#' # Questions on graphics in R
#'             
##+ 10 # Questions on functions in R ----
#' # Questions on functions in R
#' 
#' 1. Write a function that will take a vector as input and return the vector
#'    with NAs changed to a null string ("") if the vector is a character vector
#'    or to 0 if it is a numeric vector. <br>
#'    Test your function on extreme examples.
#'    
#' 2. Extend the previous function so it returns a factor if the input is a factor
#'    and changes NAs in factors to a factor level that is 
#'    a null string.<br>
#'    Test your function on extreme examples.
#'    
#' 3. Extend the previous function so the value to which 
#'    that NAs are changed can be 
#'    supplied as a parameter with default value 
#'    the same as in the previous question. Make the value to which
#'    NAs are changed potentially depend on the type of variable.<br>
#'    Test your function on extreme examples.
#'    
#' 4. (Major question) Referring to question 1 on $p$-value, 
#'     a. write a function that returns the posterior probability that 
#'        $H_0$ is true given the variables in the question: the
#'        alternative value of $\mu$,
#'        $\alpha$, $n$.
#'     b. Generate a data frame with values of these variables
#'        (hint: consider using ``expand.grid``) and evaluate the
#'        function on each row in the data frame. 
#'     c. Graph the results in some interesting and revealing way.
#'        You might want to change the values of the variables
#'        that you used in creating the data frame in order to 
#'        produce a more interesting display.
#'     d. Discuss what you graphs reveal. 
#'     
#' 6. Write a function that returns a lower diagonal matrix whose (i,j)th
#'    entry, for i > j, is i + j.  
#'    
#' 7. Write a function that finds the index of the first occurrence of
#'    x in a vector y.
#'    
#' 8. Write a function that turns an vector of non- negative integers into a factor
#'    a factor with values '0', '1', '2 or more'. Make sure that the factor
#'    has the right ordering of levels.
#'    
#' 9. Write a function that identifies whether an integer is a prime number.
#' 
#' 10. Write a function whose input is a data.frame and whose output
#'     is the same data frame except that all factor variables have been
#'     changed to character variables but the numeric variables
#'     are unchanged.
#'     
##+ 11 # Questions on OOP in R ----
#' # Questions on OOP in R
#' 
##+ 12 # Questions on Regression ----
#' # Questions on Regression
#'
#' 1. Explore the pros and cons of Wald tests versus Likelihood Ratio Tests.
#'    Construct an example where they give entirely different results. 
#' 
##+ 13 # Questions on Causality ----
#' # Questions on Causality
#' 
#' 1. One of your professors uploads videos of the course to a website.
#'    One day, he analyzes results from last year's class and discovers
#'    that students' performance in the course is related to
#'    how often they viewed the videos. Students who viewed
#'    the videos frequently tended to 
#'    perform less well on the final exam than students who
#'    viewed the videos relatively rarely. \newline
#'    \newline 
#'    Upon discovering this, your professor announces
#'    that he will stop recording lectures because,
#'    he says, the videos have been shown to cause students to perform more poorly
#'    on the course. In answering the following questions, use clear and
#'    simple language even a professor might be able to understand. 
#' 
#'    a) Do you think the data used in this study 
#'       constitute experimental data (in the sense used in this course) 
#'       or observational data?
#'    a) Explain why the
#'       number of lectures attended could be a
#'       potential confounding factor when
#'       considering the relationship between the frequency of viewing videos and
#'       performance on the course. 
#'    a) Can you think of potential mediating factors?
#'    a) Draw causal graphs for a confounding factor and for a mediating factor.
#'    a) Using a potential confounding factor, draw a hypothetical Paik-Agresti diagram to show
#'       how students who view the videos frequently might do more poorly than those
#'       who view them rarely, even though viewing videos may make a positive 
#'       contribution for individual students in the course.
#' 
#' 2. In 1964, the Public Health Service of the United States studied the effects
#'    of smoking on health in a sample of 42,00 households. For men and for women
#'    in each age group, they found that those who had never smoked were on average
#'    somewhat healthier than the current smokers, but the current smokers were on
#'    average much healthier than the former smokers. 
#' 
#'     a) Would this data be considered observational or experimental to examine
#'        the possible effects of smoking? Why?
#'     a) Why did they study men and
#'        women and the different age groups separately? 
#'     a) The lesson seems to be that you shouldn’t
#'        start smoking, but once you’ve started, don’t stop. Find some plausible
#'        explanations for this surprising relationship between quitting smoking and
#'        health. Find at least one plausible confounding factor and one plausible
#'        mediating factor that might account for part of the relationship.
#'     a) Conditioning on a plausible confounding factor, draw a hypothetical Paik-Agresti diagram
#'        showing a conditional and an unconditional relationship between quitting and 
#'        health that is consistent with the findings of the study.
#' 
#' 3. A study investigated whether there was a higher risk of complications when
#'    women gave birth at home with the assistance of a midwife instead of giving
#'    birth in a maternity ward in a hospital. 400 women who chose to give birth at
#'    home and 2,000 women who gave birth in a hospital were studied. The following
#'    table summarizes the number of complications in each group:  
#' 
#+ echo=FALSE,results='asis' 
library(knitr)
library (kableExtra)
z <- cbind(` Complications `=c(20,200,220), ` No Complications ` = c(380,1800,2180), ` Total ` = c(400,2000,2400))
rownames(z) <- c('Home Births','Hospital Births','Total')
kable(z,'html') %>% kable_styling(full_width=F)
#' 
#'     a) Find the rate of complication in each group: the home birth group and the hospital birth group.
#'     a) Do you think that this is an observational study or an experimental study? Why?
#'     a) The data suggest that it is safer (in the
#'        sense of a lower rate of complications) to give birth at home than to give
#'        birth in the hospital. Discuss whether this implies that a woman should
#'        consider giving birth at home in order to reduce her risk of complications.
#'        Identify at least one plausible confounding factor and one plausible
#'        mediating factor that could partly explain the results of the study.
#'     a) Choose a possible confounding factor and
#'        use a Paik-Agresti diagram to show how controlling for this confounding
#'        factor could reverse the direction of association between the rate of
#'        complications and the location of birth: home or hospital.
#' 
#' 4. Mary (a woman) is choosing between restaurants A and B to take her friend, 
#'    John (a man), out for dinner.  
#'    Restaurant A has an average rating of 4.1 and restaurant B of 4.3.\newline 
#'    \newline 
#'    But looking at ratings by gender, among men, restaurant A has a rating of 4.0 and
#'    restaurant B of 3.8. Among women, restaurant A has a rating of 4.6 and
#'    restaurant B of 4.4. It seems that men and women separately prefer restaurant
#'    A but together they prefer restaurant B!  
#'
#'     a) Draw a Paik-Agresti diagram conditioning on the gender
#'        with restaurant on the horizontal axis and average ratings on the 
#'        vertical axis to explain how this apparent contradiction could arise. 
#'     a) Draw a causal graph describing the relationships among the three variables: restaurant,
#'        gender and ratings.
#'     a) Assuming that there are no other significant factors related to restaurant ratings,
#'        what kind of variable is gender in this context?
#'     a) Which restaurant should Mary choose? Why?
#'
#' 5. Fedor is choosing between restaurants A and B 
#'    to take his friend, Jaspreet, out
#'    for dinner.  Restaurant A has an average rating of 4.1 
#'    and restaurant B of 4.3.\newline 
#'    \newline
#'    Each restaurant has six waiters.
#'    Restaurant A has one good waiter and 5 bad ones.
#'    Restaurant B has 5 good waiters and 1 good one. 
#'    Customers can't choose the waiter they get. 
#' 
#'    Ratings
#'    among customers getting a good waiter are 4.6 at restaurant A and 4.4 at
#'    restaurant B. Ratings among customers getting a bad waiter are 4.0 at
#'    restaurant A and 3.8 at restaurant B. So, overall, customers prefer restaurant
#'    B but among those getting a bad waiter, they prefer restaurant A and among those
#'    getting a good waiter they also prefer restaurant A!\newline
#'    \newline
#'    In other words, the bad waiters at restaurant A are better than the bad waiter
#'    at restaurant B and the good waiter at restaurant A is better than
#'    the good waiters at restaurant B.\newline
#'    \newline
#'    Suppose that you can't choose your waiter and that your chances of getting
#'    each type of waiter at either restaurant are similar to the proportions in
#'    the ratings.  
#' 
#'     a) Draw a Paik-Agresti diagram conditioning on the quality
#'        of the waiter with restaurant on the horizontal axis and average ratings on the 
#'        vertical axis to explain how this apparent contradiction could arise. 
#'     a) Draw a causal graph describing the relationships among the three variables: restaurant,
#'        quality of waiter and ratings.
#'     a) Assuming that there are no other significant factors related to restaurant ratings,
#'        what kind of variable is the quality of the waiter in this context?
#'     a) Which restaurant should Fedor choose? Why?
#' 