#' ---
#' title: "MATH 4939: Statistical Data Analysis Using SAS and R"
#' date: "Winter 2024"
#' author: ""
#' output:
#'   html_document:
#'     toc: true
#'     toc_float: 
#'       collapsed: false
#'     toc_depth: 3
#'     theme: readable
#' bibliography: 4939.bib
#' link-citations: yes
#' ---
#' \newcommand{\E}{\mathrm{E}}
#' \newcommand{\Var}{\mathrm{V\:\!\!ar}}
#' \newcommand{\mat}[1]{\begin{pmatrix}#1\end{pmatrix}}
#+ include=FALSE 
# TODO:

##+ Day 16 ----
#' ## __Day 16__: Monday, February 14 
#'
#' __Team today:__ Chen
#' 
#' __Class links:__
#' 
#' Continued from last class
#' 
#' - [Plotting with Lattice](files/Mixed_Models/latticeExtra_examples.R)
#' - [Multilevel Mixed Models](files/Mixed_Models/Hierarchical_Models.pdf)
#' - Updated files are in [this folder](files/Mixed_Models/).
#' - [R script to play with Multilevel Models: Lab 1.R](files/Mixed_Models/Lab_1.R)
#' - [Added-Variable Plot (Frisch-Waugh-Lovell Theorem) and the Linear Propensity Score Theorem](files/FWL/Three_Basic_Theorems.pdf)
#'
##+ ### Assignment 5 (individual) ------
##' ### __Assignment 5__ (individual)
#'  
#' __Due:__ <s>Tuesday, March 1</s>Sunday, March 6
#' 
#' The purpose of this assignment is to give everyone a chance to 
#' work individually 
#' with the data for the project in preparation for collaboration
#' with your team. 
#'
#' We will study methods to work with this kind of data over
#' the next few weeks.
#'  
#' The data are contained in an
#' Excel file at http://blackwell.math.yorku.ca/MATH4939_2018/data_private/.
#' Use the
#' userid and password provided in class. Please do not post the
#' userid and password in any public posting, e.g. on Piazza.
#' You may post them in 'Private' posts to your team.
#' The data should be treated as
#' confidential and may be used only for the purposes of this course.
#' 
#' The data consist of longitudinal volume measurements for
#' a number of patients being treated after traumatic brain injuries (TBI),
#' e.g. from car accidents or falls, and similar data from
#' a number of control subjects without brain injuries.
#' 
#' The goal of the study is to 
#' identify whether some brain structures are subject to a rate of
#' shrinkage after TBIs that is greater than the rate normally associated
#' with aging. It is thought that some structures, particularly portions 
#' of the
#' hippocampus may be particularly affected after TBI.
#' 
#' You will be able to work with this data set as we explore ways of
#' of working with multilevel and longitudinal data. It's a real data
#' set with all the flaws that are typical of real data sets.
#' 
#' A first task will be to turn the data from a 'wide file' with one
#' row per subject to a long file with one row per 'occasion'.
#' Note that variables
#' with names that end in ’_1’, ’_2’, etc. are longitudinal variables,
#' i.e. variables measured on different occasions at different points in time. 
#' 
#' A good way to transform variable names if they aren't in the right form
#' is to use substitutions with regular expressions.
#' 
#' A good way to transform the data set from 'wide' form to 'long' form
#' is to use the 'tolong' function in the 'spida2' package but you 
#' are welcome to use other methods that can be implemented through a
#' script in R, i.e. not manipulating the data itself.  You might find section 9, 
#' particularly section 9.4, of the following notes helpful:
#' 
#' - [Working with Data](R/Working_with_Data.pdf)
#' 
#' Most of
#' the variables are measures of the volume of components of the brain:
#'  
#' - ‘HC’ refers to the hippocampus that has several parts, 
#' - ‘CC’ to the corpus callosum, 
#' - ‘GM’ is grey matter, 
#' - ‘WM’ is white matter, 
#' - ‘VBR’ is the ventricle to brain ratio. Ventricles are ‘holes’ 
#'   in your brain that are filled with
#'   cerebro-spinal fluid so VBR measures how big the holes in your brain are
#'   compared with the 'solid' matter. If the brain volume shrinks, 
#'   the total volume
#'   of the cranium remains the same so VBR goes up. 
#'   
#' I hope that you will be curious to know something about these various
#' parts of the brain and that you will exploit the internet to get
#' some information.
#'   
#' The ids are numerical for
#' patients with brain injuries and have the form ‘c01’, ‘c02’ etc for control
#' subjects. The variable ‘date_1’ contains the date of injury and ‘date_2’,
#' ‘date_3’, etc., the dates on which the corresponding brain scans were
#' performed. 
#' 
#' You might like to have a look at fixing dates
#' in [Wrangling Messy Spreadsheets into Useable Data](files/Mixed_Models/Messy_data.html#fix-time) 
#' for some ideas on using dates to extract, for example, the elapsed time
#' between two dates as a numerical variable. 
#' 
#' Plot some key variables: VBR,
#' CC_TOT, HPC_L_TOT, HPC_R_TOT against elapsed time since injury using
#' appropriate plots to convey some idea of the general patterns in the data.
#' Remember that any changes to the data must be done in R. __Do not edit the
#' Excel file.__ Comment on what you see. Make a table (using a command in R, of
#' course) showing how many observations are available from each subject. Create
#' a posting entitled ‘Assignment 6’ to Piazza in which you Upload your
#' Rmarkdown .R file and the html file it produces. Make it Private to the
#' instructor until the deadline.
#'
#' <!-- 
##+ ### Assignment 7 (individual) ------
##' ### Assignment 7 (individual)
#'
#' - Due: Monday, March 22 at 11:59 pm
#' - Put your work in an R markdown file and run it. Post your results 
#'   privately to the Instructors using the folder 'assn8' on Piazza.
#' - Don't forget to add a link in your LOG  file.
#' - Post both the R markdown script file and the pdf output it produces.<br>
#'   Using the 'hs' data among public schools only, fit the following models:
#'     1. Regress 'mathach' on 'ses'
#'     2. Create variables, 'ses_mean' and 'mathach_mean' equal to the mean 
#'        of each variables within each school and regress 'mathach_mean' on
#'        'ses_mean' in two ways: regressing on all students and regressing
#'        with one observation per school.
#'     3. Create a variable 'ses_dev' equal to 'ses' - 'ses_mean'. 
#'        Regress 'mathach' on 'ses_dev' + 'ses_mean'.
#'     4. Regress 'mathach' on 'ses' + 'ses_mean'.
#'     5. Regress 'mathach' on 'ses' + a factor for schools.
#'     6. Use a mixed effects model to regress 'mathach' on 'ses' with
#'        a random intercept for each school.
#'     7. Use a mixed effects model to regress 'mathach' on 'ses' + 'ses_mean'
#'        with a random intercept for each school.
#'     8. Use a mixed effects model to regress 'mathach' on 'ses_dev' + 'ses_mean'
#'        with a random intercept for each school.
#'     9. Use a mixed effects model to regress 'mathach' on 'ses_dev' + 'ses_mean'
#'        with a random intercept and a random slope for 'ses_dev' for each school.
#'     9. Identify the equalities and inequalities in the estimated coefficients
#'        above that correspond to equalities and inequalities discussed in class.
#'     9. Discuss differences between the standard errors of corresponding estimated
#'        coefficients in models in lines
#'        4, 5, 7 and 8.
#'     9. Fit a model using data from both sectors allowing for different
#'        slopes with respect of 'ses_dev' and 'ses_mean' in each sector and
#'        a random intercept for each school. Estimate and construct a
#'        confidence interval for the difference in 
#'        expected 'mathach' for a student whose ses is 0 in a Public school with mean ses
#'        equal to -1 and a student whose ses is -1 in a Catholic school with mean ses
#'        equal to 0. 
#' -->
#' 
##+ Day 17 ----
#' ## __Day 17__: Wednesday, February 16 
#'
#' __Team today:__ Davidian
#' 
#' __Class links:__
#' 
#' Continued from last class
#' 
#' - [Plotting with Lattice](files/Mixed_Models/latticeExtra_examples.R)
#' - [Multilevel Mixed Models](files/Mixed_Models/Hierarchical_Models.pdf)
#' - Updated files are in [this folder](files/Mixed_Models/).
#' - [R script to play with Multilevel Models: Lab 1.R](files/Mixed_Models/Lab_1.R)
#' - [Added-Variable Plot (Frisch-Waugh-Lovell Theorem) and the Linear Propensity Score Theorem](files/FWL/Three_Basic_Theorems.pdf)
#'
##+ Day 18 ----
#' ## __Day 18__: Friday, February 18 
#'
#' __Team today:__ Efron
#' 
#' __Class links:__
#' 
#' 
#' New:
#' 
#' - [Mixed Model or Pooled Analysis: What's the Difference (in progress)](files/Mixed_Models/Mixed_Model_or_Pooled_Analysis.pdf)
#'   - [R script](files/Mixed_Models/Mixed_Model_or_Pooled_Analysis.R)
#' 
#' Continued from last class
#' 
#' - [Plotting with Lattice](files/Mixed_Models/latticeExtra_examples.R)
#' - [Multilevel Mixed Models](files/Mixed_Models/Hierarchical_Models.pdf)
#' - Updated files are in [this folder](files/Mixed_Models/).
#' - [R script to play with Multilevel Models: Lab 1.R](files/Mixed_Models/Lab_1.R)
#' - [Added-Variable Plot (Frisch-Waugh-Lovell Theorem) and the Linear Propensity Score Theorem](files/FWL/Three_Basic_Theorems.pdf)
#'
#'
##+ Day 19 ----
#' ## __Day 19__: Monday, February 28
#'
#' __Team Today:__ Since we're meeting in class, there won't be a daily team. Thank
#' you to all the teams for you participation.
#' 
#' __Project Teams:__ Some teams have 3 or fewer active members. We'll have
#' a discussion on the difficult question of possible reassignments.
#' 
#' __Scheduling oral midterm:__ I will put up a link on Piazza to schedule the
#' oral midterm around noon tomorrow (Tuesday) and will mail notification to everyone.
#' 
#' __Class links:__
#' 
#' Continued from last class
#' 
#' - [Plotting with Lattice](files/Mixed_Models/latticeExtra_examples.R)
#' - [Multilevel Mixed Models](files/Mixed_Models/Hierarchical_Models.pdf)
#' - Updated files are in [this folder](files/Mixed_Models/).
#' - [R script to play with Multilevel Models: Lab 1.R](files/Mixed_Models/Lab_1.R)
#' - [Added-Variable Plot (Frisch-Waugh-Lovell Theorem) and the Linear Propensity Score Theorem](files/FWL/Three_Basic_Theorems.pdf)
#'
#' __Sample questions for the midterm on March 5 and 6:__
#' 
#' - Have a look at the following questions from [Assignment 2](questions/m4939_questions_2022.html)
#'   - Basic R: 8.5, 12.1, 8.18, 8.36 (a) and (b)
#'   - Answering questions with data: review question 5, be prepared for a
#'     similar specific question with a possibly different data set and variables.
#' - Review quiz questions.
#' - Mixed model theory: In a normal linear mixed model to fit data with two levels, a response variable
#'   $Y$ and a single level-1 predictor $X$, $k$ clusters of size $n_i, i = 1 ,..., k$.  
#'   Suppose you use the R command `lme(Y ~ 1 + X, data, random = ~ 1 + X | id)`.
#'   Using the notation used in class for such a model:
#'   - Derive $\Var(\hat{\beta}_i)$ and $\Var(\hat{\beta}_i - \beta_i)$ where 
#'     $\beta_i$ is the 'true' vector
#'     of coefficients in the $i$th cluster and $\hat{\beta}_i$ is the BLUE
#'     for $\beta_i$ based on the data in cluster $i$.
#'   - Discuss which variance is relevant if one is using $\hat{\beta}_i$ to
#'     make inferences about cluster $i$ or to make inferences about the 
#'     population from which cluster $i$ is viewed as a sample.
#' - Gauss-Markov:
#'   - Use the Generalized Gauss-Markov Theorem to show that if you have two
#'     uncorrelated estimators, $\hat{\psi}_1$ and $\hat{\psi}_2$ of the same
#'     unknown parameter $\psi$ then the BLUE using these two estimators 
#'     is their weighted average using weights proportional to their inverse
#'     variance. Hint: Consider the expression:
#'     $$\mat{\hat{\psi}_1 \\ \hat{\psi}_2} = \mat{1\\1} \psi + \mat{\epsilon_1 \\ \epsilon_2}$$
#'   - Suppose you have two uncorrelated unbiased estimators for a parameter $\psi$. The
#'     value of the first estimator has variance 25 and value 5, the second
#'     estimator has variance 16 and value 10. What is the BLUE of $\psi$ 
#'     using these two estimators and what is its variance?
#' - Consider a regression of a continuous variable Y on a continuous variable X and a 
#'   dichotomous factor coded with an indicator variable G. 
#'   Consider a regression of Y on X and G with:   
#'   $$Y_i =  \beta_0 + \beta_1 X_i + \epsilon_i , \quad \epsilon_i \sim iid N(0,\sigma^2)$$
#'   In the multiple regression of Y on X and G both $\hat{\beta}_X$ and $\hat{\beta}_G$ are
#'   highly significant.  However, in simple regressions `Y ~ X` and  `Y ~ G` 
#'   neither predictor is significant.    
#'   Sketch plausible data that could exhibit this phenomenon in data space with axes for X
#'   and Y and group membership indicated by different characters. Also sketch a 
#'   plausible confidence ellipses for $(\beta_X, \beta_G)$. 
#' - The following questions refer to the output below for a mixed model fitted with the 
#'   full high school math achievement data set. The model uses 
#'   - SES, 
#'   - SES.School which is the mean SES in the sample in each school, 
#'   - ‘female’ which is an individual level indicator variable,  
#'   - ‘Type’ which is a three-level factor with levels 
#'     “Coed”, “Girl” and “Boy” with the 
#'     obvious definition, and 
#'   - Sector which is a 2-level factor with levels “Catholic” and “Public”. 
#'   a) Consider two Catholic ‘girl’ schools, one with mean SES = 0 and 
#'      the other with mean SES = 1. Suppose the values of SES in the former 
#'      school range from -1 to 1 and in the latter school from 0 to 2. Draw a 
#'      graph showing the predicted MathAch in these two schools over the 
#'      range of values of SES in each school. On your graph identify the value 
#'      and location of the contextual effect of SES, the within school effect of 
#'      SES and the compositional effect of SES. 
#'   b) Suppose you were to refit the model without SES.School. What 
#'      would you expect would happen to the coefficient for SES? Would it 
#'      stay roughly the same, get bigger or get smaller, or is the change 
#'      unpredictable? Explain. 
#'   c) Suppose you want to perform an overall test of the importance of 
#'      gender in the model, either within schools or between schools. Specify a 
#'      hypothesis matrix that would perform this test. 
#'   d) How would you estimate the difference between the predicted math achievement of 
#'      a boy in a boys’ school versus a girl in a girls’ school. If you suspected 
#'      that this is affected by the SES of the school, how would you modify the 
#'      model to test this hypothesis?
#' 
#' ![output](files/HS_output.png)       
#' 
##+ Day 20 ----
#' ## __Day 20__: Wednesday, March 2 
#'
#' __Class links:__
#' 
#' Continued from last class:
#' 
#' - [Interpreting Contextual and Compositional Effects](files/Mixed_Models/Interpreting_Contextual_and_Compositional_Effects.pdf)
#' - Updated files are in [this folder](files/Mixed_Models/).
#' - [R script to play with Multilevel Models: Lab 1.R](files/Mixed_Models/Lab_1.R)
#' - [Added-Variable Plot (Frisch-Waugh-Lovell Theorem) and the Linear Propensity Score Theorem](files/FWL/Three_Basic_Theorems.pdf)
#'
#' New:
#' 
#' - [Longitudinal Models](files/Mixed_Models/Longitudinal_Models.pdf)
#' - [R script to play with Longitudinal Models: Lab 2.R](files/Mixed_Models/Lab_2.R)
#' 
#' 
##+ Day 21 ----
#' ## __Day 21__: Friday, March 4 
#'
#' __Class links:__
#' 
#' - [Longitudinal Models](files/Mixed_Models/Longitudinal_Models.pdf)
#' - [R script to play with Longitudinal Models: Lab 2.R](files/Mixed_Models/Lab_2.R)
#' - Updated files are in [this folder](files/Mixed_Models/).
#' 
##+ Day 22 ----
#' ## __Day 22__: Monday, March 7 
#'
#' __Class links:__
#' 
#' Continued from last class:
#' 
#' - [Longitudinal Models](files/Mixed_Models/Longitudinal_Models.pdf)
#' - [R script to play with Longitudinal Models: Lab 2.R](files/Mixed_Models/Lab_2.R)
#' - Updated files are in [this folder](files/Mixed_Models/).
#' 
##+ Day 23 ----
#' ## __Day 23__: Wednesday, March 9
#'
#' __Class links:__
#' 
#' Continued from last class:
#' 
#' - [Longitudinal Models](files/Mixed_Models/Longitudinal_Models.pdf)
#' - [R script to play with Longitudinal Models: Lab 2.R](files/Mixed_Models/Lab_2.R)
#' - Updated files are in [this folder](files/Mixed_Models/).
#' 
##+ Day 24 ----
#' ## __Day 24__: Friday, March 11 
#'
#' __Class links:__
#' 
#' __Project:__
#' 
#' - Consult the description of the project in the 
#'   [course description](files/description.html#Course_work_and_grades)
#' - Each team should now create a post that is private to the team
#'   entitle 'Project Diary'. Each member of the team should log
#'   their work on the project by editing this post. You can also
#'   use it to keep track of 'to do lists' and the progress of
#'   the project.
#' - Your task is to study and report on the changes in brain volume
#'   after traumatic brain injury (TBI), comparing patients with controls
#'   in order detect whether TBI patients exhibit changes beyond
#'   what would be expected as a normal consequence of aging.
#'   Each team should focus on one component of the brain:
#'   - Anscombe: Ventricular Brain Ratio: VBR
#'   - Blackwell: Left hippocampus: HC_L_TOT
#'   - Chen: Right hippocampus: HC_R_TOT
#'   - Davidian: Anterior corpus callosum: CC_ant  
#'   - Efron: Posterior corpus callosum: CC_post  
#' - I will post a calendar for team to schedule a meeting with me
#'   at some time over the next two weeks.
#' - The deadline for the finished written materials is the last day of term.
#' - Presentations will be scheduled during the last 3 classes.
#' 
#' __Continued from last class:__
#' 
#' - [Longitudinal Models](files/Mixed_Models/Longitudinal_Models.pdf)
#' - [R script to play with Longitudinal Models: Lab 2.R](files/Mixed_Models/Lab_2.R)
#' - Updated files are in [this folder](files/Mixed_Models/).
#' 
##+ Day 25 ----
#' ## __Day 25__: Monday, March 14 
#'
#' __Continued from last class:__
#' 
#' - [Longitudinal Models](files/Mixed_Models/Longitudinal_Models.pdf)
#' - [R script to play with Longitudinal Models: Lab 2.R](files/Mixed_Models/Lab_2.R)
#' - Updated files are in [this folder](files/Mixed_Models/).
#' 
#' __Possible Quiz Questions for Wednesday:__
#' 
#' - Given $\hat{\gamma}$, $\hat{G}$, $\hat{\beta}_i$,
#'   $\hat{\sigma}^2$ and $(X_i' X_i)^{-1}$, (and maybe 
#'   $\hat{G}^{-1}$ and $(X_i' X_i)^{-1}$ to ease your
#'   burden of calculations) calculate the EBLUP for $\beta_i$
#'   and its estimated variance.
#' - Given $\hat{G}$ answer questions about estimated variances of the
#'   cluster regression lines: 
#'   $\eta = \beta_{0i} + X \beta_{1i}$, such as:
#'   - find the value of $X$ for which $\Var(\beta_{0i} + X \beta_{1i})$
#'     is minimized
#'   - find $\Var(\beta_{0i} + X \beta_{1i})$ generally, and/or 
#'     for various given values of $X$, e.g. $X=0$.
#'   - discuss the consequences of using a model for the 2 by 2
#'     $G$ matrix in which $g_{01}$ is fixed at 0.
#'   - discuss the consequences of forcing $g_{11} = 0$ (note that
#'     $G$ must be positive-definite for the 'lme' algorithm
#'     to work). 
#' 
##+ Day 26 ----
#' ## __Day 26__: Wednesday, March 16 
#'
##+ ### Assignment 6 (teams) ------
##' ### __Assignment 6__ (teams)
#'  
#' __Due:__ Wednesday, March 23
#' 
#' - Everyone should work their way through ["Lab 2"](files/Mixed_Models/Lab_2.R) individually
#' - Afterwards, meet as a group and write a summary of your findings with emphasis
#'   on whether and how the estimation of the relative effectiveness of the three
#'   drugs differed as you changed the model: e.g. whether you included or not a
#'   contextual effect for each subject's drug profile, whether you included an
#'   effect of time and whether you included auto-correlation in time.
#' - Write a description of reasons why the estimation of the effectiveness of
#'   drugs could change as it did.
#'   
#' __Continued from last class:__
#' 
#' - [Longitudinal Models](files/Mixed_Models/Longitudinal_Models.pdf)
#' - [R script to play with Longitudinal Models: Lab 2.R](files/Mixed_Models/Lab_2.R)
#' - Updated files are in [this folder](files/Mixed_Models/).
#' 
#' __New:__
#' 
#' - [Polynomial Splines](files/Guide_to_splines_in_spida.pdf)
#' - [Non-Linear Mixed Models](files/Mixed_Models/Non_Linear_Mixed_Models.pdf) 
#' 
#' 
##+ Day 27 ----
#' ## __Day 27__: Friday, March 18
#'
#' __Continued:__
#' 
#' - [Polynomial Splines](files/Guide_to_splines_in_spida.pdf)
#' - [Non-Linear Mixed Models](files/Mixed_Models/Non_Linear_Mixed_Models.pdf)
#'  
##+ Day 28 ----
#' ## __Day 28__: Monday, March 21 
#'
#' Class cancelled.
#'
##+ Day 29 ----
#' ## __Day 29__: Wednesday, March 23 
#'
#' __Continued:__
#' 
#' - [Non-Linear Mixed Models](files/Mixed_Models/Non_Linear_Mixed_Models.pdf)
#'  
##+ Day 30 ----
#' ## __Day 30__: Friday, March 25
#'
#' __Continued:__
#' - [Non-Linear Mixed Models](files/Mixed_Models/Non_Linear_Mixed_Models.pdf) 
#' 
##+ Day 31 ----
#' ## __Day 31__: Monday, March 28 
#'
#' __Continued:__
#' - [Non-Linear Mixed Models](files/Mixed_Models/Non_Linear_Mixed_Models.pdf) 
#'
#' __New:__
#'
#' - [Dealing with Heteroskedasticity](files/Mixed_Models/Dealing_with_Heteroskedasticity.pdf)
#'   [R script](files/Mixed_Models/Dealing_with_Heteroskedasticity.R)
#'
##+ Day 32 ----
#' ## __Day 32__: Wednesday, March 30
#'
#' __New:__
#' 
#' - [Causal Review](files/Regression_Review/The_Causal_Zoo.pdf)
#' - [Lord's Paradox, Gain Scores and Longitudinal Analysis](files/Regression_Review/Lords_Paradox_Gain_scores.pdf)
#'
##+ Day 33 ----
#' ## __Day 33__: Friday, April 1 
#'
#' - [Schedule a time for an optional meeting about the project](https://calendly.com/georgesmonette/project-meetings)
#' - [Schedule a time for your oral test](https://calendly.com/georgesmonette/math-4939-oral-exam)
#' - [Schedule a slot for your team's presentation](https://calendly.com/georgesmonette/math-4939-project-presentation)
#' 
#' __Sample Questions:__
#' 
#' - [Sample Questions - 2018](files/MATH_4939_Sample_Final_Exam_Questions.pdf)
#'   - 1, 4, 5, 6, 7, 9, 10, 11, 14, 15, 16, 17, 18, 19, 20, 21, 22,
#'     23, 24, 25, 28.
#'
##+ Day 34 ----
#' ## __Day 34__: Monday, April 4
#'
#' - [Lord's Paradox, Gain Scores and Longitudinal Analysis](files/Regression_Review/Lords_Paradox_Gain_scores.pdf)
#' - [Lord's Paradox: A Simulation](files/Regression_Review/Lords_Paradox_A_Simulation.pdf)
#'   - [R script](files/Regression_Review/Lords_Paradox_A_Simulation.R)
#' - Identifiability revisited:
#'   - [Identifiability: Is Your Model Too Big for Your Data](files/Mixed_Models/Identifiability_Is_Your_Model_Too_Big_For_Your_Data.pdf)    
#'     - [R script](files/Mixed_Models/Identifiability_Is_Your_Model_Too_Big_For_Your_Data.R)    
#'
##+ Day 35 ----
#' ## __Day 35__: Wednesday, April 6 {#CURRENT}
#' 
#' __Extra tutorial:__
#' 
#' - Tuesday, April 12 at 5 pm at [https://yorku.zoom.us/my/georgesmonette](https://yorku.zoom.us/my/georgesmonette)
#' 
#' __More Sample Questions:__
#' 
#' - [Sample Questions - 2018](files/MATH_4939_Sample_Final_Exam_Questions.pdf)
#'   - 1, 4, 5, 6, 7, 9, 10, 11, 14, 15, 16, 17, 18, 19, 20, 21, 22,
#'     23, 24, 25, 28.
#' - [Midterm 2020](files/math4939_mt_2020_solutions_2020_02_28.pdf)
#'   - 5
#' - [Midterm 2019](files/math4939_mt_2019_solutions.pdf)
#'   - 1, 2, 3, 4, 8
#' - [Version of random online exam in 2020](files/Online_Exam_2021_01_24.pdf)   
#'   - try all the questions
#'  
#' # References
#'   
#- EXIT ----
#+ include=FALSE
knitr::knit_exit()
#' __Class links:__
#'
#' - [Regression Review](files/Regression_Review/)
#'   - [Simple Regression](files/Regression_Review/Simple_Regression.pdf)
#'   - [Multiple Regression](files/Regression_Review/Multiple_Regression.pdf)
#'   - [Causal Questions](files/Regression_Review/Causal_Questions.pdf)
#'   - [22 Statements](files/Regression_Review/22_Statements.html)
#'   
##+ Day 8 ----
#' ## __Day 8__: Wednesday, January 27
#'
#' __Class links:__
#'
#' - [Regression Review](files/Regression_Review/)
#'   - [Simple Regression](files/Regression_Review/Simple_Regression.pdf)
#'   - [Multiple Regression](files/Regression_Review/Multiple_Regression.pdf)
#'   - [Causal Questions](files/Regression_Review/Causal_Questions.pdf)
#'   - [22 Statements](files/Regression_Review/22_Statements.html)
#' 
##+ ### Assignment 4 (teams) ------
##' ### Assignment 4 (teams)
#'
#' - Due: Sunday, February 7
#' - Each team works on the questions in [22 Statements](files/Regression_Review/22_Statements.html)
#'   (there are actually 23) whose numbers are X mod 6 where X is the 'team number' i.e. 1 for Arrow,
#'   2 for Birnbaum, etc. Prepare one post per question. Edit the main post to create your 
#'   'final' answer but have discussions as you work along as 'followup discussions'. 
#'   
##+ Day 9 ----
#' ## __Day 9__: Friday, January 29
#'
#' __Class links:__
#'
#' - [Regression Review](files/Regression_Review/)
#'   - [Simple Regression](files/Regression_Review/Simple_Regression.pdf)
#'   - [Multiple Regression](files/Regression_Review/Multiple_Regression.pdf)
#'   - [Causal Questions](files/Regression_Review/Causal_Questions.pdf)
#'   - [22 Statements](files/Regression_Review/22_Statements.html)
#' 
##+ ### Assignment 5 (teams) ------
##' ### Assignment 5 (teams)
#'
#' - Due: Friday, February 12
#' - The Vocab data frame available in the 'car' package, has 30,351 rows and 4 columns. 
#'   The observations are respondents to U.S. General Social Surveys, 1972-2016, 
#'   with data on the year, results on a vocabulary test, and the respondents' gender and education.
#' - Prepare an analysis exploring how the relative performance on vocabulary tests changes
#'   for men and women over time and how performance is related to education.
#' - If relationships seem non-linear consider using suitable model including,
#'   possibly, polynomial, parametric splines such as available with the 'gsp'
#'   function in 'spida2' or non-parametric splines available with the 'gam'
#'   function and the smoother 's' in the 'mgcv' package. 
#'   - Note that if you use 'mgcv' you might like to work on the Rstudio server
#'     on mtor: [http://mtor.sci.yorku.ca:8787](http://mtor.sci.yorku.ca:8787).
#'     Many of the functions in the 'mgcv' package are quite compute-intensive
#'     and run much faster on a large multi-core computer. Also you reduce the
#'     risk of frying your CPU -- as, I think, has happened to me. 
#' - Don't forget to explore possible relevant interactions.
#' - Use appropriate graphs to display your results.
#' - Identify unexpected or interesting phenomena in your results.
#' - Suggest alternative plausible explanations for what you find.
#' - Each team prepare one report generated by an R of Rmd file. Post both
#'   the pdf and the R or Rmd file to Piazza.
#' - Conduct your discussion to show individual contributions to the project
#'   as followup discussions in a Piazza post.
#' - Half the grade is common to all substantially participating members and
#'   is based on the quality of the report. The other half is individual and
#'   is based on individual contributions to the discussion.
#' 
##+ Day 10 ----
#' ## __Day 10__: Monday, February 1
#'
#' __Class links:__
#'
#' - [Regression Review](files/Regression_Review/)
#'   - [Simple Regression](files/Regression_Review/Simple_Regression.pdf)
#'   - [Multiple Regression](files/Regression_Review/Multiple_Regression.pdf)
#'   - [Causal Questions](files/Regression_Review/Causal_Questions.pdf)
#'   - [22 Statements](files/Regression_Review/22_Statements.html)
#'   
##+ Day 11 ----
#' ## __Day 11__: Wednesday, February 3
#' __Class links:__
#'
#' - [Regression Review](files/Regression_Review/)
#'   - [Simple Regression](files/Regression_Review/Simple_Regression.pdf)
#'   - [Multiple Regression](files/Regression_Review/Multiple_Regression.pdf)
#'   - [Causal Questions](files/Regression_Review/Causal_Questions.pdf)
#'   - [22 Statements](files/Regression_Review/22_Statements.html)
#'   
##+ Day 12 ----
#' ## __Day 12__: Friday, February 5
#' 
#' __Class links:__
#'
#' - [Regression Review](files/Regression_Review/)
#'   - [Multiple Regression](files/Regression_Review/Multiple_Regression.pdf)
#'   - [Causal Questions](files/Regression_Review/Causal_Questions.pdf)
#'   - [22 Statements](files/Regression_Review/22_Statements.html)
#'   
##+ Day 13 ----
#' ## __Day 13__: Monday, February 8
#'
#' __Teams:__ Arrow, Flournoy
#' 
#' - continuing previous day
#' 
##+ Day 14 ----
#' ## __Day 14__: Wednesday, February 10 
#'
#' __Teams:__ Birnbaum, Eeden
#'
#' - [Regression Review](files/Regression_Review/)
#'   - [Multiple Regression](files/Regression_Review/Multiple_Regression.pdf)
#'   - [Causal Questions](files/Regression_Review/Causal_Questions.pdf)
#'   - [22 Statements](files/https://piazza.com/class/kimbv9fdjvrd0?cid=449/22_Statements.html)
#'   - [Three Basic Theorems](files/Regression_Review/Three_Basic_Theorems.pdf)
#'     - These three theorems serve to establish a number of important ideas:
#'       - The estimated slope and its SE in the Added-Variable Plot is
#'         the same as the estimated coefficient and its SE in a
#'         multiple regression. Econometricians know this as the 
#'         Frisch-Waugh-Lovell theorem.
#'       - Note that the $X$ variable in AVP is the residual of the regression
#'         of $X$ on the other predictors. Let $\hat{X}_{|other preds}$ be
#'         the least-squares predictor of $X$ using the other predictors,
#'         say $Z_1$, $Z_2$, ..., $Z_k$.   $\hat{X}_{|other preds}$ is a 
#'         linear propensity score in the approach to causal inference
#'         known as the 'Rubin Causal Model' (RCM).
#'       - The regression of $Y$ on $X$ and $\hat{X}_{|other preds}$ has the
#'         same regression coefficient wrt to $X$ as in the full multiple
#'         regression (and, hence, the AVP) but the SE will, in general,
#'         be larger unless the $Z$s have 0 partial correlations with $Y$
#'         controlling for $X$. Note that the 'X' variable in the AVP for
#'         this regression is the same as the 'X' variable in the AVP for
#'         the full multiple regression but the 'Y' variable will have 
#'         a marginal and residual variances that are at least as 
#'         large as those of the AVP for the full multiple regression.
#'       - Blocking a backdoor path in a causal DAG always yields the
#'         same estimate for the effect of a focal variable $X$ but
#'         SE is greater when the blocking variables are 'closer to X' and
#'         smaller if the blocking variables are 'closer to Y'.
#'       - _Controlling_ for an instrumental variable is a 'disaster' for the SE,
#'         although
#'         an instrumental variable can be used in a different type of
#'         analysis: two-stage least squares.
#'       - Controlling for a mediating factor is a 'disaster' for the
#'         estimate of the causal effect of the focal variable.
#' - Questions to ponder:
#'   - In a multiple linear normal regression model regressing $Y$ on two
#'     predictors $X_1$ and $X_2$, let $\beta_1$ and $\beta_2$ be
#'     the parameter of the multiple regression and let $\gamma_1$
#'     and $\gamma_2$ denote parameters of the simple regressions.
#'   - Consider the following scenarios. Is each scenario plausible
#'     or not? If possible, do you think it would be very rare or not?
#'     Why? Think of real world variables that might be examples of
#'     those scenarios that are plausible.
#'     1. The test of $H_0: \beta_1 = \beta_2 = 0$ is highly significant
#'        but neither test of $H_0: \beta_1 = 0$ nor $H_0: \beta_2 = 0$
#'        achieves significance. See [this Piazza post](https://piazza.com/class/kimbv9fdjvrd0?cid=449).
#'     2. The estimates of $\beta_1$ and $\beta_2$ are both positive but
#'        the estimate of $\gamma_1$ is negative.
#'     3. The tests of $H_0: \beta_1 = \beta_2 = 0$, $H_0: \beta_1 = 0$,
#'        and $H_0: \beta_2 = 0$ all achieve significance but 
#'        neither the test of $H_0: \gamma_1 = 0$ nor of $H_0: \gamma_2 = 0$
#'        achieves significance. (This common scenario provides a counterexample
#'        to the Venn diagram representation of the decomposition of sums of
#'        squares. It is sometimes called 'suppression' in the 
#'        applied psychology literature for reasons that are paradoxical!)
#'     4. The estimates of $\beta_1$ and $\beta_2$ are both positive but
#'        the estimates of both $\gamma_1$ or $\gamma_2$ are negative.
#'     5. Invent some other scenario and discuss its plausibility.
#'   
##+ Day 15 ----
##' ## __Day 15__: Friday, February 12 
#'
#' __Teams:__ Cai, Diaconis
#'
#' __Class links:__
#'
#' - [Regression Review](files/Regression_Review/)
#'   - [Multiple Regression](files/Regression_Review/Multiple_Regression.pdf)
#'   - [Causal Questions](files/Regression_Review/Causal_Questions.pdf)
#'   - [22 Statements](files/Regression_Review/22_Statements.html)
#'
#' __Reading ahead during Reading Week:__
#' 
#' - [Multilevel, Mixed and Longitudinal Models](files/Mixed_Models/)
#' - [Working with Data](http://blackwell.math.yorku.ca/MATH4939/R/Working_with_Data.pdf)
#' 
##+ ### Assignment 6 (individual) ------
##' ### Assignment 6 (individual)
#'  
#' __Due:__ Monday, March 1 at 11:59 p.m.
#' 
#' The purpose of this assignment is to give everyone a chance to 
#' work individually 
#' with the data for the project in preparation for collaboration
#' with your team. 
#' 
#' We will study methods to manipulate this kind of data as
#' soon as we return from the break.
#'
#' The data are contained in an
#' Excel file at http://blackwell.math.yorku.ca/MATH4939_2018/data_private/.
#' Use the
#' userid and password provided in class. Please do not post the
#' userid and password in any public posting, e.g. on Piazza.
#' You may post them in 'Private' posts to your team.
#' The data should be treated as
#' confidential and may be used only for the purposes of this course.
#' 
#' The data consist of longitudinal volume measurements for
#' a number of patients being treated after traumatic brain injuries (TBI),
#' e.g. from car accidents or falls, and similar data from
#' a number of control subjects without brain injuries.
#' 
#' The goal of the study is to 
#' identify whether some brain structures are subject to a rate of
#' shrinkage after TBIs that is greater than the rate normally associated
#' with aging. It is thought that some structures, particularly portions 
#' of the
#' hippocampus may be particularly affected after TBI.
#' 
#' You will be able to work with this data set as we explore ways of
#' of working with multilevel and longitudinal data. It's a real data
#' set with all the flaws that are typical of real data sets.
#' 
#' A first task will be to turn the data from a 'wide file' with one
#' row per subject to a long file with one row per 'occasion'.
#' Note that variables
#' with names that end in ’_1’, ’_2’, etc. are longitudinal variables,
#' i.e. variables measured on different occasions at different points in time. 
#' 
#' A good way to transform variable names if they aren't in the right form
#' is to use substitutions with regular expressions.
#' 
#' A good way to transform the data set from 'wide' form to 'long' form
#' is the use the 'tolong' function in the 'spida2' package but you 
#' are welcome to use other methods that can be implemented through a
#' scipt in R, i.e. not manipulating the data itself.  You might find section 9, 
#' particularly section 9.4, of the following notes helpful:
#' 
#' - [Working with Data](http://blackwell.math.yorku.ca/MATH4939/R/Working_with_Data.pdf)
#' 
#' Most of
#' the variables are measures of the volume of components of the brain:
#'  
#' - ‘HC’ refers to the hippocampus that has several parts, 
#' - ‘CC’ to the corpus callosum, 
#' - ‘GM’ is grey matter, 
#' - ‘WM’ is white matter, 
#' - ‘VBR’ is the ventricle to brain ratio. Ventricles are ‘holes’ 
#'   in your brain that are filled with
#'   cerebro-spinal fluid so VBR measures how big the holes in your brain are
#'   compared with the 'solid' matter. If the brain volume shrinks, 
#'   the total volume
#'   of the cranium remains the same so VBR goes up. 
#'   
#' The ids are numerical for
#' patients with brain injuries and have the form ‘c01’, ‘c02’ etc for control
#' subjects. The variable ‘date_1’ contains the date of injury and ‘date_2’,
#' ‘date_3’, etc., the dates on which the corresponding brain scans were
#' performed. 
#' 
#' You might like to have a look at fixing dates
#' in [Wrangling Messy Spreadsheets into Useable Data](files/Mixed_Models/Messy_data.html#fix-time) 
#' for some ideas on using dates to extract, for example, the elapsed time
#' between two dates as a numerical variable. 
#' 
#' Plot some key variables: VBR,
#' CC_TOT, HPC_L_TOT, HPC_R_TOT against elapsed time since injury using
#' appropriate plots to convey some idea of the general patterns in the data.
#' Remember that any changes to the data must be done in R. __Do not edit the
#' Excel file.__ Comment on what you see. Make a table (using a command in R, of
#' course) showing how many observations are available from each subject. Create
#' a posting entitled ‘Assignment 6’ to Piazza in which you Upload your
#' Rmarkdown .R file and the html file it produces. Make it Private to the
#' instructor until Sunday, February 28 at 11:59 pm.
#' 
##+ Day 16 TODAY ----
#' ## __Day 16__: Monday, February 22 
#'
#' __Teams:__ Birnbaum, Cai
#' 
#' __Class links:__
#' 
#' - We didn't get a chance to talk about this in detail but we'll come back to it:
#'   - [Causal Questions](files/Regression_Review/Causal_Questions.pdf) <!-- ADD causal sim and 6 models -->
#'   - [Imai (2019) Notes on Causal DAGs](files/Imai_2019_Causal_DAGs.pdf)
#' - [Multilevel, Mixed and Longitudinal Models](files/Mixed_Models/)
#'   - [Hierarchical Models to Mixed Models](files/Mixed_Models/Hierarchical_Models.pdf)
#'   - [Lab_1.R](files/Mixed_Models/Lab_1.R): This is an R script that is meant to
#'     be run line-by-line experimenting with the code as you go along. There are
#'     probably some errors in the file. When you find them, you can post them
#'     with corrections on Piazza. Consider them contributions for the second half
#'     of the course. 
#' <!-- add tolong illustration -->
#' <!-- add diagnostics from John -->
#' - [Working with Data](http://blackwell.math.yorku.ca/MATH4939/R/Working_with_Data.pdf)
#' 
#' __Contributions:__
#' 
#' The course description says:
#' 
#' > On or before February 15, add links in your LOG file to your best 5 contributions made before reading week and on or before April 4 add links to your best 5 contributions made after reading week. Add a line of the form:
#' 
#' > `Contributions: @41 @105 @107 @201 @261`
#' 
#' This refers to contributions that are not otherwise given grades.
#' 
#' If you haven't done this already, please do so before February 29.
#' 
#' __Oral Exam:__
#' 
#' - Saturday, February 27, 2021 between 10am and 9pm
#' - Times will be allocated randomly and announced by
#'   individual message on Piazza on Wednesday, February 24.
#' - Details:
#'   - Over Zoom with camera
#'   - Will be recorded
#'   - Duration: 15 minutes, 3 questions, 5 minutes each.
#'   - Open 'book' and open web but no human help allowed.
#'   - Questions can be answered 
#'     - combination of orally and in writing, showing 
#'       results on camera
#'     - diagrams can be drawn on a sheet of paper and
#'       shown on camera
#'   - Questions will be randomly selected for each person
#'   - Potential questions:
#'     - Questions similar to assignment questions:
#'       - e.g. Describe your conclusions based on assignment 5:
#'         - How does the relative performance on vocabulary tests change
#'           for men and women over time and how is performance 
#'           related to education.
#'     - Questions similar to quiz questions.
#'     - Questions on [23+ statements](questions/22_statements.html)
#'       - Have a look at comments on Assignment 4 in Piazza (enter 'folder:assn4' in the search box)
#'       - Note that there are four types of statement
#'         - correct statements -- only one
#'         - sometimes okay but often not, i.e. __it depends!' statements__:
#'           - in most cases the correctness of the statement depends on
#'             the context of the analysis: prediction versus causal/explanatory questions and observational versus experimental data.
#'             You need to get into the habit to stop and think how the appropriateness
#'             of a statement might depend on the context. Something that
#'             makes sense for predictive analyses can make absolutely no
#'             sense for causal analyses, and vice-versa.
#'         - __"Don't be fooled into looking for an explanation when nothing unexpected is happening" statements__
#'           - Examples are seemingly self-contradictory phenomena that can be explained by regression to the mean, e.g.
#'             - Tall fathers report that their sons are on average shorter than themselves and
#'               tall sons report that their fathers are shorter than themselves,
#'             - People with high z-scores on the mid-term tend on average to have
#'               lower z-scores on the final,
#'             - Kahneman's pilot instructors perceived that criticism resulted
#'               in better performance and praise in worse performance although
#'               Kahneman believed that the causal effects should be in the opposite
#'               direction. Both the instructors and Kahneman can be correct 
#'               from their perspective. The resolution
#'               of the apparent contradiction is that the pilots were correctly perceiving a
#'               __predictive__ relationship that can have the opposite sign
#'               of the __causal__ relationship that Kahneman postulated.
#'             - Think up some other examples!
#'           - Sample means that seem biased but they're from distributions known to be
#'             highly skewed.
#'           - Estimators that seem inconsistent and seem to imply sampling or other biases 
#'             but they __should be inconsistent__ because they're estimating
#'             different things, e.g. average class sizes from the faculty and
#'             from the student point of view. Note that this is an issue that
#'             has consequences for equity: it shows that what you see when you look
#'             at something 'from the top' [can be very different](https://weallcount.com/2019/07/11/auto-draft/)
#'             from what you see looking 'from the bottom'. 
#'         - __Conflation errors:__ that come from conflating related but actually distinct phenomena or concepts, such as
#'           - interaction and collinearity
#'           - likelihood and probability
#'           - marginal probability and conditional probabilities
#'           - the significance of individual hypotheses and the significance of joint hypotheses
#'           - statistical concepts (e.g. sums of squares) and misleading analogies or representations (e.g. Venn diagrams)
#'           - p-values (probability of data showing a relationship that is as extreme or more extreme
#'             than what was observed given a hypothesis) with posterior probability (probability of a hypothesis given the data).
#'             They can be dramatically different as illustrated by the case of Sally Clark.
#' 
#' __Quiz questions:__ for Wednesday, January 24
#' 
#' - Review questions from assignment 4. There will be more than one question
#'   and you will be asked to answer a question that is different from the
#'   ones for which your team was responsible.  
#'              
##- TODO ---- 
#' <!-- tolong and other longitudinal manipulations -->
#' <!-- 
#'   PREPARE QUIZ QUESTION BASED ON ANNOUNCEMENT ABOVE
#'   Changing data without touching it: regular expressions 
#'   LInks to http://blackwell.math.yorku.ca/MATH4939/R/Working_with_Data.pdf
#'   Hilbert space picture -- connection with CEs
#'   Ellipses as transformations of circles
#'   - When you fit a model that is not of full-rank with 'lm' 
#'     R gives you a warning. What, specifically, is the problem
#'     with using a model that is not of full rank. R just seems to 
#'     drop the columns of the X matrix that are collinear. So what's
#'     the matter (if any) with that?
#'     - Consider invariances of such models.  
#' -->
#'  
##+ Day 17 ----
#' ## __Day 17__: Wednesday, February 24
#'
#' __Teams:__ Arrow, Diaconis
#' 
#' __Lecture:__ continuation from previous day
#' 
##+ Day 18 ----
#' ## __Day 18__: Friday, February 26 
#'
#' __Teams:__ Flournoy, Eeden
#' 
#' __Lecture:__ continuation from previous day
#' 
##+ Day 19 ----
#' ## __Day 19__: Monday, March 1 
#'
#' __Teams:__ Eeden, Diaconis
#' 
#' - [Multilevel, Mixed and Longitudinal Models](files/Mixed_Models/)
#'   - [Hierarchical Models to Mixed Models](files/Mixed_Models/Hierarchical_Models.pdf)
#'   - [Lab_1.R](files/Mixed_Models/Lab_1.R): This is an R script that is meant to
#'     be run line-by-line experimenting with the code as you go along. There are
#'     probably some errors in the file. When you find them, you can post them
#'     with corrections on Piazza. Consider them contributions for the second half
#'     of the course. 
#'   - [Longitudinal Models](files/Mixed_Models/Longitudinal_Models.pdf)
#'   - [Lab_2.R](files/Mixed_Models/Lab_2.R): This is another R script that is meant to
#'     be run line-by-line experimenting with the code as you go along. There are
#'     errors in the file and many opportunities for improvement. 
#'     Post them on Piazza.
#'
#'  
##+ Day 20 ----
#' ## __Day 20__: Wednesday, March 3
#'
#' __Teams:__ Flournoy, Cai
#' 
##+ Day 21 ----
#' ## __Day 21__: Friday, March 5
#'
#' __Teams:__ Arrow, Birnbaum
#' 
##+ Day 22 ----
#' ## __Day 22__: Monday, March 8
#' 
##+ Day 23 ----
#' ## __Day 23__: Wednesday, March 10
#' 
#' __Advice on project:__
#' 
#' You may want to choose one of CC_TOT, HPC_TOT and VBR as outcome
#' variables.
#'
#' Question: Is there evidence of an effect of TBI on the change over time in
#' these volumetric measures compared with
#' control subjects? In particular, is there evidence of a gap between controls
#' and patients and is there evidence that the rate of change post-TBI is
#' different from what would be expected as the normal change associated with
#' aging: an average change in these volumetric measures after TBI adjusting the
#' for the normally expected change associated with aging, taking into account
#' the possibility that the rate of change may not be constant over the
#' post-injury period. Is there evidence that the rate of change is different in
#' the early versus the later post-TBI period? Can you estimate what proportion
#' of TBI patients would experience various proportional changes in volume: e.g.
#' what proportion would change by more than 10%, 5% to 10%, less that 5%? 
#' 
#' The main report should contain discussions, tables and graphs to
#' present your findings. It should be a proper professional looking report,
#' i.e. no visible code. You should also prepare your presentation using
#' Rmarkdown. 
#'  
##+ Day 24 ----
#' ## __Day 24__: Friday, March 12 
#' 
##+ ### Assignment 8 (individual) ------
##' ### Assignment 8 (individual)
#'
#' - Due: Monday, March 22 at 11:59 pm
#' - Put your work in an R markdown file and run it. Post your results 
#'   privately to the Instructors using the folder 'assn8' on Piazza.
#' - Don't forget to add a link in your LOG  file.
#' - Post both the R markdown script file and the pdf output it produces.<br>
#'   Using the 'hs' data among public schools only, fit the following models:
#'     1. Regress 'mathach' on 'ses'
#'     2. Create variables, 'ses_mean' and 'mathach_mean' equal to the mean 
#'        of each variables within each school and regress 'mathach_mean' on
#'        'ses_mean' in two ways: regressing on all students and regressing
#'        with one observation per school.
#'     3. Create a variable 'ses_dev' equal to 'ses' - 'ses_mean'. 
#'        Regress 'mathach' on 'ses_dev' + 'ses_mean'.
#'     4. Regress 'mathach' on 'ses' + 'ses_mean'.
#'     5. Regress 'mathach' on 'ses' + a factor for schools.
#'     6. Use a mixed effects model to regress 'mathach' on 'ses' with
#'        a random intercept for each school.
#'     7. Use a mixed effects model to regress 'mathach' on 'ses' + 'ses_mean'
#'        with a random intercept for each school.
#'     8. Use a mixed effects model to regress 'mathach' on 'ses_dev' + 'ses_mean'
#'        with a random intercept for each school.
#'     9. Use a mixed effects model to regress 'mathach' on 'ses_dev' + 'ses_mean'
#'        with a random intercept and a random slope for 'ses_dev' for each school.
#'     9. Identify the equalities and inequalities in the estimated coefficients
#'        above that correspond to equalities and inequalities discussed in class.
#'     9. Discuss differences between the standard errors of corresponding estimated
#'        coefficients in models in lines
#'        4, 5, 7 and 8.
#'     9. Fit a model using data from both sectors allowing for different
#'        slopes with respect of 'ses_dev' and 'ses_mean' in each sector and
#'        a random intercept for each school. Estimate and construct a
#'        confidence interval for the difference in 
#'        expected 'mathach' for a student whose ses is 0 in a Public school with mean ses
#'        equal to -1 and a student whose ses is -1 in a Catholic school with mean ses
#'        equal to 0. 
#' 
##+ Day 25 ----
#' ## __Day 25__: Monday, March 15 
#' 
#' __Teams:__ Flournoy, Arrow
#' 
##+ Day 26 ----
#' ## __Day 26__: Wednesday, March 17 
#'
#' __Teams:__ Eeden, Birnbaum
#' 
##+ ### Assignment 9 (individual) ------
##' ### Assignment 9 (individual)
#'  
#' __Due:__ Wednesday, March 24 at 11:59 p.m.
#' 
#' Work your way through  
#' [Lab 2.R](files/Mixed_Models/Lab_2.R). 
#'
#' Answer 'in words' (no output or graphs needed, just a verbal descriptions) the
#' following questions all relating to the comparison of the effectiveness
#' of 'Clozapine' compared with the two other drugs on the severity of
#' 'negative' symptoms. The questions expect you to consider four models: a model
#' using drug, a model using drug and a contextual variable for drug (since drug is 
#' a three-level factor, the contextual variable will be the within-patient
#' mean of each indicator variable for drug), a model that uses, in addition, a
#' linear effect of year, and, finally a model that also incorporates an
#' autoregressive component with respect to year.
#' 
#' 1. If you start with a model that includes 'drug' without a contextual
#'    variable, what is the result of including a contextual variable for 'drug'
#'    on the comparisons between drugs. Provide a plausible explanation why including the 
#'    contextual variable would have this effect on the estimates of the comparisons
#'    between drugs.
#' 2. What is the consequence of including, in addition, a linear effect in year?
#'    Why would including year have this effect on the comparisons?
#' 3. What is the consequence of allowing for autocorrelations with respect
#'    to time? Why would including autocorrelations have this effect on the comparisons?
#'     
#' Post your answers as a private post by the deadline. Make it public 
#' <font color="red">after Sunday, March 29.</font>
#'    
##+ Day 27 ----
#' ## __Day 27__: Friday, March 19 
#' 
#' - [Multilevel, Mixed and Longitudinal Models](files/Mixed_Models/)
#'   - [Longitudinal Models](files/Mixed_Models/Longitudinal_Models.pdf)
#'   - [Non-linear Mixed Models](files/Mixed_Models/Non_Linear_Mixed_Models.pdf)
#'
#' __Teams:__ Diaconis, Cai
##+ Day 28 ----
#' ## __Day 28__: Monday, March 22
#'
#' - Some posts you should read:
#'   - [Great examples of Berkson's Paradox](https://piazza.com/class/kimbv9fdjvrd0?cid=800)
#'   - [Data Fallacies](https://piazza.com/class/kimbv9fdjvrd0?cid=797)
#'   - [Beyond AR(1)](https://piazza.com/class/kimbv9fdjvrd0?cid=791)
#'   - [Singular convergence](https://piazza.com/class/kimbv9fdjvrd0?cid=783)
#'   - [BLUEs vs BLUPs](https://piazza.com/class/kimbv9fdjvrd0?cid=781)
#'   
#' - [Multilevel, Mixed and Longitudinal Models](files/Mixed_Models/)
#'   - [Longitudinal Models](files/Mixed_Models/Longitudinal_Models.pdf)
#'   - [Non-linear Mixed Models](files/Mixed_Models/Non_Linear_Mixed_Models.pdf)
#'   
#' __Teams:__ Cai, Birnbaum
#' 
#' 
#' 
##+ Day 29 ----
#' ## __Day 29__: Wednesday, March 24
#' 
#' __Teams:__ Diaconis, Arrow
##+ Day 30 ----
#' ## __Day 30__: Friday, March 26 
#' 
#' __Teams:__ Eeden, Flournoy
#' 
##+ Day 31 ----
#' ## __Day 31__: Monday, March 29
#' 
#' __Teams:__ Diaconis, Eeden
##+ Day 32 ----
#' ## __Day 32__: Wednesday, March 31 {#CURRENT}
#' 
#' __Lecture:__
#' 
#' - [Parametric Splines](files/Splines/)
#'  
#' __Teams:__ Cai, Flournoy
##+ Day 33 ----
#' ## __Day 33__: Friday, April 2 
#' 
#' __Holiday__ 
#' 
##+ Day 34 ----
#' ## __Day 34__: Monday, April 5  
#' 
#' - [Sample Questions](files/MATH_4939_Sample_Final_Exam_Questions.pdf)
#' 
#' __Teams:__ Birnbaum, Arrow
##+ Day 35 ----
#' ## __Day 35__: Wednesday, April 7
#' 
#' __Teams:__ Eeden, Cai
#' 
#' 
##+ Day 36 ----
#' ## __Day 36__: Friday, April 9 {#CURRENT}
#' 
#' __Project Presentations:__
#' 
#' - __Teams:__ Birnbaum, Diaconis, Cai
#' 
##+ Day 37 ----
#' ## __Day 37__: Monday, April 12 {#CURRENT}
#' 
#' __Project Presentations:__
#' 
#' - __Teams:__ Eeden, Arrow, Flournoy
#' 
#' # References
#' 
##+ EXIT ------
#+ include=FALSE 
knitr::knit_exit()
#' <!--
#' 
#' 
#' 
#' __Teams:__ Flournoy, Arrow
#' __Teams:__ Eeden, Birnbaum
#' __Teams:__ Diaconis, Cai
#' 
#' __Teams:__ Cai, Birnbaum
#' __Teams:__ Diaconis, Arrow
#' __Teams:__ Eeden, Flournoy
#' 
#' __Teams:__ Diaconis, Eeden
#' __Teams:__ Cai, Flournoy
#' __Teams:__ Birnbaum, Arrow
#' TODO(georges) ADD STUFF:
#' Questions:
#' 
#' - [coffee-av3D-1.gif (671×680)](https://www.datavis.ca/papers/ellipses/movies/coffee-av3D-1.gif)
#' 
#' 
#' Bayesian thinking by Julia Galef: https://www.youtube.com/watch?v=BrK7X_XlGB8
#' Perfectly linked to Sally Clark: 'base rate neglect' 
#' Meet a very shy person on campus: math or business?
#' Look at very easy layout: 'hand drawn mosaic plot' or prior x LR (rectangle)
#' Look at great way of updating using rectangles for meditation
#' TOPICS TO BE SEEN:
#' - Regular Expressions      
#' -->
#' __Teams:__ Arrow, Flournoy
#' __Teams:__ Birnbaum, Eeden
#' __Teams:__ Cai, Diaconis
#' 
#' __Teams:__ Birnbaum, Cai
#' __Teams:__ Arrow, Diaconis
#' __Teams:__ Flournoy, Eeden
#' 
#' __Teams:__ Eeden, Diaconis
#' __Teams:__ Flournoy, Cai
#' __Teams:__ Arrow, Birnbaum
#' 
#' __Teams:__ Flournoy, Arrow
#' __Teams:__ Eeden, Birnbaum
#' __Teams:__ Diaconis, Cai
#' 
#' __Teams:__ Cai, Birnbaum
#' __Teams:__ Diaconis, Arrow
#' __Teams:__ Eeden, Flournoy
#' 
#' __Teams:__ Diaconis, Eeden
#' __Teams:__ Cai, Flournoy
#' __Teams:__ Birnbaum, Arrow

