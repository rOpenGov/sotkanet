#/usr/local/bin/R CMD BATCH document.R
~/bin/R-3.5.1/bin/R CMD build ../../ 
~/bin/R-3.5.1/bin/R CMD check --as-cran sotkanet_0.9.62.tar.gz
~/bin/R-3.5.1/bin/R CMD INSTALL sotkanet_0.9.62.tar.gz
