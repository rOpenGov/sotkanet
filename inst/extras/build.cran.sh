/usr/bin/R CMD BATCH document.R
/usr/bin/R CMD build ../../
/usr/bin/R CMD check --as-cran sotkanet_0.9.03.tar.gz
/usr/bin/R CMD INSTALL sotkanet_0.9.03.tar.gz
