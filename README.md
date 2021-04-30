sotkanet: Tools for accessing open data on welfare and health in Finland
========================================================================

<!-- badges: start -->

[![R build
status](https://github.com/rOpenGov/sotkanet/workflows/R-CMD-check/badge.svg)](https://github.com/rOpenGov/sotkanet/actions)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/sotkanet)](https://cran.r-project.org/package=sotkanet)
[![codecov.io](https://codecov.io/github/rOpenGov/sotkanet/coverage.svg?branch=master)](https://codecov.io/github/rOpenGov/sotkanet?branch=master)
[![Downloads](http://cranlogs.r-pkg.org/badges/grand-total/sotkanet)](https://cran.r-project.org/package=sotkanet)
<!-- badges: end -->

<!-- README.md is generated from README.Rmd. Please edit that file -->

R package to access and manipulate data from the Sotkanet demographics
indicator database. The [Sotkanet data
portal](https://sotkanet.fi/sotkanet/fi/index) provides over 2000
demographic indicators across Finland and Europe, and is maintained by
the [National Institute for Health and Welfare
(THL)](https://thl.fi/fi/). For more information, see [data
description](https://sotkanet.fi/sotkanet/en/data).

### Installation

    install.packages("sotkanet")

### Simple example

List available indicators in the Sotkanet data portal:

    library(sotkanet) 
    sotkanet.indicators <- SotkanetIndicators()

For further usage instructions, check the [tutorial
page](http://ropengov.github.io/sotkanet/articles/tutorial.html).

### Meta

The package authors are listed in the [DESCRIPTION file](DESCRIPTION).
Part of [rOpenGov](http://ropengov.org/).

-   Please [report any issues or
    bugs](https://github.com/ropengov/sotkanet/issues).
-   License: BSD-2-clause
-   Get citation information in R with `citation('sotkanet')`
-   [Contact](http://ropengov.org/community/)
-   [Pull requests](https://github.com/ropengov/sotkanet/)
