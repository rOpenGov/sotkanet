/usr/bin/R CMD BATCH document.R
/usr/bin/R CMD build ../../ #--no-build-vignettes
/usr/bin/R CMD check --as-cran sotkanet_0.9.09.tar.gz
/usr/bin/R CMD INSTALL sotkanet_0.9.09.tar.gz
