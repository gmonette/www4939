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
#' 
#' <!----
#' 
#' TODO:
#' 
#' - First: possible ask list of questions for different students to answer
#'   based on vocabular study.
#'   Idea; Different students use same methodology so those lacking will
#'   get help from others.
#' 
#' - look at notes in Quire for changes to description, e.g.
#'   - require cameras for oral test
#'   - in class 1 hour midterm and 2 hour final if inclass possible, otherwise
#'     a 30 minute oral individually scheduled for both
#'   - weekly quiz, in class on laptop with access to web to equalize
#'     for students not in class
#'   - sould I change to markdown to facilitate citations:
#'   - add reading and sumarizzing a paper
#'   - add contributed links should be accompanied with a note describing
#'     why the link is interesting and providing a critique.
#'   - front row team as before, your participation is much appreciated
#'     and makes a big difference to the lecturer.
#'   - Lecture will be on zoom. Class attendance is expected and participation
#'     in class or via chat, etc, which students can use in class also is encouraged
#'   - make sure speakers not active on your lapttop if you use zoom in class;
#'     a good trick is to plug earbuds in your laptop to avoid deafening feedback
#'     loops
#'   - Team Project: differen students work on different aspects of a problem
#'     and then combine their work into a common project and presentation to
#'     be recorded on Zoom and will be posted for class.
#'   - Two Other teams comment independently??
#' What do do about SAS. Might have time this year due to early start.
#' 
#' --->
#' 
#+ include=FALSE
library(knitr)
k <- knitr::knit_exit
library(kableExtra)
library(magrittr)
# library(citr)
options(
  list(
    citr.bibliography_path='4939.bib',
    citr.use_betterbiblatex = TRUE))
#' This version: `r format(Sys.time(), '%B %d %Y %H:%M')`
#' <FORM>
#' <INPUT TYPE="button" onClick="history.go(0)" VALUE="Click here to get the latest update">
#' </form>
#' <form method="post" action="#CURRENT">
#'    <button type="submit">Go to the current date</button>
#' </form>
#' 
#' 
#' <br>
#' <font color="#CC0000" size="6">___Announcements:___</font>
#' 
#' __Sunday: February 25, 2024 at 4:30 pm: Update on the (apparently probable) strike.__
#' 
#'  At this stage it seems so unlikely that there won’t be a strike that 
#'  I am planning on the assumption that it will take place.
#'  
#'  Therefore, any forthcoming quizzes, if scheduled while the strike is still unresolved, 
#'  are cancelled and will be rescheduled.
#'  
#'  Our class will meet over Zoom at the usual time at https://yorku.zoom.us/j/93916385398
#' 
#' <!--
#' 
#' - No announcements so far
#' 
#' <font color="#880000" size="5">___The tutorial from 3 to 4 and office hours from 4 to 6 scheduled for Friday, January 22 
#' will take place at the same times on Saturday, January 23, instead ___</font>
#' <br><br>
#' <font color="#880000" size="5">___You must have passed<br>both MATH 3131 and MATH 4330<br>to enrol in and get credit for MATH 4939___</font>
#' 
#' > [Doubt is not a pleasant condition, but certainty is absurd. -- _Voltaire_](http://blackwell.math.yorku.ca/georgesmonette/files/quotes.html)
#' 
#' -->
#' 
#' > [Where there is no uncertainty, there cannot be truth -- _Richard Feynman_](http://blackwell.math.yorku.ca/georgesmonette/files/quotes.html)
#' 
#' > [To teach how to live without certainty, and yet without being paralysed by hesitation, is perhaps the chief thing that philosophy, in our age, can still do for those who study it. — Bertrand Russell](http://blackwell.math.yorku.ca/georgesmonette/files/quotes.html)
#' 
#+ include=FALSE
opts <- options(warn=-1)
library(p3d)
Init3d(cex=1)
d <- Smoking
d$`cigarettes/day` <- d$CigCon/365
d$`health spending` <- d$HealthExpPC
d$`life expectancy` <- d$LE
dim(d)
Plot3d(`life expectancy` ~ `health spending` + `cigarettes/day` | Continent, d)
spin(theta=-90,phi=0,fov=0)
Axes3d()
fit1 <- lm( `life expectancy` ~ `cigarettes/day`, d)
summary(fit1)
Fit3d(fit1, alpha = .5)

