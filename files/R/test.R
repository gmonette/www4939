#' ---
#' title: 'CAR: Chapter 1'
#' author:  ''
#' date:    ''
#' fontsize:	12pt
#' header-includes:
#' - \usepackage{amsmath}
#' - \usepackage{geometry}
#' - \geometry{papersize={6in,4in},left=.2in,right=.2in,top=.1in,bottom=.1in}
#' - \usepackage{fancyhdr}
#' - \pagestyle{fancy}
#' - \fancyhead{}
#' - \fancyfoot[R]{\thepage}
#' - \newcommand{\var}{\mathrm{Var}}
#' output:
#'   pdf_document:
#'     toc: true
#'   html_document:
#'     toc: true
#'     toc_float: true
#'     theme: readable
#'     highlight: tango
#'     fig.width: 5
#'     fig.height: 3.5
#' ---
#' 
#'     df_print: kable
#'     includes:
#'       in_header: slides.tex
#+ knitting, include=FALSE
# defaults if knitting
options(width=70)
knitr::opts_chunk$set(comment="", error = TRUE, fig.width = 6, fig.height = 3.5)
# Note: the 'error = TRUE' options allows errors to occur without stopping the script
if(.Platform$OS.type == 'windows') windowsFonts(Arial=windowsFont("TT Arial"))
#+ 
#' This version dated: `r format(Sys.time(), '%B %d %Y %H:%M')`
#' 
#' # Head 1
#' 
mtcars
#' \newpage
#' 
#' # Head 2
#' 
mtcars