#'
#'
#' <!--
#' - [Introduction to Bayesian Ideas](files/Introduction_to_Bayesian_Ideas.pdf)
#' - The fundamental $2 \times 2$ table of statistcs: 
#'   [Lies, damned lies and statistics](lectures/Lies_damned_lies/Lies_Damned_Lies_and_Statistics.pdf)
#' -->
#' 
##+ Day 7 ----
#' ## __Day 7__: Monday, January 20
#'
#' __Class links:__
#' 
#' - Assignment 2:
#'     - The case of $n = 10000$, $\mu_1 = 5$: [pdf](questions/Assignment_2_version_1.pdf) __/__ [R script](questions/Assignment_2_version_1.pdf)
#'     - A generic solution: 
#'         - [R script](questions/Assignment_2_version_2.R)
#'         - [Sample output](questions/Assignment_2_version_2.pdf)
#' - The fundamental $2 \times 2$ table of statistcs: 
#'   [Lies, damned lies and statistics](lectures/Lies_damned_lies/Lies_Damned_Lies_and_Statistics.pdf)
#'
#' ### Assignment 5 (teams)
#' 
#' Write a collaborative essay on the implications of the results
#' from assignment 2.
#' 
#' __Due:__ Wednesday, January 29
#' 
##+ Day 8 ----
#' ## __Day 8__: Wednesday, January 22
#'
#' __Class links:__
#' 
#' - The fundamental $2 \times 2$ table of statistcs: 
#'   [Lies, damned lies and statistics](lectures/Lies_damned_lies/Lies_Damned_Lies_and_Statistics.pdf)
#' - [Paik-Agresti diagrams](R/paik_diagrams.pdf) __/__ [script](R/paik_diagrams.R)
#' 
#' ### Assignment 6 (teams)
#' 
#' These are [five questions on causality](questions/m4939_questions_2020.html#14_questions_on_causality).
#' Each team member should try one. In the heading of your post, please say: __Assignment 6 Question X__
#' where X is the number of the question you worked on. This will make it easier to compare answers
#' to the same question.
#'  
#' - __Random numbers__: 4 5 2 1 3
#' - __Deadlines__: See the [course description](files/description.html) for the meaning of these deadlines.
#'     1. Friday, January 31 at noon 
#'     2. Sunday, February 2 at noon 
#'     3. Monday, February 3 at 9 pm
#' 
##+ Day 9 ----
#' ## __Day 9__: Friday, January 24
#'
#' __Class links:__
#' 
#' - The fundamental $2 \times 2$ table of statistcs: 
#'   [Lies, damned lies and statistics](lectures/Lies_damned_lies/Lies_Damned_Lies_and_Statistics.pdf)
#' - [Paik-Agresti diagrams](R/paik_diagrams.pdf) __/__ [script](R/paik_diagrams.R)
#' 
#' ## __Day 10__: Monday, January 27
#'
#' __Class links:__
#' 
#' - The fundamental $2 \times 2$ table of statistcs: 
#'   [Lies, damned lies and statistics](lectures/Lies_damned_lies/Lies_Damned_Lies_and_Statistics.pdf)
#' - [Paik-Agresti diagrams](R/paik_diagrams.pdf) __/__ [script](R/paik_diagrams.R)
#' 
##+ Day 11 ----
#' ## __Day 11__: Wednesday, January 29
#'
#' __Class links:__
#' 
#' - Expanded notes on Chapter 2 of @fox2019r:
#'     - [Working with Data](R/Working_with_Data.pdf) 
#'     - [R script](R/Working_with_Data.R) 
#' 
#' ### Assignment 7 (teams)
#' 
#' The following are two questions that everyone should try 
#' individually. Since everyone is working on them, keep your
#' posting 'Private' to everyone until the first deadline so
#' everyone has the challenge of working individually.
#' Be sure to post your individual work privately to Piazza before
#' deadline #1. You will be considered to have completed that 
#' part of the assignment if you show signs of a
#' substantial honest attempt by that time. Note that Piazza
#' keeps a history of postings.
#' 
#' After deadline #1 you can help each other in the usual way.
#' 
#' - [Math 4939 Questions #5](questions/m4939_questions_2020.html?time=12345)
#' - [Math 4939 Questions #9.5](questions/m4939_questions_2020.html?time=12345)
#' 
#' The following 10 questions
#' [Math 4939 Questions](questions/m4939_questions_2020.html?time=12345) 
#' should be done in the usual way, i.e. 
#' each team member does two questions. For questions that involve
#' writing a function, make sure to include extensive tests of your function
#' including under extreme conditions. Also include brief 
#' documentation as comments within the function including
#' the purpose, the arguments and what the function 
#' returns. E.g:
#' <pre>
#' to.farenheit(x) <- function(x) {
#'    # converts degrees Celsius to degrees Farenheit
#'    # Parameters:
#'    #   x: temperature in degrees Celsius
#'    # Returns: temperature in degrees Farenheit
#'    9*x/5 + 32
#' }  
#' </pre>
#' 
#' - Questions 4, 7.9, 7.10, 7.11, 7.12, 7.13, 11.3. 11.5, 11.8, 11.9 
#' - __Random numbers__: 4 2 3 1 5
#' - __Deadlines__: See the [course description](files/description.html) 
#'   for the meaning of these deadlines.
#'     1. Friday, February 7 at noon 
#'     2. Sunday, February 9 at noon 
#'     3. Monday, February 10 at 9 pm
#'
##+ Day 12 ----
#' ## __Day 12__: Friday, January 31
#'
#' __Class links:__
#' 
#' - Expanded notes on Chapter 2 of @fox2019r:
#'     - [Working with Data](R/Working_with_Data.pdf) 
#'     - [R script](R/Working_with_Data.R) 
#'
##+ Day 13 ----
#' ## __Day 13__: Monday, February 3
#'
#' __Class links:__
#' 
#' - Expanded notes on Chapter 2 of @fox2019r:
#'     - [Working with Data](R/Working_with_Data.pdf?q=1234) 
#'     - [R script](R/Working_with_Data.R?q=1234)
#' - Expanded notes on Chapter 3 of @fox2019r:
#'     - [Regression in R](R/Regression_in_R.html?q=1234) 
#'     - [R script](R/Regression_in_R.R?q=1234)
#' - [Last year's midterm test](files/math4939_mt_2019.pdf)
#'
##+ Day 14 ----
#' ## __Day 14__: Wednesday, February 5
#'
#' __Class links:__
#' 
#' - Expanded notes on Chapter 2 of @fox2019r:
#'     - [Working with Data](R/Working_with_Data.pdf?q=1234) 
#'     - [R script](R/Working_with_Data.R?q=1234)
#' - Expanded notes on Chapter 3 of @fox2019r:
#'     - [Regression in R](R/Regression_in_R.html?q=1234) 
#'     - [R script](R/Regression_in_R.R?q=1234)
#'     - [PDF](R/Regression_in_R_notes.pdf?q=1234)
#'
##+ Day 15 ----
#' ## __Day 15__: Friday, February 7
#'
#' - continuation
#' 
##+ Day 16 ----
#' ## __Day 16__: Monday, February 10
#'
#' -continuation
#' 
##+ Day 17 ----
#' ## __Day 17__: Wednesday, February 12
#'
#' -continuation
#' 
##+ Day 18 ----
#' ## __Day 18__: Friday, February 14
#'
#' - Midterm test
#' 
##+ Day 19 ----
#' ## __Day 19__: Monday, February 24
#' 
#' - [Solutions to the midterm](files/math4939_mt_2020_solutions.pdf)
#' - [The meaning of regression](lectures/Regression_Review/)
#' - [21+ statistical statements](questions/22_statements.html)
#' 
##+ Day 20 ----
#' ## __Day 20__: Wednesday, February 26
#'
##+ Day 21 ----
#' ## __Day 21__: Friday, February 28
#' 
#' __Links:__
#' 
#' - [The meaning of regression](lectures/Regression_Review/)
#' - [21+ statistical statements](questions/22_statements.html)
#' 
#' __References:__
#' 
#' - [Judea Pearl and Dana McKenzie (2018) The Book of Why: The New Science of Cause and Effect](http://bayes.cs.ucla.edu/WHY/) [@pearl2018book]
#' - [Miguel Hernan and James Robins (Feb. 21, 2020) Causal Inference: What If](https://www.hsph.harvard.edu/miguel-hernan/causal-inference-book/) [@hernanCausalInferenceWhat2020]
#' 
#' ![](pix/What_if.jpg){width=40% } ![](pix/Book_of_Why.jpg){width=40% }
#'
##+ Day 22 ----
#' ## __Day 22__: Monday, March 2
#'
##+ Day 23 ----
#' ## __Day 23__: Wednesday, March 4
#'
#' __Links:__
#' 
#' - [The meaning of regression](lectures/Regression_Review/)
#' - [21+ statistical statements](questions/22_statements.html)
#'
#' ### Project
#' 
#' See the [course description](files/description.html) for
#' details on the execution of the project. You should prepare
#' a rough initial report posted privately to your team __by
#' Sunday, March 15.__  Our last class is Friday, April 3, and
#' we will have project presentations on that day. We will start
#' the class at 9 am instead of 9:30 to give each team a 
#' chance to present. 
#' 
#' For the project, each team will work on one of these two
#' datasets. Both require thoughtful analyses to address 
#' an important but difficult question: What do the data
#' reveal about possible patterns of discrimination?
#' 
#' Data set 1 is available through the 'car' package as
#' the "Arrests" data set. Beware that you will find many
#' discussion and projects about this data on the web. Most
#' are very superficial. You can do better!
#' 
#' Data set 2, is the "Greene" data also in the 'car' package.
#' 
#' Teams 1, 3 and 5 should tackle the "Arrests" data and
#' teams 2, 4 and 6, the "Greene" data.
#' 
#' Use the __project__ folder on Piazza for posts related to the
#' project.  Keep posts private to your team until the day
#' of the presentation.
#' 
#' ### Assignment 8 (teams)
#'  
#' Discuss each of the [statements in this list](questions/22_statements.html).
#' 
#' - __Random numbers__: 5 2 4 1 3
#' - __Deadlines__: See the [course description](files/description.html) 
#'   for the meaning of these deadlines.
#'     1. Friday, March 13 at noon 
#'     2. Sunday, March 15 at noon 
#'     3. Monday, March 16 at 9 pm
#' 
##+ Day 24 ----
#' ## __Day 24__: Friday, March 6
#'
##+ Day 25 ----
#' ## __Day 25__: Monday, March 9
#'
##+ Day 26 ----
#' ## __Day 26__: Wednesday, March 11
#'
#' __Links:__
#' 
#' - [The meaning of regression](lectures/Regression_Review/)
#' - [21+ statistical statements: 22 fallacies and one paradox](questions/22_statements.html)

