#' ---
#' title: 'New 4939 Questions 2021'
#' date: "January 2021"
#' author: ""
#' output:
#'   html_document:
#'     toc: true
#'     toc_float: true
#'     number_sections: true
#'     theme: readable
#' bibliography: ../common/math4939.bib
#' link-citations: yes
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
#' |   4              |  1      | very large effect size  |
#' |   5              |  5      | huge effect size     |

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
#' 9. Have a look at this [xkcd cartoon](https://xkcd.com/1132/). How does the Bayesian statistician derive a probability to make a decision in this example?
#'    Show the details.  
#'     
#' To delve more deeply into these issues you can read @wassersteinASAStatementValues2016 
#' and @wassersteinMovingWorld052019. Concerns about $p$-values have been
#' around for a long time, see @schervishValuesWhatThey1996. For a short
#' overview see @berglandRethinkingPValuesStatistical2019. 
#' Two key influential and erstwhile controversial papers are by John Ioannidis: 
#' @ioannidisWhyMostPublished2005, @ioannidisWhatHaveWe2019. 
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
#' It records a vocabulary score for over 30,000
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
#' 2. What can you say about any trends in vocabulary
#'    scores over time when you adjust for education?
#'    What difference does it make whether you 
#'    adjust for education or you don't? 
#'    What is the difference in the meaning of
#'    changes in vocabulary score whether you
#'    adjust for education or not?
#'    Do the trends, if any,
#'    appear to differ by gender?
#' 4. What can you say about any trends in education
#'    levels over time? Do the trends, if any,
#'    appear to differ by gender?
#' 5. What can you say about male/female differences
#'    in vocabulary scores when you adjust for education?
#'    Is the relationship constant or changing over time?
#'    If it is changing, how can you describe the
#'    nature of the change?  
#' 
#'
##+ 5 Questions on factors in R ----  
#' # Questions on factors in R
#' 
#' Some of these questions illustrate important potential pitfalls 
#' in using factor variables.
#' As a result, some developers eschew them and prefer to work with character
#' variables as much as possible. Factors, however, are invaluable for
#' many statistical applications since they allow the creation of different orderings
#' of the values in a character vector, which is often important for statistical
#' modeling and for graphics.
#' 
#' 1. Describe the difference, if any, and if so why, between
#'    the following (note that the behaviour of the 'factor' function
#'    has changed over time):
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
#' 9. Write a Rmarkdown script that illustrates the use of
#'    at least 5 functions from the subgroup 'Ordering and tabulating' of the
#'    group 'Statistics' at http://adv-r.had.co.nz/Vocabulary.html
#'    
#' 10. Write a Rmarkdown script that illustrates the use of
#'    at least 5 functions from the subgroup 'Linear models' of the
#'    group 'Statistics' at http://adv-r.had.co.nz/Vocabulary.html
#'    
#' 11. Write a Rmarkdown script that illustrates the use of
#'    at least 5 functions from the subgroup 'Miscellaneous tests' of the
#'    group 'Statistics' at http://adv-r.had.co.nz/Vocabulary.html
#'    
#' 12. Write a Rmarkdown script that illustrates the use of
#'    at least 5 functions from the subgroup 'Random variables' of the
#'    group 'Statistics' at http://adv-r.had.co.nz/Vocabulary.html.
#'    Include interesting graphs.
#'    
#' 13. Write a Rmarkdown script that illustrates the use of
#'    at least 5 functions from the subgroup 'Matrix algebra' of the
#'    group 'Statistics' at http://adv-r.had.co.nz/Vocabulary.html
#'
##+ 7 # Questions on selection in R ----
#' # Questions on selection in R
#' 
#' 1. Suppose<br>
#'    `x <- 1:5`<br>
#'    What is the difference between `x[NA]` and `x[NA_integer_]`? Why? Hint: It may have something to do with
#'    the recycling rule.
#'    
#' 2. Write a function whose input is a numerical matrix and that
#'    checks whether the matrix is a lower diagonal matrix, i.e.
#'    all elements above the diagonal are 0. Hint: consider using
#'    the `row` and `col` functions.
#'    
#' 3. (Longitudinal data) A longitudinal data set with one row
#'    per occasion has a varying number of observations for each
#'    subject. Suppose that a variable named ‘id’ has a unique
#'    identifier for each subject. Some subjects have been
#'    measured on only one occasion and you would like to perform
#'    an analysis that excludes those subjects. Suppose that the
#'    original data frame is called ‘dd’. Write R code to create
#'    a data frame ‘ds’ that excludes the subjects that were
#'    measured only once.
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
#' 5. This question illustrates how simple data manipulation can be used to answer
#'    basic queries about data. 
#'    Consider classlists for four sections of a first year statistics course 
#'    STA1000 (at http://blackwell.math.yorku.ca/MATH4939/data/clist_exercise/) 
#'    and two classlists for a second year statistics course STA2000, 
#'    taken the following year. 
#'    Without any direct editing of the classlists do the following:
#'     
#'     1. Write a function that transforms each input classlist into a data frame 
#'        with useful variables on the program of each students. 
#'        Note that information on program is encoded in a 
#'        single column that can contain
#'        information on a number of distinct variables. 
#'        You need to use string manipulation functions, e.g. sub, gsub,
#'        strsplit, to turn this column into useful variables. 
#'        Note that a space is usually a delimiter between subfields
#'        but sometimes not. You might need to preprocess the strings 
#'        before splitting them into subfieds. 
#'     2. Is there evidence that a different proportion of students in the 
#'        2nd year course go on to study statistics in the 3rd
#'        year course? 
#'     3. Is there evidence that this remains true when adjusting for the 
#'        program of students in the 2nd year course? 
#'     4. Are there conversions, i.e. students who change their majors 
#'        to statistics? Do they come disproportionately from some sections 
#'        instead of others?
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
#' 5. Write a function that returns a lower diagonal matrix whose (i,j)th
#'    entry, for i > j, is i + j.  
#'    
#' 6. Write a function that finds the index of the first occurrence of
#'    x in a vector y.
#'    
#' 7. Write a function that turns an vector of non- negative integers into a factor
#'    a factor with values '0', '1', '2 or more'. Make sure that the factor
#'    has the right ordering of levels.
#'    
#' 8. Write a function that identifies whether an integer is a prime number.
#' 
#' 9. Write a function whose input is a data.frame and whose output
#'    is the same data frame except that all factor variables have been
#'    changed to character variables but the numeric variables
#'    are unchanged.
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
#'    a) Using a potential confounding factor, draw a hypothetical MC diagram (alias Paik-Agresti diagram, alias 'marginal-conditional plot') to show
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
#'     a) Conditioning on a plausible confounding factor, draw a hypothetical MC diagram
#'        showing a conditional and an unconditional relationship between quitting and 
#'        health that is consistent with the findings of the study.
#' 
#' 3. A study investigated whether there was a higher risk of complications when
#'    women gave birth at home with the assistance of a midwife instead of giving
#'    birth in a maternity ward in a hospital. 400 women who chose to give birth at
#'    home and 2,000 women who gave birth in a hospital were studied. 
#'    The table below  summarizes the number of complications in each group. 
#'    
#'      a) Find the rate of complication in each group: 
#'         the home birth group and the hospital birth group.
#'      a) Do you think that this is an observational study or an experimental study? Why?
#'      a) The data suggest that it is safer (in the
#'         sense of a lower rate of complications) to give birth at home than to give
#'         birth in the hospital. Discuss whether this implies that a woman should
#'         consider giving birth at home in order to reduce her risk of complications.
#'         Identify at least one plausible confounding factor and one plausible
#'         mediating factor that could partly explain the results of the study.
#'      a) Choose a possible confounding factor and
#'         use a MC diagram to show how controlling for this confounding
#'         factor could reverse the direction of association between the rate of
#'         complications and the location of birth: home or hospital.
#' 
#+ echo=FALSE,results='asis' 
             library(knitr)
             library (kableExtra)
             z <- cbind(` Complications `=c(20,200,220), ` No Complications ` = c(380,1800,2180), ` Total ` = c(400,2000,2400))
             rownames(z) <- c('Home Births','Hospital Births','Total')
             kable(z,'html') %>% kable_styling(full_width=F)