fith <- lm( `life expectancy` ~ `cigarettes/day` 
            + `health spending` 
            + log( `health spending`), d)

Fit3d(fith, col = 'red')
options(opts)
#+ echo=FALSE
rglwidget()
#' **How harmful is smoking?:** Cigarette consumption and life expectancy in 189 countries in 2004: Correlation is not causation. This is an example of the ecological fallacy, which is itself an example of a deeper phenomenon: Simpson's Paradox. 
#' 
#' <!-- > ![[<centre>Simpson's Paradox in 3D</centre>](http://blackwell.math.yorku.ca/Causality/rot.gif)](pix/simpsons.PNG) -->
#' 
#' # Quick links {#quick}
#' 
#' - [Go to current date](#CURRENT)
#' - [Course description](files/description.html)
#' - [Piazza class forum](http://piazza.com/yorku.ca/winter2024/math4939) 
#' - [Eclass -- only for grades](https://eclass.yorku.ca/)
#' - [Recordings](http://blackwell.math.yorku.ca/recordings/MATH4939/)
#' - [Questions](questions/m4939_questions_2024.html)
#' <!--- - [Annotated files on Mixed Models](files/Mixed_Models/)  --->
#'
#' <!--
#'   - [Schedule a slot for your team's presentation](https://calendly.com/georgesmonette/math-4939-project-presentation?month=2022-04&date=2022-04-08&back=1)
#' -->
#' 
##+ Calendar-------------
#'
#' # Calendar
#'
#' __Classes__ meet on Mondays, Wednesday and Friday from 9:30 to 10:20 in ACW 305 on Mondays and Wednesdays and in ACW 204 on Fridays.<br>
#' __Tutorial:__ On [Zoom (click here)](https://yorku.zoom.us/j/93916385398), every Tuesday from 1:30 to 2:30 pm.
#' __Instructor:__ [Georges Monette](http://blackwell.math.yorku.ca/gmonette) 
#' __Teaching Assistant:__ Chenyi Yu<br>
#' __Email:__ Messages about course content should be posted publicly to Piazza. You may
#' post messages and questions as personal messages to the instructors. If they are of
#' general interest and don't contain personal information, they will usually
#' be made public for the benefit of the entire class unless you specifically request that the message
#' remain private.
#' 
##- Day 1 ------
#'
#' ## __Day 1__: Monday, January 8
#' 
#' - [Course description](files/description.html)
#' - This evening, I will give access to Piazza to all students currently registered
#'   in the course. 
#'     -  I will use your York e-mail address. If you don't read 
#'        email at your York email address, please make sure that 
#'        it's forwarded to an email address that you do read regularly.
#'     -  Please do not change your e-mail address on Piazza because
#'        your York email address is used to identify you so you get credited for
#'        your contributions. 
#' - Topic 1: __How harmful is smoking?__
#'     - [Here's the link to the R script](files/Intro/Smoking.R)
#'
##- Day 2 ------
#' ## __Day 2__: Wednesday, January 10
#' 
##- ### Assignment 1 (individual): Connecting with your team. ------
#' ### __Assignment 1__ (individual): Connecting with your team.
#' 
#' __Due Thursday, January 11, 9 pm__
#' 
#' - Join Piazza using the invitation sent to your yorku.ca email address.
#' - Get to know your team members. Post a message private to your team introducing yourself. What statistics
#'   courses have you taken? What programming languages do you know? Are you
#'   interested in particular applications of statistics, etc? Use the folder 'assn1'.
#' - Reply to your team members' postings, perhaps asking them further questions
#'   about their background and interests.
#'
##- ### Assignment 2 (individual): Setting things up. ------
##' ### __Assignment 2__ (individual): Setting things up
#' 
#' __Due Sunday, January 14, 9 pm__
#' 
#' - __Summary:__ 
#'     1. Install (or update) R and RStudio
#'     2. Get a free Github account 
#'     3. Install git on your computer
#'     4. Post publicly on Piazza if you run into problems.  Help others if you can. Before the deadline on Sunday, 
#'        post at least one public message commenting on your experiences installing software. Use the folder 'assn2'. 
#' - __1. Install R and RStudio__ following
#'   [these instructions](files/software_installation.html). If you have already installed R and RStudio, update them to the latest versions.
#' - __2. Get a free Github account:__ If you don't have one, first consider choosing a name. Here's
#'   [an excellent source of advice from Jenny Bryan](http://happygitwithr.com/github-acct.html).
#'     - __CAUTION:__ Avoid installing 'Github for Windows'  from the Github site. It is not
#'       the same as 'Git for Windows'.
#' - __3. Install git on your computer__ using the instructions on [Jenny Bryan's webpage](https://happygitwithr.com/).
#'     - If you are curious about how git is used have a look at [this tutorial](https://explainxkcd.com/wiki/index.php/1597:_Git)! 
#'     - As a final step: In the RStudio menu click on `Tools | Global Options ... | Terminal`. Then click on the box in 
#'       __Shell__ paragraph to the right of _New terminals open with:_ 
#'         - On a PC, select _Git Bash_    
#'         - On a Mac, select _Bash_    
#'     - You don't need to do anything else at this time. We will see how to set up SSH keys to connect to Github 
#'       <!-- and to blackwell -->
#'       through the RStudio terminal in a few lectures.
#' - __4. Post questions on Piazza__ and if everything goes well, post that on Piazza. Use the folder 'assn2'.
#'  
##- Day 3 ------
#' ## __Day 3__: Friday, January 12
#' 
#' - Topic 2: Regression Review: [Regression in R](files/R/Regression_in_R.html)
#' 
#'  
##- Day 4 ------
#' ## __Day 4__: Monday, January 15
#' 
#' __Complete Doodle Poll for a tutorial hour by this evening:__
#' 
#'   - Ivy prepared [this Doodle poll](//doodle.com/meeting/participate/id/b4WzwgJa) to find an hour for our
#'     tutorial over Zoom. We'll start this week at the time that will be selected
#'     this evening.  Please complete the poll by 9pm so your preferences
#'     will be taken into account.
#'   - Consider what is the best strategy in completing Doodle polls. Should you
#'     fill in your one preferred time or should you include times that
#'     are less preferable but nevertheless possible? How do you maximize the
#'     value of your choice(s)?
#' 
#' __Quiz on Wednesday:__
#'  
##- Day 5 ------
#' ## __Day 5__: Wednesday, January 17
#' 
#' __Announcement:__ Tutorial on [Zoom (click here)](https://yorku.zoom.us/j/93916385398), every Tuesday from 1:30 to 2:30 pm.
#' 
#' __Quiz Today__
#' 
#' __Topic 2 (continuing):__ Regression Review: [Regression in R](files/R/Regression_in_R.html)
#' 
#'  
##- Day 6 ------
#' ## __Day 6__: Friday, January 19
#' 
#' __Topic 2 (continuing):__ Regression Review 
#'  
#'  - [Simple to Multiple Regression](files/Regression_Review/Simple_Regression.pdf)  
#'  - [Multiple Regression in $\beta$-space](files/Regression_Review/Multiple_Regression.pdf)  
#'  - [Three Basic Theorems](files/Regression_Review/Three_Basic_Theorems.pdf)
#' 
#'  
##- Day 7 ------
#' ## __Day 7__: Monday, January 22
#' 
#' __Topic 2 (continuing):__ Regression Review 
#'  
#'  - [Simple to Multiple Regression](files/Regression_Review/Simple_Regression.pdf)  
#'  - [Multiple Regression in $\beta$-space](files/Regression_Review/Multiple_Regression.pdf)  
#'  - [Three Basic Theorems](files/Regression_Review/Three_Basic_Theorems.pdf)
#' 
##- Day 8 ------
#' ## __Day 8__: Wednesday, January 24
#' 
#' __Topic 2 (continuing):__ Regression Review 
#'  
#'  - [Simple to Multiple Regression](files/Regression_Review/Simple_Regression.pdf)  
#'  - [Multiple Regression in $\beta$-space](files/Regression_Review/Multiple_Regression.pdf)  
#'  - [Three Basic Theorems](files/Regression_Review/Three_Basic_Theorems.pdf)
#'  
#' __Learning R:__
#' 
#' Why R? What about SAS, SPSS, Python, among others?
#' 
#' SAS is a very high quality, intensely engineered,
#' environment for statistical analysis. It is widely used
#' by large corporations.  New procedures in SAS are
#' developed and thoroughly tested by a team of 1,000 or more
#' SAS engineers before being released. It currently
#' has more than 300 procedures.
#' 
#' R is an environment for statistical programming 
#' and development
#' that has accumulated many somewhat inconsistent 
#' layers developed
#' over time by people of varying abilities, many
#' of whom work
#' largely independently of each other.
#' There is no centralized
#' quality testing except to check whether code 
#' and documentation run
#' before a new package is added to R's main repository,
#' CRAN. 
#' When this page was last updated, CRAN had `r format(nrow(available.packages()), big.mark = ',')` packages.
#' 
#' In addition, a large number of packages under development are available through
#' other repositories, such as github.
#' 
#' The development of SAS began in 1966 and that of R
#' (in the form of its predecessor, S, at Bell Labs) in 1976.
#' 
#' The 'design' of R (using 'R' to refer to both R and
#' to S) owes a lot to the design of Unix. 
#' The idea is to create
#' a toolbox of simple tools that you link together yourself 
#' to perform an analysis.  Unix, 
#' [now mainly as Linux](https://opensource.com/article/18/5/differences-between-linux-and-unix),
#' ^[R is to S as Linux is to Unix as GNU C is to C as GNU C++ is to C .... S, Unix, C and C++ were created at Bell Labs in the late 60s and the 70s. R, Linux, GNU C and GNU C++ are public license re-engineerings of the proprietary S, Unix, C and C++ respectively.]
#' commands were
#' simple tools linked together by _pipes_ so the output
#' of one command is the input of the next. To do anything
#' you need to put the commands together yourself.
#' 
#' The same is true of R. It's extremely flexible but at
#' the cost of requiring you to know what you want to do
#' and to be able to use its many tools in combination with each other
#' to achieve your goal. Many decisions in R's design were intended
#' to make it easy to use interactively.  Often the result is a
#' language that is very quirky for programming.
#' 
#' SAS, in contrast, requires you to select options
#' to run large procedures that purport to do the entire job. 
#' 
#' This is an old joke: If someone publishes a journal
#' article about a new statistical
#' method, it might be added to SAS in 5 to 10 years. 
#' It won't be added to SPSS until 5 years after there's 
#' a textbook written 
#' about it, maybe another 10 to 15 years after its appearance in SAS. 
#' 
#' It was added to R two years ago because the new method 
#' was developed as a package in R long before being published. 
#' 
#' So why become a statistician? So you can have the breadth
#' and depth of understanding that someone needs to apply 
#' the latest statistical ideas with the intelligence
#' and discernment to use them effectively. 
#' 
#' So expect to have a symbiotic relationship with R.
#' You need R to have access to the tools that
#' implement the latest ideas in
#' statistics. R needs you because it takes people 
#' like you to use R effectively.
#' 
#' The role of R in this course is to help us
#' 
#' - have access to tools to expand our ability to explore and analyze data, and
#' - learn how to develop and implement new statistical methods.
#'   i.e. learn how to build new tools
#' - deepen our understanding of the use of statistics
#'   for scientific discovery as well as for business applications
#' 
#' It's very challenging to find a good way to
#' 'learn R'.  It depend on where you are and where
#' you want to go. Now, there's a plethora of on-line
#' courses. See the blog post:
#' [The 5 Most Effective Ways to Learn R](https://www.r-bloggers.com/the-5-most-effective-ways-to-learn-r/) 
#' 
#' In my opinion, ultimately, the best way is to 
#' 
#' - __play__ your way through the 'official' 
#'   [manuals on CRAN](https://cran.r-project.org/manuals.html) 
#'   starting with 'An Introduction to R' along with
#'   'R Data Import/Export'. Note however that these materials
#'   were developed before the current mounting concern
#'   with reproducible research and some of the advice
#'   should be deprecated, e.g. using 'attach' and
#'   'detach' with data.frames.
#' - read the 
#'   [CRAN task views](https://cran.r-project.org/web/views) 
#'   in areas that interest you.
#' - Have a look at the 1/2 million questions tagged 'r' on
#'   [stackoverflow](https://stackoverflow.com/questions/tagged/r?tab=newest&page=1&pagesize=15). 
#' - At every opportunity, use R Markdown documents (like the sample script you
#'   ran when you installed R) to work on assignments, project, 
#'   etc.
#'    
#' Using R is like playing the piano. You can read and learn
#' all the theory you want, ultimately you learn by __playing__.
#'
#' Copy the following scripts as files in RStudio:
#' 
#' - Elementary examples in R: [CAR_1.R](files/R/CAR_1.R), and
#' - More advanced techniques: [Working with Data.R](files/R/Working_with_Data.R). 
#' 
#' __Play__ with them line by line. 
#' 
#' Post questions arising from these scripts to the 'question' folder 
#' on Piazza.  We will take up some questions in class and others
#' in tutorials scheduled to deal with questions on R.   
#'
##- ### Assignment 3 (teams) ------
##' ### __Assignment 3__ (teams)
#'
#' #### Exercises:
#' 
#' - From [4939 questions](questions/m4939_questions_2024.html)
#'     - 5.1, 5.2, 5.3, 5.4, <!-- 5.5, -->
#'     - 5.6.23, 5.6.24, 5.6.25, 5.6.26, <!-- 5.6.27, -->
#'     - 6.1, 6.2, 6.3, 6.4, <!-- 6.5, -->
#'     - 7.4, 7.5, 7.6, 7.7, <!-- 7.8, -->
#'     - 8.1, 8.2, 8.3, 8.4, <!-- 8.5,  -->
#'     - 8.6, 8.7, 8.8, 8.9, <!-- 8.10, -->
#'     - 8.18.a, 8.18.b, 8.18.c, 8.18.d, <!-- 8.18.e, --> 
#'     - 8.36.a, 8.36.b, 8.36.c, 8.36.d, <!-- 8.36.e,  -->
#'     - 8.51.a, 8.51.b, 8.51.c, (write functions that would work on matrices of any size), 8.61.a, <!-- 8.62.a -->
#'     - 12.1, 12.3, 12.5, 12.7, <!-- 12.9,  -->
#' 
#' - Do the exercises above. There are at most 4 members
#'   in each team.  Randomly assign the numbers 1 to 4
#'   to members of your team (without replacement).
#'   Member number 1 does the first question in each row,
#'   Member number 2 does the second question in each row, etc.
#' - __Deadlines__: See the [course description](files/description.html) for the meaning of these deadlines.
#'     1. Friday, February 2 at noon 
#'     2. Sunday, February 4 at noon 
#'     3. Monday, February 5 at 9 pm
#' - __IMPORTANT:__ 
#'   - Upload the answer to each question in a single Piazza post (post it as a Piazza 'Note', not as a Piazza 'Question') with the title: "A3 5.1" for the first question, etc.  
#'   - You can answer the question directly in the posting or by uploading a pdf file and the R script or Rmarkdown script that generated it.
#'   - When providing help or comments, do so as "followup discussion".
#' 
##- Day 12 ------
#' ## __Day 12__: Friday, February 2
#' 
#' - [Regression Review folder](files/Regression_Review)
#' - [Mixed Models folder](files/Mixed_Models)
#' 
#' 
##- Day 13 ------
#' ## __Day 13__: Monday, February 5
#' 
#' - [Regression Review folder](files/Regression_Review)
#' - [Mixed Models folder](files/Mixed_Models)
#' 
##- ### Assignment 4 (teams) ------
##' ### __Assignment 4__ (teams)
##' 
##' Let $N$ be your team member number for the last assignment, comment
##' on the statements 
##' whose number $Q$ is equal to $N (mod __4__)$ in 
##' [this file of statements](files/Regression_Review/23+ statements about statistics.html)
##' related to statistics. Be warned that most of these statements are
##' fallacious to some degree. To keep things interesting, there might
##' be one or more correct statements.
##' 
##' Elliptical thinking may help you get insights into the correctness of some statements.
##' 
##' - __Deadlines__: See the [course description](files/description.html) for the meaning of these deadlines.
#'     1. Monday, February 12 at noon 
#'     2. Wednesday, February 15 at 9 pm 
#'     3. Friday, February 17 at 9 pm
#' - __IMPORTANT:__ 
#'   - Upload the answer to each question in a single Piazza post (post it as a Piazza 'Note', not as a Piazza 'Question') with the title: "A4 Statement 1" for the first statement, etc.  
#'   - You can answer the question directly in the posting or by uploading a pdf file and the R script or Rmarkdown script that generated it.
#'   - When providing help or comments, do so as "followup discussion".
#'   - Do not do a separate post for your final answer, just keep editing the original post.

