#' ---
#' title: "Plan R"
#' date: "January 2020"
#' author: "Georges Monette"
#' output:
#'   html_document:
#'     toc: true
#'     toc_float: true
#'     theme: readable
#' link-citations: yes
#' ---
#' 
#' SO: Stay with CAR 
#' Add additional stuff for a change
#' e.g add GLH questions where appropriate
#' Cover paradoxes. 
#' 
#' # Important R topics
#' 
#' | Where |  Topic | How |
#' |-------|--------|-----|
#' |       | Reshaping hierarchical data 
#' |       | Reshaping multinomial data
#' |       | Writing functions
#' |       | Overlaying plots -- latticeExtra
#' |       | Coercion
#' |       | Recycling
#' |       | Closures
#' |       | expand.grid \
#'           -- maybe with plots for Bayes example
#' |       | Closures
#' |       | Closures
#' |       | lapply, etc. 
#' 
#' 
#' 
#' Links
#' 
#' - [General Question banks](../../../../_QUESTION_BANKS)
#' - [SCS2019](../../../../SCS2019/)
#' - __MATH 6642__ only has .R scripts in its main directory
#' - [MATH6642](../../../../MATH6642/www_MATH6642) /[index](../../../../MATH6642/www_MATH6642/index.html)
#'   - [Exploring Regression GLH.R](../../../../MATH6642/www_MATH6642/Exploring_Regression_GLH.R)
#'   - [Mathematical background.R](../../../../MATH6642/www_MATH6642/Mathematical_Background_DRAFT.R)
#'   - [Messy data.R](../../../../MATH6642/www_MATH6642/Messy_data.R)
#'   - [Fox on limitation of Effects](../../../../MATH6642/www_MATH6642/mixed-models-effect-differences.Rmd)
#'   - [Fox on limitation of Effects](../../../../MATH6642/www_MATH6642/mixed-models-effect-plots.Rmd)
#'   - [Multiple Regression Ellipses (accompany Multiple Regression)](../../../../MATH6642/www_MATH6642/Multiple_Regression_Ellipses.R)
#'   - [Smoking-analysis.R](../../../../MATH6642/www_MATH6642/Smoking-analysis.R)
#'   - [Smoking3-analysis.R](../../../../MATH6642/www_MATH6642/Smoking3-analysis.R)
#'   - [Smoking.R](../../../../MATH6642/www_MATH6642/Smoking.R)
#' - __MATH 4939__ has extensive collection in its R directory
#' - [MATH4939_2019](http://blackwell.math.yorku.ca/MATH4939_2019/)
#'   - [R](http://blackwell.math.yorku.ca/MATH4939_2019/R)
#'   
#' 
#' 
#' ## Chapter 1
#' 
#' - Topics:
#'   - Basic syntax
#'   - data types
#'   - indexing
#'     - indices: sequences
#'     - logical vectors and operators & | !
#'     - functions
#'     - help
#'       - include vignettes
#'       - RSiteSearch
#'     - errors
#'     - Reproducible analyses using RStudio and rmarkdown
#'     - regression example
#'     - R function for stats
#'     - Generic fundtions and methods
#'     - Table 1.1 of basic stats functions
#'   - [Fox Chapter 1](../Fox/Chap-1.R)
#' 
#' ## Chapter 2
#' 
#' - [Fox Chapter 2](../Fox/Chap-2.R)
#' - Topics:
#'   - data input
#'   - exporting 
#'   - data.frames vs tibbles
#'   - working with data frames
#'   - missing data  mice
#'   - transforming data
#'   - manipulating data frames
#'     - binding rows and columns
#'     - aggregating data frames
#'     - merging
#'     - reshape
#'   - working with matrices, arrays, and lists
#'   - indexing data frames
#'   - dates and times
#'   - character data
#'   - large data sets
#' 
#' ## Chapter 9
#' 
#' ## Chapter 10
#' 
#' ## Chapter 3
#' 
#' ## Chapter 4
#' 
#' ## Chapter 5
#' 
#' ## Chapter 6
#' 
#' ## Chapter 7
#' 
#' ## Chapter 8
#' 
#' ## Appendix
#' 
#' ## Appendix
#' 
#' ## Appendix
#' 
#' ## Appendix
#' 
#' - Synopsis:
#'     - __NEW__: Handout: with information
#'     - most real problems: messy data, complex models, 
#'     - if you're going to be able to offer something as a statistician you need to be able to deal with
#'       real problems, not just conventional statistical versions of questions.
#'     - Explore website
#'     - course description
#'     - describe assignments: goal: finding a balance between encouraging team work 
#'     - LOG file
#'     - Structure for deadlines
#'     - First assignment: install stuff
#'     - __FIX__ Jenny Bryan's link
#'     - __IMPROVE__: start of R done very badly: Need to show example rather than philosophy
#'         - work on examples NOT Wickham __WHAT I DID WAS TOTALLY MEANINGLESS__
#'         - oFFER Wickham for advanced use
#'         - __DO__ Improve John's scripts
#'         - __FIND EXERCISES__
#'     - __NEW__ discuss mathstat in context of 
#'     _ Take picture.
#'       
#' __Main change:__ 
#' 
#' - Use John's scripts as basis. Add to them. 
#'   Produce slice output 'a la SWOT' so I can annotate file and run at same time
#' __Add my material and exercises as appropriate but start with John.
#'      
#' Topics:
#' 
#' 
#' | When   | Topic            |                                    |
#' |--------|------------------|------------------------------------|
#' |        |                  |                                    |
#' 
#' 
#' - R: Plan better, don't riff (was painfully slow)
#'     - See [Regression in R](../R_files/Regression_in_R_2019.html)
#'     - Use ((Advanced_R_Questions.html)
#'     - Lots of stuff in [R](../R_files/)
#'     - see C:\Users\georg\Dropbox\home\Courses\R\Scripts
#'     - See John's scripts online
#'     - hierarchical data maniplation for statistics: might want to do database course, this is barebones
#'     - regular expression
#'     - pull in material from Wickham but use John's structure with additions:
#'         - regex
#'         - hierarchical: capply, up, tolong, towide
#'         - lapply
#'         - magrittr
#'     - gsplines, Lfx 
#'     - USE SWOT style
#'     - Use Ian Greene's immagration data. Also file/data_exercise.html
#'     - 
#' - Regression:
#'     - 2 x 2 + Agresti diagram: causality: Choosing a restaurant
#'     - Simple regression
#'     - Multiple regression 
#'     - Sally Clark
#'     - LATER
#'     - Hierarchical + Longitudinal
#'     - MCMC??
#'     - Must do SAS
#'
#' 
#' # Tentative syllabus
#' 
#' ## Week 1
#' 
#' - Fox Preface, Chapter 1
#'     - 
#' 
#' 
#' 
#' 
#' # Resources
#' 
#' All relative
#' 
#' TODO(georges) SEE outline.R
#' 
#' - Note: will take some topics out of order: balance between logical and applied structure
#'     - You learn something best when you need to use it.
#' - ___INCLUDES?:___
#'     - [Ellipses and Variance](../R_files/Ellipses_and_Variance.html)
#'     - [Exploring Regression](../R_files/Exploring_Regression.html)
#'         - needs work: no bands on second analyses. 
#'         - no ellipses
#'         - a bit tedious on fitted lines
#'         - asks: what is the value of an additional year of education
#'     - [Understanding Ouput in Regression](../files/Understanding_Output_in_Regression.html)
#'         - Very early version but has ellipses and GLH
#'         - VERY GOOD???
#'     - [R/Likelihood.html](../R_files/Likelihood.html)
#'         - see also [R/Likelihood_2.R](../R_files/Likelihood_2.R)
#'         - perhaps better on in _Lectures
#'         - This is on the verge of being very good to explain
#'           quadratic and non-quadratic shapes of likelihood,
#'           what happens as sigma goes to 0 (although SHOULD DO THIS
#'           WITH MULTILEVEL MODEL AS BETWEEN VARIANCE GOES TO ZERO)
#'     - [R/paik_diagram.R]
#'         - not bad but could be much better
#'     - [R/Suppressor variables]
#'         - smallest of starts -- incorporate with earlier talks
#' 
#' - Resources
#' - [4330.bib](../4330.bib)
#' - [code_samples](../code_samples)
#' - [code_samples/CPA_Talk.R](../code_samples/CPA_Talk.R)
#' - [code_samples/gelman 1988 election.R](../code_samples/gelman 1988 election.R)
#' - [code_samples/index-1.R](../code_samples/index-1.R)
#' - [common](../common)
#' - [common/bib.bib](../common/bib.bib)
#' - [common/header.R](../common/header.R)
#' - [common/math4939.bib](../common/math4939.bib)
#' - [data](../data)
#' - [data/clist_exercise](../data/clist_exercise)
#'     - data for class list hierarchical exercise
#'     - cf Greene.txt
#' - [data/clist_exercise/STAT1000_2016_Fall_Sec_A.csv](../data/clist_exercise/STAT1000_2016_Fall_Sec_A.csv)
#' - [data/clist_exercise/STAT1000_2016_Fall_Sec_B.csv](../data/clist_exercise/STAT1000_2016_Fall_Sec_B.csv)
#' - [data/clist_exercise/STAT1000_2017_Summer_Sec_A.csv](../data/clist_exercise/STAT1000_2017_Summer_Sec_A.csv)
#' - [data/clist_exercise/STAT1000_2017_Winter_Sec_A.csv](../data/clist_exercise/STAT1000_2017_Winter_Sec_A.csv)
#' - [data/clist_exercise/STAT2000_2016_Summer_Sec_A.csv](../data/clist_exercise/STAT2000_2016_Summer_Sec_A.csv)
#' - [data/clist_exercise/STAT2000_2017_Winter_Sec_A.csv](../data/clist_exercise/STAT2000_2017_Winter_Sec_A.csv)
#' - [data/clist_exercise/STAT2000_2018_Winter_Sec_A.csv](../data/clist_exercise/STAT2000_2018_Winter_Sec_A.csv)
#' - [data/fox](../data/fox)
#' - [data/fox/download.R](../data/fox/download.R)
#' - [data/fox/greene.txt](../data/fox/greene.txt)
#'     - Greene data
#' - [data/fox/hs_powers.txt](../data/fox/hs_powers.txt)
#' - [data/fox/ornstein.txt](../data/fox/ornstein.txt)
#' - [data/InfantMortality.csv](../data/InfantMortality.csv)
#' - [data/InfantMortality_GDP.xlsx](../data/InfantMortality_GDP.xlsx)
#' - [data/smoke.csv](../data/smoke.csv)
#' - [data/smokers.csv](../data/smokers.csv)
#' - [Datasets.xls](../Datasets.xls)
#' - [data_private](../data_private)
#' - [data_private/TBI.xlsx](../data_private/TBI.xlsx)
#' - [Duncan.txt](../Duncan.txt)
#' - [file2_.xlsx](../file2_.xlsx)
#' - [files](../files)
#' - [files/22_statements.html](../files/22_statements.html)
#' - [files/22_statements.R](../files/22_statements.R)
#'     - 23 statement -- maybe a later version
#' - [files/activity_2](../files/activity_2)
#'     - Good 4330 activity based on Greene data
#'     - Have a look at COMMENTS post exercise
#'     - Not sure  where original is, perhaps in 4330 index
#' - [files/activity_2/Bayes_Activity_2.html](../files/activity_2/Bayes_Activity_2.html)
#' - [files/activity_2/Bayes_Activity_2.pdf](../files/activity_2/Bayes_Activity_2.pdf)
#' - [files/activity_2/Blackwell_MATH_4330_Activity_2.html](../files/activity_2/Blackwell_MATH_4330_Activity_2.html)
#' - [files/activity_2/Blackwell_MATH_4330_Activity_2.pdf](../files/activity_2/Blackwell_MATH_4330_Activity_2.pdf)
#' - [files/activity_2/Bose_MATH_4330_Activity_2.html](../files/activity_2/Bose_MATH_4330_Activity_2.html)
#' - [files/activity_2/Bose_MATH_4330_Activity_2.pdf](../files/activity_2/Bose_MATH_4330_Activity_2.pdf)
#' - [files/activity_2/COMMENTS.txt](../files/activity_2/COMMENTS.txt)
#' - [files/activity_2/Neyman_Math_4330_Activity_2.html](../files/activity_2/Neyman_Math_4330_Activity_2.html)
#' - [files/activity_2/Neyman_Math_4330_Activity_2.pdf](../files/activity_2/Neyman_Math_4330_Activity_2.pdf)
#' - [files/activity_2/Nightingale_Math_4330_Activity_2.html](../files/activity_2/Nightingale_Math_4330_Activity_2.html)
#' - [files/activity_2/Nightingale_Math_4330_Activity_2.pdf](../files/activity_2/Nightingale_Math_4330_Activity_2.pdf)
#' - [files/activity_2/Rao_Canadian_Refugee_Appeals_and_Judge_Decisions.html](../files/activity_2/Rao_Canadian_Refugee_Appeals_and_Judge_Decisions.html)
#' - [files/activity_2/Rao_Canadian_Refugee_Appeals_and_Judge_Decisions.pdf](../files/activity_2/Rao_Canadian_Refugee_Appeals_and_Judge_Decisions.pdf)
#' - [files/ARAGLM3E_TOC.txt](../files/ARAGLM3E_TOC.txt)
#' - [files/Arrests_exercise.html](../files/Arrests_exercise.html)
#'     - Arrests exercise
#' - [files/Arrests_exercise.R](../files/Arrests_exercise.R)
#' - [files/CMU_Structure_of_a_data_analysis_report.pdf](../files/CMU_Structure_of_a_data_analysis_report.pdf)
#'     - Good summary mindful of audience
#' - [files/data_exercise.html](../files/data_exercise.html)
#'     - Data ingest exercise using fake class enrolment data
#' - [files/data_exercise.R](../files/data_exercise.R)
#' - [files/description.html](../files/description.html)
#' - [files/description.pdf](../files/description.pdf)
#' - [files/description.R](../files/description.R)
#' - [files/description_4330.R](../files/description_4330.R)
#' - [files/description_4939.R](../files/description_4939.R)
#' - [files/dropEqG.png](../files/dropEqG.png)
#' - [files/graph.PNG](../files/graph.PNG)
#' - [files/Guide_to_splines_in_spida.pdf](../files/Guide_to_splines_in_spida.pdf)
#'     - Guide to splines
#' - [files/Guide_to_splines_in_spida_orig.pdf](../files/Guide_to_splines_in_spida_orig.pdf)
#' - [files/health-pgovt-fit.png](../files/health-pgovt-fit.png)
#' - [files/health-pgovt.png](../files/health-pgovt.png)
#' - [files/Hierarchical_Models.pdf](../files/Hierarchical_Models.pdf)
#' - [files/Hierarchical_Models_orig.pdf](../files/Hierarchical_Models_orig.pdf)
#' - [files/HilbertSpace.PNG](../files/HilbertSpace.PNG)
#'     - Nice single 3d
#'     - TODO FInd where generated
#' - [files/ICDA2E_TOC.txt](../files/ICDA2E_TOC.txt)
#'     - Agresti TOC
#' - [files/Identifiability_notes.pdf](../files/Identifiability_notes.pdf)
#'     - very rough IMPORTANT
#' - [files/Indiana_variable_types.pdf](../files/Indiana_variable_types.pdf)
#'     - Types of variables: Great for discussion
#' - [files/m4330_sample_exam_questions.pdf](../files/m4330_sample_exam_questions.pdf)
#'     - sample questions
#' - [files/machine_learning.pdf](../files/machine_learning.pdf)
#'     - cartoon
#' - [files/MATH4330_Fall2017_description.html](../files/MATH4330_Fall2017_description.html)
#' - [files/math4330_final_2018.pdf](../files/math4330_final_2018.pdf)
#' - [files/math4939_exam_2018_1.pdf](../files/math4939_exam_2018_1.pdf)
#' - [files/math4939_mt_2019_solutions.pdf](../files/math4939_mt_2019_solutions.pdf)
#' - [files/math4939_test_2018.pdf](../files/math4939_test_2018.pdf)
#' - [files/math4939_test_2018_discussion.pdf](../files/math4939_test_2018_discussion.pdf)
#' - [files/MATH_4330_mid_term_2017.pdf](../files/MATH_4330_mid_term_2017.pdf)
#' - [files/MATH_4330_mid_term_2017_notes.pdf](../files/MATH_4330_mid_term_2017_notes.pdf)
#' - [files/MATH_4330_Peer_Evaluation.docx](../files/MATH_4330_Peer_Evaluation.docx)
#' - [files/MATH_4330_Peer_Evaluation.pdf](../files/MATH_4330_Peer_Evaluation.pdf)
#' - [files/MATH_4939_Course_Description_2018.pdf](../files/MATH_4939_Course_Description_2018.pdf)
#' - [files/MATH_4939_Final_Exam_2017.pdf](../files/MATH_4939_Final_Exam_2017.pdf)
#' - [files/MATH_4939_Final_Exam_Questions.docx](../files/MATH_4939_Final_Exam_Questions.docx)
#' - [files/MATH_4939_Sample_Final_Exam_Questions.pdf](../files/MATH_4939_Sample_Final_Exam_Questions.pdf)
#' - [files/MATH_4939_Sample_Final_Exam_Questions_notes.pdf](../files/MATH_4939_Sample_Final_Exam_Questions_notes.pdf)
#' - [files/Question_39.pdf](../files/Question_39.pdf)
#'     - Agresti sketch (rough but maybe good)
#' - [files/Smoking3.csv](../files/Smoking3.csv)
#' - [files/survey_and_markdown_sample.html](../files/survey_and_markdown_sample.html)
#' - [files/survey_and_markdown_sample.R](../files/survey_and_markdown_sample.R)
#'     - markdown example and class survey -- later version possible 
#' - [files/syllabus.html](../files/syllabus.html)
#'     - detailed 4330 syllabus
#' - [files/syllabus.R](../files/syllabus.R)
#' - [files/Titanic.txt](../files/Titanic.txt)
#'     - One version with names
#' - [files/Understanding_Output_in_Regression.html](../files/Understanding_Output_in_Regression.html)
#' - [files/Understanding_Output_in_Regression.Rmd](../files/Understanding_Output_in_Regression.Rmd)
#'     - VERY GOOD BUT 2014 version -- perhaps something more recent
#' - [files/unknown_princeton_glm_theory.pdf](../files/unknown_princeton_glm_theory.pdf)
#'     - Very good theoretical thing on GLMs
#' - [files/visual_ci.PNG](../files/visual_ci.PNG)
#'     - visual confidence interval
#' - [files/welcome_and_software_installation.html](../files/welcome_and_software_installation.html)
#' - [files/welcome_and_software_installation.R](../files/welcome_and_software_installation.R)
#'     - Welcome file - seems to have been incorporated into index.html
#' - [file_.xlsx](../file_.xlsx)
#' - [Greene.txt](../Greene.txt)
#'     - Greene data
#' - [Hamlet.txt](../Hamlet.txt)
#' - [index.html](../index.html)
#' - [index.R](../index.R)
#' - [index_bak.R](../index_bak.R)
#' - [lectures](../lectures)
#' - [lectures/4330.bib](../lectures/4330.bib)
#' - [lectures/Analysis 2 – Exponential decay.pdf](../lectures/Analysis 2 – Exponential decay.pdf)
#'     - Uses SWOT example 
#' - [lectures/anscombe_and_data_ellipse.html](../lectures/anscombe_and_data_ellipse.html)
#' - [lectures/anscombe_and_data_ellipse.pdf](../lectures/anscombe_and_data_ellipse.pdf)
#' - [lectures/anscombe_and_data_ellipse.R](../lectures/anscombe_and_data_ellipse.R)
#' - [lectures/anscombe_and_data_ellipse_notes.pdf](../lectures/anscombe_and_data_ellipse_notes.pdf)
#'     - Pretty good ellipses
#' - [lectures/examining_data.html](../lectures/examining_data.html)
#' - [lectures/examining_data.R](../lectures/examining_data.R)
#' - [lectures/examining_data_1.html](../lectures/examining_data_1.html)
#' - [lectures/examining_data_1.pdf](../lectures/examining_data_1.pdf)
#' - [lectures/examining_data_1.R](../lectures/examining_data_1.R)
#'     - expansion on intro categorical example     
#' - [lectures/examining_data_1_notes.pdf](../lectures/examining_data_1_notes.pdf)
#' - [lectures/Frequentist_or_Bayesian_Inference_Sally_Clark_vs_Roy_Meadow.pdf](../lectures/Frequentist_or_Bayesian_Inference_Sally_Clark_vs_Roy_Meadow.pdf)
#'     - GOOD BUT CHECK SCS2019 FOR POSSIBLY IMPROVED VERSION
#' - [lectures/Guide_to_splines_in_spida.pdf](../lectures/Guide_to_splines_in_spida.pdf)
#' - [lectures/Guide_to_splines_in_spida_notes.pdf](../lectures/Guide_to_splines_in_spida_notes.pdf)
#'     - GOOD AND ...
#' - [lectures/Hierarchical_Models_and_Mixed_Models.pdf](../lectures/Hierarchical_Models_and_Mixed_Models.pdf)
#'     - GOOD
#' - [lectures/Hierarchical_Models_and_Mixed_Models_notes.pdf](../lectures/Hierarchical_Models_and_Mixed_Models_notes.pdf)
#' - [lectures/Lab_1.R](../lectures/Lab_1.R)
#' - [lectures/Lab_1_with_ICPSR_notes.pdf](../lectures/Lab_1_with_ICPSR_notes.pdf)
#' - [lectures/Lab_2.html](../lectures/Lab_2.html)
#' - [lectures/Lab_2.pdf](../lectures/Lab_2.pdf)
#' - [lectures/Lab_2.R](../lectures/Lab_2.R)
#' - [lectures/Lab_2_notes.pdf](../lectures/Lab_2_notes.pdf)
#' - [lectures/Lab_2_notes_2.pdf](../lectures/Lab_2_notes_2.pdf)
#' - [lectures/Lab_2_old.pdf](../lectures/Lab_2_old.pdf)
#'     - Longitudinal stuff
#' - [lectures/lectures_toc.html](../lectures/lectures_toc.html)
#' - [lectures/lectures_toc.R](../lectures/lectures_toc.R)
#'     - First 3 chapters of CAR listed
#' - [lectures/Lies_Damned_Lies_2018_01_19.pdf](../lectures/Lies_Damned_Lies_2018_01_19.pdf)
#' - [lectures/Longitudinal_Models.pdf](../lectures/Longitudinal_Models.pdf)
#' - [lectures/Longitudinal_Models_notes.pdf](../lectures/Longitudinal_Models_notes.pdf)
#' - [lectures/Longitudinal_Models_orig.pdf](../lectures/Longitudinal_Models_orig.pdf)
#' - [lectures/Longitudinal_Models_with_ICPSR_notes.pdf](../lectures/Longitudinal_Models_with_ICPSR_notes.pdf)
#' - [lectures/Messy_data.html](../lectures/Messy_data.html)
#' - [lectures/Messy_data.R](../lectures/Messy_data.R)
#'     - Wrangling with Messy spreadsheets
#' - [lectures/mm.bib](../lectures/mm.bib)
#' - [lectures/Multiple_Regression.pdf](../lectures/Multiple_Regression.pdf)
#'     - standard
#' - [lectures/Multiple_Regression_Ellipses.R](../lectures/Multiple_Regression_Ellipses.R)
#' - [lectures/Multiple_Regression_notes.pdf](../lectures/Multiple_Regression_notes.pdf)
#' - [lectures/Multiple_Regression_with_notes.pdf](../lectures/Multiple_Regression_with_notes.pdf)
#' - [lectures/nature_of_regression.html](../lectures/nature_of_regression.html)
#' - [lectures/nature_of_regression.pdf](../lectures/nature_of_regression.pdf)
#'     - Interesting but not sure
#' - [lectures/nature_of_regression.R](../lectures/nature_of_regression.R)
#' - [lectures/nature_of_regression_notes.pdf](../lectures/nature_of_regression_notes.pdf)
#' - [lectures/New folder](../lectures/New folder)
#' - [lectures/Non_Linear_Mixed_Models.pdf](../lectures/Non_Linear_Mixed_Models.pdf)
#' - [lectures/Non_Linear_Mixed_Models_orig.pdf](../lectures/Non_Linear_Mixed_Models_orig.pdf)
#' - [lectures/Notes_2018_04_02.pdf](../lectures/Notes_2018_04_02.pdf)
#' - [lectures/Notes_2019_03_15.pdf](../lectures/Notes_2019_03_15.pdf)
#' - [lectures/Notes_2019_03_16.pdf](../lectures/Notes_2019_03_16.pdf)
#' - [lectures/Simple_Regression.pdf](../lectures/Simple_Regression.pdf)
#' - [lectures/Simple_Regression_notes.pdf](../lectures/Simple_Regression_notes.pdf)
#' - [lectures/SLID-selection.txt](../lectures/SLID-selection.txt)
#' - [lectures/tex2pdf.15908](../lectures/tex2pdf.15908)
#' - [lectures/Titanic.txt](../lectures/Titanic.txt)
#' - [lectures/tolong.pdf](../lectures/tolong.pdf)
#'     - bad slides on tolong
#' - [lectures/transforming_data_tukeys_ladder_of_powers.html](../lectures/transforming_data_tukeys_ladder_of_powers.html)
#' - [lectures/transforming_data_tukeys_ladder_of_powers.pdf](../lectures/transforming_data_tukeys_ladder_of_powers.pdf)
#' - [lectures/transforming_data_tukeys_ladder_of_powers.R](../lectures/transforming_data_tukeys_ladder_of_powers.R)
#'     - AAA on Ladder of powers and vectorizing a function
#' - [lectures/UnitedNations.txt](../lectures/UnitedNations.txt)
#' - [lectures/__data_craft.html](../lectures/__data_craft.html)
#' - [lectures/__data_craft.R](../lectures/__data_craft.R)
#'     - AAA 'data craft' comapres different fits: use with CAR  
#' - [markdown_sample.html](../markdown_sample.html)
#' - [markdown_sample.R](../markdown_sample.R)
#'     - AA markdown with Titanic
#' - [notes](../notes)
#' - [notes/Data_Structures_Advanced_R.pdf](../notes/Data_Structures_Advanced_R.pdf)
#' - [notes/Functions_Advanced_R.pdf](../notes/Functions_Advanced_R.pdf)
#' - [notes/Notes_2019_01_04.pdf](../notes/Notes_2019_01_04.pdf)
#' - [notes/Notes_2019_03_22.pdf](../notes/Notes_2019_03_22.pdf)
#' - [notes/Notes_on_Heteroskedacity.html](../notes/Notes_on_Heteroskedacity.html)
#'     - AAAA Notes on mixed models heteroskedasticity 
#' - [notes/Notes_on_Heteroskedacity.R](../notes/Notes_on_Heteroskedacity.R)
#' - [notes/Notes_on_Heteroskedacity_files](../notes/Notes_on_Heteroskedacity_files)
#' - [notes/Notes_on_Heteroskedasticity.html](../notes/Notes_on_Heteroskedasticity.html)
#' - [notes/Notes_on_Heteroskedasticity.R](../notes/Notes_on_Heteroskedasticity.R)
#' - [notes/Notes_on_Heteroskedasticity_1.pdf](../notes/Notes_on_Heteroskedasticity_1.pdf)
#' - [notes/Office_hour_notes_2019_03_11.pdf](../notes/Office_hour_notes_2019_03_11.pdf)
#' - [notes/OO_Advanced_R.pdf](../notes/OO_Advanced_R.pdf)
#' - [notes/Style_Advanced_R.pdf](../notes/Style_Advanced_R.pdf)
#' - [notes/Subsetting_Advanced_R.pdf](../notes/Subsetting_Advanced_R.pdf)
#' - [notes/Vocabulary_Advanced_R.pdf](../notes/Vocabulary_Advanced_R.pdf)
#' - [Ornstein.txt](../Ornstein.txt)
#' - [outline.html](../outline.html)
#' - [outline.R](../outline.R)
#' - [pix](../pix)
#' - [pix/2017-09-13 10.35.07.jpg](../pix/2017-09-13 10.35.07.jpg)
#' - [pix/2017-09-13 10.35.07_orig.jpg](../pix/2017-09-13 10.35.07_orig.jpg)
#' - [pix/2017-09-13 10.35.25.jpg](../pix/2017-09-13 10.35.25.jpg)
#' - [pix/2017-09-13 10.35.25_orig.jpg](../pix/2017-09-13 10.35.25_orig.jpg)
#' - [pix/2017-09-15 10.32.56.jpg](../pix/2017-09-15 10.32.56.jpg)
#' - [pix/2017-09-15 10.32.56_orig.jpg](../pix/2017-09-15 10.32.56_orig.jpg)
#' - [pix/2017-09-15 10.33.11.jpg](../pix/2017-09-15 10.33.11.jpg)
#' - [pix/2017-09-15 10.33.27.jpg](../pix/2017-09-15 10.33.27.jpg)
#' - [pix/2017-09-15 10.33.27_orig.jpg](../pix/2017-09-15 10.33.27_orig.jpg)
#' - [pix/20170920_103432.jpg](../pix/20170920_103432.jpg)
#' - [pix/assignment_1_pic_1.PNG](../pix/assignment_1_pic_1.PNG)
#' - [pix/Class_photo_1.PNG](../pix/Class_photo_1.PNG)
#' - [pix/Class_photo_2.PNG](../pix/Class_photo_2.PNG)
#' - [pix/Class_photo_2017_09_25.jpg](../pix/Class_photo_2017_09_25.jpg)
#' - [pix/confidence_ellipse.PNG](../pix/confidence_ellipse.PNG)
#' - [pix/Cropped-quadratic.png](../pix/Cropped-quadratic.png)
#' - [pix/duchampwheel.png](../pix/duchampwheel.png)
#' - [pix/Georges contemplating the work of Marcel Duchamp.jpg](../pix/Georges contemplating the work of Marcel Duchamp.jpg)
#' - [pix/photo.R](../pix/photo.R)
#' - [pix/photo_2017.html](../pix/photo_2017.html)
#' - [pix/simpsons.PNG](../pix/simpsons.PNG)
#' - [pix/statscan.jpg](../pix/statscan.jpg)
#' - [pres-figure](../pres-figure)
#' - [pres-figure/unnamed-chunk-2-1.png](../pres-figure/unnamed-chunk-2-1.png)
#' - [pres.md](../pres.md)
#' - [pres.Rpres](../pres.Rpres)
#' - [Prestige-bugged.txt](../Prestige-bugged.txt)
#' - [Prestige.txt](../Prestige.txt)
#' - [private](../private)
#' - [projects](../projects)
#' - [projects/slides](../projects/slides)
#' - [projects/slides/Team_1_Presentation.html](../projects/slides/Team_1_Presentation.html)
#' - [projects/slides/Team_1_with_equations.pdf](../projects/slides/Team_1_with_equations.pdf)
#' - [projects/slides/Team_2_Presentation_final.pdf](../projects/slides/Team_2_Presentation_final.pdf)
#' - [projects/slides/Team_3_Project_Team3_Slides.pdf](../projects/slides/Team_3_Project_Team3_Slides.pdf)
#' - [pvals.rda](../pvals.rda)
#' - [quadsmoke.png](../quadsmoke.png)
#' - [questions](../questions)
#' - [questions/m4939_questions.html](../questions/m4939_questions.html)
#'     - AAAA 53 questions -- probably from Qbank
#' - [R](../R)
#'     - AAAAAA  great notes (find a context)
#'     - Restructure to stay closer to order in CAR
#' - [R/Advanced R_Notes_Extras_notes.pdf](../R_files/Advanced R_Notes_Extras_notes.pdf)
#'     - Great colors but output to landscape and watch 'width'
#' - [R/Advanced R_Notes_Extras_notes_2019_01_21.pdf](../R_files/Advanced R_Notes_Extras_notes_2019_01_21.pdf)
#' - [R/Advanced_R_Notes_2_Data_Structures.html](../R_files/Advanced_R_Notes_2_Data_Structures.html)
#' - [R/Advanced_R_Notes_2_Data_Structures.pdf](../R_files/Advanced_R_Notes_2_Data_Structures.pdf)
#' - [R/Advanced_R_Notes_2_Data_Structures.R](../R_files/Advanced_R_Notes_2_Data_Structures.R)
#' - [R/Advanced_R_Notes_3_Subsetting.html](../R_files/Advanced_R_Notes_3_Subsetting.html)
#' - [R/Advanced_R_Notes_3_Subsetting.R](../R_files/Advanced_R_Notes_3_Subsetting.R)
#' - [R/Advanced_R_Notes_3_Subsetting_notes.pdf](../R_files/Advanced_R_Notes_3_Subsetting_notes.pdf)
#' - [R/Advanced_R_Notes_4_Vocabulary.html](../R_files/Advanced_R_Notes_4_Vocabulary.html)
#' - [R/Advanced_R_Notes_4_Vocabulary_notes.pdf](../R_files/Advanced_R_Notes_4_Vocabulary_notes.pdf)
#' - [R/Advanced_R_Notes_4_Vocabulary_XXX.R](../R_files/Advanced_R_Notes_4_Vocabulary_XXX.R)
#' - [R/Advanced_R_Notes_56_Functions_and_OOP_XXX.R](../R_files/Advanced_R_Notes_56_Functions_and_OOP_XXX.R)
#' - [R/Advanced_R_Notes_Extras.html](../R_files/Advanced_R_Notes_Extras.html)
#' - [R/Advanced_R_Notes_Extras.md](../R_files/Advanced_R_Notes_Extras.md)
#' - [R/Advanced_R_Notes_Extras.R](../R_files/Advanced_R_Notes_Extras.R)
#' - [R/Advanced_R_Notes_Pitfalls.R](../R_files/Advanced_R_Notes_Pitfalls.R)
#' - [R/Advanced_R_Questions.html](../R_files/Advanced_R_Questions.html)
#'     - AAAA 62 questions
#' - [R/Advanced_R_Questions.R](../R_files/Advanced_R_Questions.R)
#' - [R/Advanced_R_Questions_files](../R_files/Advanced_R_Questions_files)
#' - [R/Advanced_R_Questions_files/fonts](../R_files/Advanced_R_Questions_files/fonts)
#' - [R/Advanced_R_Questions_files/fonts/open-sans-400.woff](../R_files/Advanced_R_Questions_files/fonts/open-sans-400.woff)
#' - [R/Advanced_R_Questions_files/fonts/open-sans-700.woff](../R_files/Advanced_R_Questions_files/fonts/open-sans-700.woff)
#' - [R/Advanced_R_Questions_files/images](../R_files/Advanced_R_Questions_files/images)
#' - [R/Advanced_R_Questions_files/images/body-bg.jpg](../R_files/Advanced_R_Questions_files/images/body-bg.jpg)
#' - [R/Advanced_R_Questions_files/images/body-bg.png](../R_files/Advanced_R_Questions_files/images/body-bg.png)
#' - [R/Advanced_R_Questions_files/images/header-bg.jpg](../R_files/Advanced_R_Questions_files/images/header-bg.jpg)
#' - [R/Advanced_R_Questions_files/images/highlight-bg.jpg](../R_files/Advanced_R_Questions_files/images/highlight-bg.jpg)
#' - [R/Advanced_R_Questions_files/style.css](../R_files/Advanced_R_Questions_files/style.css)
#' - [R/Advanced_R_Questions_notes.pdf](../R_files/Advanced_R_Questions_notes.pdf)
#' - [R/Assignment_4.R](../R_files/Assignment_4.R)
#'     - Class list exercise
#' - [R/Bayes](../R_files/Bayes)
#' - [R/Bayes/.Rhistory](../R_files/Bayes/.Rhistory)
#' - [R/Bayes/server.R](../R_files/Bayes/server.R)
#'     - with Mosaic plot -- good for a Shiny project
#' - [R/Bayes/ui.R](../R_files/Bayes/ui.R)
#' - [R/bib.bib](../R_files/bib.bib)
#' - [R/derivative.html](../R_files/derivative.html)
#'     - AAAA uses gpanel.fit
#' - [R/derivative.R](../R_files/derivative.R)
#' - [R/dropEqG.png](../R_files/dropEqG.png)
#' - [R/Ellipses_and_Variance.html](../R_files/Ellipses_and_Variance.html)
#'     - AAAA Variances with ellipses and ending with Duchamp
#' - [R/Ellipses_and_Variance.R](../R_files/Ellipses_and_Variance.R)
#' - [R/Exercise_tmp.R](../R_files/Exercise_tmp.R)
#'     - MIGHT just duplicate others
#' - [R/Exploring_Data_in_R_1.html](../R_files/Exploring_Data_in_R_1.html)
#'     - AA enormous file leading to categorical plots .. but no Galef plots
#'     - No Paik-Agresti plots
##' ########################################################## HERE ----
#' - [R/Exploring_Data_in_R_1.R](../R_files/Exploring_Data_in_R_1.R)
#' - [R/Exploring_Data_in_R_1_2019_02_03.pdf](../R_files/Exploring_Data_in_R_1_2019_02_03.pdf)
#' - [R/Exploring_Regression.html](../R_files/Exploring_Regression.html)
#'     - Extensive 
#' - [R/Exploring_Regression.R](../R_files/Exploring_Regression.R)
#' - [R/file.csv](../R_files/file.csv)
#' - [R/file.xlsx](../R_files/file.xlsx)
#' - [R/file2.csv](../R_files/file2.csv)
#' - [R/file2.xlsx](../R_files/file2.xlsx)
#' - [R/From_leo_2017_11_14.R](../R_files/From_leo_2017_11_14.R)
#' - [R/GLMs_for_counts.html](../R_files/GLMs_for_counts.html)
#'     - Ornstein data
#' - [R/GLMs_for_counts.R](../R_files/GLMs_for_counts.R)
#'     - mediation vs confounding 1 page hand drawn
#' - [R/graph.PNG](../R_files/graph.PNG)
#' - [R/grouped_means_or_lme.R](../R_files/grouped_means_or_lme.R)
#'     - simulation
#' - [R/health-pgovt-fit.png](../R_files/health-pgovt-fit.png)
#' - [R/health-pgovt.png](../R_files/health-pgovt.png)
#' - [R/HilbertSpace.PNG](../R_files/HilbertSpace.PNG)
#'     - good hilbert space graph
#' - [R/Lab_1.R](../R_files/Lab_1.R)
#'     - AAAA Lab 1
#' - [R/Likelihood.html](../R_files/Likelihood.html)
#'     - AAA good start NEEDS work
#' - [R/Likelihood.md](../R_files/Likelihood.md)
#' - [R/Likelihood.R](../R_files/Likelihood.R)
#' - [R/Likelihood_2.html](../R_files/Likelihood_2.html)
#' - [R/Likelihood_2.md](../R_files/Likelihood_2.md)
#' - [R/Likelihood_2.R](../R_files/Likelihood_2.R)
#'     - stab in the dark
#' - [R/Likelihood_files](../R_files/Likelihood_files)
#' - [R/Likelihood_files/figure-html](../R_files/Likelihood_files/figure-html)
#' - [R/Likelihood_files/figure-html/unnamed-chunk-3-1.png](../R_files/Likelihood_files/figure-html/unnamed-chunk-3-1.png)
#' - [R/Likelihood_files/figure-html/unnamed-chunk-7-1.png](../R_files/Likelihood_files/figure-html/unnamed-chunk-7-1.png)
#' - [R/Linear_hypotheses.R](../R_files/Linear_hypotheses.R)
#'     - AA minimal for Prestige
#' - [R/Logistic.html](../R_files/Logistic.html)
#'     - AAAA Uses Green data -- seems advanced
#' - [R/Logistic.pdf](../R_files/Logistic.pdf)
#' - [R/Logistic.R](../R_files/Logistic.R)
#' - [R/Logistic_notes.pdf](../R_files/Logistic_notes.pdf)
#'     - AAAA annotated pdf
#' - [R/Logistic_with_simulated_p_values.R](../R_files/Logistic_with_simulated_p_values.R)
#'     - AAA Empirical p-value for brglm with simulation"
#' - [R/Messy_data.html](../R_files/Messy_data.html)
#'     - AAAA with Heather
#' - [R/Messy_data.pdf](../R_files/Messy_data.pdf)
#' - [R/Messy_data.R](../R_files/Messy_data.R)
#' - [R/mig.pdf](../R_files/mig.pdf)
#'     - AAA nice seasonal spline with panel.fit on migraine data -- consider using Unemployment data
#' - [R/migraines.html](../R_files/migraines.html)
#'     - AAA cp previous
#' - [R/migraines.md](../R_files/migraines.md)
#' - [R/migraines.pdf](../R_files/migraines.pdf)
#' - [R/migraines.R](../R_files/migraines.R)
#' - [R/migraines.utf8.md](../R_files/migraines.utf8.md)
#' - [R/migraines_files](../R_files/migraines_files)
#' - [R/migraines_files/figure-html](../R_files/migraines_files/figure-html)
#' - [R/migraines_files/figure-html/unnamed-chunk-11-1.png](../R_files/migraines_files/figure-html/unnamed-chunk-11-1.png)
#' - [R/migraines_files/figure-html/unnamed-chunk-14-1.png](../R_files/migraines_files/figure-html/unnamed-chunk-14-1.png)
#' - [R/migraines_files/figure-html/unnamed-chunk-14-2.png](../R_files/migraines_files/figure-html/unnamed-chunk-14-2.png)
#' - [R/migraines_files/figure-html/unnamed-chunk-14-3.png](../R_files/migraines_files/figure-html/unnamed-chunk-14-3.png)
#' - [R/migraines_files/figure-html/unnamed-chunk-16-1.png](../R_files/migraines_files/figure-html/unnamed-chunk-16-1.png)
#' - [R/migraines_files/figure-html/unnamed-chunk-16-2.png](../R_files/migraines_files/figure-html/unnamed-chunk-16-2.png)
#' - [R/migraines_files/figure-html/unnamed-chunk-16-3.png](../R_files/migraines_files/figure-html/unnamed-chunk-16-3.png)
#' - [R/migraines_files/figure-html/unnamed-chunk-16-4.png](../R_files/migraines_files/figure-html/unnamed-chunk-16-4.png)
#' - [R/migraines_files/figure-html/unnamed-chunk-3-1.png](../R_files/migraines_files/figure-html/unnamed-chunk-3-1.png)
#' - [R/migraines_files/figure-html/unnamed-chunk-5-1.png](../R_files/migraines_files/figure-html/unnamed-chunk-5-1.png)
#' - [R/migraines_files/figure-html/unnamed-chunk-6-1.png](../R_files/migraines_files/figure-html/unnamed-chunk-6-1.png)
#' - [R/migraines_files/figure-html/unnamed-chunk-6-2.png](../R_files/migraines_files/figure-html/unnamed-chunk-6-2.png)
#' - [R/migraines_files/figure-html/unnamed-chunk-6-3.png](../R_files/migraines_files/figure-html/unnamed-chunk-6-3.png)
#' - [R/migraines_files/figure-html/unnamed-chunk-6-4.png](../R_files/migraines_files/figure-html/unnamed-chunk-6-4.png)
#' - [R/migraines_files/figure-html/unnamed-chunk-6-5.png](../R_files/migraines_files/figure-html/unnamed-chunk-6-5.png)
#' - [R/migraines_notes.pdf](../R_files/migraines_notes.pdf)
#' - [R/mm.bib](../R_files/mm.bib)
#' - [R/ornstein.txt](../R_files/ornstein.txt)
#'     - Ornstein data
#' - [R/paik_diagrams.html](../R_files/paik_diagrams.html)
#' - [R/paik_diagrams.R](../R_files/paik_diagrams.R)
#'     - AAA Paik diagram NEEDS IMPROVEMENT
#' - [R/piazza-nats1500_roster (51).csv](../R_files/piazza-nats1500_roster (51).csv)
#' - [R/piazza-nats1500_roster (51).xlsx](../R_files/piazza-nats1500_roster (51).xlsx)
#' - [R/quadsmoke.png](../R_files/quadsmoke.png)
#' - [R/readxl_bug.JPG](../R_files/readxl_bug.JPG)
#' - [R/regions.png](../R_files/regions.png)
#' - [R/Regression_in_R_2019.html](../R_files/Regression_in_R_2019.html)
#' - [R/Regression_in_R_2019.R](../R_files/Regression_in_R_2019.R)
#'     - AAAA Regression in R; has Type I II III tests
#' - [R/Regression_in_R_2019_01_30.html](../R_files/Regression_in_R_2019_01_30.html)
#' - [R/Regression_in_R_2019_01_30.pdf](../R_files/Regression_in_R_2019_01_30.pdf)
#'     - AAAA has exercises USE FOR CHAPTER 2??????
#' - [R/Regression_in_R_2019_2019_01_21.pdf](../R_files/Regression_in_R_2019_2019_01_21.pdf)
#' - [R/Regression_in_R_2019_2019_01_28.pdf](../R_files/Regression_in_R_2019_2019_01_28.pdf)
#' - [R/regression_plots.R](../R_files/regression_plots.R)
#'     - overview quick but .... important
#' - [R/regular_expression_murdoch.R](../R_files/regular_expression_murdoch.R)
#' - [R/SampleClassFile.csv](../R_files/SampleClassFile.csv)
#' - [R/selection_in_lists.R](../R_files/selection_in_lists.R)
#'     - snippet
#' - [R/supressor_variable.pdf](../R_files/supressor_variable.pdf)
#' - [R/supressor_variable.R](../R_files/supressor_variable.R)
#'     - very short -- just SS -- consider looking for talk
#' - [R/tail.R](../R_files/tail.R)
#'     - curious ??
#' - [R/Titanic.txt](../R_files/Titanic.txt)
#'     - with names
#' - [R/UnitedNations.txt](../R_files/UnitedNations.txt)
#'     - contraception, infant mortality
#' - [R/visual_ci.PNG](../R_files/visual_ci.PNG)
#'     - guessing the correlation
#' - [R/_file.xlsx](../R_files/_file.xlsx)
#' - [R/_file2.xlsx](../R_files/_file2.xlsx)
#' - [R/__Logistic.R](../R_files/__Logistic.R)
#' - [R/__Overdispersion.R](../R_files/__Overdispersion.R)
#' - [README.R](../README.R)
#' - [README.txt](../README.txt)
#' - [regions.png](../regions.png)
#' - [Regression_in_R_2019.R](../Regression_in_R_2019.R)
#'     - AAAA compare with above in R directory
#' - [Rplots.pdf](../Rplots.pdf)
#' - [R_notes](../R_notes)
#'     - edit in R-RNOTE  (in courses or in R/??????)
#'     - changes in this directory date to 17 or 18
#' - [R_notes/.RData](../R_notes/.RData)
#' - [R_notes/.Rhistory](../R_notes/.Rhistory)
#' - [R_notes/assignments](../R_notes/assignments)
#' - [R_notes/assignments/Approaching an Analysis -- Comments on Assignment 2.R](../R_notes/assignments/Approaching an Analysis -- Comments on Assignment 2.R)
#' - [R_notes/chapters](../R_notes/chapters)
#' - [R_notes/chapters/Appendix_01_Additional_Material (2).R](../R_notes/chapters/Appendix_01_Additional_Material (2).R)
#' - [R_notes/chapters/Appendix_01_Additional_Material.R](../R_notes/chapters/Appendix_01_Additional_Material.R)
#' - [R_notes/chapters/Approaching an Analysis -- Comments on Assignment 2.R](../R_notes/chapters/Approaching an Analysis -- Comments on Assignment 2.R)
#' - [R_notes/chapters/contents.html](../R_notes/chapters/contents.html)
#' - [R_notes/chapters/contents.R](../R_notes/chapters/contents.R)
#' - [R_notes/chapters/Exploring_Regression_GLH-2.R](../R_notes/chapters/Exploring_Regression_GLH-2.R)
#' - [R_notes/chapters/Exploring_Regression_GLH.R](../R_notes/chapters/Exploring_Regression_GLH.R)
#' - [R_notes/chapters/Lab_2.R](../R_notes/chapters/Lab_2.R)
#' - [R_notes/chapters/Part_01_Getting_Started.html](../R_notes/chapters/Part_01_Getting_Started.html)
#' - [R_notes/chapters/Part_01_Getting_Started.R](../R_notes/chapters/Part_01_Getting_Started.R)
#' - [R_notes/chapters/Part_02_Short_tour.R](../R_notes/chapters/Part_02_Short_tour.R)
#' - [R_notes/chapters/Part_02_Short_tour.spin.R](../R_notes/chapters/Part_02_Short_tour.spin.R)
#' - [R_notes/chapters/Part_02_Short_tour.spin.Rmd](../R_notes/chapters/Part_02_Short_tour.spin.Rmd)
#' - [R_notes/chapters/Part_02_Short_tour_2.R](../R_notes/chapters/Part_02_Short_tour_2.R)
#' - [R_notes/chapters/Part_03_Language.R](../R_notes/chapters/Part_03_Language.R)
#' - [R_notes/chapters/Part_04_Installing_Github_Packages.R](../R_notes/chapters/Part_04_Installing_Github_Packages.R)
#' - [R_notes/chapters/Part_05_Linear_Model_Example.R](../R_notes/chapters/Part_05_Linear_Model_Example.R)
#' - [R_notes/chapters/Part_05_Linear_Model_Examplepedit.R](../R_notes/chapters/Part_05_Linear_Model_Examplepedit.R)
#' - [R_notes/chapters/Part_05_Linear_Model_Examplepedit_2.R](../R_notes/chapters/Part_05_Linear_Model_Examplepedit_2.R)
#' - [R_notes/chapters/Part_05_Linear_Model_Examplepedit_OnGray.R](../R_notes/chapters/Part_05_Linear_Model_Examplepedit_OnGray.R)
#' - [R_notes/chapters/Part_06_Complex_Data.R](../R_notes/chapters/Part_06_Complex_Data.R)
#' - [R_notes/chapters/Part_0Q_A_Tour_of_Linear_Models_in_R.R](../R_notes/chapters/Part_0Q_A_Tour_of_Linear_Models_in_R.R)
#' - [R_notes/chapters/Part_0Q_A_Tour_of_Linear_Models_in_Rvgray.R](../R_notes/chapters/Part_0Q_A_Tour_of_Linear_Models_in_Rvgray.R)
#' - [R_notes/chapters/Review_of_Regression_in_R.R](../R_notes/chapters/Review_of_Regression_in_R.R)
#' - [R_notes/cheatsheets](../R_notes/cheatsheets)
#' - [R_notes/cheatsheets/base-r.pdf](../R_notes/cheatsheets/base-r.pdf)
#' - [R_notes/cheatsheets/data-visualization-2.1.pdf](../R_notes/cheatsheets/data-visualization-2.1.pdf)
#' - [R_notes/cheatsheets/how-big-is-your-graph.pdf](../R_notes/cheatsheets/how-big-is-your-graph.pdf)
#' - [R_notes/cheatsheets/leaflet.pdf](../R_notes/cheatsheets/leaflet.pdf)
#' - [R_notes/cheatsheets/package-development.pdf](../R_notes/cheatsheets/package-development.pdf)
#' - [R_notes/cheatsheets/rmarkdown-2.0.pdf](../R_notes/cheatsheets/rmarkdown-2.0.pdf)
#' - [R_notes/cheatsheets/strings.pdf](../R_notes/cheatsheets/strings.pdf)
#' - [R_notes/common](../R_notes/common)
#' - [R_notes/common/header.R](../R_notes/common/header.R)
#' - [R_notes/common/_common.yaml](../R_notes/common/_common.yaml)
#' - [R_notes/copy.sh](../R_notes/copy.sh)
#' - [R_notes/data](../R_notes/data)
#' - [R_notes/data/SampleClassFile.csv](../R_notes/data/SampleClassFile.csv)
#' - [R_notes/EDIT HERE_____R_Notes - Shortcut.lnk](../R_notes/EDIT HERE_____R_Notes - Shortcut.lnk)
#' - [R_notes/EDIT THIS FOLDER IN R-RNOTE.txt](../R_notes/EDIT THIS FOLDER IN R-RNOTE.txt)
#' - [R_notes/images](../R_notes/images)
#' - [R_notes/images/readxl_bug.JPG](../R_notes/images/readxl_bug.JPG)
#' - [R_notes/index.html](../R_notes/index.html)
#' - [R_notes/index.R](../R_notes/index.R)
#' - [R_notes/LICENSE](../R_notes/LICENSE)
#' - [R_notes/pix](../R_notes/pix)
#' - [R_notes/pix/blueball.gif](../R_notes/pix/blueball.gif)
#' - [R_notes/README.md](../R_notes/README.md)
#' - [R_notes/References](../R_notes/References)
#' - [R_notes/R_Notes.md](../R_notes/R_Notes.md)
#' - [R_notes/Sandbox.R](../R_notes/Sandbox.R)
#' - [R_notes/topics](../R_notes/topics)
#' - [R_notes/topics/How_to_plot_many_fits.html](../R_notes/topics/How_to_plot_many_fits.html)
#' - [R_notes/topics/How_to_plot_many_fits.R](../R_notes/topics/How_to_plot_many_fits.R)
#' - [R_notes/topics/Using_tolong.R](../R_notes/topics/Using_tolong.R)
#' - [R_notes/__materials](../R_notes/__materials)
#' - [R_notes/__materials/Davis 2012 Causal Inference with Observational Data.pdf](../R_notes/__materials/Davis 2012 Causal Inference with Observational Data.pdf)
#' - [R_notes/__materials/Fox 2017 ICPSR Installing R and RStudio.html](../R_notes/__materials/Fox 2017 ICPSR Installing R and RStudio.html)
#' - [R_notes/__materials/Fox Blackmore example.eml](../R_notes/__materials/Fox Blackmore example.eml)
#' - [R_notes/__materials/MATH 4039_ Exploring Regression with Linear Hypotheses.pdf](../R_notes/__materials/MATH 4039_ Exploring Regression with Linear Hypotheses.pdf)
#' - [R_notes/__materials/Souces_notes.docx](../R_notes/__materials/Souces_notes.docx)
#' - [R_notes/__materials/Warwick_R_Exercises.pdf](../R_notes/__materials/Warwick_R_Exercises.pdf)
#' - [R_notes/__materials/Warwick_R_Exercises_and_Solutions.pdf](../R_notes/__materials/Warwick_R_Exercises_and_Solutions.pdf)
#' - [R_notes/__materials/__Fox 2017 ICPSR Course on R.pdf](../R_notes/__materials/__Fox 2017 ICPSR Course on R.pdf)
#' - [R_notes/__old_R_course](../R_notes/__old_R_course)
#' - [R_notes/__old_R_course/R](../R_notes/__old_R_course/R)
#' - [R_notes/__old_R_course/R/files](../R_notes/__old_R_course/R/files)
#' - [R_notes/__old_R_course/R/files/Match.html](../R_notes/__old_R_course/R/files/Match.html)
#' - [R_notes/__old_R_course/R/From WWW](../R_notes/__old_R_course/R/From WWW)
#' - [R_notes/__old_R_course/R/From WWW/R](../R_notes/__old_R_course/R/From WWW/R)
#' - [R_notes/__old_R_course/R/From WWW/R/BeyondRepeated-2007-02-22-FittingModels.R](../R_notes/__old_R_course/R/From WWW/R/BeyondRepeated-2007-02-22-FittingModels.R)
#' - [R_notes/__old_R_course/R/From WWW/R/coursefun.R](../R_notes/__old_R_course/R/From WWW/R/coursefun.R)
#' - [R_notes/__old_R_course/R/From WWW/R/coursefunBK.R](../R_notes/__old_R_course/R/From WWW/R/coursefunBK.R)
#' - [R_notes/__old_R_course/R/From WWW/R/coursefunBK2.R](../R_notes/__old_R_course/R/From WWW/R/coursefunBK2.R)
#' - [R_notes/__old_R_course/R/From WWW/R/coursefunBK3.R](../R_notes/__old_R_course/R/From WWW/R/coursefunBK3.R)
#' - [R_notes/__old_R_course/R/From WWW/R/fun-20080630.R](../R_notes/__old_R_course/R/From WWW/R/fun-20080630.R)
#' - [R_notes/__old_R_course/R/From WWW/R/fun-bak20080808.R](../R_notes/__old_R_course/R/From WWW/R/fun-bak20080808.R)
#' - [R_notes/__old_R_course/R/From WWW/R/fun-last.R](../R_notes/__old_R_course/R/From WWW/R/fun-last.R)
#' - [R_notes/__old_R_course/R/From WWW/R/fun-new.R](../R_notes/__old_R_course/R/From WWW/R/fun-new.R)
#' - [R_notes/__old_R_course/R/From WWW/R/fun-R.html](../R_notes/__old_R_course/R/From WWW/R/fun-R.html)
#' - [R_notes/__old_R_course/R/From WWW/R/fun.R](../R_notes/__old_R_course/R/From WWW/R/fun.R)
#' - [R_notes/__old_R_course/R/From WWW/R/fun061109.R](../R_notes/__old_R_course/R/From WWW/R/fun061109.R)
#' - [R_notes/__old_R_course/R/From WWW/R/fun090621.R](../R_notes/__old_R_course/R/From WWW/R/fun090621.R)
#' - [R_notes/__old_R_course/R/From WWW/R/funRDC.R](../R_notes/__old_R_course/R/From WWW/R/funRDC.R)
#' - [R_notes/__old_R_course/R/From WWW/R/funVlast.R](../R_notes/__old_R_course/R/From WWW/R/funVlast.R)
#' - [R_notes/__old_R_course/R/From WWW/R/fun_0.1.zip](../R_notes/__old_R_course/R/From WWW/R/fun_0.1.zip)
#' - [R_notes/__old_R_course/R/From WWW/R/gm_1.0.zip](../R_notes/__old_R_course/R/From WWW/R/gm_1.0.zip)
#' - [R_notes/__old_R_course/R/From WWW/R/index.html](../R_notes/__old_R_course/R/From WWW/R/index.html)
#' - [R_notes/__old_R_course/R/From WWW/R/MGT1382-R.html](../R_notes/__old_R_course/R/From WWW/R/MGT1382-R.html)
#' - [R_notes/__old_R_course/R/From WWW/R/MGT1382.R](../R_notes/__old_R_course/R/From WWW/R/MGT1382.R)
#' - [R_notes/__old_R_course/R/From WWW/R/MultilevelModelsinR.R](../R_notes/__old_R_course/R/From WWW/R/MultilevelModelsinR.R)
#' - [R_notes/__old_R_course/R/From WWW/R/MultipleRegressionAndDiagnostics.R](../R_notes/__old_R_course/R/From WWW/R/MultipleRegressionAndDiagnostics.R)
#' - [R_notes/__old_R_course/R/From WWW/R/MultivariateNormalContours.R](../R_notes/__old_R_course/R/From WWW/R/MultivariateNormalContours.R)
#' - [R_notes/__old_R_course/R/From WWW/R/p3d.tar.gz](../R_notes/__old_R_course/R/From WWW/R/p3d.tar.gz)
#' - [R_notes/__old_R_course/R/From WWW/R/p3d.zip](../R_notes/__old_R_course/R/From WWW/R/p3d.zip)
#' - [R_notes/__old_R_course/R/From WWW/R/p3d_0.01.tar.gz](../R_notes/__old_R_course/R/From WWW/R/p3d_0.01.tar.gz)
#' - [R_notes/__old_R_course/R/From WWW/R/p3d_0.01.zip](../R_notes/__old_R_course/R/From WWW/R/p3d_0.01.zip)
#' - [R_notes/__old_R_course/R/From WWW/R/PACKAGES](../R_notes/__old_R_course/R/From WWW/R/PACKAGES)
#' - [R_notes/__old_R_course/R/From WWW/R/Plot3D (1).R](../R_notes/__old_R_course/R/From WWW/R/Plot3D (1).R)
#' - [R_notes/__old_R_course/R/From WWW/R/Plot3D-last (2).R](../R_notes/__old_R_course/R/From WWW/R/Plot3D-last (2).R)
#' - [R_notes/__old_R_course/R/From WWW/R/Plot3d-last.R](../R_notes/__old_R_course/R/From WWW/R/Plot3d-last.R)
#' - [R_notes/__old_R_course/R/From WWW/R/Plot3d.R](../R_notes/__old_R_course/R/From WWW/R/Plot3d.R)
#' - [R_notes/__old_R_course/R/From WWW/R/R-Commands.html](../R_notes/__old_R_course/R/From WWW/R/R-Commands.html)
#' - [R_notes/__old_R_course/R/From WWW/R/R-fun.html](../R_notes/__old_R_course/R/From WWW/R/R-fun.html)
#' - [R_notes/__old_R_course/R/From WWW/R/R-Graphics.ppt](../R_notes/__old_R_course/R/From WWW/R/R-Graphics.ppt)
#' - [R_notes/__old_R_course/R/From WWW/R/R-Graphics.R](../R_notes/__old_R_course/R/From WWW/R/R-Graphics.R)
#' - [R_notes/__old_R_course/R/From WWW/R/sorttable2.js](../R_notes/__old_R_course/R/From WWW/R/sorttable2.js)
#' - [R_notes/__old_R_course/R/From WWW/R/spida.tar.gz](../R_notes/__old_R_course/R/From WWW/R/spida.tar.gz)
#' - [R_notes/__old_R_course/R/From WWW/R/spida.zip](../R_notes/__old_R_course/R/From WWW/R/spida.zip)
#' - [R_notes/__old_R_course/R/From WWW/R/spida_0.1.tar.gz](../R_notes/__old_R_course/R/From WWW/R/spida_0.1.tar.gz)
#' - [R_notes/__old_R_course/R/From WWW/R/spida_0.1.zip](../R_notes/__old_R_course/R/From WWW/R/spida_0.1.zip)
#' - [R_notes/__old_R_course/R/From WWW/R/src](../R_notes/__old_R_course/R/From WWW/R/src)
#' - [R_notes/__old_R_course/R/From WWW/R/src/contrib](../R_notes/__old_R_course/R/From WWW/R/src/contrib)
#' - [R_notes/__old_R_course/R/From WWW/R/src/contrib/gm_1.0.tar.gz](../R_notes/__old_R_course/R/From WWW/R/src/contrib/gm_1.0.tar.gz)
#' - [R_notes/__old_R_course/R/From WWW/R/src/contrib/PACKAGES](../R_notes/__old_R_course/R/From WWW/R/src/contrib/PACKAGES)
#' - [R_notes/__old_R_course/R/From WWW/R/test.R](../R_notes/__old_R_course/R/From WWW/R/test.R)
#' - [R_notes/__old_R_course/R/From WWW/R/VisualizingMultipleRegressionPart1.R](../R_notes/__old_R_course/R/From WWW/R/VisualizingMultipleRegressionPart1.R)
#' - [R_notes/__old_R_course/R/From WWW/R/VisualizingMultipleRegressionPart2.R](../R_notes/__old_R_course/R/From WWW/R/VisualizingMultipleRegressionPart2.R)
#' - [R_notes/__old_R_course/R/From WWW/R/VisualizingMultipleRegressionPart3.R](../R_notes/__old_R_course/R/From WWW/R/VisualizingMultipleRegressionPart3.R)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/.S](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/.S)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/.S/.Last.value](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/.S/.Last.value)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/.S/z](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/.S/z)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/98outline.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/98outline.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/dirty.txt](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/dirty.txt)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/home.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/home.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/sedinfo.txt](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/sedinfo.txt)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/contents.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/contents.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/intro.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/intro.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/isas.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/isas.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/parameters.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/parameters.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part1.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part1.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part10.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part10.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part11.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part11.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part12.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part12.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part2.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part2.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part3.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part3.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part4.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part4.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part5.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part5.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part6.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part6.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part7.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part7.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part8.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part8.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part9.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/part9.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/solutions1.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/solutions1.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/solutions2.html](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/solutions2.html)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zbar1.gif](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zbar1.gif)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zbox1.gif](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zbox1.gif)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zdens1.gif](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zdens1.gif)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zdot1.gif](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zdot1.gif)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zfaces1.gif](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zfaces1.gif)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zhist1.gif](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zhist1.gif)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zhist2.gif](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zhist2.gif)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zlm1.gif](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zlm1.gif)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zpie1.gif](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zpie1.gif)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zplot1.gif](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zplot1.gif)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zplot2.gif](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zplot2.gif)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zplot3.gif](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zplot3.gif)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zplot4.gif](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zplot4.gif)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zstars1.gif](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/Tutorial/zstars1.gif)
#' - [R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/viinfo.txt](../R_notes/__old_R_course/R/From WWW/S_Tutorial_1993/viinfo.txt)
#' - [R_notes/__old_R_course/R/Participants](../R_notes/__old_R_course/R/Participants)
#' - [R_notes/__old_R_course/R/Participants/ISR Registered Participants from Betty Tai Sept 19.xls](../R_notes/__old_R_course/R/Participants/ISR Registered Participants from Betty Tai Sept 19.xls)
#' - [R_notes/__old_R_course/R/Participants/List of Participants_Sept19.xls](../R_notes/__old_R_course/R/Participants/List of Participants_Sept19.xls)
#' - [R_notes/__old_R_course/R/Participants/SCS Fall 2011 R Course Combined List of Participants.xls](../R_notes/__old_R_course/R/Participants/SCS Fall 2011 R Course Combined List of Participants.xls)
#' - [R_notes/__old_R_course/R/Participants/Students.xlsx](../R_notes/__old_R_course/R/Participants/Students.xlsx)
#' - [R_notes/__old_R_course/R/Rnotes.html](../R_notes/__old_R_course/R/Rnotes.html)
#' - [R_notes/__old_R_course/R/R_CSI_2013.docx](../R_notes/__old_R_course/R/R_CSI_2013.docx)
#' - [R_notes/__old_R_course/R/Scripts](../R_notes/__old_R_course/R/Scripts)
#' - [R_notes/__old_R_course/R/Scripts/.RData](../R_notes/__old_R_course/R/Scripts/.RData)
#' - [R_notes/__old_R_course/R/Scripts/1_Installing_Packages.R](../R_notes/__old_R_course/R/Scripts/1_Installing_Packages.R)
#' - [R_notes/__old_R_course/R/Scripts/2_Short_tour.R](../R_notes/__old_R_course/R/Scripts/2_Short_tour.R)
#' - [R_notes/__old_R_course/R/Scripts/3_Language.docx](../R_notes/__old_R_course/R/Scripts/3_Language.docx)
#' - [R_notes/__old_R_course/R/Scripts/3_Language.pdf](../R_notes/__old_R_course/R/Scripts/3_Language.pdf)
#' - [R_notes/__old_R_course/R/Scripts/3_Language.R](../R_notes/__old_R_course/R/Scripts/3_Language.R)
#' - [R_notes/__old_R_course/R/Scripts/4_Linear_Model_Example.docx](../R_notes/__old_R_course/R/Scripts/4_Linear_Model_Example.docx)
#' - [R_notes/__old_R_course/R/Scripts/4_Linear_Model_Example.pdf](../R_notes/__old_R_course/R/Scripts/4_Linear_Model_Example.pdf)
#' - [R_notes/__old_R_course/R/Scripts/4_Linear_Model_Example.R](../R_notes/__old_R_course/R/Scripts/4_Linear_Model_Example.R)
#' - [R_notes/__old_R_course/R/Scripts/4_Linear_Model_Examplepedit.R](../R_notes/__old_R_course/R/Scripts/4_Linear_Model_Examplepedit.R)
#' - [R_notes/__old_R_course/R/Scripts/4_Linear_Model_Examplepedit_2.R](../R_notes/__old_R_course/R/Scripts/4_Linear_Model_Examplepedit_2.R)
#' - [R_notes/__old_R_course/R/Scripts/4_Linear_Model_Examplepedit_OnGray.R](../R_notes/__old_R_course/R/Scripts/4_Linear_Model_Examplepedit_OnGray.R)
#' - [R_notes/__old_R_course/R/Scripts/A Tour of Linear Models in R.R](../R_notes/__old_R_course/R/Scripts/A Tour of Linear Models in R.R)
#' - [R_notes/__old_R_course/R/Scripts/A Tour of Linear Models in Rvgray.R](../R_notes/__old_R_course/R/Scripts/A Tour of Linear Models in Rvgray.R)
#' - [R_notes/__old_R_course/R/Scripts/Day_3](../R_notes/__old_R_course/R/Scripts/Day_3)
#' - [R_notes/__old_R_course/R/Scripts/Day_3/.RData](../R_notes/__old_R_course/R/Scripts/Day_3/.RData)
#' - [R_notes/__old_R_course/R/Scripts/Day_3/.Rhistory](../R_notes/__old_R_course/R/Scripts/Day_3/.Rhistory)
#' - [R_notes/__old_R_course/R/Scripts/Day_3/data.R](../R_notes/__old_R_course/R/Scripts/Day_3/data.R)
#' - [R_notes/__old_R_course/R/Scripts/Day_3/data0.R](../R_notes/__old_R_course/R/Scripts/Day_3/data0.R)
#' - [R_notes/__old_R_course/R/Scripts/Day_3/data1.R](../R_notes/__old_R_course/R/Scripts/Day_3/data1.R)
#' - [R_notes/__old_R_course/R/Scripts/Day_3/Debugging.R](../R_notes/__old_R_course/R/Scripts/Day_3/Debugging.R)
#' - [R_notes/__old_R_course/R/Scripts/Day_3/Ellipse_Geometry.R](../R_notes/__old_R_course/R/Scripts/Day_3/Ellipse_Geometry.R)
#' - [R_notes/__old_R_course/R/Scripts/Day_3/graphics.R](../R_notes/__old_R_course/R/Scripts/Day_3/graphics.R)
#' - [R_notes/__old_R_course/R/Scripts/Day_3/Graphics_GM.R](../R_notes/__old_R_course/R/Scripts/Day_3/Graphics_GM.R)
#' - [R_notes/__old_R_course/R/Scripts/Day_3/Graphics_JF.R](../R_notes/__old_R_course/R/Scripts/Day_3/Graphics_JF.R)
#' - [R_notes/__old_R_course/R/Scripts/Day_3/Programming.R](../R_notes/__old_R_course/R/Scripts/Day_3/Programming.R)
#' - [R_notes/__old_R_course/R/Scripts/Day_3/R-exts.pdf](../R_notes/__old_R_course/R/Scripts/Day_3/R-exts.pdf)
#' - [R_notes/__old_R_course/R/Scripts/Day_3/Visualizing Multiple Regression.R](../R_notes/__old_R_course/R/Scripts/Day_3/Visualizing Multiple Regression.R)
#' - [R_notes/__old_R_course/R/Scripts/Day_3_www](../R_notes/__old_R_course/R/Scripts/Day_3_www)
#' - [R_notes/__old_R_course/R/Scripts/Day_3_www/p3d.beta.zip](../R_notes/__old_R_course/R/Scripts/Day_3_www/p3d.beta.zip)
#' - [R_notes/__old_R_course/R/Scripts/Day_3_www/Programming.R](../R_notes/__old_R_course/R/Scripts/Day_3_www/Programming.R)
#' - [R_notes/__old_R_course/R/Scripts/Day_3_www/Simple_Data_Entry.R](../R_notes/__old_R_course/R/Scripts/Day_3_www/Simple_Data_Entry.R)
#' - [R_notes/__old_R_course/R/Scripts/Day_3_www/spida.beta.zip](../R_notes/__old_R_course/R/Scripts/Day_3_www/spida.beta.zip)
#' - [R_notes/__old_R_course/R/Scripts/Day_3_www/Tour_of_Graphic_in_R.R](../R_notes/__old_R_course/R/Scripts/Day_3_www/Tour_of_Graphic_in_R.R)
#' - [R_notes/__old_R_course/R/Scripts/Day_3_www/Tour_of_Graphic_in_Rv2.R](../R_notes/__old_R_course/R/Scripts/Day_3_www/Tour_of_Graphic_in_Rv2.R)
#' - [R_notes/__old_R_course/R/Scripts/Duncan.csv](../R_notes/__old_R_course/R/Scripts/Duncan.csv)
#' - [R_notes/__old_R_course/R/Scripts/fox_1.R](../R_notes/__old_R_course/R/Scripts/fox_1.R)
#' - [R_notes/__old_R_course/R/Scripts/fox_2.R](../R_notes/__old_R_course/R/Scripts/fox_2.R)
#' - [R_notes/__old_R_course/R/Scripts/fox_3.R](../R_notes/__old_R_course/R/Scripts/fox_3.R)
#' - [R_notes/__old_R_course/R/Scripts/fox_4-5.R](../R_notes/__old_R_course/R/Scripts/fox_4-5.R)
#' - [R_notes/__old_R_course/R/Scripts/fox_4_5.R](../R_notes/__old_R_course/R/Scripts/fox_4_5.R)
#' - [R_notes/__old_R_course/R/Scripts/fox_7.R](../R_notes/__old_R_course/R/Scripts/fox_7.R)
#' - [R_notes/__old_R_course/R/Scripts/fox_8.R](../R_notes/__old_R_course/R/Scripts/fox_8.R)
#' - [R_notes/__old_R_course/R/Scripts/Introduction to R.docx](../R_notes/__old_R_course/R/Scripts/Introduction to R.docx)
#' - [R_notes/__old_R_course/R/Scripts/Introduction to R.pdf](../R_notes/__old_R_course/R/Scripts/Introduction to R.pdf)
#' - [R_notes/__old_R_course/R/Scripts/Notes.docx](../R_notes/__old_R_course/R/Scripts/Notes.docx)
#' - [R_notes/__old_R_course/R/Scripts/p3d.beta.zip](../R_notes/__old_R_course/R/Scripts/p3d.beta.zip)
#' - [R_notes/__old_R_course/R/Scripts/Prestige.additive.pdf](../R_notes/__old_R_course/R/Scripts/Prestige.additive.pdf)
#' - [R_notes/__old_R_course/R/Scripts/prestige.additive.png](../R_notes/__old_R_course/R/Scripts/prestige.additive.png)
#' - [R_notes/__old_R_course/R/Scripts/Prestige.interaction.pdf](../R_notes/__old_R_course/R/Scripts/Prestige.interaction.pdf)
#' - [R_notes/__old_R_course/R/Scripts/Prestige.interaction.png](../R_notes/__old_R_course/R/Scripts/Prestige.interaction.png)
#' - [R_notes/__old_R_course/R/Scripts/Rplot.pdf](../R_notes/__old_R_course/R/Scripts/Rplot.pdf)
#' - [R_notes/__old_R_course/R/Scripts/spida.beta.zip](../R_notes/__old_R_course/R/Scripts/spida.beta.zip)
#' - [R_notes/__to_include](../R_notes/__to_include)
#' - [R_notes/__to_include/Approaching an Analysis -- Comments on Assignment 2.R](../R_notes/__to_include/Approaching an Analysis -- Comments on Assignment 2.R)
#' - [R_notes/__to_include/class jan 15.R](../R_notes/__to_include/class jan 15.R)
#' - [R_notes/__to_include/dropEqG.png](../R_notes/__to_include/dropEqG.png)
#' - [R_notes/__to_include/Ellipses in Multiple Regression.R](../R_notes/__to_include/Ellipses in Multiple Regression.R)
#' - [R_notes/__to_include/Example_1.R](../R_notes/__to_include/Example_1.R)
#' - [R_notes/__to_include/First_example.R](../R_notes/__to_include/First_example.R)
#' - [R_notes/__to_include/fragments.R](../R_notes/__to_include/fragments.R)
#' - [R_notes/__to_include/Glossary_Terms.html](../R_notes/__to_include/Glossary_Terms.html)
#' - [R_notes/__to_include/Glossary_Terms.R](../R_notes/__to_include/Glossary_Terms.R)
#' - [R_notes/__to_include/Lab_2.R](../R_notes/__to_include/Lab_2.R)
#' - [R_notes/__to_include/Messy_data.R](../R_notes/__to_include/Messy_data.R)
#' - [R_notes/__to_include/RandSAS_Chapter02.html](../R_notes/__to_include/RandSAS_Chapter02.html)
#' - [R_notes/__to_include/RandSAS_Chapter02.R](../R_notes/__to_include/RandSAS_Chapter02.R)
#' - [R_notes/__to_include/Reading_and_merging_spreadsheets.R](../R_notes/__to_include/Reading_and_merging_spreadsheets.R)
#' - [R_notes/__to_include/Regression_in_R.R](../R_notes/__to_include/Regression_in_R.R)
#' - [R_notes/__to_include/Review_of_Regression_in_R.html](../R_notes/__to_include/Review_of_Regression_in_R.html)
#' - [R_notes/__to_include/R_and_SAS_Chapter02.R](../R_notes/__to_include/R_and_SAS_Chapter02.R)
#' - [R_notes/__to_include/R_Exercises.html](../R_notes/__to_include/R_Exercises.html)
#' - [R_notes/__to_include/R_Exercises.md](../R_notes/__to_include/R_Exercises.md)
#' - [R_notes/__to_include/R_Exercises.R](../R_notes/__to_include/R_Exercises.R)
#' - [R_notes/__to_include/sample_data.R](../R_notes/__to_include/sample_data.R)
#' - [R_notes/__to_include/sample_data_2.R](../R_notes/__to_include/sample_data_2.R)
#' - [R_notes/__to_include/Selected_Warwick_Exercises.R](../R_notes/__to_include/Selected_Warwick_Exercises.R)
#' - [R_notes/__to_include/Smoking3-analysis.R](../R_notes/__to_include/Smoking3-analysis.R)
#' - [R_notes/__to_include/Smoking3.csv](../R_notes/__to_include/Smoking3.csv)
#' - [R_notes/__to_include/Type I II III.R](../R_notes/__to_include/Type I II III.R)
#' - [R_notes/__to_include/Type_I_II_III.html](../R_notes/__to_include/Type_I_II_III.html)
#' - [R_notes/__to_include/Understanding_Output_in_Regression.R](../R_notes/__to_include/Understanding_Output_in_Regression.R)
#' - [R_notes/__to_include/__P_hacking.html](../R_notes/__to_include/__P_hacking.html)
#' - [R_notes/__to_include/__P_hacking.R](../R_notes/__to_include/__P_hacking.R)
#' - [R_notes/__to_include/__Short_tour_of_R.R](../R_notes/__to_include/__Short_tour_of_R.R)
#' - [R_notes.R](../R_notes.R)
#' - [SLID-selection.txt](../SLID-selection.txt)
#' - [slides](../slides)
#' - [slides/Cant_ignore_gender_and_be_unbiased.pdf](../slides/Cant_ignore_gender_and_be_unbiased.pdf)
#'     - AAAA
#' - [slides/cauchy_schwartz_and_average_class_size.pdf](../slides/cauchy_schwartz_and_average_class_size.pdf)
#'     - CSI but crude
#' - [slides/ellipses_b2_not_sig.pdf](../slides/ellipses_b2_not_sig.pdf)
#'     - crude
#' - [slides/glms.pdf](../slides/glms.pdf)
#'    - AA hand written but some good
#' - [slides/ladder_of_powers.pdf](../slides/ladder_of_powers.pdf)
#'    - by hand NEEDS IMP
#' - [slides/Likelihood.pdf](../slides/Likelihood.pdf)
#'    - by hand 
#' - [slides/Logistic_notes.pdf](../slides/Logistic_notes.pdf)
#'    - blank
#' - [slides/monty_hall.pdf](../slides/monty_hall.pdf)
#'    - good but SCS2019 probably better
#' - [slides/monty_hall_notes.pdf](../slides/monty_hall_notes.pdf)
#' - [slides/notes_2017_10_29.pdf](../slides/notes_2017_10_29.pdf)
#' - [slides/Notes_on_assignment_1.pdf](../slides/Notes_on_assignment_1.pdf)
#'     - educatin by type for Prestige data
#' - [slides/October_23.pdf](../slides/October_23.pdf)
#'     - crude POM slides
#' - [slides/Odds.pdf](../slides/Odds.pdf)
#'     - crude contigency tables
#' - [slides/Residuals_notes.pdf](../slides/Residuals_notes.pdf)
#'     - AAAA but NEEDS TONS OF IMPROVEMENT
#' - [slides/three_d (2).pdf](../slides/three_d (2).pdf)
#' - [slides/three_d.pdf](../slides/three_d.pdf)
#'     - on Hilbert space NEEDS IMPROVEMENT
#' - [slides/Two_by_two.pdf](../slides/Two_by_two.pdf)
#' - [slides/Two_by_two_notes.pdf](../slides/Two_by_two_notes.pdf)
#' - [slides/Two_by_two_notes_2.pdf](../slides/Two_by_two_notes_2.pdf)
#' - [slides/Two_by_two_unmelted.pdf](../slides/Two_by_two_unmelted.pdf)
#'     - AA Early Sally Clark with intro on 2x2 tables
#' - [slides/visual_avp.pdf](../slides/visual_avp.pdf)
#'     - badd messy slides
#' - [slides/When_Is_Correlation_Causation.pdf](../slides/When_Is_Correlation_Causation.pdf)
#'     - seems to be SSC talk version
#' - [slides/__glms.pdf](../slides/__glms.pdf)
#'     - GLMS again 
#' - [Smoking3.csv](../Smoking3.csv)
#' - [software_installation.html](../software_installation.html)
#'     - now in index.html
#' - [software_installation.R](../software_installation.R)
#' - [Titanic.txt](../Titanic.txt)
#' - [tmp](../tmp)
#' - [TODO.R](../TODO.R)
#' - [UnitedNations.txt](../UnitedNations.txt)
#' - [Wickam2.R](../Wickam2.R)
#'     - from wickham has EXERCISES ON FACTORS
#' - [_file.xlsx](../_file.xlsx)
#' - [_file2.xlsx](../_file2.xlsx)
#' - [_PLAN.R](../_PLAN.R)
#' - [__ADMIN_2019](../__ADMIN_2019)
#' - [__ADMIN_2019/2018MATH4939M_first.xls](../__ADMIN_2019/2018MATH4939M_first.xls)
#' - [__ADMIN_2019/DOWNLOADED_2018MATH4939M (2).xls](../__ADMIN_2019/DOWNLOADED_2018MATH4939M (2).xls)
#' - [__ADMIN_2019/MASTER_2018MATH4939M_first.xls](../__ADMIN_2019/MASTER_2018MATH4939M_first.xls)
#' - [__ADMIN_2019/MidTerm2018NATS1500M (1).xls](../__ADMIN_2019/MidTerm2018NATS1500M (1).xls)
#' - [__ADMIN_2019/New folder](../__ADMIN_2019/New folder)
#' - [__ADMIN_2019/New folder/Re  Enroll MATH4939 in Winter - 2019 Semester as Visiting Student.html](../__ADMIN_2019/New folder/Re  Enroll MATH4939 in Winter - 2019 Semester as Visiting Student.html)
#' - [__ADMIN_2019/tests_and_exams](../__ADMIN_2019/tests_and_exams)
#' - [__ADMIN_2019/tests_and_exams/math4939_exam_2019.pdf](../__ADMIN_2019/tests_and_exams/math4939_exam_2019.pdf)
#' - [__ADMIN_2019/W2019gradesletter New.docx](../__ADMIN_2019/W2019gradesletter New.docx)
#' - [__DRAFTS.R](../__DRAFTS.R)
#'     - Arrests assignment draft
#' - [__file.xlsx](../__file.xlsx)
#' - [__file2.xlsx](../__file2.xlsx)
#' - [__files](../__files)
#' - [__files/Bariatric_surgery.pdf](../__files/Bariatric_surgery.pdf)
#'     - AAAA find source: good example of effect of longitudinal study to adjust for cured dropout
#' - [__files/Baryatric_surgery_plot.pdf](../__files/Baryatric_surgery_plot.pdf)
#' - [__files/data.R.pdf](../__files/data.R.pdf)
#'     - on Baryatric surgery
#' - [__files/Evolution_of_Inference.pdf](../__files/Evolution_of_Inference.pdf)
#' - [__files/FirstDayAttendance.docx](../__files/FirstDayAttendance.docx)
#' - [__files/majors_assignment_prep](../__files/majors_assignment_prep)
#' - [__files/majors_assignment_prep/.RData](../__files/majors_assignment_prep/.RData)
#' - [__files/majors_assignment_prep/.Rhistory](../__files/majors_assignment_prep/.Rhistory)
#' - [__files/majors_assignment_prep/STAT1000_2016_Fall_Sec_A.csv](../__files/majors_assignment_prep/STAT1000_2016_Fall_Sec_A.csv)
#' - [__files/majors_assignment_prep/STAT1000_2016_Fall_Sec_B.csv](../__files/majors_assignment_prep/STAT1000_2016_Fall_Sec_B.csv)
#' - [__files/majors_assignment_prep/STAT1000_2017_Summer_Sec_A.csv](../__files/majors_assignment_prep/STAT1000_2017_Summer_Sec_A.csv)
#' - [__files/majors_assignment_prep/STAT1000_2017_Winter_Sec_A.csv](../__files/majors_assignment_prep/STAT1000_2017_Winter_Sec_A.csv)
#' - [__files/majors_assignment_prep/STAT2000_2016_Summer_Sec_A.csv](../__files/majors_assignment_prep/STAT2000_2016_Summer_Sec_A.csv)
#' - [__files/majors_assignment_prep/STAT2000_2017_Winter_Sec_A.csv](../__files/majors_assignment_prep/STAT2000_2017_Winter_Sec_A.csv)
#' - [__files/majors_assignment_prep/STAT2000_2018_Winter_Sec_A.csv](../__files/majors_assignment_prep/STAT2000_2018_Winter_Sec_A.csv)
#' - [__files/majors_assignment_prep/tran.knit.md](../__files/majors_assignment_prep/tran.knit.md)
#' - [__files/majors_assignment_prep/tran.R](../__files/majors_assignment_prep/tran.R)
#' - [__files/MATH 4939 Information.docx](../__files/MATH 4939 Information.docx)
#' - [__files/Multiple_Regression.pdf](../__files/Multiple_Regression.pdf)
#' - [__files/Multiple_Regression_with_notes.pdf](../__files/Multiple_Regression_with_notes.pdf)
#' - [__files/New Microsoft Word Document.docx](../__files/New Microsoft Word Document.docx)
#' - [__files/Simple_Regression_with_notes.pdf](../__files/Simple_Regression_with_notes.pdf)
#' - [__files/TBI (7).xlsx](../__files/TBI (7).xlsx)
#' - [__files/TBIexplore.R](../__files/TBIexplore.R)
#' - [__files/Webct2016](../__files/Webct2016)
#' - [__files/Webct2016/2016_SC_MATH_F_4330__3_A_EN_A_LECT_01_ Assignment 1.html](../__files/Webct2016/2016_SC_MATH_F_4330__3_A_EN_A_LECT_01_ Assignment 1.html)
#' - [__files/Webct2016/2016_SC_MATH_F_4330__3_A_EN_A_LECT_01_ Assignment 2.html](../__files/Webct2016/2016_SC_MATH_F_4330__3_A_EN_A_LECT_01_ Assignment 2.html)
#' - [__files/Webct2016/2016_SC_MATH_F_4330__3_A_EN_A_LECT_01_ Information about the course.html](../__files/Webct2016/2016_SC_MATH_F_4330__3_A_EN_A_LECT_01_ Information about the course.html)
#' - [__files/Webct2016/Asher 2011 Simon and Blalock technique.pdf](../__files/Webct2016/Asher 2011 Simon and Blalock technique.pdf)
#' - [__files/Webct2016/Class8.pdf](../__files/Webct2016/Class8.pdf)
#' - [__files/Webct2016/d201401-401.pdf](../__files/Webct2016/d201401-401.pdf)
#' - [__files/Webct2016/eigenvalues-and-eigenvectors.ppt](../__files/Webct2016/eigenvalues-and-eigenvectors.ppt)
#' - [__files/Webct2016/ila0601.pdf](../__files/Webct2016/ila0601.pdf)
#' - [__files/Webct2016/jordan_form.ppt](../__files/Webct2016/jordan_form.ppt)
#' - [__files/Webct2016/lec-19.ppt](../__files/Webct2016/lec-19.ppt)
#' - [__files/Webct2016/Lecture_10.pdf](../__files/Webct2016/Lecture_10.pdf)
#' - [__files/Webct2016/mle.pdf](../__files/Webct2016/mle.pdf)
#' - [__files/Webct2016/MLE_MT2004.ppt](../__files/Webct2016/MLE_MT2004.ppt)
#' - [__files/__Evolution_of_Inference_melted.pdf](../__files/__Evolution_of_Inference_melted.pdf)
#' - [__notes](../__notes)
#' - [__notes/Notes_2019_01_09.pdf](../__notes/Notes_2019_01_09.pdf)
#' - [__PLAN.pdf](../__PLAN.pdf)
#' - [__play](../__play)
#' - [__play/activity2](../__play/activity2)
#' - [__play/activity2/greene.html](../__play/activity2/greene.html)
#' - [__play/activity2/greene.R](../__play/activity2/greene.R)
#' - [__play/activity2/Greene.txt](../__play/activity2/Greene.txt)
#' - [__play/activity2/greene_stash.R](../__play/activity2/greene_stash.R)
#' - [__QUESTIONS](../__QUESTIONS)
#'     - AAAA sources of qeustions
#' - [__QUESTIONS/.Rhistory](../__QUESTIONS/.Rhistory)
#' - [__QUESTIONS/functions.R](../__QUESTIONS/functions.R)
#' - [__QUESTIONS/functions_bak.R](../__QUESTIONS/functions_bak.R)
#' - [__QUESTIONS/m4330](../__QUESTIONS/m4330)
#' - [__QUESTIONS/m4330/gen.R](../__QUESTIONS/m4330/gen.R)
#' - [__QUESTIONS/m4330/q22a.PNG](../__QUESTIONS/m4330/q22a.PNG)
#' - [__QUESTIONS/m4330/q22b.PNG](../__QUESTIONS/m4330/q22b.PNG)
#' - [__QUESTIONS/m4330/q25a.PNG](../__QUESTIONS/m4330/q25a.PNG)
#' - [__QUESTIONS/m4330/q25b.PNG](../__QUESTIONS/m4330/q25b.PNG)
#' - [__QUESTIONS/m4330/q25c.PNG](../__QUESTIONS/m4330/q25c.PNG)
#' - [__QUESTIONS/m4330/q_draft.R](../__QUESTIONS/m4330/q_draft.R)
#' - [__QUESTIONS/m4330_deferred_exam_2017.pdf](../__QUESTIONS/m4330_deferred_exam_2017.pdf)
#' - [__QUESTIONS/m4330_deferred_exam_2017.Rmd](../__QUESTIONS/m4330_deferred_exam_2017.Rmd)
#' - [__QUESTIONS/m4330_exam_2017.pdf](../__QUESTIONS/m4330_exam_2017.pdf)
#' - [__QUESTIONS/m4330_exam_2017.Rmd](../__QUESTIONS/m4330_exam_2017.Rmd)
#' - [__QUESTIONS/m4330_test.Rmd](../__QUESTIONS/m4330_test.Rmd)
#' - [__QUESTIONS/m4939](../__QUESTIONS/m4939)
#' - [__QUESTIONS/m4939/drugs.PNG](../__QUESTIONS/m4939/drugs.PNG)
#' - [__QUESTIONS/m4939/explode.PNG](../__QUESTIONS/m4939/explode.PNG)
#' - [__QUESTIONS/m4939/verbal_math.PNG](../__QUESTIONS/m4939/verbal_math.PNG)
#' - [__QUESTIONS/m4939_questions.html](../__QUESTIONS/m4939_questions.html)
#' - [__QUESTIONS/m4939_questions.pdf](../__QUESTIONS/m4939_questions.pdf)
#' - [__QUESTIONS/m4939_questions.Rmd](../__QUESTIONS/m4939_questions.Rmd)
#' - [__QUESTIONS/math4939_exam_2018_1.aux](../__QUESTIONS/math4939_exam_2018_1.aux)
#' - [__QUESTIONS/math4939_exam_2018_1.pdf](../__QUESTIONS/math4939_exam_2018_1.pdf)
#' - [__QUESTIONS/math4939_exam_2018_1.Rmd](../__QUESTIONS/math4939_exam_2018_1.Rmd)
#' - [__QUESTIONS/math4939_exam_2018_1.tex](../__QUESTIONS/math4939_exam_2018_1.tex)
#' - [__QUESTIONS/math4939_mt_2019.pdf](../__QUESTIONS/math4939_mt_2019.pdf)
#' - [__QUESTIONS/math4939_test_2018.pdf](../__QUESTIONS/math4939_test_2018.pdf)
#' - [__QUESTIONS/math4939_test_2018.Rmd](../__QUESTIONS/math4939_test_2018.Rmd)
#' - [__QUESTIONS/math4939_test_2018.tex](../__QUESTIONS/math4939_test_2018.tex)
#' - [__QUESTIONS/MATH_4330_examquestions.xlsx](../__QUESTIONS/MATH_4330_examquestions.xlsx)
#' - [__QUESTIONS/MATH_4939_questions.xlsx](../__QUESTIONS/MATH_4939_questions.xlsx)
#' - [__QUESTIONS/mystyles.sty](../__QUESTIONS/mystyles.sty)
#' - [__QUESTIONS/nats1500_test_1_2018.Rmd](../__QUESTIONS/nats1500_test_1_2018.Rmd)
#' - [__QUESTIONS/qm4330_exam_2017.Rmd](../__QUESTIONS/qm4330_exam_2017.Rmd)
#' - [__QUESTIONS/qMATH_4330_examquestions.xlsx](../__QUESTIONS/qMATH_4330_examquestions.xlsx)
#' - [__QUESTIONS/Quiz about the R programming language _ Statistik Dresden.pdf](../__QUESTIONS/Quiz about the R programming language _ Statistik Dresden.pdf)
#' - [__QUESTIONS/Sample exam 2016_06_14.pdf](../__QUESTIONS/Sample exam 2016_06_14.pdf)
#' - [__QUESTIONS/tex2pdf.1116](../__QUESTIONS/tex2pdf.1116)
#' - [__QUESTIONS/tex2pdf.13716](../__QUESTIONS/tex2pdf.13716)
#' - [__QUESTIONS/tex2pdf.3356](../__QUESTIONS/tex2pdf.3356)
#' - [__QUESTIONS/tex2pdf.4548](../__QUESTIONS/tex2pdf.4548)
#' - [__QUESTIONS/tex2pdf.7684](../__QUESTIONS/tex2pdf.7684)
#' - [__QUESTIONS/tex2pdf.8612](../__QUESTIONS/tex2pdf.8612)
#' - [__QUESTIONS/tex2pdf.9864](../__QUESTIONS/tex2pdf.9864)
#' - [__raw_sources](../__raw_sources)
#' - [__raw_sources/Agresti 2007 Categorical Data Analysis 2E Extra Exercises.pdf](../__raw_sources/Agresti 2007 Categorical Data Analysis 2E Extra Exercises.pdf)
#' - [__raw_sources/Agresti 2007 Introduction to Categorical Data Analysis 2E.pdf](../__raw_sources/Agresti 2007 Introduction to Categorical Data Analysis 2E.pdf)
#' - [__raw_sources/Evans 2009 Probability and Statistics.pdf](../__raw_sources/Evans 2009 Probability and Statistics.pdf)
#' - [__raw_sources/How can I assess group work--Teaching Excellence & Educational Innovation - Carnegie Mellon University.url](../__raw_sources/How can I assess group work--Teaching Excellence & Educational Innovation - Carnegie Mellon University.url)
#' - [__raw_sources/Presnell 2000 categorical data analysis using R.pdf](../__raw_sources/Presnell 2000 categorical data analysis using R.pdf)
#' - [__test.html](../__test.html)
#' - [__test.R](../__test.R)
#' - [__TODO.html](../__TODO.html)
#' - [__TODO.R](../__TODO.R)
#' - [___file.xlsx](../___file.xlsx)
#' - [___file2.xlsx](../___file2.xlsx)
#' - [](../)
#' - [](../)
#' - [../../R](../../../R)
#' - [../../R_files/files](../../../R_files/files)
#' - [../../R_files/files/Match.html](../../../R_files/files/Match.html)
#' - [../../R_files/From WWW](../../../R_files/From WWW)
#' - [../../R_files/From WWW/R](../../../R_files/From WWW/R)
#' - [../../R_files/From WWW/R/BeyondRepeated-2007-02-22-FittingModels.R](../../../R_files/From WWW/R/BeyondRepeated-2007-02-22-FittingModels.R)
#' - [../../R_files/From WWW/R/coursefun.R](../../../R_files/From WWW/R/coursefun.R)
#' - [../../R_files/From WWW/R/coursefunBK.R](../../../R_files/From WWW/R/coursefunBK.R)
#' - [../../R_files/From WWW/R/coursefunBK2.R](../../../R_files/From WWW/R/coursefunBK2.R)
#' - [../../R_files/From WWW/R/coursefunBK3.R](../../../R_files/From WWW/R/coursefunBK3.R)
#' - [../../R_files/From WWW/R/fun-20080630.R](../../../R_files/From WWW/R/fun-20080630.R)
#' - [../../R_files/From WWW/R/fun-bak20080808.R](../../../R_files/From WWW/R/fun-bak20080808.R)
#' - [../../R_files/From WWW/R/fun-last.R](../../../R_files/From WWW/R/fun-last.R)
#' - [../../R_files/From WWW/R/fun-new.R](../../../R_files/From WWW/R/fun-new.R)
#' - [../../R_files/From WWW/R/fun-R.html](../../../R_files/From WWW/R/fun-R.html)
#' - [../../R_files/From WWW/R/fun.R](../../../R_files/From WWW/R/fun.R)
#' - [../../R_files/From WWW/R/fun061109.R](../../../R_files/From WWW/R/fun061109.R)
#' - [../../R_files/From WWW/R/fun090621.R](../../../R_files/From WWW/R/fun090621.R)
#' - [../../R_files/From WWW/R/funRDC.R](../../../R_files/From WWW/R/funRDC.R)
#' - [../../R_files/From WWW/R/funVlast.R](../../../R_files/From WWW/R/funVlast.R)
#' - [../../R_files/From WWW/R/fun_0.1.zip](../../../R_files/From WWW/R/fun_0.1.zip)
#' - [../../R_files/From WWW/R/gm_1.0.zip](../../../R_files/From WWW/R/gm_1.0.zip)
#' - [../../R_files/From WWW/R/index.html](../../../R_files/From WWW/R/index.html)
#' - [../../R_files/From WWW/R/MGT1382-R.html](../../../R_files/From WWW/R/MGT1382-R.html)
#' - [../../R_files/From WWW/R/MGT1382.R](../../../R_files/From WWW/R/MGT1382.R)
#' - [../../R_files/From WWW/R/MultilevelModelsinR.R](../../../R_files/From WWW/R/MultilevelModelsinR.R)
#' - [../../R_files/From WWW/R/MultipleRegressionAndDiagnostics.R](../../../R_files/From WWW/R/MultipleRegressionAndDiagnostics.R)
#' - [../../R_files/From WWW/R/MultivariateNormalContours.R](../../../R_files/From WWW/R/MultivariateNormalContours.R)
#' - [../../R_files/From WWW/R/p3d.tar.gz](../../../R_files/From WWW/R/p3d.tar.gz)
#' - [../../R_files/From WWW/R/p3d.zip](../../../R_files/From WWW/R/p3d.zip)
#' - [../../R_files/From WWW/R/p3d_0.01.tar.gz](../../../R_files/From WWW/R/p3d_0.01.tar.gz)
#' - [../../R_files/From WWW/R/p3d_0.01.zip](../../../R_files/From WWW/R/p3d_0.01.zip)
#' - [../../R_files/From WWW/R/PACKAGES](../../../R_files/From WWW/R/PACKAGES)
#' - [../../R_files/From WWW/R/Plot3D (1).R](../../../R_files/From WWW/R/Plot3D (1).R)
#' - [../../R_files/From WWW/R/Plot3D-last (2).R](../../../R_files/From WWW/R/Plot3D-last (2).R)
#' - [../../R_files/From WWW/R/Plot3d-last.R](../../../R_files/From WWW/R/Plot3d-last.R)
#' - [../../R_files/From WWW/R/Plot3d.R](../../../R_files/From WWW/R/Plot3d.R)
#' - [../../R_files/From WWW/R/R-Commands.html](../../../R_files/From WWW/R/R-Commands.html)
#' - [../../R_files/From WWW/R/R-fun.html](../../../R_files/From WWW/R/R-fun.html)
#' - [../../R_files/From WWW/R/R-Graphics.ppt](../../../R_files/From WWW/R/R-Graphics.ppt)
#' - [../../R_files/From WWW/R/R-Graphics.R](../../../R_files/From WWW/R/R-Graphics.R)
#' - [../../R_files/From WWW/R/sorttable2.js](../../../R_files/From WWW/R/sorttable2.js)
#' - [../../R_files/From WWW/R/spida.tar.gz](../../../R_files/From WWW/R/spida.tar.gz)
#' - [../../R_files/From WWW/R/spida.zip](../../../R_files/From WWW/R/spida.zip)
#' - [../../R_files/From WWW/R/spida_0.1.tar.gz](../../../R_files/From WWW/R/spida_0.1.tar.gz)
#' - [../../R_files/From WWW/R/spida_0.1.zip](../../../R_files/From WWW/R/spida_0.1.zip)
#' - [../../R_files/From WWW/R/src](../../../R_files/From WWW/R/src)
#' - [../../R_files/From WWW/R/src/contrib](../../../R_files/From WWW/R/src/contrib)
#' - [../../R_files/From WWW/R/src/contrib/gm_1.0.tar.gz](../../../R_files/From WWW/R/src/contrib/gm_1.0.tar.gz)
#' - [../../R_files/From WWW/R/src/contrib/PACKAGES](../../../R_files/From WWW/R/src/contrib/PACKAGES)
#' - [../../R_files/From WWW/R/test.R](../../../R_files/From WWW/R/test.R)
#' - [../../R_files/From WWW/R/VisualizingMultipleRegressionPart1.R](../../../R_files/From WWW/R/VisualizingMultipleRegressionPart1.R)
#' - [../../R_files/From WWW/R/VisualizingMultipleRegressionPart2.R](../../../R_files/From WWW/R/VisualizingMultipleRegressionPart2.R)
#' - [../../R_files/From WWW/R/VisualizingMultipleRegressionPart3.R](../../../R_files/From WWW/R/VisualizingMultipleRegressionPart3.R)
#' - [../../R_files/From WWW/S_Tutorial_1993](../../../R_files/From WWW/S_Tutorial_1993)
#' - [../../R_files/From WWW/S_Tutorial_1993/.S](../../../R_files/From WWW/S_Tutorial_1993/.S)
#' - [../../R_files/From WWW/S_Tutorial_1993/.S/.Last.value](../../../R_files/From WWW/S_Tutorial_1993/.S/.Last.value)
#' - [../../R_files/From WWW/S_Tutorial_1993/.S/z](../../../R_files/From WWW/S_Tutorial_1993/.S/z)
#' - [../../R_files/From WWW/S_Tutorial_1993/98outline.html](../../../R_files/From WWW/S_Tutorial_1993/98outline.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/dirty.txt](../../../R_files/From WWW/S_Tutorial_1993/dirty.txt)
#' - [../../R_files/From WWW/S_Tutorial_1993/home.html](../../../R_files/From WWW/S_Tutorial_1993/home.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/sedinfo.txt](../../../R_files/From WWW/S_Tutorial_1993/sedinfo.txt)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial](../../../R_files/From WWW/S_Tutorial_1993/Tutorial)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/contents.html](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/contents.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/intro.html](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/intro.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/isas.html](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/isas.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/parameters.html](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/parameters.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/part1.html](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/part1.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/part10.html](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/part10.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/part11.html](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/part11.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/part12.html](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/part12.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/part2.html](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/part2.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/part3.html](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/part3.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/part4.html](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/part4.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/part5.html](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/part5.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/part6.html](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/part6.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/part7.html](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/part7.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/part8.html](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/part8.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/part9.html](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/part9.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/solutions1.html](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/solutions1.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/solutions2.html](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/solutions2.html)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/zbar1.gif](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/zbar1.gif)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/zbox1.gif](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/zbox1.gif)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/zdens1.gif](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/zdens1.gif)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/zdot1.gif](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/zdot1.gif)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/zfaces1.gif](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/zfaces1.gif)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/zhist1.gif](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/zhist1.gif)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/zhist2.gif](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/zhist2.gif)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/zlm1.gif](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/zlm1.gif)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/zpie1.gif](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/zpie1.gif)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/zplot1.gif](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/zplot1.gif)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/zplot2.gif](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/zplot2.gif)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/zplot3.gif](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/zplot3.gif)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/zplot4.gif](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/zplot4.gif)
#' - [../../R_files/From WWW/S_Tutorial_1993/Tutorial/zstars1.gif](../../../R_files/From WWW/S_Tutorial_1993/Tutorial/zstars1.gif)
#' - [../../R_files/From WWW/S_Tutorial_1993/viinfo.txt](../../../R_files/From WWW/S_Tutorial_1993/viinfo.txt)
#' - [../../R_files/Participants](../../../R_files/Participants)
#' - [../../R_files/Participants/ISR Registered Participants from Betty Tai Sept 19.xls](../../../R_files/Participants/ISR Registered Participants from Betty Tai Sept 19.xls)
#' - [../../R_files/Participants/List of Participants_Sept19.xls](../../../R_files/Participants/List of Participants_Sept19.xls)
#' - [../../R_files/Participants/SCS Fall 2011 R Course Combined List of Participants.xls](../../../R_files/Participants/SCS Fall 2011 R Course Combined List of Participants.xls)
#' - [../../R_files/Participants/Students.xlsx](../../../R_files/Participants/Students.xlsx)
#' - [../../R_files/Rnotes.html](../../../R_files/Rnotes.html)
#' - [../../R_files/R_CSI_2013.docx](../../../R_files/R_CSI_2013.docx)
#' - [../../R_files/Scripts](../../../R_files/Scripts)
#' - [../../R_files/Scripts/.RData](../../../R_files/Scripts/.RData)
#' - [../../R_files/Scripts/1_Installing_Packages.R](../../../R_files/Scripts/1_Installing_Packages.R)
#' - [../../R_files/Scripts/2_Short_tour.R](../../../R_files/Scripts/2_Short_tour.R)
#' - [../../R_files/Scripts/3_Language.docx](../../../R_files/Scripts/3_Language.docx)
#' - [../../R_files/Scripts/3_Language.pdf](../../../R_files/Scripts/3_Language.pdf)
#' - [../../R_files/Scripts/3_Language.R](../../../R_files/Scripts/3_Language.R)
#' - [../../R_files/Scripts/4_Linear_Model_Example.docx](../../../R_files/Scripts/4_Linear_Model_Example.docx)
#' - [../../R_files/Scripts/4_Linear_Model_Example.pdf](../../../R_files/Scripts/4_Linear_Model_Example.pdf)
#' - [../../R_files/Scripts/4_Linear_Model_Example.R](../../../R_files/Scripts/4_Linear_Model_Example.R)
#' - [../../R_files/Scripts/4_Linear_Model_Examplepedit.R](../../../R_files/Scripts/4_Linear_Model_Examplepedit.R)
#' - [../../R_files/Scripts/4_Linear_Model_Examplepedit_2.R](../../../R_files/Scripts/4_Linear_Model_Examplepedit_2.R)
#' - [../../R_files/Scripts/4_Linear_Model_Examplepedit_OnGray.R](../../../R_files/Scripts/4_Linear_Model_Examplepedit_OnGray.R)
#' - [../../R_files/Scripts/A Tour of Linear Models in R.R](../../../R_files/Scripts/A Tour of Linear Models in R.R)
#' - [../../R_files/Scripts/A Tour of Linear Models in Rvgray.R](../../../R_files/Scripts/A Tour of Linear Models in Rvgray.R)
#' - [../../R_files/Scripts/Day_3](../../../R_files/Scripts/Day_3)
#' - [../../R_files/Scripts/Day_3/.RData](../../../R_files/Scripts/Day_3/.RData)
#' - [../../R_files/Scripts/Day_3/.Rhistory](../../../R_files/Scripts/Day_3/.Rhistory)
#' - [../../R_files/Scripts/Day_3/data.R](../../../R_files/Scripts/Day_3/data.R)
#' - [../../R_files/Scripts/Day_3/data0.R](../../../R_files/Scripts/Day_3/data0.R)
#' - [../../R_files/Scripts/Day_3/data1.R](../../../R_files/Scripts/Day_3/data1.R)
#' - [../../R_files/Scripts/Day_3/Debugging.R](../../../R_files/Scripts/Day_3/Debugging.R)
#' - [../../R_files/Scripts/Day_3/Ellipse_Geometry.R](../../../R_files/Scripts/Day_3/Ellipse_Geometry.R)
#' - [../../R_files/Scripts/Day_3/graphics.R](../../../R_files/Scripts/Day_3/graphics.R)
#' - [../../R_files/Scripts/Day_3/Graphics_GM.R](../../../R_files/Scripts/Day_3/Graphics_GM.R)
#' - [../../R_files/Scripts/Day_3/Graphics_JF.R](../../../R_files/Scripts/Day_3/Graphics_JF.R)
#' - [../../R_files/Scripts/Day_3/Programming.R](../../../R_files/Scripts/Day_3/Programming.R)
#' - [../../R_files/Scripts/Day_3/R-exts.pdf](../../../R_files/Scripts/Day_3/R-exts.pdf)
#' - [../../R_files/Scripts/Day_3/Visualizing Multiple Regression.R](../../../R_files/Scripts/Day_3/Visualizing Multiple Regression.R)
#' - [../../R_files/Scripts/Day_3_www](../../../R_files/Scripts/Day_3_www)
#' - [../../R_files/Scripts/Day_3_www/p3d.beta.zip](../../../R_files/Scripts/Day_3_www/p3d.beta.zip)
#' - [../../R_files/Scripts/Day_3_www/Programming.R](../../../R_files/Scripts/Day_3_www/Programming.R)
#' - [../../R_files/Scripts/Day_3_www/Simple_Data_Entry.R](../../../R_files/Scripts/Day_3_www/Simple_Data_Entry.R)
#' - [../../R_files/Scripts/Day_3_www/spida.beta.zip](../../../R_files/Scripts/Day_3_www/spida.beta.zip)
#' - [../../R_files/Scripts/Day_3_www/Tour_of_Graphic_in_R.R](../../../R_files/Scripts/Day_3_www/Tour_of_Graphic_in_R.R)
#' - [../../R_files/Scripts/Day_3_www/Tour_of_Graphic_in_Rv2.R](../../../R_files/Scripts/Day_3_www/Tour_of_Graphic_in_Rv2.R)
#' - [../../R_files/Scripts/Duncan.csv](../../../R_files/Scripts/Duncan.csv)
#' - [../../R_files/Scripts/fox_1.R](../../../R_files/Scripts/fox_1.R)
#' - [../../R_files/Scripts/fox_2.R](../../../R_files/Scripts/fox_2.R)
#' - [../../R_files/Scripts/fox_3.R](../../../R_files/Scripts/fox_3.R)
#' - [../../R_files/Scripts/fox_4-5.R](../../../R_files/Scripts/fox_4-5.R)
#' - [../../R_files/Scripts/fox_4_5.R](../../../R_files/Scripts/fox_4_5.R)
#' - [../../R_files/Scripts/fox_7.R](../../../R_files/Scripts/fox_7.R)
#' - [../../R_files/Scripts/fox_8.R](../../../R_files/Scripts/fox_8.R)
#' - [../../R_files/Scripts/Introduction to R.docx](../../../R_files/Scripts/Introduction to R.docx)
#' - [../../R_files/Scripts/Introduction to R.pdf](../../../R_files/Scripts/Introduction to R.pdf)
#' - [../../R_files/Scripts/Notes.docx](../../../R_files/Scripts/Notes.docx)
#' - [../../R_files/Scripts/p3d.beta.zip](../../../R_files/Scripts/p3d.beta.zip)
#' - [../../R_files/Scripts/Prestige.additive.pdf](../../../R_files/Scripts/Prestige.additive.pdf)
#' - [../../R_files/Scripts/prestige.additive.png](../../../R_files/Scripts/prestige.additive.png)
#' - [../../R_files/Scripts/Prestige.interaction.pdf](../../../R_files/Scripts/Prestige.interaction.pdf)
#' - [../../R_files/Scripts/Prestige.interaction.png](../../../R_files/Scripts/Prestige.interaction.png)
#' - [../../R_files/Scripts/Rplot.pdf](../../../R_files/Scripts/Rplot.pdf)
#' - [../../R_files/Scripts/spida.beta.zip](../../../R_files/Scripts/spida.beta.zip)
#' - [](../)
#' - [../../_Lectures/](../../../_Lectures/)
#' - [../../_Lectures/.RData](../../../_Lectures/.RData)
#' - [../../_Lectures/.Rhistory](../../../_Lectures/.Rhistory)
#' - [../../_Lectures/den](../../../_Lectures/den)
#' - [../../_Lectures/den/shinyjs_test.R](../../../_Lectures/den/shinyjs_test.R)
#' - [../../_Lectures/den/shinyjs_test.Rmd](../../../_Lectures/den/shinyjs_test.Rmd)
#' - [../../_Lectures/den/slide_test.Rmd](../../../_Lectures/den/slide_test.Rmd)
#' - [../../_Lectures/Law_of_large_numbers](../../../_Lectures/Law_of_large_numbers)
#' - [../../_Lectures/Law_of_large_numbers/LLN_CLT.Rmd](../../../_Lectures/Law_of_large_numbers/LLN_CLT.Rmd)
#'     - AAAA should deploy to shimy server
#' - [../../_Lectures/Likelihood](../../../_Lectures/Likelihood)
#' - [../../_Lectures/Likelihood/.Rhistory](../../../_Lectures/Likelihood/.Rhistory)
#' - [../../_Lectures/Likelihood/Likelihood.Rmd](../../../_Lectures/Likelihood/Likelihood.Rmd)
#' - [../../_Lectures/shiny_wegGL_tests](../../../_Lectures/shiny_wegGL_tests)
#' - [../../_Lectures/shiny_wegGL_tests/webGL_test.Rmd](../../../_Lectures/shiny_wegGL_tests/webGL_test.Rmd)
#' - [../../_Lectures/test99](../../../_Lectures/test99)
#' - [../../_Lectures/test99/app.R](../../../_Lectures/test99/app.R)
#' - [../../_Lectures/test99/app2.R](../../../_Lectures/test99/app2.R)
#' - [../../_Lectures/test99/misc.Rmd](../../../_Lectures/test99/misc.Rmd)
#' - [../../_Lectures/test99/rgl-test.Rmd](../../../_Lectures/test99/rgl-test.Rmd)
#' 
#'     - BE SURE TO INCLUDE:
#'         - Lots of linear hypotheses (see 'Output' above)
#' - DO
#' - 3 major things:
#'     - Give Arrests assignment early because little manipulation
#'     - Regular expression 
#'     - Multilevel (tolong towide) merge up 
#'         - concepts: group invariant
#'     - Exercises:
#'         - Classlists
#' - Exercise ideas:
#'     - generate 1000 rows daf wih a variable Treat with 
#'       two value 500 controls, 500 treated.
#'     - suppose the outcome has two values , 0 or 1, further details up to you
#'       unrelated to treatment
#'     - Generate 1000 outcome vectors.
#'     - Test whether each one is significantly related to Treatment.
#'     - What proportion do you expect
#'     - 2. consider a fully crossed design with three dichotomous
#'          predictors and one dichotomous independent outcome 
#'          variables. Find the best fitting model. What is the
#'          p-value for the overall test. What is the p-value for
#'          the most significant term among those whose testing
#'          satisfies the principle of marginality.
#'      - Redo both of the above with split-half.
#'         
#' - R topics to add:
#'     - ++++ regex
#'     - multilevel
#'     - AIM: Question: Ask questions about class lists
#'     - Exercise soon: Arrests
#'     - ++ create small package on github
#'     - Contribute to Github
#'     - Upload to blackwell
#'     - R and RStudio using John's material
#'         - Install spida2, p3d
#'         - Create a course project - suggest MATH4939
#'     - Get Github userid: publish it in personal LOG (FIND A NAME) [MAKE FOLDER] refer to Jenny's material
#'     - ME: Add as developers to m4939
#'     - Install git per Jenny: DO NOT USE Github git
#'     - Setup RStudio Terminal to use git bash
#'     - Setup SSH RSA key from RStudio
#'     - ME: install m4939 with sample function (make sure to include author field)
#'     - clone m4939 package in directory NOT IN MATH4939 project
#'     - ...
#'     - add documented functions to m4939
#'     - ME: add users on blackwell and subdirectories in html
#'     - Use SSH key to link to blackwell
#'     - Learn how to scp to blackwell
#' - add stuff on reproducible analyses in Day 1
#' 
#' 
#' 
#' IDEAS:
#' 
#' - don't forget to use 
#'     - Ian Greene's and 
#'     - hs
#'     - Titanic
#'     - Arrests data set
#'   for hierarchical manipulation and answering real questions: 
#'     - prepare answers with markdown script, use R (want to be
#'       able to scale up to bigger answers). no manual intervention
#' - emphasize answers to real questions
#' - Build on what I have: e.g. Advanced_R_Notes_Extras
#' 
#' EXER: 
#'   - what't the difference between 
#'   - factor(c(1,10,2)) and factor(as.character(c(1,10,2)))
#'   - why? Consider having a look at the 'factor' function.
#'   
#' 

