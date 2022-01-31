
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sotkanet: Tools for accessing open data on welfare and health in Finland <a href="https://ropengov.github.io/sotkanet/"><img src="man/figures/logo.png" align="right" height="139"/></a>

<!-- badges: start -->

[![rOG-badge](https://ropengov.github.io/rogtemplate/reference/figures/ropengov-badge.svg)](http://ropengov.org/)
[![R build
status](https://github.com/rOpenGov/sotkanet/workflows/R-CMD-check/badge.svg)](https://github.com/rOpenGov/sotkanet/actions)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/sotkanet)](https://cran.r-project.org/package=sotkanet)
[![Downloads
total](http://cranlogs.r-pkg.org/badges/grand-total/sotkanet)](https://cran.r-project.org/package=sotkanet)
[![Downloads
monthly](https://cranlogs.r-pkg.org/badges/sotkanet)](https://www.r-pkg.org/pkg/sotkanet)
[![Watch on
GitHub](https://img.shields.io/github/watchers/ropengov/sotkanet.svg?style=social)](https://github.com/ropengov/sotkanet/watchers)
[![Star on
GitHub](https://img.shields.io/github/stars/ropengov/sotkanet.svg?style=social)](https://github.com/ropengov/sotkanet/stargazers)
[![Follow on
Twitter](https://img.shields.io/twitter/follow/ropengov.svg?style=social)](https://twitter.com/intent/follow?screen_name=ropengov)
[![Codecov test
coverage](https://codecov.io/gh/rOpenGov/sotkanet/branch/master/graph/badge.svg)](https://app.codecov.io/gh/rOpenGov/sotkanet?branch=master)
<!-- badges: end -->

R package to access and manipulate data from the Sotkanet demographics
indicator database. The [Sotkanet data
portal](https://sotkanet.fi/sotkanet/fi/index) provides over 2000
demographic indicators across Finland and Europe, and is maintained by
the [National Institute for Health and Welfare
(THL)](https://thl.fi/fi/). For more information, see [data
description](https://sotkanet.fi/sotkanet/en/data).

### Installation

``` r
install.packages("sotkanet")
```

### Use example

List available indicators in the Sotkanet data portal:

``` r
library(sotkanet) 
sotkanet.indicators <- SotkanetIndicators()
```

For further usage instructions, check the [tutorial
page](http://ropengov.github.io/sotkanet/articles/tutorial.html).

### Meta

The package authors are listed in the [DESCRIPTION file](DESCRIPTION).
Part of [rOpenGov](http://ropengov.org/).

  - Please [report any issues or
    bugs](https://github.com/ropengov/sotkanet/issues).
  - License: BSD-2-clause
  - Get citation information in R with `citation('sotkanet')`
  - [Contact](http://ropengov.org/community/)
  - [Pull requests](https://github.com/ropengov/sotkanet/)
