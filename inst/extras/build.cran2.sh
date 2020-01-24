# /home/lei/bin/R CMD BATCH document.R
~/bin/R-3.6.2/bin/R CMD build ../../ --no-build-vignettes
~/bin/R-3.6.2/bin/R CMD check --as-cran sotkanet_0.9.64.tar.gz
~/bin/R-3.6.2/bin/R CMD INSTALL sotkanet_0.9.64.tar.gz