#' 
#' ## Week 1 
#' 
#' ## Week 2 
#' 
#' ## Week 3 
#' 
#' ## Week 4 
#' 
#' ## Week 5 
#' 
#' ## Week 6 
#' 
#' ## Week 7 
#' 
#' ## Week 8 
#' 
#' ## Week 9 
#' 
#' ## Week 10
#' 
#' ## Week 11
#' 
#' ## Week 12
#' 
#' 
#' 
#' ## Day 2
#' 
#' ## Day 3
#' 
#' ## Day 4
#' 
#' ## Day 5
#' 
#' ## Day 6
#' 
#' ## Day 7
#' 
#' ## Day 8
#' 
#' ## Day 9
#' 
#' ## Day 10
#' 
#' ## Day 11
#' 
#' ## Day 12
#' 
#' ## Day 13
#' 
#' ## Day 14
#' 
#' ## Day 15
#' 
#' ## Day 16
#' 
#' ## Day 17
#' 
#' ## Day 18
#' 
#' ## Day 19
#' 
#' ## Day 20
#' 
#' ## Day 21
#' 
#' ## Day 22
#' 
#' ## Day 23
#' 
#' ## Day 24
#' 
#' ## Day 25
#' 
#' ## Day 26
#' 
#' ## Day 27
#' 
#' ## Day 28
#' 
#' ## Day 29
#' 
#' ## Day 30
#' 
#' ## Day 31
#' 
#' ## Day 32
#' 
#' ## Day 33
#' 
#' ## Day 34
#' 
#' ## Day 35
#' 
#' ## Day 36
#' 
#' 
#' [Video 2019-01-04 11-26-33.mp4](../../MATH4939_2019/videos/Video 2019-01-04 11-26-33.mp4)
#' 
#' [Video 2019-01-07 11-21-00.mp4](../../MATH4939_2019/videos/Video 2019-01-07 11-21-00.mp4)
#' [Video 2019-01-09 11-20-50.mp4](../../MATH4939_2019/videos/Video 2019-01-09 11-20-50.mp4)
#' [Video 2019-01-11 11-23-46.mp4](../../MATH4939_2019/videos/Video 2019-01-11 11-23-46.mp4)
#' 
#' [Video 2019-01-14 11-22-13.mp4](../../MATH4939_2019/videos/Video 2019-01-14 11-22-13.mp4)
#' [Video 2019-01-16 11-21-15.mp4](../../MATH4939_2019/videos/Video 2019-01-16 11-21-15.mp4)
#' [Video 2019-01-18 11-27-32.mp4](../../MATH4939_2019/videos/Video 2019-01-18 11-27-32.mp4)
#' 
#' 21 23 25???
#'   
#' [Video 2019-01-28 11-22-24.mp4](../../MATH4939_2019/videos/Video 2019-01-28 11-22-24.mp4)
#' [Video 2019-01-30 11-24-22.mp4](../../MATH4939_2019/videos/Video 2019-01-30 11-24-22.mp4)
#' [Video 2019-02-01 11-22-04.mp4](../../MATH4939_2019/videos/Video 2019-02-01 11-22-04.mp4)
#' 
#' [Video 2019-02-04 11-21-13.mp4](../../MATH4939_2019/videos/Video 2019-02-04 11-21-13.mp4)
#' [Video 2019-02-04 16-15-36.mp4](../../MATH4939_2019/videos/Video 2019-02-04 16-15-36.mp4)
#' [Video 2019-02-06 11-27-33.mp4](../../MATH4939_2019/videos/Video 2019-02-06 11-27-33.mp4)
#' [Video 2019-02-07 18-06-42.mp4](../../MATH4939_2019/videos/Video 2019-02-07 18-06-42.mp4)
#' 
#' [Video 2019-02-11 11-22-53.mp4](../../MATH4939_2019/videos/Video 2019-02-11 11-22-53.mp4)
#' [Video 2019-02-13 11-32-09.mp4](../../MATH4939_2019/videos/Video 2019-02-13 11-32-09.mp4)
#' 
#' [Video 2019-02-25 11-21-30.mp4](../../MATH4939_2019/videos/Video 2019-02-25 11-21-30.mp4)
#' [Video 2019-02-27 11-27-23.mp4](../../MATH4939_2019/videos/Video 2019-02-27 11-27-23.mp4)
#' 
#' [Video 2019-03-04 11-23-49.mp4](../../MATH4939_2019/videos/Video 2019-03-04 11-23-49.mp4)
#' [Video 2019-03-06 11-20-18.mp4](../../MATH4939_2019/videos/Video 2019-03-06 11-20-18.mp4)
#' [Video 2019-03-08 11-23-11.mp4](../../MATH4939_2019/videos/Video 2019-03-08 11-23-11.mp4)
#' 
#' [Video 2019-03-11 11-22-15.mp4](../../MATH4939_2019/videos/Video 2019-03-11 11-22-15.mp4)
#' [Video 2019-03-13 11-24-16.mp4](../../MATH4939_2019/videos/Video 2019-03-13 11-24-16.mp4)
#' 
#' [Video 2019-03-18 11-22-30.mp4](../../MATH4939_2019/videos/Video 2019-03-18 11-22-30.mp4)
#' [Video 2019-03-20 11-23-57.mp4](../../MATH4939_2019/videos/Video 2019-03-20 11-23-57.mp4)
#' [Video 2019-03-22 11-24-36.mp4](../../MATH4939_2019/videos/Video 2019-03-22 11-24-36.mp4)
#' 
#' [Video 2019-03-25 11-22-57.mp4](../../MATH4939_2019/videos/Video 2019-03-25 11-22-57.mp4)
#' [Video 2019-03-27 11-24-04.mp4](../../MATH4939_2019/videos/Video 2019-03-27 11-24-04.mp4)
#' [Video 2019-03-29 11-23-44.mp4](../../MATH4939_2019/videos/Video 2019-03-29 11-23-44.mp4)

