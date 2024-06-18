# sotkanet 0.9.80 (2024-06-18)

### NEW FEATURES
* New functions: `sotkanet_cite()` for citing datasets and `sotkanet_interactive()` for interactively downloading datasets.
* New dependencies / imports: move from using `httr` package to `httr2` package. Other new imports are `lubridate`, `RefManageR`, `digest`, `frictionless` and `magrittr`.
* Added new versions for functions `GetDataSotkanet`, `SotkanetRegions`, `SotkanetIndicators` and `SotkanetIndicatorMetadata`. The new version are called `get_sotkanet`, `sotkanet_regions`, `sotkanet_indicators` and `sotkanet_indicator_metadata`. The old versions of the functions are retained.
* Functions `get_sotkanet`, `sotkanet_regions`, `sotkanet_indicators` and `sotkanet_indicator_metadata` have support for caching. They also now support English and Swedish in addition to Finnish.
*`get_sotkanet` can return a frictionless datapackage with metadata added in. 

### DEPRECATED AND DEFUNCT
* Remove dependencies / imports: `httr` and `jsonlite`
* Removed function `try_GET`

### MINOR IMPROVEMENTS
* Updated vignette and README to use new versions of the functions. Old vignette is retained.
* Added Finnish version of the vignette as an article.
* Moved from using `PascalCase` naming convention to using `snake_case` for new functions. 
* Function `get_sotkanet()` has default `years` value of `NULL` that gives the data from all the available years for the dataset. The default value for `genders` is now `c("male", "female", "total")`.

# sotkanet 0.9.79 (2022-02-01)

### NEW FEATURES
 * Functions pointing to external resources (`sotkanet.json_query()` and `sotkanet.csv_query()`) should now fail gracefully. New internal functions are in R/http_funs.R
 * New dependencies / imports: httr package for handling URLs and error messages and curl package for internet connection testing. jsonlite for handling data from json files
 * Http functions now include information on user agent. The default is "rOpenGov/sotkanet" to help API providers track package usage but it can be changed in relevant functions: `GetDataSotkanet()`, `SotkanetIndicators()` and `SotkanetRegions()`.
 
### DEPRECATED AND DEFUNCT

 * Removed internal functions: `GetDataSotkanetSingleIndicator` and `SotkanetData`.
 * Removed dependency / import: rjson
 * Deleted unused function: `base_url`
 
### MINOR IMPROVEMENTS

 * Functionalities from GetDataSotkanetSingleIndicator and SotkanetData are now embedded in one function, `GetDataSotkanet()`.
 * Some files in ./R/ folder have been renamed for better legibility: internal.R to SotkanetCollect.R and sotkanet.R to SotkanetRegions.R
 * New alias for downloading indicator metadata: `SotkanetIndicatorMetadata()` (usesSotkanetIndicator(id))
 * To help save bandwidth, when provided with a predefined list of indicators, `SotkanetIndicators()` now downloads metadata individually instead of fetching and subsetting the whole indicator dataset.
 * Vignette will no longer fetch external resources on CRAN.
 * Package license clarified: BSD 2-clause instead of FreeBSD

# sotkanet 0.9.76 (2021-04-29)

 * Adding rmarkdown to Suggests
 * Minor fixes before CRAN submission (broken URLs etc.)
 * NEWS.md template updated to pkgdown-specifications

# sotkanet 0.9.72 (2021-04-12)

 * Getting rid of RCurl dependencies
 * Updated roxygen documentation 
 
# sotkanet 0.9.48 (2017-05-16)

 * CRAN release version

# sotkanet 0.9.13 (2015-06-23)

 * base url change into https
 * reorganized R file structure

# sotkanet 0.9.12 (2015-06-06)

 * tutorial updates
 
# sotkanet 0.9.11 (2015-06-04)

 * Updated README
 * Cosmetic changes to vignette
 * Renamed tutorial

# sotkanet 0.9.09 (2015-05-20)

 * Improved documentation
 * Polished package structure
 * Stabilized erroneous URL handling
 
# sotkanet 0.9.01 (2013-12-16)

 * Package separated from sorvi
