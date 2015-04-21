## Test environments
* local ubuntu 14.10, R 3.2.0
* win-builder (devel and release)

## R CMD check results
There were no ERRORs or WARNINGs. 

There were 2 NOTEs:
* checking CRAN incoming feasibility ... NOTE
Maintainer: ‘Leo Lahti <louhos@googlegroups.com>’
License components with restrictions and base license permitting such:
  BSD_2_clause + file LICENSE
  File 'LICENSE':
    YEAR: 2010-2015
      COPYRIGHT HOLDER: Leo Lahti, Einari Happonen, Juuso Parkkinen, Joona Lehtomaki
* checking package dependencies ... NOTE
  No repository set, so cyclic dependency check skipped

## Resubmission
This is a resubmission. In this version I have:

* Removed the vignettes/figure directory

* Fixed URLs in the documentation

* Improved URL download error handling to avoid unintended failures in 
  function examples and vignette

* Improved documentation