#' ----
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
#'     a) Draw a MC diagram conditioning on the gender
#'        with restaurant on the horizontal axis and average ratings on the 
#'        vertical axis to explain how this apparent contradiction could arise. 
#'     a) Draw a causal graph describing the relationships among the three variables: restaurant,
#'        gender and ratings.
#'     a) Assuming that there are no other significant factors related to restaurant ratings,
#'        what kind of variable is gender in this context?
#'     a) Which restaurant should Mary choose? Why?
#'     a) Add an appropriate 'do-line' to the MC diagram.
#'
#' 5. Fedor is choosing between restaurants A and B 
#'    to take his friend, Jaspreet, out
#'    for dinner.  Restaurant A has an average rating of 4.1 
#'    and restaurant B of 4.3.\newline 
#'    \newline
#'    Each restaurant has six waiters.
#'    Restaurant A has one good waiter and 5 bad ones.
#'    Restaurant B has 5 good waiters and 1 bad one. 
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
#'     a) Draw a MC diagram conditioning on the quality
#'        of the waiter with restaurant on the horizontal axis and average ratings on the 
#'        vertical axis to explain how this apparent contradiction could arise. 
#'     a) Draw a causal graph describing the relationships among the three variables: restaurant,
#'        quality of waiter and ratings.
#'     a) Assuming that there are no other significant factors related to restaurant ratings,
#'        what kind of variable is the quality of the waiter in this context?
#'     a) Which restaurant should Fedor choose? Why?
#'     a) Add an appropriate 'do-line' to the MC diagram.
#' 
##+ Questions not yet classified ----
#' # Questions to be classified
#' 
#' Many or these questions ask you to write a function to accomplish some goal, instead of
#' just requiring an expression. The advantage of writing a function is you can
#' easily test your code by trying your function on extreme or impossible values. 
#' 
#' 1. What output will the following R script produce? Explain briefly why.<br>
#'    `x <- c(TRUE, FALSE, 0L)`<br>
#'    `typeof(x)`
#' 1. What output will the following R script produce? Explain briefly why.<br>
#'    `TRUE | NA`
#' 1. Let x be defined as:<br>
#'    `x <- c('0','10','5','20','15','10','0','5')`<br>
#'    Write an R function that would turn x into a factor whose ordering corresponds 
#'    to the numerical ordering of x.
#' 1. In R, let `x <- 1:5`. What output would `x[NA]` produce? What output would `x[NA_real_]` produce? 
#'    Describe the reason for the difference, if any.
#' 1. In R, describe the result of subsetting a vector with positive integers, 
#'    with negative integers, with a logical vector, or with a character vector?
#' 1. In R, what’s the difference between `[`, `[[`, and `$` when applied to a list?
#' 1. In R, when subsetting with `[`, when should you use `drop = FALSE`? 
#'    Include arrays and factors in your discussion.
#' 1. In R, if `x` is a matrix, what does `x[] <- 0` do? How is it different from `x <- 0`?
#' 1. In R, how can you use a named vector to relabel a categorical variable?
#' 1. In R, if `mtcars` is a data frame, why does `mtcars[1:20]` return an error? 
#'    How does it differ from the similar `mtcars[1:20, ]`?
#' 1. Fix each of the following common data frame subsetting errors in R:<br>
#'    `mtcars[mtcars$cyl = 4, ]`<br>
#'    `mtcars[-1:4, ]`<br>
#'    `mtcars[mtcars$cyl <= 5]`<br>
#'    `mtcars[mtcars$cyl == 4 | 6, ]`<br>
#' 1. In R, if `df` is a data frame, what does `df[is.na(df)] <- 0` do? How does it work?
#' 1. Create the vector (20,19,…,2,1) in R.
#' 1. Create the vector (1,2,3,…,19,20,19,18,…,2,1) in R.
#' 1. Create the vector (4,4,…,4,6,6,…,6,3,3,…,3) in R, where there are 10 occurrences of 4, 20 of 6 and 30 of 3.
#' 1. Write a function in R to calculate the following $\Sigma_{i=1}^{n}(i^3+4i^2)$. Test it including 'incorrect' input.
#' 1. Generate in R a vector of 30 labels: ‘label 1’, ‘label 2’, … ‘label 30’
#' 1. Let `y <- sample(1000, 30, replace = TRUE)`. Write functions in R to do the following. Test each function.
#'     a) Determine how many elements of y are multiples of 2.
#'     b) Determine how many elements of y are equal to 7 mod 13.
#'     c) Determine how many elements of y are within 200 of the maximum value.
#'     d) Determine how many elements of y are less than the previous element.
#'     e) Determine how many elements of y are an exact square.
#'     f) Determine how many elements of y are prime.
#' 1. Suppose data for a variable in R representing dollars has been entered in a variety of formats: 
#'    ‘$1,000.00’,‘1000.00’,‘$1’. 
#'    Write a function in R that transforms the variable to a numeric variable 
#'    in dollars to the nearest cent.
#' 1. Write a function in R that takes a character vector and collapses multiple 
#'    adjoining blanks in each element to a single blank.
#' 1. Write a function in R that accepts a data frame as input and returns a data frame
#'    in which every variable whose name starts with the letter ‘X’ and ends in a number has
#'    been removed.
#' 1. Create a 6 by 10 matrix of random integers in R as follows:<br>
#'    `set.seed(75)`<br>
#'    `m <- matrix(sample(10, 60, replace = T), nrow = 6)`
#' 1. Write a function to find the number of entries in each row of a matrix that are greater than 4.
#' 1. (continued from the previous question) Write a function to find how many rows 
#'    have exactly two instances of the number 7.
#' 1. Describe the difference in R between `paste(x, y, sep = ':')` and `paste(x, y, collapse = ':')`. Illustrate.
#' 1. Using the `hs` data set in the `spida2` package, 
#'    create a plot with two panels showing histograms displaying the 
#'    distribution of school sizes in the Public and in the Catholic sectors. 
#'    Use the functions `capply` and `up` in the `spida2` package. 
#'    You may also use any other approach to compare with the use of `capply` and `up`.
#' 1. Using the `hs` data set in the `spida2` package, create a plot with two panels showing 
#'    histograms displaying the distribution of sample sizes in each school in the 
#'    Public and in the Catholic sectors. 
#'    Use the functions `capply` and `up` in the `spida2` package. 
#'    You may also use any other approach to compare with the use of `capply` and `up`.
#' 1. Using the `hs` data set in the `spida2` package, create a plot with 
#'    two panels showing scatterplots displaying the relationship between mean `mathach` and mean `ses` 
#'    in each school in the Public and in the Catholic sectors. 
#'    Explore reasonable transformations and regression lines: 
#'    linear and non-parametric in the plots. 
#'    Use the functions `capply` and `up` in the `spida2` package. 
#'    You may also use any other approach to compare with the use of `capply` and `up`.
#' 1. Describe the difference in R between a generic function and a method.
#' 1. [Warwick] Create the vectors:
#'     a. (1,2,3,...,19,20)
#'     b. (20,19,...,2,1)
#'     c. (1,2,3,...,19,20,19,18,...,2,1)
#'     d. (4,6,3) and assign it to the name 'tmp'
#'     e. (4,6,3,4,6,3,...,4,6,3) where there are 10 occurrences of 4 (Hint: ?rep)
#'     f. (4,6,3,4,6,3,...,4,6,3,4) where there are 11 occurrences of 4 and 10 of 6 and 3
#'     g. (4,4,...,4,6,6,...,6,3,3,...,3) where there are 10 occurrences of 4, 20 of 6 and 30 of 3.
#' 2. [Warwick] Create the vector of the values of $e^x \cos(x)$ at $x=3, 3.1, 3.2, ..., 6$.
#' 3. [Warwick] Create the following vectors:
#'     a. $(0.1^3 0.2^1, 0.1^6 0.2^4, ... , 0.1^{36} 0.2^{34} )$
#'     b. $\left({2,\frac{2^2}{2},\frac{2^3}{3},...,\frac{2^{25}}{25}}\right)$      
#' 4. [Warwick] Calculate the following:
#'     a. $\sum_{i=10}^{100} (i^3 + 4i^2)$
#'     b. $\sum_{i=1}^{25} \left({\frac{2^i}{i} + \frac{3^i}{i^2}}\right)$
#' 5. [Warwick] Use the function 'paste' to create the following character vectors of length 30:
#'     a. <tt>("label 1", "label 2", ... , "label 30")</tt>. 
#'        Note that there is a single space
#'        between <tt>label</tt> and the number following.
#'     b. <tt>("fn1", "fn2", ..., "fn30")</tt>. In this case there is no space.
#' 6. [Warwick] Execute the following lines which create two vectors of random integers which 
#'    are chosen with replacement from the integers 0, 1, ..., 999. Both vectors have length 250.
#'    <pre><code> set.seed(50)
#'      xVec <- sample(0:999, 250, replace = T)
#'      yVec <- sample(0:999, 250, replace = T)</code></pre>  
#'    Suppose $\mathbf{x} = (x_1, x_2, ..., x_n)$ denotes the vector <tt>xVec</tt> and similarly
#'    for $\mathbf{y}$. 
#'      a. Write a function that returns the vector $(y_2 - x_1, ..., y_n - x_{n-1})$
#'      b. Write a function that returns the vector $\left({\frac{\sin(y_1)}{\cos(x_2)},\frac{\sin(y_2)}{\cos(x_3)},...,\frac{\sin(y_{n-1})}{\cos(x_n)} }\right)$  
#'      c. Write a function that returns the vector $(x_1 + 2x_2 - x_3, x_2 + 2 x_3 - x_4, ..., x_{n-1} + 2x_{n-1} - x_n)$
#'      d. Write a function that calculates $\sum_{i=1}^{n-1}\left.\frac{e^{-x_{i+1}}}{x_i + 10}\right.$
#' 7. [Warwick] This question uses the vectors <tt>xVec</tt> and <tt>yVec</tt> created in the 
#'    previous question and the 
#'    functions <tt>sort</tt>, <tt>order</tt>, <tt>mean</tt>, <tt>sqrt</tt>, <tt>sum</tt> and <tt>abs</tt>.
#'      a. Write a function that returns the values in <tt>yVec</tt> which are > 100.
#'      b. Write a function that returns the index positions in <tt>yVec</tt> of the values which are > 600?
#'      c. Write a function that returns the values in <tt>xVec</tt> 
#'         which correspond to the values in <tt>yVec</tt> which are > 600?
#'      d. Create the vector 
#'         $\left(
#'         \left|x_1-\bar{\mathbf{x}}\right|^{1/2},
#'         \left|x_2-\bar{\mathbf{x}}\right|^{1/2},...,
#'         \left|x_n-\bar{\mathbf{x}}\right|^{1/2}\right)$      
#'      e. Write a function that returns how many values in '<tt>yVec</tt>' are within 200 of the maximum value of the terms in '<tt>yVec</tt>'?
#'      f. Write a function that sort the numbers in the vector '<tt>xVec</tt>' in the order of increasing values in '<tt>yVec</tt>'.
#'      g. Write a function that returns how many numbers in '<tt>xVec</tt>' are divisible by 2?
#'      h. Write a function that returns the elements in '<tt>yVec</tt>' at index positions 1,4,7,10,13,...
#' 8. [Warwick] By using the function <tt>cumprod</tt> or otherwise, write a function that calculates 
#'    $$ 1 + \frac{2}{3} +\frac{2}{3}\frac{4}{5} + \frac{2}{3}\frac{4}{5}\frac{6}{7}+...+\frac{2}{3}\frac{4}{5}...\frac{38}{39}$$
#' 9. [Regular expressions] Suppose money data for a variable has been entered 
#'    in a variety of
#'    formats, e,g. <br>
#'    "$1,000.00", "1000.00", "123.2$"<br>
#'    Write an R function using 'gsub' and
#'    'as.numeric' to turn these various entries into a numeric variable. Experiment with your 
#'    function to make sure it works.
#' 10. [Regular expressions] Write a function that takes a character vector and collapses
#'     multiple adjoining blanks into a single blank.
#' 11. [Regular expressions] Use the file [SampleClassFile.csv](SampleClassFile.csv). One of its variables is a
#'     string that contains information about a student's faculty and programme: are they in
#'     an ordinary programme or in an honours program and the department of their major and
#'     minor.  Write a function that uses regular expression to create four new variables:
#'     the faculty in which a student is enrolled, whether they are in an ordinary or in
#'     an honours programme, their major program and their minor program if any. 
#' 11. [Regular expressions] Suppose you have a vector of names, such as:
#'     <pre>
#'         Mary Jones
#'         Tarik Mohammed
#'         Smith, Jim
#'         Tom O'Brian
#'         Victor Lindquist
#'         Chow, Vincent
#'         Wong, Mary
#'     </pre>
#'     Some names are in the format 'First Last' and others 'Last, First'. Write a
#'     function to extract the full names, in the format 'Last, First', of all the individuals
#'     whose first name is 'Mary'.     
#' 12. [Merging and reshaping] Use the site Gapminder.org to download at least three longitudinal variables
#'     into separate data sets. Merge the data sets into one for which each row represents
#'     one country and year and contains the values of each of the three variables you downloaded.
#'     Display how these variables change over time.
#' 14. [Regular expressions] Write a function that removes every variable whose
#'     name starts with the letter 'X' and ends in a number from a data frame.
#' 15. [Data] Write a function that takes a data frame and returns it with
#'     variable names in alphabetical order.     
#' 1. [Warwick] Suppose 
#'    $$\mathbf{A}= \begin{bmatrix} 1 & 1 & 1 \\ 5 & 2 & 6 \\ -1 & -1 & -3\end{bmatrix}$$
#'       a. Check that $\mathbf{A}^3 = \mathbf{0}$ where $\mathbf{0}$ is a $3 \times 3$ matrix with every entry equal to 0.
#'       b. Replace the third column of $\mathbf{A}$ by the sum of the second and third columns.
#' 2. [Warwick] Create the following matrix $\mathbf{B}$ with 15 rows:
#'    $$\mathbf{A}= \begin{bmatrix} 10 & -10 & 10 \\ 10 & -10 & 10 \\ \vdots & \vdots & \vdots \\10 & -10 & 10\end{bmatrix}$$
#'    Calculate the $3 \times 3$ matrix $\mathbf{B}^T\mathbf{B}$. Consider: <tt>?crossprod</tt>
#' 3. [Warwick] Create a $6 \times 6$ matrix '<tt>matE</tt>' with every entry equal to 0. Check what the functions
#'    '<tt>row</tt>' and '<tt>col</tt>' return when applied to '<tt>matE</tt>'. Hence create the $6 \times 6$ matrix:
#'    $$\begin{bmatrix} 
#'    0 & 1 & 0 & 0 & 0 & 0 \\ 1 & 0 & 1 & 0 & 0 & 0 \\
#'    0 & 1 & 0 & 1 & 0 & 0 \\ 0 & 0 & 1 & 0 & 1 & 0 \\
#'    0 & 0 & 0 & 1 & 0 & 1 \\ 0 & 0 & 0 & 0 & 1 & 0 \end{bmatrix}$$ 
#' 4. [Warwick] Look at <tt>?outer</tt>. Hence create the following patterned matrix:
#'    $$\begin{bmatrix} 
#'    0 & 1 & 2 & 3 & 4 & 5 \\ 1 & 2 & 3 & 4 & 5 & 6 \\
#'    2 & 3 & 4 & 5 & 6 & 7 \\ 3 & 4 & 5 & 6 & 7 & 8 \\
#'    4 & 5 & 6 & 7 & 8 & 9 \\ 5 & 6 & 7 & 8 & 9 & 10 \end{bmatrix}$$ 
#' 5. [Warwick] Create the following patterned matrices. In each case, your solution should make use of the special form
#'    of the matrix -- this means that the solution should easily generalize to creating a larger matrix with the
#'    same structure and should not involve typing in all the entries in the matrix.
#'       a. $\begin{pmatrix} 
#'          0 & 1 & 2 & 3 & 4 & 5 \\ 1 & 2 & 3 & 4 & 5 & 0 \\
#'          2 & 3 & 4 & 5 & 0 & 1 \\ 3 & 4 & 5 & 0 & 1 & 2 \\
#'          4 & 5 & 0 & 1 & 2 & 3 \\ 5 & 0 & 1 & 2 & 3 & 4 \end{pmatrix}$
#'       b. $\begin{pmatrix} 
#'          0 & 5 & 4 & 3 & 2 & 1 \\ 1 & 0 & 5 & 4 & 3 & 2 \\
#'          2 & 1 & 0 & 5 & 4 & 3 \\ 3 & 2 & 1 & 0 & 5 & 4 \\
#'          4 & 3 & 2 & 1 & 0 & 5 \\ 5 & 4 & 3 & 2 & 1 & 0 \end{pmatrix}$
#' 6. [Warwick] Solve the following system of linear equations in five unknowns
#'    $$\begin{eqnarray}
#'    x_1 + 2x_2 + 3x_3 + 4x_4 +5 x_5 &=& 7 \\
#'    2x_1 + x_2 + 2x_3 + 3x_4 +4 x_5 &=& -1 \\
#'    3x_1 + 2x_2 + x_3 + 2x_4 +3 x_5 &=& -3 \\
#'    4x_1 + 3x_2 + 2x_3 + x_4 +2 x_5 &=& 5 \\
#'    5x_1 + 4x_2 + 3x_3 + 2x_4 +x_5 &=& 17 
#'    \end{eqnarray}$$
#'    by considering and appropriate matrix equation $\mathbf{A}\mathbf{x}=\mathbf{y}$.<br>
#'    Make use of the special form of the matrix $\mathbf{A}$. The method used for the solution should easily
#'    generalize to a larger set of equations where the matrix $\mathbf{A}$ has the same structure.
#' 7. [Warwick] Create a $6 \times 10$ matrix of random integers chose from $1,2,...10$ by executing the folllowing two lines 
#'    of code:<pre><code>
#'    set.seed(75)
#'    aMat <- matrix( sample(10, size = 60, replace = T), nr = 6)
#'    </code></pre>
#'       a. Write a function to find the number of entries in each row which are greater than 4.
#'       b. Write a function to find which rows contain exactly two occurrences of the number seven.
#'       c. Find those pairs of columns wose total (over both columns) is greater than 75.
#'          The answer should be a matrix with two columns; so, for example, 
#'          the row (1,2) in the output matrix means
#'          that the sum of columns 1 and 2 in the original matrix is greater than 75. 
#'          Repeating a column
#'          is permitted; so, for example, the final output matrix 
#'          could contain the rows (1,2),(2,1) and (2,2).<br>
#'          What if repetitions are not permitted? Then, only (1,2) from (1,2), (2,1) and (2,2)
#'          would be permitted.
#' 8. [Warwick] Calculate:
#'        a. $\sum_{i=1}^{20} \sum_{j=1}^{5} \frac{i^4}{(3+j)}$
#'        b. (Hard) $\sum_{i=1}^{20} \sum_{j=1}^{5} \frac{i^4}{(3+ij)}$
#'        c. (Even harder!) $\sum_{i=1}^{10} \sum_{j=1}^{i} \frac{i^4}{(3+ij)}$
#' 1. [Warwick] 
#'     a. Write functions '<tt>tmpFn1</tt>' and '<tt>tmpFn2</tt>' such that if '<tt>xVec</tt>' is the vector
#'        $(x_1, x_2, ..., x_n)$,
#'        then '<tt>tmpFn1(xVec)</tt>' returns the vector
#'        $(x_1,x_2^2,...,x_n^n)$ 
#'        and '<tt>tmpFn2(xVec)</tt>' returns the vector
#'        $\left({x_1,\frac{x_2^2}{2},...,\frac{x_n^n}{n}}\right)$ 
#'     b. Now write a function '<tt>tmpFn3</tt>' which takes two arguments $x$ and $n$ where $x$ is a
#'        single number and $n$   is a strictly positive integer. The function should return
#'        the value of
#'        $$1 + \frac{x}{1}  + \frac{x^2}{2}  + \frac{x^3}{3}  + ... + \frac{x^n}{n}$$
#' 2. [Warwick] Write a function '<tt>tmpFn(xVec)</tt>' such that if '<tt>xVec</tt>' is the vector 
#'    $\mathbf{x}=(x_1,...,x_n)$
#'    then '<tt>tmpFn(xVec)</tt>' returns the vector of moving averages:
#'    $$\frac{x_1 + x_2 + x_3}{3}, \frac{x_2 + x_3 + x_4}{3}, ... ,\frac{x_3 + x_4 + x_5}{3}$$ 
#'    Try out your function; for example, try '<tt>tmpFn( c(1:5,6:1))</tt>'
#' 3. [Warwick] Consider the continuous function:
#'    $$f(x) =  
#'    \begin{cases}
#'    x^2 + 2x + 3 & \quad \text{if } x < 0 \\
#'    x+3          & \quad \text{if } 0 \le x \lt 2 \\ 
#'    x^2 + 4x - 7 & \quad \text{if } 2 \le x \\
#'    \end{cases}$$
#'    Write a function <tt>tmpFn</tt> which takes a single argument '<tt>xVec</tt>'. The function should 
#'    return the vector of values of the function $f(x)$ evaluated at the values in '<tt>xVec</tt>'.<br>
#'    Hence plot the function $f(x)$ for $-3 \lt x \lt 3$.
#' 4. [Warwick] Write a function which takes a single argument which is a matrix. The function should
#'    return a matrix which is the same as the function argument but every odd number is doubled.
#' 5. [Warwick] Write a function which takes two arguments '<tt>n</tt>' and '<tt>k</tt>' which are positive integers.
#'    It should return the $n \times n$ matrix:
#'    $$\begin{bmatrix}
#'    k & 1 & 0 & 0 & \cdots & 0 & 0 \\
#'    1 & k & 1 & 0 & \cdots & 0 & 0 \\
#'    0 & 1 & k & 1 & \cdots & 0 & 0 \\
#'    0 & 0 & 1 & k & \cdots & 0 & 0 \\
#'    \vdots & \vdots & \vdots & \vdots & \ddots & \vdots & \vdots \\
#'    0 & 0 & 0 & 0 & \cdots & k & 1 \\
#'    0 & 0 & 0 & 0 & \cdots & 1 & k \\
#'    \end{bmatrix}$$
#' 6. [Warwick] Suppose an angle $\alpha$ is given as a positive real number of degrees counting counter-clockwise
#'    from the positive horizontal axis. Write a function <tt>quadrant(alpha)</tt> which returns
#'    the quadrant, 1, 2, 3 or 4, corresponding to '<tt>alpha</tt>'.
#' 7. [Warwick] 
#'       a. Zeller's congruence is the formula:
#'          $$f = ([2.6m-0.2] + k + y + [y/4] + [c/4] - 2c) \mod 7$$
#'          where $[x]$ denotes the integer part of $x$; for example $[7.5]=7$.<br>
#'          Zeller's congruence returns the day of the week $f$ given:<br>
#'               $k =$ the day of the month,<br>
#'               $y =$ the year in the century,<br>
#'               $c =$ the first 2 digits of the year (the century number)<br>
#'               $m =$ the month number (where January is month 11 of the preceding year, February is month 12 of the preceding year, March is month 1, etc)
#'          For example, the data July 21, 1963 has $m=5, k = 21, c=19, y = 63$; while the date
#'          February 21, 1963 has $m=12, k=21, c=19$ and $y=62$.<br>
#'          Write a function '<tt>weekday(day, month, year)</tt>' which returns the day of the week
#'          when given the numerical inputs of the day, month and year.<br>
#'          Note that the value 1 for $f$ denotes Sunday, 2 denotes Monday, etc.
#'       b. Does your function work if the input parameters '<tt>day</tt>', '<tt>month</tt>' and '<tt>year</tt>' are
#'          vectors with the same length and with valid entries?
#' 8. [Warwick] 
#'       a. Suppose $x_0=1$ and $x_1=2$ and
#'          $$x_j = x_{j-1}+\frac{2}{x_{j-1}} \qquad \text{for }j= 1,2,...$$
#'          Write a function '<tt>testLoop</tt>' which takes a single argument $n$ and returns
#'          the first $n-1$ values of the sequence $\{x_j\}_{j \ge 0}$, that is, the values of
#'          $x_0, x_1, x_2, ... , x_{n-2}$.
#'       b. Now write a function '<tt>testLoop2</tt>' which takes a single argument 
#'          '<tt>yVec</tt>' which is a vector.
#'          The function should return
#'          $$\sum_{j=1}^{n} e^j$$
#'          where $n$ is the length of '<tt>yVec</tt>'
#' 9. [Warwick] _Solution of the difference equation_ 
#'    $x_n = r x_{n-1}(1 - x_{n-1})$ 
#'    _with starting values_ $x_1$.
#'       a. Write a function '<tt>quadmap(start, rho, niter)</tt>' which returns the vector
#'          $(x_1, ....,. x_n)$
#'          where
#'          $x_k=r x_{k-1}(1 - x_{k-1})$ and <br>
#'          $\quad$ '<tt>niter</tt>' denotes $n$,<br>
#'          $\quad$ '<tt>start</tt>' denotes $x_1$, and<br>
#'          $\quad$ '<tt>rho</tt>' denotes $r$.<br>
#'          Try out the function you have written:
#'            -  for $r=2$ and $0 < x_1 < 1$ you should get 
#'               $x_n \rightarrow 0.5$ as 
#'               $n \rightarrow \infty$.
#'            -  try '<tt>tmp <- quadmap(start=0.95, rho=2.99, niter=500)</tt>'
#'          Now type:
#'          <pre><code>plot(tmp, type = 'l')</code></pre>
#'          Also try <tt>'plot(tmp[300:500], type = 'l')</tt>'
#'       b. Now write a function which determines the number of iterations needed to get
#'          $| x_n - x_{n-1}| < 0.02$. This function has only 
#'          2 arguments: '<tt>start</tt>' and '<tt>rho</tt>'. 
#'          (For '<tt>start = 0.95</tt>' and '<tt>rho=2.99</tt>', the answer is 84.) 
#' 10. [Warwick] Given a vector 
#'     $(x_1, ... ,x_n)$,
#'     the sample autocorrelation of lag $k$ is defined to be
#'     $$r_k = \frac{\sum_{i=k+1}^{n}(x_i-\bar{x})(x_{i-k}-\bar{x})}{\sum_{i=1}^{n}(x_i-\bar{x})^2}$$
#'       a. Write a function '<tt>autocor(xVec)</tt>' which takes a single
#'          argument '<tt>xVec</tt>' which is a vector and returns a
#'          list of two values: $r_1$ and $r_2$.<br>
#'          In particular, find $r_1$ and $r_2$ for the vector
#'          $(2, 5, 8, ..., 53, 56)$.
#'       b. (Harder) Generalize the function so that it takes two arguments: 
#'          the vector '<tt>xVec</tt>' and an integer '<tt>k</tt>' which lies between 1 and 
#'          $n-1$ where $n$ is the length of '<tt>xVec</tt>'.
#'          The function should return a vector of the values
#'          $(r_0 = 1, r_1, ..., r_k)$. <br>
#'          If you used a loop to answer part (b), then you need to be 
#'          aware that much, much better solutions are possible. Hint: '<tt>sapply</tt>'.
#'
#' # References
#'               
