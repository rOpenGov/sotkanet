#/usr/local/bin/R CMD BATCH document.R
~/bin/R-4.3.2/bin/R CMD build ../../ 
~/bin/R-4.3.2/bin/R CMD check --as-cran sotkanet_0.10.1.tar.gz
~/bin/R-4.3.2/bin/R CMD INSTALL sotkanet_0.10.1.tar.gz