#' DRAFTS.R
#' 
#' # Arrests assignment from 2014
#' 
#' === Assignment 1: Analyzing Data and Communicating Results ===
#' This is an individual assignment that should be submitted through [http://webct.math.yorku.ca/course/view.php?id=116 Moodle] by noon on September 25. 
#' 
#' The purpose of this assignment is to see how you perform and interpret a statistical analysis using the methods you already know. I would prefer for you to try to use R.  The goal is not to perform a 'correct' analysis -- which does not exist -- but to give the problem an honest effort using the concepts and methods you already know.  Avoid a merely technical analysis.  Relate your analysis to the substantive questions of interest in the problem. You can get a good grade for showing an honest and intelligent effort. 
#' 
#' Retrieve the "Arrests" data set from "library(effects)" in R. Note that you may need to first install the library with:
#' 
#'    > install.packages('effects')
#' 
#' You can get information about the variables in the data set in the usual way in R with:
#' 
#'    > ?Arrests
#' 
#' In 2002 the Toronto Star published some articles claiming that an analysis of arrests for marijuana possession in Toronto reveals a clear pattern of racial discrimination in police behaviour. In part, the rate at which suspects arrested for marijuana possession are released with a summons instead of being incarcerated is much lower among blacks than among whites. 
#' 
#' You have been hired, in late 2003, by lawyers representing the Toronto Police Association to study a data set compiled in 2003. You have been asked to produce an independent opinion. Your opinion may agree, disagree or otherwise qualify the claim that there is a pattern of racial discrimination. 
#' 
#' :1: Write a report for the lawyers who hired you. The main report should include relevant graphs and explanations -- preferably an html file created with R Markdown.  Also submit a separate file with the details of your analysis. '''Remember that lawyers don't simply want to hear arguments that favour their case. On the contrary. They want to be the ones to make their case -- that is not your job. They want you to give them an objective view of the evidence so they can prepare their case with a full knowledge of the strengths and weaknesses of all sides.
#' 
#' :2: Write a letter to the editor to the Star that expresses the gist of your finding in a way that is both correct and appropriate as a letter to the editor.
#' 
#' Note that the assignment will consist of three files: 
#' # The report for the lawyers -- make it look professional.
#' # The background analysis -- this can be annotated R output prepared with R Markdown.
#' # The letter to the editor -- have a look at the Star if you need to see what a letter to the editor looks like.
#' All three files can be html files prepared with R Markdown.
#' #'
#' #' 
#' #'
library(DT)
DT::datatable(iris)
#'
zd <- scan(sep = '\n', what = list(a='a',b='a', c = 'a'),
           blank.lines.skip = T, multi.line = T,
text = "
some topic
http://example.com
comments

some other topic
blackwell.math.yorku.ca/MATH4939
MATH 4939
")
zd <- as.data.frame(zd)
link <- function(site,name=site) {
  paste0("<a href='http://",site,"' target='_blank'>",name,"</a>")
}
 zd$link <- link(zd$b,zd$c)
DT::datatable(zd, escape = FALSE)


