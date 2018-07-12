<!-- README.md is generated from README.Rmd. Please edit that file -->



sotkanet
=====

[![Build Status](https://api.travis-ci.org/rOpenGov/sotkanet.png)](https://travis-ci.org/rOpenGov/sotkanet)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/sotkanet)](https://cran.r-project.org/package=sotkanet)
[![codecov.io](https://codecov.io/github/rOpenGov/sotkanet/coverage.svg?branch=master)](https://codecov.io/github/rOpenGov/sotkanet?branch=master)
[![Cranlogs Downloads](http://cranlogs.r-pkg.org/badges/grand-total/sotkanet)](https://cran.r-project.org/package=sotkanet)


R package to access and manipulate data from the Sotkanet demographics
indicator database. The [Sotkanet data
portal](http://uusi.sotkanet.fi/portal/page/portal/etusivu/hakusivu)
provides over 2000 demographic indicators across Finland and Europe,
and is maintained by the [National Institute for Health and Welfare
(THL)](http://www.thl.fi). For more information, see [Sotkanet
indicator
database](http://uusi.sotkanet.fi/portal/page/portal/etusivu/tietoa_palvelusta)
and [API
description](http://uusi.sotkanet.fi/portal/pls/portal/!PORTAL.wwpob_page.show?_docname=22001.PDF).


### Installation


```r
install.packages("sotkanet")
```


### Simple example

List available indicators in the Sotkanet data portal:


```r
library(sotkanet) 
sotkanet.indicators <- SotkanetIndicators()
```

For further usage instructions, check the [tutorial page](https://github.com/rOpenGov/sotkanet/blob/master/vignettes/tutorial.md). 


### Meta

The package authors are listed in the [DESCRIPTION file](DESCRIPTION). Part of [rOpenGov](http://ropengov.github.io/).

* Please [report any issues or bugs](https://github.com/ropengov/sotkanet/issues).
* License: BSD-2-clause
* Get citation information in R with `citation('sotkanet')`
* [Contact](http://ropengov.github.io/contribute/)
* [Pull requests](https://github.com/ropengov/sotkanet/)
