
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

You can install the stable release version from CRAN:

``` r
install.packages("sotkanet")
```

Alternatively, you can install the development version of sotkanet
package from GitHub with:

``` r_github
# install.packages("remotes")
remotes::install_github("rOpenGov/sotkanet")
```

### Using the package

Load the package in R:

``` r
library(sotkanet)
```

List available indicators in the Sotkanet data portal:

``` r
sotkanet.indicators <- SotkanetIndicators()
head(sotkanet.indicators$indicator.title.fi)
#> [1] "Mielenterveyden häiriöihin sairaalahoitoa saaneet 0 - 17-vuotiaat / 1 000 vastaavanikäistä"             
#> [2] "Toimeentulotukea saaneet 25 - 64-vuotiaat, % vastaavanikäisestä väestöstä"                              
#> [3] "Somaattisen erikoissairaanhoidon vuodeosastohoitopäivät 75 vuotta täyttäneillä / 1 000 vastaavanikäistä"
#> [4] "0 - 6-vuotiaat, % väestöstä"                                                                            
#> [5] "0 - 6-vuotiaat, % väestöstä, väestöennuste 2060"                                                        
#> [6] "Yhden vanhemman perheet, % lapsiperheistä"
```

Here is a simple example visualizing the use of private dental care
among 0-17 years old between 2015 and 2020.

``` r
library(ggplot2)
#> Warning in register(): Can't find generic `scale_type` in package ggplot2 to
#> register S3 method.
hammashoito <- GetDataSotkanet(indicators = 1075, years = 2015:2020, genders = "total", region.category = "MAAKUNTA")

unique(hammashoito$indicator.title.fi)
#> [1] "Yksityisen hammashuollon käynnit 0 - 17-vuotiailla / 1 000 vastaavanikäistä"

hammashoito_metadata <- SotkanetIndicatorMetadata(id = 1075)

plot_caption <- paste0("Lähde: Sotkanet \n",
                       "Data päivitetty ", hammashoito_metadata$`data-updated`)

plot <- ggplot(hammashoito,aes(x=year,y=primary.value,group=region.title.fi))+
  geom_line(aes(color=region.title.fi)) +
  geom_point(aes(color=region.title.fi))

plot + labs(title = "Yksityisen hammashuollon käynnit",
            subtitle = "0 - 17-vuotiailla / 1 000 vastaavanikäistä",
            x = "Vuosi", 
            y = "Käyntien lkm",
            caption = plot_caption,
            color = "Maakunta")
```

<img src="man/figures/README-sotkanet_example-1.png" width="100%" />

For further usage instructions, check the [tutorial
page](http://ropengov.github.io/sotkanet/articles/tutorial.html).

### Contributing

  - [Submit suggestions and bug
    reports](https://github.com/ropengov/sotkanet/issues) (provide the
    output of `sessionInfo()` and `packageVersion("sorvi")` and
    preferably provide a [reproducible
    example](http://adv-r.had.co.nz/Reproducibility.html))
  - [Send a pull request](https://github.com/ropengov/sotkanet/pulls)
  - [Star us on the Github page](https://github.com/ropengov/sotkanet/)
  - [See our website](http://ropengov.org/community/) for additional
    contact information

### Acknowledgements

**Kindly cite this work** as follows: [Leo
Lahti](https://github.com/antagomir), Einari Happonen, Juuso Parkkinen,
Joona Lehtomaki, Vesa Saaristo and Pyry Kantanen (rOpenGov 2022).
sotkanet: Sotkanet Open Data Access and Analysis. R package version
0.9.77. URL: <https://github.com/rOpenGov/sotkanet>

We are grateful to all
[contributors](https://github.com/ropengov/sotkanet/graphs/contributors),
and for the [Sotkanet](https://sotkanet.fi/sotkanet/en/index?)
Statistics and Indicator Bank\! This project is part of
[rOpenGov](http://ropengov.org).

### Disclaimer

This package is in no way officially related to or endorsed by Terveyden
ja hyvinvoinnin laitos (THL) - The Finnish Institute for Health and
Welfare.

For information about THL’s open data license and limitation of
liability, please see their website: \* In English: [THL’s open data
license and limitation of
liability](https://yhteistyotilat.fi/wiki08/display/THLKA/THL%27s+open+data+license+and+limitation+of+liability)
\* In Finnish: [THL:n avoimen datan lisenssi ja
vastuuvapauslauseke](https://yhteistyotilat.fi/wiki08/display/THLKA/THL%3An+avoimen+datan+lisenssi+ja+vastuuvapauslauseke)