##- ### Assignment 5 (individual) ------
##' ### __Assignment 5__ (individual)
#' 
#' - __Due:__ Monday, February 12 
#' 
#' - Do questions 6 and 8 in the [R script to play with Multilevel Models: Lab 1.R](files/Mixed_Models/Lab_1.R)
#' 
#' - Upload your work on each question in a separate Piazza post (post it as a Piazza 'Note', not as a Piazza 'Question') 
#' - with the title: "A4 6" for the first question and "A4 8" for the second.
#' - Do your work in Rmarkdown scripts (either .R or .Rmd files, it's up to you) and post your script, not the pdf output to Piazza.
#'   The script should work when someone else runs it in the current version of R.  
#' - You can get and give help from anyone in the class but please do so in Piazza and you will get credit for it.
#' - Even if you get help, your code should be your own. Don't copy code from each other.
#'   
#' 
##- Day 18 ------
#' ## __Day 18__: Friday, February 16
#' 
#' - [Mixed Models](files/Mixed_Models)
#' - [Non-Linear Mixed Models](files/Non_linear_mixed_models)
#' 
#' 'Voluntary assignment 6':
#'   
#' - Work your way through [Lab 2.R](files/Mixed_Models/Lab_2.R)
#'   - Post questions, problems, discuss answers to questions on Piazza.
#' - Use the folder __assn_6__ for discussions.
#' 
##+ Day 19 ----
#' ## __Day 19__: Monday, February 26
#' 
#' __Class links:__
#' 
#' - [Small hierarchical example comparing pooled, between, within and mixed models](files/Mixed_Models/Hierarchical_Example.pdf)
#'   - [Mixed Models or Pooled Analysis (rough draft)](files/Mixed_Models/Mixed_Model_or_Pooled_Analysis.pdf)
#' - [Multilevel Mixed Models](files/Mixed_Models/Hierarchical_Models.pdf)
#'   - [R script to play with Multilevel Models: Lab 1.R](files/Mixed_Models/Lab_1.R)
#' - [Non-Linear Mixed Models](files/Non_linear_mixed_models/Non_Linear_Mixed_Models.pdf)
#' - [Longitudinal Linear Models](files/Mixed_Models/Longitudinal_Models.pdf)
#' <!-- - [Plotting with Lattice examples](files/Mixed_Models/latticeExtra_examples.R) 
#'  FIND SOMETHING BETTER
#' -->
#'   - [R script to play with Longitudinal Models: Lab 2.R](files/Mixed_Models/Lab_2.R)
#'     - This is a good examples of why models matter and how the estimated comparisons between
#'       drugs depend on which potential confounding factors are included in the model. This includes
#'       longitudinal components such as trends and possible autocorrelation between measurements that are close to
#'       each other in time. As you had more components the story keeps changing.  
#' - [Added-Variable Plot (Frisch-Waugh-Lovell Theorem) and the Linear Propensity Score Theorem](files/Regression_Review/Three_Basic_Theorems.pdf)
#'   - Provides important insights into equivalent models and nearly equivalent models
#' - [Parametric splines](files/Guide_to_splines_in_spida.pdf)
#'   - Models that are non-linear in X but linear in parameters.
#' - [Dealing with Heteroskedasticity](files/Mixed_Models/Dealing_with_Heteroskedasticity.pdf)
#' 
##+ ### Assignment 6 (individual) ------
##' ### __Assignment 6__ (individual)
#'  
#' __Due:__ Tuesday, March 6
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
#' Excel file at http://blackwell.math.yorku.ca/private/MATH4939_data/ .
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
#' shrinkage after TBIs (Traumatic Brain Injury) that is greater than the rate 
#' normally associated
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
#' - [Working with Data (draft)](files/R/Working_with_Data.pdf)
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
#' 
##+ Day 27 ----
#' ## __Day 27__: Friday, March 8
#' 
#' __Project:__
#' 
#' - Review the description of the project in the [course description](files/description.html).
#' - Meet with your team this weekend to choose one outcome variable you would like
#'   to focus on among VBR, CC_TOT, HPC_L_TOT, HPC_R_TOT, and discuss what
#'   approach you would like to use to analyze factors that are related to 
#'   recovery. Prepare a short summary of your plans.
#' - Schedule a meeting of your team with the instructor by posting a message with your preferred
#'   30-minute slot on Wednesday, March 13, between 1 pm and 7 pm. Use the folder __project__ and post
#'   the message to the entire class so teams will know which 30-minute slot other teams have already selected.
#'   
##+ Day 28 ----
#' ## __Day 28__: Monday, March 11
#' 
#' Continuation of day 19
#' 
###+ Day 29 ----
#' ## __Day 29__: Wednesday, March 13
#' 
#' __Class links:__
#' 
#' Asking meaningful questions + dealing with heteroskedasticity: [pdf](files/Mixed_Models/Dealing_with_Heteroskedasticity.pdf) / [R scripts](files/Mixed_Models/Dealing_with_Heteroskedasticity.R)
#'
###+ Day 30 ----
#' ## __Day 30__: Friday, March 15
#' 
#' __Class links:__
#' 
#' - [Parametric splines](files/Guide_to_splines_in_spida.pdf)
#'   - Models that are non-linear in X but linear in parameters.
#'   - Example shown in class: [R script](files/Mixed_Models/Parametric_spline_and_Fourier_series_example.R) / [pdf](files/Mixed_Models/Parametric_spline_and_Fourier_series_example.pdf)
#' 
##+ Day 31 ----
#' ## __Day 31__: Monday, March 18
#' 
#' __Class links:__
#' 
#' - [Causal Questions](files/Special_Topics/Causal_Questions.pdf)
#' - [The Causal Zoo](files/Special_Topics/The_Causal_Zoo.pdf)
#' 
#' Sample questions on causality:
#' 
#' ![](files/Special_Topics/pix/DAG_1.png){height=20%}
#' 
#' @. Consider the linear DAG above and the following models:
#'    1. `Y ~ X`
#'    2. `Y ~ X + Z6`
#'    3. `Y ~ X + Z1`
#'    4. `Y ~ X + Z1 + Z4`
#'    5. `Y ~ X + Z1 + Z3`
#'    6. `Y ~ X + Z3 + Z6`
#'    7. `Y ~ X + Z1 + Z5`
#'    8. `Y ~ X`
#'    
#'    a) For each of these models discuss briefly whether fitting the model would produce an unbiased estimate of the causal effect of `X`. 
#'    b) Among the models that provide an unbiased estimate of the causal effect of `X`, order them, 
#'       to the extent possible from the information in the DAG,
#'       according to the expected standard deviation of $\hat{\beta}_X$. Briefly state the basis for your ordering.
#'    c) Are there reasons why you might prefer to use a model that the DAG would identify as having a larger
#'       standard deviation of $\hat{\beta}_X$?
#' @. Consider a multiple regression of the form $Y = X_1 \beta_1 + X_2 \beta_2 + \varepsilon$ where
#'    $\varepsilon \sim N(0, \sigma^2 I)$ and $X_1$, $X_2$ represent blocks of variables such that
#'    the matrix $[X_1 X_2]$ is of full column rank.    
#'    
#'    Prove that the Added Variable Plot for the regression of $Y$ on $X_1$ has the same
#'    vector of least-squares coefficients as the least-squares coefficients for $X_1$
#'    in the multiple regression.
#' @. Consider the following statement:   
#'    "In a multiple regression, if you add a predictor whose effect is not significant, the
#'    coefficients of the other predictors should not have changed very much, nor should the p-values
#'    associated with them."    
#'    Is this a valid statement? If so, discuss why, illustrating your answer with 
#'    appropriate figures.
#' @. Are there any situations in which it would be important to drop a term
#'    in a model although its coefficient is highly statistically significant? 
#'    Discuss the circumstances, if any, in which this would be true, and
#'    the consequences of including or excluding the variable in question.
#' @. Are there any situations in which it would be important to include a term
#'    in a model although its coefficient is not statistically significant? 
#'    Discuss the circumstances, if any, in which this would be true, and
#'    the consequences of including or excluding the variable in question.
#'    Note that this issue can arise in a number of contexts: satisfying the 
#'    the principle or marginality and including a variable to ensure that
#'    the estimate of another variable is unbiased, notably in the context
#'    of causal estimation.
#'  
##+ CURRENT ----
##+ 
#' <span id='CURRENT'></span>
#+ include=FALSE
knitr::knit_exit()
#+
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


##+ CURRENT ----
##+ 
#' <span id='CURRENT'></span>
#'
#+ include=FALSE
knitr::knit_exit()
#'
#' DO:
#' - Paik-Agresti
#' - Causal Graphs: give good summary and exercise
#' - Interpreting RE
#' - Identification of RE model
#' 
#'
#+
