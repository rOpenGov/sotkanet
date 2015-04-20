# Package release instructions: http://r-pkgs.had.co.nz/release.html

# Documentation, Build and Check
library(devtools)
document("../../")
#build("../../")
#check("../../")
# run_examples()
# test() # Run tests

# Submissions:
# build_win("../../") # Windows check
# release() # Submit to CRAN
# submit_cran() # Submit to CRAN without all release() questions

# Utilities:
#
# revdep_check("../../")
# add_rstudio_project("../../")
# use_build_ignore("../NEWS.md", pkg = "../../") # NEWS.md not supported by CRAN
# use_package("dplyr") # add package to imports
# load_all(".") # Reload the package

# Vignettes:
#
# library(knitr)
# knit("../../vignettes/sotkanet_tutorial.Rmd", "../../vignettes/sotkanet_tutorial.md")



