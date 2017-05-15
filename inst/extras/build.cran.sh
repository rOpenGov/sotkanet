# /home/lei/bin/R CMD BATCH document.R
/home/lei/bin/R CMD build ../../ --no-build-vignettes
/home/lei/bin/R CMD check --as-cran sotkanet_0.9.49.tar.gz
/home/lei/bin/R CMD INSTALL sotkanet_0.9.49.tar.gz