#' __Some comments on causality:__
#' 
#' - There's a lot of confusion over concepts related to causality. 
#'   Be ready to take a critical approach when you read presentations
#'   about causality. Many reflect a very superficial understanding
#'   or the concepts.
#'   See, for example this web page entitled 
#'   [Confounding Variable: Simple Definition and Example](https://www.statisticshowto.datasciencecentral.com/experimental-design/confounding-variable/).
#'   What characteristics determine a better versus a worse definition of
#'   a concept like 'confounding variable.'  What do you think of the 
#'   definitions and discussions on this web page?
#' - Two major approaches developed over the last few decades are   
#'   Donald Rubin's causal model (RCM) --
#'   Rubin calls it the Neyman causal model -- versus Judea Pearl's 
#'   graph theoretical approach using DAGs (directed acyclic graphs).
#'   Here are some links to a fascinating discussion in 
#'   Andrew Gelman's blog in which some outstanding
#'   statistical minds reveal discuss the two appraoches in a
#'   way that reveals a lot about the nature of scientific 
#'   controversies.
#'     - [More on Pearl/Rubin, this time focusing on a couple of points](https://statmodeling.stat.columbia.edu/2009/07/09/more_on_pearlru/)
#'     - [Resolving disputes between J. Pearl and D. Rubin on causal inference](https://statmodeling.stat.columbia.edu/2009/07/05/disputes_about/) 
#'
##+ Day 26 ----
#' ## __Day 26__: Wednesday, March 11
#'
#' __Links:__
#' 
#' - [The meaning of regression](lectures/Regression_Review/)
#' - [23 statistical statements: 22 fallacies and one paradox](questions/22_statements.html)
#' 
##+ Day 27 ----
#' ## __Day 27__: Friday, March 13
#' 
#' __Links:__
#' 
#' - See Causal Questions and Causal_Simulation.R in [Regression_Review](files/Regression_Review/)
#' - Back to [Regression in R](R/Regression_in_R_notes.pdf?q=1234)
#' 
#' __Special links for barcharts:__
#' The following are two links illustrating how to generate barcharts
#' to visualize frequencies and relative frequencies for categorical
#' variables:
#' 
#' - [Barcharts.html](files/Barcharts.html)
#' - [Barcharts.R](files/Barcharts.R)
#' 
##+ Day 28 ----
#' ## __Day 28__: Monday, March 16
#' 
#' 
##+ Day 29 ----
#' ## __Day 29__: Wednesday, March 18
#'
#' __Links:__
#'
#' - When is Residual Deviance = Goodness of Fit ... and When It's Not:
#'     - [pdf](R/Deviance_as_Goodness_of_Fit.pdf?q=1234)
#'       __/__ [with notes](R/Deviance_as_Goodness_of_Fit_notes.pdf?q=1234) 
#'       __/__ [R script](R/Deviance_as_Goodness_of_Fit.R?q=1234) 
#' - [Regression in R](R/Regression_in_R_notes.pdf?q=1234)
#' 
##+ Day 30 ----
#' ## __Day 30__: Friday, March 20
#'
#' __Links:__
#'
#' - [Generalized Splines](files/Guide_to_splines_in_spida.pdf) __/__
#'   [notes](files/Guide_to_splines_in_spida_notes.pdf) __/__
#' - [Regression in R](R/Regression_in_R_notes.pdf?q=1234)
#'
##+ Day 31 ----
#' ## __Day 31__: Monday, March 23
#'
#' __Links:__
#'
#' - [Generalized Splines](files/Guide_to_splines_in_spida.pdf) __/__
#'   [notes](files/Guide_to_splines_in_spida_notes.pdf) __/__
#' - [Regression in R](R/Regression_in_R_notes.pdf?q=1234)
#' 
##+ Day 32 ----
#' ## __Day 32__: Wednesday, March 25
#' 
#' __Links:__
#'
#' - [Regression in R](R/Regression_in_R_notes.pdf?q=1234)
#' 
##+ Day 33 ----
#' ## __Day 33__: Friday, March 27
#'
#' __Past tests:__
#'  
#' [2017](questions/MATH_4939_Final_Exam_2017.pdf)
#' __/__ [2018](questions/math4939_exam_2018_1.pdf)
#' __/__ [2019](questions/math4939_exam_2019.pdf)
#' 
#' __Links:__
#'
#' - [Regression in R](R/Regression_in_R_notes.pdf?q=1234)
#' 
##+ Day 34 ----
#' ## __Day 34__: Monday, March 30
#'
#' __Class cancelled__
#' 
##+ CURRENT ----
#' <span id='CURRENT'></span>
#' 
##+ Day 35 ----
#' ## __Day 35__: Wednesday, April 1
#' 
#' Format of final exam: Have a look at [Sample Exam format for NATS1500](https://www.research.net/r/NATS1500-Sample-Test)
#' 
#' __Past tests:__
#'  
#' [2017](questions/MATH_4939_Final_Exam_2017.pdf)
#' __/__ [2018](questions/math4939_exam_2018_1.pdf)
#' __/__ [2019](questions/math4939_exam_2019.pdf)
#' 
##+ Day 36 ----
#' ## __Day 36__: Friday, April 3
#' 
#' __Project presentations:__
#' 
#' - Start at 9 am
#' - 10 minutes each + 5 minutes for discussion/questions
#' - We will determine the order randomly at the beginning
#'   of class
#' 
#' <!--
#' Consider:
#' - PROBLEM: project
#' - DONE moving 22 statements to questions
#' - adding http://mtor.sci.yorku.ca:8787/files/6635/SCS2019/Lords_Paradox_Gain_scores.pdf
#'   and causalsim (maybe with a vignette)
#' - Add and discuss three theorems
#' - Fascinating example of academic debate on:
#' -->
#' # References
#+ include = FALSE
## END ----
k()
#+
#' #' __Lecture Links:__
#' 
#' 
#' 
#' During the next few lectures we will review the interpretation of regression output and we will
#' read and do exercises from the earlier sections of: 
#' Data Structures and Subsetting: [Hadley Wickham (2014) _Advanced R_](http://adv-r.had.co.nz/) @wickham2014advanced.
#' 
##' ################################################  CHANGE TO NEW LINKS  ####################### 
#' - R Scripts:
#'     - [Data structures](R/Advanced_R_Notes_2_Data_Structures.R)
#'     - [Subsetting](R/Advanced_R_Notes_3_Subsetting.R)
#'     - [Vocabulary](R/Advanced_R_Notes_4_Vocabulary.R)
#'     - [Style](https://google.github.io/styleguide/Rguide.xml)
#'     - [Functions (in progress)]<!-- (R/Advanced_R_Notes_Functions_and_OOP.R)-->
#'     - [OO field guide (in progress)]<!-- (R/Advanced_R_Notes_Functions_and_OOP.R)-->
#'     - [Review of Regression in R](R/Regression_in_R.R) __/__ [html](R/Regression_in_R.html)  
#'     - [Simple loop](https://www.r-bloggers.com/how-to-write-the-first-for-loop-in-r/)
#' <!-- - Extras:     
#'     - To come:
#'         - Regular expressions
#'         - Working with multilevel and longitudinal data
#' - [Notes](notes/Notes_2019_01_04.pdf)
#' -->         
#' 
#' 
#' __Prepare for next class:__
#' 
#' - Read 'Data Structure' and 'Subsetting' in @wickham2014advanced.
#' 
#' __Reading for the next month:__
#' 
#' - Ten Rules for Effective Statistical Practice [@kassTenSimpleRules2016]
#' - The ASA Statement on $p$-values [@wassersteinASAStatementValues2016]
#' - Moving to a World Beyond $p < 0.05$ [@wassersteinMovingWorld052019]
#' 
#' # References
#' 
#+ include=FALSE
k()
#'
#' ## Day 2: Monday, January 7 
#' 
#' __Lecture:__ Continuation of previous class
#' 
#' ## Day 3: Wednesday, January 9
#' 
#' __Assignment 3:__
#' 
#' - The chapters entitled 'Data Structures' and 'Subsetting' in [Hadley Wickham (2014) _Advanced R_](http://adv-r.had.co.nz/) @wickham2014advanced
#'   contain 28 exercises -- excluding the quizzes at the beginning of each chapter, which have answers at the end of the chapter -- note that
#'   these quiz questions would make great exam questions! The two scripts for these chapters have a total of 9 questions at the end
#'   of the scripts. The assignment is to do these exercises. Probably, the best way to divide them in your team is to cycle through the questions.
#'   When posting on Piazza use a heading that identifies the question using the chapter and section of the text, e.g. <br>
#'   __Assignment 3 Data Structures, Lists, Exercise 5__<br>
#'   Use the folder `assn3` for any post related to this assignment.
#' - Deadlines: See the [course description](files/description.html) for the meaning of these deadlines.
#'     1. Thursday, January 17 at noon 
#'     2. Saturday, January 19 at noon 
#'     3. Sunday, January 20 at 9 pm
#' - Random sequence: 3 4 1 2 5
#'
#' __Lecture:__ Continuation of previous class
#' 
#' __Read for upcoming classes:__ Chapters on Vocabulary, Style and Functions in @wickham2014advanced.
#'
#' ## Day 4: Friday, January 11
#' 
#' Continuation of previous class
#'
#' ## Day 5: Monday, January 14
#' 
#' __Lecture:__ Reorganizing Links to @wickham2014advanced and related material:
#' 
#' - Data Structures:
#'     - [Text with notes](notes/Data_Structures_Advanced_R.pdf)
#'     - [R script](R/Advanced_R_Notes_2_Data_Structures.R) 
#'        __|__[Output](R/Advanced_R_Notes_2_Data_Structures.html)
#'        __|__[Output with notes](R/Advanced_R_Notes_2_Data_Structures_notes.pdf)
#' - Subsetting:
#'     - [Text with notes](notes/Subsetting_Advanced_R.pdf)
#'     - [R script](R/Advanced_R_Notes_3_Subsetting.R) 
#'       __|__ [Output](R/Advanced_R_Notes_3_Subsetting.html) 
#'       __|__ [Output with notes](R/Advanced_R_Notes_3_Subsetting_notes.pdf)
#' 
#' ## Day 6: Wednesday, January 16
#' 
#' __Lecture:__ Reorganizing Links to @wickham2014advanced and related material:
#' 
#' - Data Structures:
#'     - [Text with notes](notes/Data_Structures_Advanced_R.pdf)
#'     - [R script](R/Advanced_R_Notes_2_Data_Structures.R) 
#'       __|__ [Output](R/Advanced_R_Notes_2_Data_Structures.html)
#'       __|__ [Output with notes](R/Advanced_R_Notes_2_Data_Structures_notes.pdf)
#' - Subsetting:
#'     - [Text with notes](notes/Subsetting_Advanced_R.pdf)
#'     - [R script](R/Advanced_R_Notes_3_Subsetting.R) 
#'       __|__ [Output](R/Advanced_R_Notes_3_Subsetting.html) 
#'       __|__ [Output with notes](R/Advanced_R_Notes_3_Subsetting_notes.pdf)
#' - Vocabulary, Language and Style:
#'     - [Text on Vocabulary with notes](notes/Vocabulary_Advanced_R.pdf)
#'     - [Text on Style with notes](notes/Style_Advanced_R.pdf)
#'     - [Google R Style Guide](https://google.github.io/styleguide/Rguide.xml)
#' - Functions and Object-Oriented Programming:
#'     - [Text with notes](notes/Functions_Advanced_R.pdf)
#'     - [Text with notes](notes/OO_Advanced_R.pdf)
#' - Additional Notes: Language, Regular Expressions, Reshaping, Functions, OOP, Traps and Pitfalls, etc.
#'     - [R script](R/Advanced_R_Notes_Extras.R) 
#'       __|__ [Output](R/Advanced_R_Notes_Extras.html)
#'       __|__ [Output with notes](R/Advanced_R_Notes_Extras_notes.pdf)
#' - Regression Output in R:
#'     - [R script](R/Regression_in_R_2019.R)
#'       __|__ [Output](R/Regression_in_R_2019.html)
#'       __|__ [Output with notes](R/Regression_in_R_2019_notes.pdf)
#' - Questions:
#'     - [R script](R/Advanced_R_Questions.R)
#'       __|__ [Output](R/Advanced_R_Questions.html)
#'       __|__ [Output with notes](R/Advanced_R_Questions_notes.pdf)
#' 
#' ## Day 7: Friday, January 18
#' 
#' __Lecture:__
#' 
#' - [Additional Notes](R/Advanced_R_Notes_Extras.html)
#' 
#' __Assignment 4:__
#' 
#' - One team now has 6 members so the number of shared questions is a multiple of 6. If your team has 5 members, do only 5/6 of the shared questions.
#' - Question to be done by everyone: [Working with multiple data sets](files/data_exercise.html). Prepare your answer in R markdown, either a .R file
#'   with markdown (preferred by me) or a .Rmd file (preferred by most other people).
#'   Upload your .R or .Rmd file to Piazza. Use a title like: __Assignment 4: Classlist analysis__. Post your work as a __private__ posting 
#'   to the instructors __until Deadline 1 on January 24 at noon.__
#' - Shared questions (each person does 1/6):
#'     - From @wickham2014advanced:
#'         - Chapter on Functions:
#'             - Section on Function Components: 4 questions
#'             - Section on Lexical Scoping: 3 questions
#'             - Section "Every operation is ...': 0 questions
#'             - Section on Function Arguments __Important__: 3 questions
#'             - Section on Special Calls __Fun__: 5 questions
#'             - Section on Return Values: 4 questions
#'             - Total of 19 questions
#'         - Chapter on Object-Oriented Programming:
#'             - Section on S3: 6 questions
#'         - [R questions](R/Advanced_R_Questions.html): Questions 12, 18(f), 19, 41, 42
#' - Use descriptive titles for your posts such as<br>         
#'   __Assignment 4 Functions, Lexical Scoping 2__<br>
#'   Use the folder `assn4` for any post related to this assignment.
#' - Deadlines: See the [course description](files/description.html) for the meaning of these deadlines.
#'     1. Thursday, January 24 at noon 
#'     2. Saturday, January 26 at noon 
#'     3. Sunday, January 27 at 9 pm
#' - Random sequence: 3 2 1 5 6 4
#'
#' ## Day 8: Monday, January 21
#'
#' __Lecture:__
#' 
#' - [Additional Notes](R/Advanced_R_Notes_Extras.html) 
#'   __|__ [notes](R/Advanced_R_Notes_Extras_notes_2019_01_21.pdf)
#' - [Regression in R](R/Regression_in_R_2019.html)
#'   __|__ [notes](R/Regression_in_R_2019_2019_01_21.pdf)
#'
#' ## Day 9: Wednesday, January 23
#' 
#' No video: We discussed:
#' 
#' - Using `towide`: Why it produces an error unless 'idvar' and
#'   'timevar' combinations are unique.
#' - Object-oriented programming:
#'     - Creating a new generic function and methods.
#'     - Creating a new class and writing methods for existing
#'       generic functions. 
#' - Anything else?
#' 
#' ## Friday, January 25: No class
#' 
#' ## Day 10: Monday, January 28
#' 
#' __Lecture:__
#' 
#' - [Regression in R](R/Regression_in_R_2019.html)
#'   __|__ [notes](R/Regression_in_R_2019_2019_01_28.pdf) 
#'
#' ## Day 11: Wednesday, January 30
#' 
#' __Lecture:__
#' 
#' - [Regression in R](R/Regression_in_R_2019_01_30.html)
#'   __|__ [notes](R/Regression_in_R_2019_01_30.pdf) 
#'   
#' __Assignment 5:__
#' 
#' - __Question to be done by everyone:__ 
#'   [Analysis of Arrests for Marijuana Possession](files/Arrests_exercise.html). 
#'   Prepare your answer in R markdown, either a .R file
#'   with markdown or a .Rmd file.
#'   Upload your .R or .Rmd file to Piazza. Use a title like:<br>
#'   __Assignment 5: Analysis of Marijuana Arrests__.<br> 
#'   Post your work as a __private__ posting 
#'   to the instructor __until Deadline 3 on February 9 at 9 pm.__<br> You don't want to ruin the
#'   fun for other students by giving spoilers. It's almost impossible to do your own
#'   creative work when you've seen someone else's work.
#' - __Shared questions:__ Each team member should so 3 questions from the approximately
#'   21 questions in [Regression in R](R/Regression_in_R_2019_01_30.html)
#' - Use descriptive titles for your posts such as:         
#'   __Assignment 5: Regression in R: Exercise 3.2__<br>
#'   Use the folder `assn5` for any post related to this assignment.
#' - Deadlines: See the [course description](files/description.html) for the meaning of these deadlines.
#'     1. Thursday, February 7 at noon 
#'     2. Saturday, February 9 at noon 
#'     3. Sunday, February 10  at 9 pm
#' - Random sequence: 4 3 5 2 6 1
#'
#' ## Day 12: Friday, February 1
#' 
#' __Lecture:__
#'
#' - For reading: [Exploring Data in R](R/Exploring_Data_in_R_1.html) 
#'   __|__ [script](R/Exploring_Data_in_R_1.R) 
#' - Continuing: [Regression in R](R/Regression_in_R_2019_01_30.html)
#'   __|__ [notes](R/Regression_in_R_2019_01_30.pdf) 
#'   __|__ [script](R/Regression_in_R_2019.R) 
#'   
#' ## Day 13: Monday, February 4
#' 
#' __questions for the midterm:__ 
#' 
#' - [Last year's midterm](files/math4939_test_2018.pdf)
#' - Assignment questions
#' 
#' __Lecture:__
#' 
#' - [Assignment 4: Working with multiple files R script](R/Assignment_4.R)
#' - Continuing: [Regression in R](R/Regression_in_R_2019_01_30.html)
#'   __|__ [notes](R/Regression_in_R_2019_01_30.pdf) 
#'   __|__ [script](R/Regression_in_R_2019.R)<br>
#' - New: [Guide to splines in spida2](files/Guide_to_splines_in_spida.pdf) 
#'     
#' __Coming up:__
#' 
#' - [Hierarchical Models](files/Hierarchical_Models.pdf)
#' - [Hierarchical Models Lab 1](R/Lab_1.R)
#'
#' ## Day 13: Wednesday, February 6
#' 
#' - see comments on selected exercises on Piazza
#' - continued previous day
#' 
#' ## Day 13: Friday, February 8
#' 
#' - [Prerecorded lecture](videos/Video%202019-02-07%2018-06-42.mp4)
#' - [Hierarchical Models](files/Hierarchical_Models.pdf)
#' - [Hierarchical Models Lab 1](R/Lab_1.R)
#'     - work your way through the first 1/3 of this script, experimenting
#'       and working on exercises. In particular, work on adding gender
#'       to the model.
#'       
#' ## Day 14: Monday, February 11
#' 
#' - continued Hierarchical Models
#' 
#' ## Day 15: Wednesday, February 13
#'        
#' - [Last year's midterm](files/math4939_test_2018_discussion.pdf)
#' 
#' ## Day 16: Monday, February 25
#' 
#' - continue Hierarchical Models
#' - [Hierarchical Models Lab 1](R/Lab_1.R)
#'     - work your way through the remainder of this script, experimenting
#'       and working on exercises. In particular, work on adding gender
#'       to the model.
#' 
#' ## Day 17: Wednesday, February 27
#' 
#' - continue Hierarchical Models
#' 
#' __Project:__ 
#' 
#' Assignment 6 below is designed to give each of you an opportunity to
#' explore the data you will be using for the project. The data are contained in an
#' Excel file at http://blackwell.math.yorku.ca/MATH4939/data_private. 
#' Use the userid and password provided in class. THe data should be treated as
#' confidential and may be used only for the purposes of this course. 
#' 
#' __Assignment 6:__ 
#'
#' - (Individual) Post your work as a __Private__ posting to the instructor
#'   until Sunday, March 3 at 9pm. Use `assn_6` as a folder.
#' - Post a Rmarkdown script file and html output it produces to:
#'     - Turn the data frame for the project into a long file. Note that
#'       variables with names that end in '_1', '_2', etc. are longitudinal variables.
#'       Most of the variables are measures of the volume of components of the brain: 
#'       e.g. 'HC' refers to
#'       the hippocampus that has several parts, 'CC' to the corpus callosum, 'GM' is 
#'       grey matter, 'WM' is white matter, 'VBR' is the ventricle to brain ratio. Ventricles
#'       are 'holes' in your brain that are filled with cerebro-spinal fluid so VBR measures
#'       how big the holes in your brain are compared with the solid matter. If the brain volume
#'       shrinks, the total volume of the cranium remains the same so VBR goes up. 
#'     - The ids are numerical for patients with brain injuries and have the form 'c01', 'c02'
#'       etc for control subjects. The variable 'date_1' contains the date of injury and
#'       'date_2', 'date_3', etc., the dates on which the corresponding brain scans were 
#'       performed.
#'     - You might like to have a look at [Wrangling Messy Spreadsheets into Useable Data](R/Messy_data.html) 
#'       for some ideas on using dates.
#'     - Plot some key variables: VBR, CC_TOT, HPC_L_TOT, HPC_R_TOT against elapsed time
#'       since injury using appropriate plots to convey some idea of the general patterns
#'       in the data.
#'     - Remember that any changes to the data must be done in R. Do not edit the Excel file.
#'     - Comment on what you see.
#'     - Make a table (using a command in R, of course) showing how many observations
#'       are available from each subject. 
#'     - Create a posting entitled 'Assignment 6' to Piazza in which you 
#'       Upload your Rmarkdown .R file and the html file it produces.
#'     - Make it Private to the instructor until Sunday, March 3 at 9pm.
#'  
#' ## Day 18: Monday, March 4
#'
#' - Continue hierarchical models
#' 
#' __Assignment 7:__ 
#'
#' - (Individual) Post your work as a __Private__ posting to the instructor
#'   until Sunday, March 10 at 9pm. Use `assn_7` as a folder.
#' - Post a Rmarkdown script file and the html output it produces.<br>
#'   Using the 'hs' data among public schools only, fit the following models:
#'     1. Regress 'mathach' on 'ses'
#'     2. Create variables, 'ses_mean' and 'mathach_mean' equal to the mean 
#'        of each variables within each school and regress 'mathach_mean' on
#'        'ses_mean' in two ways: regressing on all students and regressing
#'        with one observation per school.
#'     3. Create a variable 'ses_dev' equal to 'ses' - 'ses_mean'. 
#'        Regress 'mathach' on 'ses_dev' + 'ses_mean'.
#'     4. Regress 'mathach' on 'ses' + 'ses_mean'.
#'     5. Regress 'mathach' on 'ses' + a factor for schools.
#'     6. Use a mixed effects model to regress 'mathach' on 'ses' with
#'        a random intercept for each school.
#'     7. Use a mixed effects model to regress 'mathach' on 'ses' + 'ses_mean'
#'        with a random intercept for each school.
#'     8. Use a mixed effects model to regress 'mathach' on 'ses_dev' + 'ses_mean'
#'        with a random intercept for each school.
#'     9. Use a mixed effects model to regress 'mathach' on 'ses_dev' + 'ses_mean'
#'        with a random intercept and a random slope for 'ses_dev' for each school.
#'     9. Identify the equalities and inequalities in the estimated coefficients
#'        above that correspond to equalities and inequalities discussed in class.
#'     9. Discuss differences between the standard errors of corresponding estimated
#'        coefficients in models in lines
#'        4, 5, 7 and 8.
#'     9. Fit a model using data from both sectors allowing for different
#'        slopes with respect of 'ses_dev' and 'ses_mean' in each sector and
#'        a random intercept for each school. Estimate and construct a
#'        confidence interval for the difference in 
#'        expected 'mathach' for a student whose ses is 0 in a Public school with mean ses
#'        equal to -1 and a student whose ses is -1 in a Catholic school with mean ses
#'        equal to 0. 
#' - Create a posting entitled 'Assignment 7' to Piazza in which you 
#'   Upload your Rmarkdown .R file and the html file it produces.
#' - Make it Private to the instructor until Sunday, March 10 at 9pm.
#'
#' __Midterm retry:__
#' 
#' You can improve your midterm grade by retrying any question on which
#' you didn't get a perfect score. You can gain as much as 50% of the 
#' difference between the grade you got on the midterm and a perfect
#' grade of 10 on any question you retry. The work must be your own.
#' You may not copy work from anyone else but you can seek help to
#' better understand general principles.
#' 
#' Make your answers private to the instructor, one post per question.
#' Use the title 'Midterm Question X' where X is the question you are
#' retrying. Use the folder `midterm retry`. Post your answers before 
#' Friday, March 8 at 9pm. 
#' 
#' ## Day 19: Wednesday, March 6
#' 
#' __Lecture:__
#' 
#' - Continue hierarchical models
#' - Start? [Longitudinal Models](lectures/Longitudinal_Models.pdf)
#' 
#' __Project:__
#' 
#' The project consists in using the TBI data set (download it again) to answer the 
#' questions below. Prepare a report
#' and a 15-minute (absolute total time since 3 teams need to present in 50 minutes) presentation.
#' Teams 1, 2 and 3 will work on CC_TOT, HPC_TOT and VBR, respectively, as outcome variables.
#' 
#' The questions to answer are:
#' 
#' 1. Is there evidence of an effect of TBI on volumetric measures compared with control subjects?
#'    In particular, is there evidence of a gap between controls and patients and is there
#'    evidence that the rate of change post-TBI is different from what would be expected as
#'    the normal change associated with aging: an average change in these volumetric measures after TBI adjusting the
#'    for the normally expected change associated with aging, taking into account the possibility that
#'    the rate of change may not be constant over the post-injury period.
#' 2. Is there evidence that the rate of change is different in the early versus the later post-TBI
#'    period? 
#' 3. Can you estimate what proportion of TBI patients would experience various proportional
#'    changes in volume: e.g. what proportion would change by more than 10%, 5% to 10%,
#'    less that 5%?
#'    
#' Your report should be a pdf file generated by a .R or .Rmd file 
#' (agree on the format within your team).
#' It should contain discussions, tables and graphs to present your findings. 
#' It should be a proper professional
#' looking report, i.e. no visible code. You should also prepare your presentation using
#' [Rmarkdown](https://rmarkdown.rstudio.com/lesson-11.html). You will eventually post
#' your work on Piazza. 
#' 
#' The first step is to do some research on the phenomenom you are studying. Find some 
#' relevant sources and create a bibliography. 
#' 
#' ## Day 20: Friday, March 8
#' 
#' - [Longitudinal Models](lectures/Longitudinal_Models.pdf)
#' - Lord's Paradox
#' 
#' ## Day 21: Monday, March 11
#' 
#' __Assignment 8:__ 
#'
#' - (Team) Post your work as postings to your team 
#'   until Sunday, March 17 at 9pm. Use `assn_8` as a folder.
#' - Illustrate Lord's Paradox by generating data with the 
#'   distribution shown in the discussion of Lord's Paradox, with 200 subjects
#'   in each 'cafeteria' group. Then perform the following analyses
#'   and comment on your results. Let Y1 be weight at time 1, Y2 be
#'   weight at time 2, G = Y2 - Y1 and C be the cafeteria.
#'     1. Y2 ~ C + Y1 
#'     2. G ~ C
#'     3. G ~ C + Y1
#' - Reshape the data in long form, letting Time = 1,2 be the
#'   time variable and use the following model:
#'     - lme(Y ~ Time * C, data, random = ~ 1 | subject)
#' - Comment on the relationships among the estimated coefficients and their SEs
#'   from these models.
#' - Create a posting entitled 'Assignment 8' to Piazza in which you 
#'   Upload your Rmarkdown .R file and the html file it produces.
#' - Make it private to your team until Sunday, March 17 at 9pm.
#'
#' __Lecture:__
#' 
#' - [Longitudinal Models](lectures/Longitudinal_Models.pdf)
#' - Play with [Lab_2.R](lectures/Lab_2.R)
#' 
#' ## Day 22: Wednesday, March 13
#' 
#' - [Longitudinal Models](lectures/Longitudinal_Models.pdf)
#' 
#' ## Day 23: Friday, March 15
#' 
#' - [Longitudinal Models](lectures/Longitudinal_Models.pdf)
#' 
#' ## Day 24: Monday, March 18
#' 
#' - [Last year's final exam](files/math4939_exam_2018_1.pdf)
#' - [Longitudinal Models](lectures/Longitudinal_Models.pdf)
#' - Using Github
#'     - __Setup (first time only)__
#'         - Make sure that you've accepted the invitations you received from Github
#'         - Open the project you use for the course in RStudio
#'         - Make sure you are using the git shell in your terminal
#'         - Go to (or open) a terminal session
#'         - Type: `git clone https://github.com/MATH-4939-York-University/TeamX.git` where X is your 
#'           team number: 1, 2, or 3.<br>
#'           This will download the current repository from Github and create a new directory 'TeamX' as a subdirectory of the your current directory.
#'         - Create a 'New Project' in Rstudio in this directory.
#'         - Open this project in RStudio.
#'         - Create a file called 'first_XX.R' where XX is your initials (2 or 3 capital letters)
#'           and save it.  
#'         - __Stage__ the new file to your tracked files and __commit__ the change using the steps shown in
#'           class.
#'         - __Pull__ to add any changes made by others in the meantime.
#'         - __Push__ the changes to Github.
#'     - __Ongoing Workflow for the project__
#'         - In RStudio, open the 'TeamX' project.
#'         - __Pull__ to get all changes by your team.
#'         - Open files created by others but avoid modifying them. Copy and paste material
#'           into your own files.
#'         - All files you create or edit should end with your initials.
#'         - Frequently and at the end of a session: 
#'             - __Pull__ - __Stage__, __Commit__, __Pull__, __Push__ 
#'         - Whenever you start working after any pause: __Pull__
#'         - Communication: Your team should agree to use Piazza OR Github. Try both between now
#'           and Wednesday and let's discuss on Wednesday. Use the 'r_tudio_git' folder on Piazza
#'           to discuss problems with the class.
#'         - When you start feeling brave, work on common files. This is what git is really meant
#'           for but you may need to learn much more about git to fix editing conflicts. Good
#'           preventative: __Pull__, __Stage__, __Commit__, __Pull__, __Push__, __Pull__ often when working
#'           on a commonly edited file.
#'
#' ## Day 26: Friday, March 22
#' 
#' - [Notes on heteroskedasticity in mixed models](notes/Notes_on_Heteroskedasticity.html) 
#'   __/__ [R script](notes/Notes_on_Heteroskedasticity.R)
#'   __/__ [notes](notes/Notes_on_Heteroskedasticity_1.pdf)
#'  
#' ## Day 25: Monday, March 25
#' 
#' ## Day 25: Wednesday, March 27
#' 
#' - [Non-Linear Mixed Effects Models](lectures/Non_Linear_Mixed_Models.pdf)
#' - [Last year's final exam](files/math4939_exam_2018_1.pdf)
#' 
#' ## Day 26: Friday, March 29
#' 
#' - [Notes on Theorems in Regression](http://blackwell.math.yorku.ca/gmonette/drafts/Three_Basic_Theorems.pdf) continued as a [rough draft](http://blackwell.math.yorku.ca/gmonette/drafts/Regression_2.pdf)
#' 
#' ## Day 27: Monday, April 1
#'
#' - [Non-Linear Mixed Effects Models](lectures/Non_Linear_Mixed_Models.pdf)
#' - [Notes on the midterm](files/math4939_mt_2019_solutions.pdf)
#' 
#' # References
#' 
#+ include=FALSE
## EXIT --------------
knitr::knit_exit()
#'
#' __Lecture:__
#'
#' - __Read in advance__
#'     - Data Structures and Subsetting: [Hadley Wickham (2014) _Advanced R_](http://adv-r.had.co.nz/) @wickham2014advanced.
#' - __Activity 3 (team)__ due: Wednesday, January 10 at 9 am.
#'   Post answers to the __exercises__ (not the quiz) in
#'   the _Advanced R_ text in the chapters on _Data structures_
#'   and _Subsetting_ whose number mod 3 is equal
#'   to 0 for Bayes, 1 for Blackwell and 2 for Fraser.
#'
#' ## Day 3: Monday, January 15
#'
#' - __Read in advance__
#'     - _Vocabulary_, _Style_, and _Functions_ in [Hadley Wickham (2014) _Advanced R_](http://adv-r.had.co.nz/) @wickham2014advanced.
#' - Scripts:
#'     - [Advanced R notes on data structures and subsetting](R/Advanced_R_Notes_2_Data_Structures_3_Subsetting.R)
#'         - Note sections on factors, dropping levels, indexing with a matrix of indices, easy sorting of a data frame in spida2
#'     - [Advanced R notes on vocabulary and language](R/Advanced_R_Notes_Language.R)
#'         - Note sections on subsetting data frames, rep, diag, apply, lapply, multilevel data,
#'           capply, up and merge, naming objects.
#' - __Activity 4 (team)__ due: Friday, January 19 at 9 am. __(updated)__
#'   Post answers to the exercise set in the _Advanced R_ test in the chapter titled
#'   _Functions_. Within each set, Bayes, Blackwell and Fraser use mod 1, 2 and 0 respectively. This
#'   means that Bayes does more work this time but we will try to balance that over the course.
#'
#' ## Day 4: Wednesday, January 17
#'
#' <!-- add material on additional vocab for multilevel
#' Plan:
#' Functions and OOP for NEXT CLASS
#' Multilevel data -- get from ICPSR?
#'    - group evaluation activity: use data frame with classlist with my.yorku.ca
#' Regular expressions -- post link to game
#' Dates and time -- later for longitudinal
#' Graphics
#' Debugging
#'
#' Causality - links from Judea Pearl
#'
#' Ask student to post Index in Piazza
#'
#' - __Read in advance__
#'     - _OO field guide_, sections _Base types_ and _S3_ in [Hadley Wickham (2014) _Advanced R_](http://adv-r.had.co.nz/) @wickham2014advanced.
#' - __Activity 5 (team)__ due: Monday, January 22 at 9 am. __(updated)__
#'   Post answers the the exercise set in the _Advanced R_ test in the chapter titled
#'   _OO field guide_ in the section _S3_. Use the same moduli as for Activity 4.
#' - __Activity 6 (team)__ due: Wednesday, January 24 at 9 am.
#'   Collectively edit a post on Piazza on the following topic. Try to make the post itself
#'   as 'clean' and clear as possible. You can have discussions in the followup discussions.
#'   Prepare a commented list of links to 'cheatsheets' and resources on:
#'     - Bayes: r markdown
#'     - Blackwell: base R
#'     - Fraser: basic and lattice graphics
#' - __Activity 7 (individual)__ due: Friday, January 26 at 9 am.
#'   Review this [script](R/Exploring_Regression.R) ([html output](R/Exploring_Regession.html)).
#'   Prepare an analysis and graphs displaying the value of an additional year of education as
#'   a function of education, type of occupation and gender composition (choose gender compositions
#'   of 0%, 50% and 100% female). Post your R markdown script and html output as a private post
#'   to the instructor on Piazza.
#'
#' ## Day 5: Friday, January 19
#'
#' - [Lies, Damned Lies, ...](Lies_Damned_Lies_2018_01_19.pdf) to be continued
#'     - Lies? or answers to different questions?
#'     - Experimental vs observational data
#'     - Why experimental data provides answers to causal questions
#'     - Limitations of experimental data
#'     - Causal vs predictive questions
#'     - The challenge of causal inference with observational data
#'
#' ## Day 6: Monday, January 22
#'
#' - Finish [Advanced R notes on vocabulary and language](R/Advanced_R_Notes_Language.R)
#'       
#' ## Day 7: Wednesday, January 24
#'
#' - Really finish [Advanced R notes on vocabulary and language](R/Advanced_R_Notes_Language.R)
#' - Review: [More on R](lectures/Messy_data.html) ([script](lectures/Messy_data.R))
#'     - This file for a short course on R has a section near the end that illustrates
#'       how easy it is to write a function in C and incorporate it into R with a
#'       'header' function.
#'     - It also has useful information on using date and time variables.
#'
#' 
#' ## Day 8: Friday, January 26
#'
#+ include=FALSE
#### EXIT --------------------------
knitr::knit_exit()
#+
#' - Finish [Lies, Damned Lies, ...](Lies_Damned_Lies_2018_01_19.pdf)
#' - __Activity 8 (teams)__ due: Friday, February 2 at 9 am.
#'   Prepare and discuss a Paik-Agresti diagram for the following situations:
#'     - __Bayes:__ There are two treatments used on kidney stones: Treatment A
#'       and Treatment B. Doctors are more likely to use Treatment A on large
#'       -- therefore more serious -- kidney stones and Treatment B on 
#'       small stones. Should a patient who doesn't know the size of their
#'       kidney stone examine the general population data, or the stone-size
#'       specific data when determining which treatment will be more effective?
#'       Make up a table with plausible hypothetical data on the success
#'       rates of each treatment. Note that, in fact, the _overall_ rate of 
#'       success for Treatment B (lithotripsy) is higher than that of Treatment A (surgery).
#'       Is it possible that patients should nevertheless prefer Treatment A regardless
#'       of the size of their kidney stones? Why or why not?
#'     - __Fraser:__ A baseball batter named Tim has a better batting average than
#'       his teammate Frank. However, someone notices that Frank has a better
#'       batting average than Tim against both right-handed and left-handed
#'       pitchers. How can this happen? Present hypothetical data in a table
#'       and draw the corresponding Paik-Agresti diagram. 
#'     - __Blackwell:__ Use the following Florida capital sentence data from Agresti 2012. Is there
#'       evidence that black defendants are sentenced to capital punishment more
#'       frequently than white defendants? Does it make any difference 
#'       if you consider the race of the victim? If so, how?
#+ include=FALSE
dp <- read.table(
  header=TRUE,
  text = 
    '
"race of defendant" "race of victim" "death sentence" count
white white yes 53
black white yes 11
white black yes 0
black black yes 4
white white no  414
black white no  37
white black no  16
black black no  139
')
#+ echo=FALSE,results='asis'
names(dp) <- gsub('\\.',' ', names(dp))
knitr::kable(dp, caption = 'Floriday capital punishment data')
#' 
#' - __Activity 9 (teams)__ due: Monday, February <s>5</s> 26 at 9 am. __(updated)__<br>
#'   Design a system to collect information from each team member
#'   about each team mate based on the questions in
#'   [this peer evaluation form](files/MATH_4330_Peer_Evaluation.pdf).<br> 
#'     - Design a poll using the
#'       'poll' feature in Piazza (when you create a 'New Post' one of the options
#'       is to create a 'Poll/In-Class Response' post) __or some other method__.
#'     - Create a set of functions in R that take the result of the poll
#'       and turn it into a report for each individual giving them
#'       their truncated(?) means 
#'       on each item, the team average and the class average.
#'       The comments, which are of a general nature, should be included
#'       for each individual but shouldn't show the author.
#'     - The final output should be a report in the form of a pdf file
#'       for each student. They should not be mailed automatically so
#'       they can be reviewed by the instructor before mailing.
#' - Start reading:
#'     - [Hierarchical and Mixed Models](lectures/Hierarchical_Models_and_Mixed_Models.pdf)
#'     - [Lab 1.R](lectures/Lab_1.R)
#'     - [Longitudinal Models](lectures/Longitudinal_Models.pdf)
#'     - [Lab 2.R](lectures/Lab_2.R)
#'     
#' # Day 9: Monday, January 29
#' 
#' - continue Hierarchical and Mixed Models
#' 
#' # Day 10: Wednesday, January 31
#' 
#' - continue Hierarchical and Mixed Models
#' 
#' # Day 11: Friday, February 2
#' 
#' - continue Hierarchical and Mixed Models
#' 
#' # Day 12: Monday, February 5
#' 
#' - continue Hierarchical and Mixed Models
#' 
#' # Day 13: Wednesday, February 7
#' 
#' - continue Hierarchical and Mixed Models
#' - Tutorial: Two files we looked at:
#'     - [Eyeing correlations](files/visual_ci.PNG)
#'     - [Selecting from lists](R/selection_in_lists.R)
#' 
#' # Day 14: Friday, February 9
#' 
#' - continue Hierarchical and Mixed Models
#' 
#' # Day 15: Monday, February 12
#' 
#' - continue Hierarchical and Mixed Models
#' 
#' # Day 16: Wednesday, February 14
#' 
#' - Midterm test
#' - __Activity 10 (individual)__ due: Wednesday, February 28 at 9 am. 
#'       - Answer the questions and do the exercises in 
#'         [Lab 1.R](lectures/Lab_1.R). 
#'       - Play and experiment with the code. Correct it where you find errors. 
#'       - Add at least 2 interesting questions or exercises. 
#'       - Post the resulting .R script and .html output on Piazza in 
#'         a private posting to the instructor.
#'       - Although this is an individual activity you may work with each other, but
#'         do your own work in the file. For example, don't cut and paste from someone else's work.
#' 
#' # Day X: Friday, February 16
#' 
#' - no class today
#' 
#' # Day 17: Monday, February 26
#' 
#' - __Project__: For a start, individually, have a look at and download the data for the project at 
#'   http://blackwell.math.yorku.ca/MATH4939/data_private. Use the userid and password 
#'   provided in class. Have a good look at the data and be prepared to discuss
#'   it and to ask questions about it on Wednesday. 
#' 
#' # Day 18: Wednesday, February 28
#' 
#' - [Hierarchical and Mixed Models with notes](lectures/Hierarchical_Models_and_Mixed_Models_notes.pdf)
#'     - [Lab 1.R](lectures/Lab_1.R)
#'     - [Longitudinal Models](lectures/Longitudinal_Models_notes.pdf)
#'     - [Lab 2.R](lectures/Lab_2.R)
#' 
#' # Day 19: Friday, March 2
#' 
#' - [Hierarchical and Mixed Models with notes](lectures/Hierarchical_Models_and_Mixed_Models_notes.pdf)
#' 
#' # Day 20: Monday, March 5
#' 
#' - [Hierarchical and Mixed Models with notes](lectures/Hierarchical_Models_and_Mixed_Models_notes.pdf)
#' - [Longitudinal Models with notes](lectures/Longitudinal_Models_notes.pdf)
#' 
#' # Day 21: Wednesday, March 7
#' 
#' - [Hierarchical and Mixed Models with notes](lectures/Hierarchical_Models_and_Mixed_Models_notes.pdf)
#' - [Longitudinal Models with notes](lectures/Longitudinal_Models_notes.pdf)
#' - [Parametric splines](lectures/Guide_to_splines_spida_notes.pdf)
#' - Examples of parametric splines and seasonal adjustments
#'     - [Migraine data](R/migraines.pdf)  | [R script](R/migraines.R)
#'
#' # Day 22: Friday, March 9
#' 
#' # Day 23: Monday, March 12
#' 
#' # Day 24: Wednesday, March 14
#' 
#' # Day 25: Friday, March 16
#' 
#' - Example of longitudinal data analysis
#'     - [Lab 2.R](lectures/Lab_2.R)
#'     - [Lab 2.html](lectures/Lab_2.html)
#'     - [Lab 2.pdf](lectures/Lab_2.pdf)
#'  
#' # Day 26: Monday, March 19
#' 
#' # Day 27: Wednesday, March 21
#' 
#' - [Sample exam questions](files/MATH_4939_Sample_Final_Exam_Questions.pdf)        
#' 
#' # Day 28: Friday, March 23
#' 
#' - Sorry! I lost the video today. The whole lecture was devoted to the identifiability
#'   of variance-covariance parameters in linear mixed effects models. The notes
#'   for the lecture start around p. 97 of [Lab 2](lectures/Lab_2_notes_2.pdf) 
#' - [Wang, W. (2013) "Identifiability of linear mixed effects models](https://projecteuclid.org/download/pdfview_1/euclid.ejs/1359041591)
#'     - This is an article on the identification of variance-covariance 
#'       parameters on the G and R side variance models. Sometimes you just need
#'       to laboriously write out the parameters of the variance model to understand
#'       potential problems with your model.
#'       
#' ##
#' # References
#'