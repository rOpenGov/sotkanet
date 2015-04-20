/usr/local/bin/R CMD BATCH document.R
/usr/local/bin/R CMD build ../../ #--no-build-vignettes
/usr/local/bin/R CMD check --as-cran sotkanet_0.9.10.tar.gz
/usr/local/bin/R CMD INSTALL sotkanet_0.9.10.tar.gz
