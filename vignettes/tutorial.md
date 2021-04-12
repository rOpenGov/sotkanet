---
title: "Sotkanet API R tools"
author: "Leo Lahti"
date: "2021-04-12"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Sotkanet API R tools}
  %\VignetteEncoding{UTF-8}
  %\VignetteEngine{knitr::rmarkdown}
editor_options: 
  chunk_output_type: inline
---

This is the [sotkanet](https://github.com/rOpenGov/sotkanet) R package to access data from the [Sotkanet portal](https://sotkanet.fi/sotkanet/en/index) that provides over 2000 demographic indicators across Finland and Europe, maintained by the National Institute for Health and Welfare (THL). For more information, see [Information about Sotkanet](https://sotkanet.fi/sotkanet/en/tietoa-palvelusta) and [API description](https://sotkanet.fi/sotkanet/en/ohje/74). This package is part of [rOpenGov](http://ropengov.org).




### Installation

Release version


```r
install.packages("sotkanet")
```


Development version (for the adventurous ones)


```r
library(devtools)
install_github("ropengov/sotkanet")
```



### Listing available indicators

Load sotkanet and other libraries used in this vignette



List available Sotkanet indicators:


```r
sotkanet.indicators <- SotkanetIndicators(type = "table")
# kable(head(sotkanet.indicators))
```

List geographical regions with available indicators:


```r
options(width = 60)
sotkanet.regions <- SotkanetRegions(type = "table")
kable(head(sotkanet.regions))
```

<table>
 <thead>
  <tr>
   <th style="text-align:right;"> region </th>
   <th style="text-align:left;"> region.title.fi </th>
   <th style="text-align:left;"> region.code </th>
   <th style="text-align:left;"> region.category </th>
   <th style="text-align:left;"> region.uri </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 833 </td>
   <td style="text-align:left;"> Etelä-Suomen AVIn alue </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> ALUEHALLINTOVIRASTO </td>
   <td style="text-align:left;"> http://www.yso.fi/onto/kunnat/ahv1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 834 </td>
   <td style="text-align:left;"> Lounais-Suomen AVIn alue </td>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> ALUEHALLINTOVIRASTO </td>
   <td style="text-align:left;"> http://www.yso.fi/onto/kunnat/ahv2 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 835 </td>
   <td style="text-align:left;"> Itä-Suomen AVIn alue </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> ALUEHALLINTOVIRASTO </td>
   <td style="text-align:left;"> http://www.yso.fi/onto/kunnat/ahv3 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 836 </td>
   <td style="text-align:left;"> Länsi- ja Sisä-Suomen AVIn alue </td>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:left;"> ALUEHALLINTOVIRASTO </td>
   <td style="text-align:left;"> http://www.yso.fi/onto/kunnat/ahv4 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 837 </td>
   <td style="text-align:left;"> Pohjois-Suomen AVIn alue </td>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:left;"> ALUEHALLINTOVIRASTO </td>
   <td style="text-align:left;"> http://www.yso.fi/onto/kunnat/ahv5 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 838 </td>
   <td style="text-align:left;"> Lapin AVIn alue </td>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:left;"> ALUEHALLINTOVIRASTO </td>
   <td style="text-align:left;"> http://www.yso.fi/onto/kunnat/ahv6 </td>
  </tr>
</tbody>
</table>


### Querying SOTKAnet indicators

Get the indicator no. 10013 (Unemployment rate of young people aged 16-24 years) from [Sotkanet free-text search](https://sotkanet.fi/sotkanet/en/haku) from Finland (Suomi) for 1990-2012 (Eurostat employment statistics youth unemployment), and plot a graph:


```r
# Get indicator data
dat <- GetDataSotkanet(indicators = 10013, years = 1990:2012, 
       		       genders = c('female', 'male', 'total'), 
		       region.category = "EUROOPPA", regions = "Suomi")

# Investigate the first lines in the data
kable(head(dat)) %>% 
  kable_styling() %>%
  kableExtra::scroll_box(width = "100%")
```

<div style="border: 1px solid #ddd; padding: 5px; overflow-x: scroll; width:100%; "><table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> region </th>
   <th style="text-align:left;"> region.title.fi </th>
   <th style="text-align:left;"> region.code </th>
   <th style="text-align:left;"> region.category </th>
   <th style="text-align:right;"> indicator </th>
   <th style="text-align:left;"> indicator.title.fi </th>
   <th style="text-align:right;"> year </th>
   <th style="text-align:left;"> gender </th>
   <th style="text-align:right;"> primary.value </th>
   <th style="text-align:right;"> absolute.value </th>
   <th style="text-align:left;"> indicator.organization.title.fi </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 10013.727 </td>
   <td style="text-align:right;"> 1022 </td>
   <td style="text-align:left;"> Suomi </td>
   <td style="text-align:left;"> 246 </td>
   <td style="text-align:left;"> EUROOPPA </td>
   <td style="text-align:right;"> 10013 </td>
   <td style="text-align:left;"> (EU) Nuorisotyöttömyysaste </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:left;"> male </td>
   <td style="text-align:right;"> 17.1 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> Euroopan yhteisöjen tilastotoimisto (Eurostat) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 10013.728 </td>
   <td style="text-align:right;"> 1022 </td>
   <td style="text-align:left;"> Suomi </td>
   <td style="text-align:left;"> 246 </td>
   <td style="text-align:left;"> EUROOPPA </td>
   <td style="text-align:right;"> 10013 </td>
   <td style="text-align:left;"> (EU) Nuorisotyöttömyysaste </td>
   <td style="text-align:right;"> 2004 </td>
   <td style="text-align:left;"> female </td>
   <td style="text-align:right;"> 19.4 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> Euroopan yhteisöjen tilastotoimisto (Eurostat) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 10013.729 </td>
   <td style="text-align:right;"> 1022 </td>
   <td style="text-align:left;"> Suomi </td>
   <td style="text-align:left;"> 246 </td>
   <td style="text-align:left;"> EUROOPPA </td>
   <td style="text-align:right;"> 10013 </td>
   <td style="text-align:left;"> (EU) Nuorisotyöttömyysaste </td>
   <td style="text-align:right;"> 1996 </td>
   <td style="text-align:left;"> female </td>
   <td style="text-align:right;"> 31.6 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> Euroopan yhteisöjen tilastotoimisto (Eurostat) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 10013.730 </td>
   <td style="text-align:right;"> 1022 </td>
   <td style="text-align:left;"> Suomi </td>
   <td style="text-align:left;"> 246 </td>
   <td style="text-align:left;"> EUROOPPA </td>
   <td style="text-align:right;"> 10013 </td>
   <td style="text-align:left;"> (EU) Nuorisotyöttömyysaste </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:left;"> male </td>
   <td style="text-align:right;"> 20.8 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> Euroopan yhteisöjen tilastotoimisto (Eurostat) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 10013.731 </td>
   <td style="text-align:right;"> 1022 </td>
   <td style="text-align:left;"> Suomi </td>
   <td style="text-align:left;"> 246 </td>
   <td style="text-align:left;"> EUROOPPA </td>
   <td style="text-align:right;"> 10013 </td>
   <td style="text-align:left;"> (EU) Nuorisotyöttömyysaste </td>
   <td style="text-align:right;"> 2011 </td>
   <td style="text-align:left;"> female </td>
   <td style="text-align:right;"> 18.4 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> Euroopan yhteisöjen tilastotoimisto (Eurostat) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 10013.732 </td>
   <td style="text-align:right;"> 1022 </td>
   <td style="text-align:left;"> Suomi </td>
   <td style="text-align:left;"> 246 </td>
   <td style="text-align:left;"> EUROOPPA </td>
   <td style="text-align:right;"> 10013 </td>
   <td style="text-align:left;"> (EU) Nuorisotyöttömyysaste </td>
   <td style="text-align:right;"> 1997 </td>
   <td style="text-align:left;"> female </td>
   <td style="text-align:right;"> 28.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> Euroopan yhteisöjen tilastotoimisto (Eurostat) </td>
  </tr>
</tbody>
</table></div>

### Fetch all SOTKAnet indicators

This takes for a long time and is not recommended for regular
use. Save the data on your local disk for further work.


```r
# These indicators have problems with R routines:
probematic.indicators <- c(1575, 1743, 1826, 1861, 1882, 1924, 1952, 2000, 2001, 2033, 2050, 3386, 3443)

# Get data for all indicators
datlist <- list()
for (ind in setdiff(sotkanet.indicators$indicator, probematic.indicators)) {
  datlist[[as.character(ind)]] <- GetDataSotkanet(indicators = ind, 
  		years = 1990:2013, genders = c('female', 'male', 'total'))
}

# Combine tables (this may require considerable time and memory 
# for the full data set)
dat <- do.call("rbind", datlist)
```

## Visualization

Download and visualize time series:


```r
# Pick indicator name
indicator.name <- as.character(unique(dat$indicator.title.fi))
indicator.source <- as.character(unique(dat$indicator.organization.title.fi))

# Visualize
library(ggplot2)
theme_set(theme_bw(20)); 
p <- ggplot(dat, aes(x = year, y = primary.value, group = gender, color = gender)) 
p <- p + geom_line() + ggtitle(paste(indicator.name, indicator.source, sep = " / ")) 
p <- p + xlab("Year") + ylab("Value") 
p <- p + theme(title = element_text(size = 10))
p <- p + theme(axis.title.x = element_text(size = 20))
p <- p + theme(axis.title.y = element_text(size = 20))
p <- p + theme(legend.title = element_text(size = 15))
print(p)
```

<img src="figure/sotkanetDataVisu-1.png" title="plot of chunk sotkanetDataVisu" alt="plot of chunk sotkanetDataVisu" width="100%" />


Investigate the effect of municipality size on demographic
variation. Smaller municipalities show more random variation as
expected by statistical arguments:


```r
selected.inds <- c(127, 178)
dat <- GetDataSotkanet(indicators = selected.inds, 
       			years = 2011, genders = c('total'))
# Pick necessary fields and remove duplicates
datf <- dat[, c("region.title.fi", "indicator.title.fi", "primary.value")]
datf <- datf[!duplicated(datf),]
dw <- reshape(datf, idvar = "region.title.fi", 
      		    timevar = "indicator.title.fi", direction = "wide")
names(dw) <- c("Municipality", "Population", "Migration")
p <- ggplot(dw, aes(x = log10(Population), y = Migration)) +
       geom_point(size = 3)
       ggtitle("Migration vs. population size") 
#> $title
#> [1] "Migration vs. population size"
#> 
#> attr(,"class")
#> [1] "labels"
       theme(title = element_text(size = 15))
#> List of 1
#>  $ title:List of 11
#>   ..$ family       : NULL
#>   ..$ face         : NULL
#>   ..$ colour       : NULL
#>   ..$ size         : num 15
#>   ..$ hjust        : NULL
#>   ..$ vjust        : NULL
#>   ..$ angle        : NULL
#>   ..$ lineheight   : NULL
#>   ..$ margin       : NULL
#>   ..$ debug        : NULL
#>   ..$ inherit.blank: logi FALSE
#>   ..- attr(*, "class")= chr [1:2] "element_text" "element"
#>  - attr(*, "class")= chr [1:2] "theme" "gg"
#>  - attr(*, "complete")= logi FALSE
#>  - attr(*, "validate")= logi TRUE
       theme(axis.title.x = element_text(size = 20))
#> List of 1
#>  $ axis.title.x:List of 11
#>   ..$ family       : NULL
#>   ..$ face         : NULL
#>   ..$ colour       : NULL
#>   ..$ size         : num 20
#>   ..$ hjust        : NULL
#>   ..$ vjust        : NULL
#>   ..$ angle        : NULL
#>   ..$ lineheight   : NULL
#>   ..$ margin       : NULL
#>   ..$ debug        : NULL
#>   ..$ inherit.blank: logi FALSE
#>   ..- attr(*, "class")= chr [1:2] "element_text" "element"
#>  - attr(*, "class")= chr [1:2] "theme" "gg"
#>  - attr(*, "complete")= logi FALSE
#>  - attr(*, "validate")= logi TRUE
       theme(axis.title.y = element_text(size = 20))
#> List of 1
#>  $ axis.title.y:List of 11
#>   ..$ family       : NULL
#>   ..$ face         : NULL
#>   ..$ colour       : NULL
#>   ..$ size         : num 20
#>   ..$ hjust        : NULL
#>   ..$ vjust        : NULL
#>   ..$ angle        : NULL
#>   ..$ lineheight   : NULL
#>   ..$ margin       : NULL
#>   ..$ debug        : NULL
#>   ..$ inherit.blank: logi FALSE
#>   ..- attr(*, "class")= chr [1:2] "element_text" "element"
#>  - attr(*, "class")= chr [1:2] "theme" "gg"
#>  - attr(*, "complete")= logi FALSE
#>  - attr(*, "validate")= logi TRUE
       theme(legend.title = element_text(size = 15))
#> List of 1
#>  $ legend.title:List of 11
#>   ..$ family       : NULL
#>   ..$ face         : NULL
#>   ..$ colour       : NULL
#>   ..$ size         : num 15
#>   ..$ hjust        : NULL
#>   ..$ vjust        : NULL
#>   ..$ angle        : NULL
#>   ..$ lineheight   : NULL
#>   ..$ margin       : NULL
#>   ..$ debug        : NULL
#>   ..$ inherit.blank: logi FALSE
#>   ..- attr(*, "class")= chr [1:2] "element_text" "element"
#>  - attr(*, "class")= chr [1:2] "theme" "gg"
#>  - attr(*, "complete")= logi FALSE
#>  - attr(*, "validate")= logi TRUE
print(p)
```

<img src="figure/sotkanetVisu3-1.png" title="plot of chunk sotkanetVisu3" alt="plot of chunk sotkanetVisu3" width="100%" />

## Further examples

For further usage examples, see
[rOpenGov-blog](http://ropengov.org), and
[takomo](https://github.com/louhos/takomo/tree/master/Sotkanet), and 
[Helsinki Region Infoshare-blog](http://www.hri.fi/fi/ajankohtaista/sotkanet-indikaattoripankki-mukaan-sorvi-tyokalupakkiin/)


# Licensing and Citations

### SOTKAnet data

Cite SOTKAnet and link to [https://sotkanet.fi/sotkanet/fi/index](https://sotkanet.fi/sotkanet/fi/index). Also mention indicator provider. 

 * [Full license and terms of use](https://sotkanet.fi/sotkanet/en/tietoa-palvelusta). 

Central points:

 * SOTKAnet REST API is meant for non-regular data queries. Avoid regular and repeated downloads.
 * SOTKAnet API can be used as the basis for other systems
 * Metadata for regions and indicators are under [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/) 
 * THL indicators are under [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/) 
 * Indicators provided by third parties can be used only by separate agreement!


### SOTKAnet R package

This work can be freely used, modified and distributed under the 
[Two-clause BSD license](http://en.wikipedia.org/wiki/BSD\_licenses).


```r
citation("sotkanet")
#> 
#> Kindly cite the sotkanet R package as follows:
#> 
#>   (C) Leo Lahti, Einari Happonen, Juuso Parkkinen and
#>   Joona Lehtomaki 2013-2015. sotkanet: Sotkanet R
#>   Tools
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Misc{,
#>     title = {sotkanet R package},
#>     author = {Leo Lahti and Einari Happonen and Juuso Parkkinen and Joona Lehtomaki},
#>     year = {2013},
#>   }
#> 
#> For more info, see:
#> https://github.com/ropengov/sotkanet/
```

### Session info

This vignette was created with


```r
sessionInfo()
```
