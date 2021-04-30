#/usr/local/bin/R CMD BATCH document.R
~/bin/R-4.0.4/bin/R CMD build ../../ 
~/bin/R-4.0.4/bin/R CMD check --as-cran sotkanet_0.9.75.tar.gz
~/bin/R-4.0.4/bin/R CMD INSTALL sotkanet_0.9.75.tar.gz
