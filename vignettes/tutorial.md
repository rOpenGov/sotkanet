<!--
%\VignetteEngine{knitr}
%\VignetteIndexEntry{sotkanet R vignette}
-->


Sotkanet API R tools
===========

This is the [sotkanet](https://github.com/rOpenGov/sotkanet) R package to access data from the [Sotkanet portal](http://uusi.sotkanet.fi/portal/page/portal/etusivu/hakusivu) that provides over 2000 demographic indicators across Finland and Europe, maintained by the National Institute for Health and Welfare (THL). For more information, see [Sotkanet indicator database](http://uusi.sotkanet.fi/portal/page/portal/etusivu/tietoa_palvelusta) and [API description](http://uusi.sotkanet.fi/portal/pls/portal/!PORTAL.wwpob_page.show?_docname=22001.PDF). This package is part of [rOpenGov](http://ropengov.github.com).




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
sotkanet.regions <- SotkanetRegions(type = "table")
kable(head(sotkanet.regions))
```



| region|region.title.fi                 |region.code |region.category     |region.uri                         |
|------:|:-------------------------------|:-----------|:-------------------|:----------------------------------|
|    833|Etelä-Suomen AVIn alue          |1           |ALUEHALLINTOVIRASTO |http://www.yso.fi/onto/kunnat/ahv1 |
|    834|Lounais-Suomen AVIn alue        |2           |ALUEHALLINTOVIRASTO |http://www.yso.fi/onto/kunnat/ahv2 |
|    835|Itä-Suomen AVIn alue            |3           |ALUEHALLINTOVIRASTO |http://www.yso.fi/onto/kunnat/ahv3 |
|    836|Länsi- ja Sisä-Suomen AVIn alue |4           |ALUEHALLINTOVIRASTO |http://www.yso.fi/onto/kunnat/ahv4 |
|    837|Pohjois-Suomen AVIn alue        |5           |ALUEHALLINTOVIRASTO |http://www.yso.fi/onto/kunnat/ahv5 |
|    838|Lapin AVIn alue                 |6           |ALUEHALLINTOVIRASTO |http://www.yso.fi/onto/kunnat/ahv6 |


### Querying SOTKAnet indicators

Get the [indicator 10013](http://uusi.sotkanet.fi/portal/page/portal/etusivu/hakusivu/metadata?type=I&indicator=10013) from Finland (Suomi) for 1990-2012 (Eurostat employment statistics youth unemployment), and plot a graph:


```r
# Get indicator data
dat <- GetDataSotkanet(indicators = 10013, years = 1990:2012, 
       		       genders = c('female', 'male', 'total'), 
		       region.category = "EUROOPPA", regions = "Suomi")

# Investigate the first lines in the data
kable(head(dat))
```



|           | region|region.title.fi |region.code |region.category | indicator|indicator.title.fi         | year|gender | primary.value| absolute.value|indicator.organization.title.fi                |
|:----------|------:|:---------------|:-----------|:---------------|---------:|:--------------------------|----:|:------|-------------:|--------------:|:----------------------------------------------|
|10013.1139 |   1022|Suomi           |246         |EUROOPPA        |     10013|(EU) Nuorisotyöttömyysaste | 1993|female |          30.6|             NA|Euroopan yhteisöjen tilastotoimisto (Eurostat) |
|10013.1140 |   1022|Suomi           |246         |EUROOPPA        |     10013|(EU) Nuorisotyöttömyysaste | 2010|female |          19.0|             NA|Euroopan yhteisöjen tilastotoimisto (Eurostat) |
|10013.1141 |   1022|Suomi           |246         |EUROOPPA        |     10013|(EU) Nuorisotyöttömyysaste | 2004|total  |          20.7|             NA|Euroopan yhteisöjen tilastotoimisto (Eurostat) |
|10013.1142 |   1022|Suomi           |246         |EUROOPPA        |     10013|(EU) Nuorisotyöttömyysaste | 2006|male   |          19.0|             NA|Euroopan yhteisöjen tilastotoimisto (Eurostat) |
|10013.1143 |   1022|Suomi           |246         |EUROOPPA        |     10013|(EU) Nuorisotyöttömyysaste | 1990|female |           8.2|             NA|Euroopan yhteisöjen tilastotoimisto (Eurostat) |
|10013.1144 |   1022|Suomi           |246         |EUROOPPA        |     10013|(EU) Nuorisotyöttömyysaste | 2006|total  |          18.7|             NA|Euroopan yhteisöjen tilastotoimisto (Eurostat) |

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

![plot of chunk sotkanetDataVisu](figure/sotkanetDataVisu-1.png)


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

![plot of chunk sotkanetVisu3](figure/sotkanetVisu3-1.png)

## Further examples

For further usage examples, see
[Louhos-blog](http://louhos.wordpress.com), and
[takomo](https://github.com/louhos/takomo/tree/master/Sotkanet), and 
[Helsinki Region Infoshare-blog](http://www.hri.fi/fi/ajankohtaista/sotkanet-indikaattoripankki-mukaan-sorvi-tyokalupakkiin/)


# Licensing and Citations

### SOTKAnet data

Cite SOTKAnet and link to [http://www.sotkanet.fi](http://www.sotkanet.fi/). Also mention indicator provider. 

 * [Full license and terms of use](http://uusi.sotkanet.fi/portal/page/portal/etusivu/tietoa_palvelusta). 

Central points:

 * SOTKAnet REST API is meant for non-regular data queries. Avoid regular and repeated downloads.
 * SOTKAnet API can be used as the basis for other systems
 * Metadata for regions and indicators are under [CC-BY 3.0](http://creativecommons.org/licenses/by/3.0/) 
 * THL indicators are under [CC-BY 3.0](http://creativecommons.org/licenses/by/3.0/) 
 * Indicators provided by third parties can be used only by separate agreement!


### SOTKAnet R package

This work can be freely used, modified and distributed under the 
[Two-clause BSD license](http://en.wikipedia.org/wiki/BSD\_licenses).


```r
citation("sotkanet")
#> 
#> Kindly cite the sotkanet R package as follows:
#> 
#>   (C) Leo Lahti, Einari Happonen, Juuso Parkkinen and Joona Lehtomaki
#>   2013-2015. sotkanet: Sotkanet R Tools
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Misc{,
#>     title = {sotkanet R package},
#>     author = {Leo Lahti and Einari Happonen and Juuso Parkkinen and Joona Lehtomaki},
#>     year = {2013},
#>   }
#> 
#> For more info, see: https://github.com/ropengov/sotkanet/
```

### Session info

This vignette was created with


```r
sessionInfo()
#> R version 3.6.2 (2019-12-12)
#> Platform: x86_64-pc-linux-gnu (64-bit)
#> Running under: Ubuntu 19.10
#> 
#> Matrix products: default
#> BLAS:   /home/lemila/bin/R-3.6.2/lib/libRblas.so
#> LAPACK: /home/lemila/bin/R-3.6.2/lib/libRlapack.so
#> 
#> locale:
#>  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
#>  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
#>  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
#>  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
#>  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
#> [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
#> 
#> attached base packages:
#> [1] stats     graphics  grDevices utils     datasets  methods   base     
#> 
#> other attached packages:
#> [1] ggplot2_3.2.1   sotkanet_0.9.64 knitr_1.26     
#> 
#> loaded via a namespace (and not attached):
#>  [1] Rcpp_1.0.3       magrittr_1.5     tidyselect_0.2.5 munsell_0.5.0   
#>  [5] colorspace_1.4-1 rjson_0.2.20     R6_2.4.1         rlang_0.4.2     
#>  [9] stringr_1.4.0    highr_0.8        dplyr_0.8.3      tools_3.6.2     
#> [13] grid_3.6.2       gtable_0.3.0     xfun_0.11        withr_2.1.2     
#> [17] digest_0.6.23    assertthat_0.2.1 lazyeval_0.2.2   tibble_2.1.3    
#> [21] lifecycle_0.1.0  crayon_1.3.4     farver_2.0.1     purrr_0.3.3     
#> [25] bitops_1.0-6     RCurl_1.95-4.12  glue_1.3.1       evaluate_0.14   
#> [29] labeling_0.3     stringi_1.4.5    compiler_3.6.2   pillar_1.4.3    
#> [33] scales_1.1.0     pkgconfig_2.0.3
```
