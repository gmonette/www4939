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
# 
# - Frist: possible ask list of questions for different students to answer
#   based on vocabular study.
#   Idea; Different students use same methodology so those lacking will
#   get help from others.
# 
# - look at notes in Quire for changes to description, e.g.
#   - require cameras for oral test
#   - in class 1 hour midterm and 2 hour final if inclass possible, otherwise
#     a 30 minute oral individually scheduled for both
#   - weekly quiz, in class on laptop with access to web to equalize
#     for students not in class
#   - sould I change to markdown to facilitate citations:
#   - add reading and sumarizzing a paper
#   - add contributed links should be accompanied with a note describing
#     why the link is interesting and providing a critique.
#   - front row team as before, your participation is much appreciated
#     and makes a big difference to the lecturer.
#   - Lescture will be on zomm. Class attendance is expected and participation
#     in class or via chat, etc, which students can use in class also is encouraged
#   - make sure speakers not active on your lapttop if you use zoom in class;
#     a good trick is to plug earbuds in your laptop to avoid deafening feedback
#     loops
#   - Team Project: differen students work on different aspects of a problem
#     and then combine their work into a common project and presentation to
#     be recorded on Zoom and will be posted for class.
#   - Two Other teams comment independently??
# What do do about SAS. Might have time this year due to early start.
# 
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
#' <!--
#' 
#' <br>
#' <center>
#' <font color="#880000" size="5">___Announcement(s):___</font>
#' </center>
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

##+ CURRENT ----
##+ 
#' <span id='CURRENT'></span>
#' 
