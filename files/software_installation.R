#' ---
#' title: "Installing R and RStudio"
#' subtitle: "MATH 4939"
#' date: ""
#' author: "Georges Monette"
#' output:
#'   html_document:
#'     toc: false
#'     toc_float: true
#'     theme: readable
#' link-citations: yes
#' ---
#' (Updated: `r format(Sys.time(), '%B %d %Y %H:%M')`)
#' 
#' Please install the following:
#'   
#' @. __The current version of R:__ Even if you have used R previously, 
#'    you should install the current version from the 
#'    [Comprehensive R Archive Network](https://cran.r-project.org/) (CRAN).<br>
#'    If you are asked to select a [CRAN mirror](https://cran.r-project.org/mirrors.html), 
#'    I suggest that you choose the
#'    [0-Cloud](https://cloud.r-project.org/) mirror which is first in the list.
#'     - __Windows[^1] only:__ Download and install the latest version of 
#'        [Rtools](https://cran.r-project.org/bin/windows/Rtools/).
#'     - __Mac OS[^2] only:__  
#'         - Install the Apple Xcode developer tools. For macOS 10.7 (Lion) or higher, you
#'           can install Xcode for free from the App Store. For earlier versions of macOS,
#'           Xcode can be installed from your system DVD or downloaded from the Apple
#'           developer website. 
#'         - Some R software (e.g., the rgl package for constructing dynamic 3D
#'           graphs) uses the the standard Unix X11 windowing system instead of the native
#'           Mac windowing system.
#'             1. Download the disk image (dmg) file for XQuartz (X11 softward for macOS) from the XQuartz website.
#'             2. When you open this file by double-clicking on it, you'll find XQuartz.pkg; 
#'                double-click on it to run the installer, clicking through all the defaults.
#'             3. Important: After the installer runs, you'll have to log out and back on to your 
#'                MacOS account -- or simply reboot your Mac.
#' @. __RStudio:__ Install the free desktop version of 
#'    [RStudio](https://www.rstudio.com/products/rstudio/download/).
#'    - Scroll towards the bottom of the page and right-click on the appropriate installer for
#'      your operating system. Download it and then run the downloaded file.
#'    When you first run RStudio, it will use the last version of R that you installed. 
#' @. __Create a RStudio project for MATH4939:__
#'      - Start RStudio by clicking on the desktop icon.    
#'      - From the RStudio menus, select _File > New Project_. 
#'      - In the _Create Project_ screen that appears, select _New Directory_.
#'      - In the _Project Type_ screen, select _New Project_. 
#'      - In the _Create New Project_ screen, in the _Directory name_ box, type __MATH4939__. 
#'        Then click on the _Create Project_ button at the lower right.
#' @. __Packages for this course:__ We will install many additional packages during the course. To get started, 
#'    install basic packages by typing (or cutting and pasting) the following commands into the _Console_ window in RStudio:
#' <pre>
#' install.packages(c("car", "devtools", "effects", "ggplot2", "Hmisc"))
#' install.packages(c("knitr", "magrittr", "rgl", "rio", "rmarkdown", "readxl))
#' install.packages("latticeExtra")
#' install.packages("gplot")
#' install.packages('cv')
#' devtools::install_github('gmonette/spida2')
#' devtools::install_github('gmonette/p3d')
#' </pre>
#' @. __Check that things are working:__ Open [this script](markdown_sample.R) and cut and paste it into a new R script
#'    in R Studio. 
#'       - Run it manually line by line. Experiment with the code.  
#'       - **After running it line by line** run it as a Rmarkdown file by hitting: Ctrl-Shift-K. This should show you
#'         the output of the script in an HTML window.  If not, click on the new html file in your "Files" pane in RStudio.
#' @. __Post a message to Piazza:__ After connecting with Piazza, you can post a message
#'    to say whether you were successful.  If you ran into problems post a 
#'    message explaining what seems 
#'    to have gone wrong
#'    and we will all try to help. Use the folder 'assn1' for this message. 
#' 
#' [^1]: If you are using Windows and you are not sure whether you have a 64-bit or a 32-bit version you should first visit https://support.microsoft.com/en-us/help/15056/windows-7-32-64-bit-faq to find out.
#' 
#' [^2]: I thank John Fox for creating these detailed instructions for macOS.