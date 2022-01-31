# sotkanet 0.9.76 (2022-01-31)

### NEW FEATURES
 * Functions pointing to external resources (`sotkanet.json_query` and `sotkanet.csv_query`) should now fail gracefully. New internal functions are in graceful_http.R file
 * New dependencies / imports: httr package for handling URLs and error messages and curl package for internet connection testing. jsonlite for handling data from json files
 
### DEPRECATED AND DEFUNCT

 * Removed internal functions: `GetDataSotkanetSingleIndicator` and `SotkanetData`.
 * Removed dependency / import: rjson
 
### MINOR IMPROVEMENTS

 * Functionalities from GetDataSotkanetSingleIndicator and SotkanetData are now embedded in one function, `GetDataSotkanet`.
 * Some files in ./R/ folder have been renamed for better legibility: internal.R to SotkanetCollect.R and sotkanet.R to SotkanetRegions.R
 * New alias for downloading indicator metadata: `SotkanetIndicatorMetadata()` (usesSotkanetIndicator(id))

# sotkanet 0.9.75 (2021-04-29)

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
