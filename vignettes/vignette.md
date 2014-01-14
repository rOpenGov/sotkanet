<!--
%\VignetteEngine{knitr}
%\VignetteIndexEntry{An R Markdown Vignette made with knitr}
-->

Sotkanet API R tools
===========

This is the [sotkanet](http://ropengov.github.com/sotkanet) R package to access data from the [Sotkanet portal](http://uusi.sotkanet.fi/portal/page/portal/etusivu/hakusivu) that provides over 2000 demographic indicators across Finland and Europe, maintained by the National Institute for Health and Welfare (THL). For more information, see [Sotkanet indicator database](http://uusi.sotkanet.fi/portal/page/portal/etusivu/tietoa_palvelusta) and [API description](http://uusi.sotkanet.fi/portal/pls/portal/!PORTAL.wwpob_page.show?_docname=22001.PDF). This package is part of [rOpenGov](http://ropengov.github.com/).


### Installation

Release version for general users:


```r
install.packages("sotkanet")
library(sotkanet)
```


Development version for developers:


```r
install.packages("devtools")
library(devtools)
install_github("sotkanet", "ropengov")
library(sotkanet)
```


### Listing available indicators

List available Sotkanet indicators:


```r
library(sotkanet)
sotkanet.indicators <- SotkanetIndicators(type = "table")
```

```
## Error: cannot open the connection
```

```r
head(sotkanet.indicators)
```

```
## Error: object 'sotkanet.indicators' not found
```


List geographical regions with available indicators:


```r
sotkanet.regions <- SotkanetRegions(type = "table")
```

```
## Error: cannot open the connection
```

```r
head(sotkanet.regions)
```

```
## Error: object 'sotkanet.regions' not found
```



### Querying SOTKAnet indicators

Get the [indicator 10013](http://uusi.sotkanet.fi/portal/page/portal/etusivu/hakusivu/metadata?type=I&indicator=10013) from Finland (Suomi) for 1990-2012 (Eurostat employment statistics youth unemployment), and plot a graph:


```r
# Get indicator data
dat <- GetDataSotkanet(indicators = 10013, years = 1990:2012, genders = c("female", 
    "male", "total"), region.category = "EUROOPPA", region = "Suomi")
```

```
## Error: cannot open the connection
```

```r

# Investigate the first lines in the data
head(dat)
```

```
## Error: object 'dat' not found
```

```r

# Pick indicator name
indicator.name <- as.character(unique(dat$indicator.title.fi))
```

```
## Error: object 'dat' not found
```

```r
indicator.source <- as.character(unique(dat$indicator.organization.title.fi))
```

```
## Error: object 'dat' not found
```

```r

# Visualize
library(ggplot2, quietly = TRUE)
theme_set(theme_bw(20))
p <- ggplot(dat, aes(x = year, y = primary.value, group = gender, color = gender))
```

```
## Error: object 'dat' not found
```

```r
p <- p + geom_line() + ggtitle(paste(indicator.name, indicator.source, sep = " / "))
```

```
## Error: object 'p' not found
```

```r
p <- p + xlab("Year") + ylab("Value")
```

```
## Error: object 'p' not found
```

```r
p <- p + theme(title = element_text(size = 10))
```

```
## Error: object 'p' not found
```

```r
p <- p + theme(axis.title.x = element_text(size = 20))
```

```
## Error: object 'p' not found
```

```r
p <- p + theme(axis.title.y = element_text(size = 20))
```

```
## Error: object 'p' not found
```

```r
p <- p + theme(legend.title = element_text(size = 15))
```

```
## Error: object 'p' not found
```

```r
print(p)
```

```
## Error: object 'p' not found
```



### Effect of municipality size

Smaller municipalities have more random variation.


```r
selected.indicators <- c("Väestö 31.12.", "Kuntien välinen nettomuutto / 1 000 asukasta")
selected.inds <- sotkanet.indicators$indicator[match(selected.indicators, sotkanet.indicators$indicator.title.fi)]
```

```
## Error: object 'sotkanet.indicators' not found
```

```r
dat <- GetDataSotkanet(indicators = selected.inds, years = 2011, genders = c("total"))
```

```
## Error: cannot open the connection
```

```r
datf <- dat[, c("region.title.fi", "indicator.title.fi", "primary.value")]
```

```
## Error: object 'dat' not found
```

```r
dw <- reshape(datf, idvar = "region.title.fi", timevar = "indicator.title.fi", 
    direction = "wide")
```

```
## Error: object 'datf' not found
```

```r
names(dw) <- c("Municipality", "Population", "Migration")
```

```
## Error: object 'dw' not found
```

```r
p <- ggplot(dw, aes(x = log10(Population), y = Migration)) + geom_point(size = 3)
```

```
## Error: object 'dw' not found
```

```r
p <- p + ggtitle("Migration vs. population size")
```

```
## Error: object 'p' not found
```

```r
p <- p + theme(title = element_text(size = 15))
```

```
## Error: object 'p' not found
```

```r
p <- p + theme(axis.title.x = element_text(size = 20))
```

```
## Error: object 'p' not found
```

```r
p <- p + theme(axis.title.y = element_text(size = 20))
```

```
## Error: object 'p' not found
```

```r
p <- p + theme(legend.title = element_text(size = 15))
```

```
## Error: object 'p' not found
```

```r
print(p)
```

```
## Error: object 'p' not found
```




### Fetch all SOTKAnet indicators

This takes for a long time and is not recommended for regular
use. Save the data on your local dissk for further work.



```r
# These indicators have problems with R routines:
probematic.indicators <- c(1575, 1743, 1826, 1861, 1882, 1924, 1952, 2000, 2001, 
    2033, 2050, 3386, 3443)

# Get data for all indicators
datlist <- list()
for (ind in setdiff(sotkanet.indicators$indicator, probematic.indicators)) {
    datlist[[as.character(ind)]] <- GetDataSotkanet(indicators = ind, years = 1990:2013, 
        genders = c("female", "male", "total"))
}

# Combine tables (this may require considerable time and memory for the
# full data set)
dat <- do.call("rbind", datlist)
```


For further usage examples, see
[Louhos-blog](http://louhos.wordpress.com), and
[takomo](https://github.com/louhos/takomo/tree/master/Sotkanet).


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
[Two-clause FreeBSD
license](http://en.wikipedia.org/wiki/BSD\_licenses). Kindly cite the
R package as 'Leo Lahti, Einari Happonen, Juuso Parkkinen ja Joona
Lehtomäki (2013). sotkanet R package. URL:
http://ropengov.github.io/sotkanet'.


### Session info


This vignette was created with


```r
sessionInfo()
```

```
## R version 3.0.1 (2013-05-16)
## Platform: x86_64-unknown-linux-gnu (64-bit)
## 
## locale:
##  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
##  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
##  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
##  [7] LC_PAPER=C                 LC_NAME=C                 
##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
## [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] ggplot2_0.9.3.1 knitr_1.2       sotkanet_0.9.01 rjson_0.2.12   
## 
## loaded via a namespace (and not attached):
##  [1] colorspace_1.2-2   dichromat_2.0-0    digest_0.6.3      
##  [4] evaluate_0.4.3     formatR_0.7        grid_3.0.1        
##  [7] gtable_0.1.2       labeling_0.1       MASS_7.3-26       
## [10] munsell_0.4        plyr_1.8           proto_0.3-10      
## [13] RColorBrewer_1.0-5 reshape2_1.2.2     scales_0.2.3      
## [16] stringr_0.6.2      tools_3.0.1
```

