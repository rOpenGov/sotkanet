---
output: github_document
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



sotkanet
=====

[![Build Status](https://api.travis-ci.org/rOpenGov/sotkanet.png)](https://travis-ci.org/rOpenGov/sotkanet)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/sotkanet)](http://cran.r-project.org/package=sotkanet)
[![Cranlogs Downloads](http://cranlogs.r-pkg.org/badges/grand-total/sotkanet)](http://cran.r-project.org/package=sotkanet)
<!--[![Stories in Ready](https://badge.waffle.io/ropengov/sotkanet.png?label=Ready)](http://waffle.io/ropengov/sotkanet)-->
<!--[SNM](http://scisoft-net-map.isri.cmu.edu/application/sotkanet)-->


This R package is designed to access and manipulate data from the
Sotkanet demographics indicator database. The [Sotkanet data
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


### Use

List available indicators in the Sotkanet data portal:


```r
library(sotkanet) 
sotkanet.indicators <- SotkanetIndicators()
```

For further usage instructions, check the [tutorial page](https://github.com/rOpenGov/sotkanet/blob/master/vignettes/tutorial.md). 


### Authors

The package authors are listed in the [DESCRIPTION file](DESCRIPTION). Part of [rOpenGov](http://ropengov.github.io/). 


You are welcome to:
  
  * [Submit feedback and bug reports](https://github.com/ropengov/sotkanet/issues)
  * [Send a pull request](https://github.com/ropengov/sotkanet/)
  * [Contact us](http://ropengov.github.io/contribute/)


