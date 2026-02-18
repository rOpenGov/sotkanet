# Changelog

## sotkanet 0.10.1 (2024-07-10)

CRAN release: 2024-07-10

#### NEW FEATURES

- New functions:
  [`sotkanet_cite()`](https://ropengov.github.io/sotkanet/reference/sotkanet_cite.md)
  for citing datasets (issue
  [\#16](https://github.com/rOpenGov/sotkanet/issues/16), PR
  [\#17](https://github.com/rOpenGov/sotkanet/issues/17) by
  [@Allaht2](https://github.com/Allaht2)) and
  [`sotkanet_interactive()`](https://ropengov.github.io/sotkanet/reference/sotkanet_interactive.md)
  for interactively downloading datasets (issue
  [\#20](https://github.com/rOpenGov/sotkanet/issues/20), PR
  [\#21](https://github.com/rOpenGov/sotkanet/issues/21) by
  [@Allaht2](https://github.com/Allaht2)).
- New dependencies / imports: move from using `httr` package to `httr2`
  package (issue [\#19](https://github.com/rOpenGov/sotkanet/issues/19),
  PR [\#24](https://github.com/rOpenGov/sotkanet/issues/24) by
  [@Allaht2](https://github.com/Allaht2)). Other new imports are
  `lubridate`, `RefManageR`, `digest`, `frictionless` and `magrittr`.
- Added new versions for functions `GetDataSotkanet`, `SotkanetRegions`,
  `SotkanetIndicators` and `SotkanetIndicatorMetadata`. The new version
  are called `get_sotkanet`, `sotkanet_regions`, `sotkanet_indicators`
  and `sotkanet_indicator_metadata`. The old versions of different
  functions are kept without deprecation messages or warnings, but users
  are gently encouraged to use the new functions (issue
  [\#18](https://github.com/rOpenGov/sotkanet/issues/18), PR
  [\#25](https://github.com/rOpenGov/sotkanet/issues/25) by
  [@Allaht2](https://github.com/Allaht2))
- Functions `get_sotkanet`, `sotkanet_regions`, `sotkanet_indicators`
  and `sotkanet_indicator_metadata` have support for caching (issue
  [\#14](https://github.com/rOpenGov/sotkanet/issues/14), PR
  [\#21](https://github.com/rOpenGov/sotkanet/issues/21) by
  [@Allaht2](https://github.com/Allaht2)). They also now support English
  and Swedish in addition to Finnish (issue
  [\#9](https://github.com/rOpenGov/sotkanet/issues/9), PR
  [\#21](https://github.com/rOpenGov/sotkanet/issues/21) by
  [@Allaht2](https://github.com/Allaht2)). \*`get_sotkanet` can return a
  frictionless datapackage with metadata added in (issue
  [\#15](https://github.com/rOpenGov/sotkanet/issues/15), PR
  [\#21](https://github.com/rOpenGov/sotkanet/issues/21) by
  [@Allaht2](https://github.com/Allaht2)).

#### DEPRECATED AND DEFUNCT

- Remove dependencies / imports: `httr` and `jsonlite`
- Removed function `try_GET`

#### MINOR IMPROVEMENTS

- Updated vignette and README to use new versions of the functions. Old
  vignette is retained.
- Added Finnish version of the vignette as an article (issue
  [\#10](https://github.com/rOpenGov/sotkanet/issues/10), PR
  [\#24](https://github.com/rOpenGov/sotkanet/issues/24) by
  [@Allaht2](https://github.com/Allaht2)).
- Moved from using `PascalCase` naming convention to using `snake_case`
  for new functions (issue
  [\#18](https://github.com/rOpenGov/sotkanet/issues/18)).
- Function
  [`get_sotkanet()`](https://ropengov.github.io/sotkanet/reference/get_sotkanet.md)
  has default `years` value of `NULL` that gives the data from all the
  available years for the dataset (issue
  [\#12](https://github.com/rOpenGov/sotkanet/issues/12), PR
  [\#24](https://github.com/rOpenGov/sotkanet/issues/24) by
  [@Allaht2](https://github.com/Allaht2)).
- The default value for `genders` is now `c("male", "female", "total")`
  (issue [\#22](https://github.com/rOpenGov/sotkanet/issues/22), PR
  [\#24](https://github.com/rOpenGov/sotkanet/issues/24) by
  [@Allaht2](https://github.com/Allaht2)).
- New `region.category` supported by the API, `YTA` (“yhteistyöalue”)
  now mentioned in relevant function documentation (PR
  [\#26](https://github.com/rOpenGov/sotkanet/issues/26) by
  [@Allaht2](https://github.com/Allaht2))

## sotkanet 0.9.79 (2022-02-01)

CRAN release: 2022-02-01

#### NEW FEATURES

- Functions pointing to external resources
  ([`sotkanet.json_query()`](https://ropengov.github.io/sotkanet/reference/sotkanet.json_query.md)
  and
  [`sotkanet.csv_query()`](https://ropengov.github.io/sotkanet/reference/sotkanet.csv_query.md))
  should now fail gracefully. New internal functions are in
  R/http_funs.R
- New dependencies / imports: httr package for handling URLs and error
  messages and curl package for internet connection testing. jsonlite
  for handling data from json files
- Http functions now include information on user agent. The default is
  “rOpenGov/sotkanet” to help API providers track package usage but it
  can be changed in relevant functions:
  [`GetDataSotkanet()`](https://ropengov.github.io/sotkanet/reference/GetDataSotkanet.md),
  [`SotkanetIndicators()`](https://ropengov.github.io/sotkanet/reference/SotkanetIndicators.md)
  and
  [`SotkanetRegions()`](https://ropengov.github.io/sotkanet/reference/SotkanetRegions.md).

#### DEPRECATED AND DEFUNCT

- Removed internal functions: `GetDataSotkanetSingleIndicator` and
  `SotkanetData`.
- Removed dependency / import: rjson
- Deleted unused function: `base_url`

#### MINOR IMPROVEMENTS

- Functionalities from GetDataSotkanetSingleIndicator and SotkanetData
  are now embedded in one function,
  [`GetDataSotkanet()`](https://ropengov.github.io/sotkanet/reference/GetDataSotkanet.md).
- Some files in ./R/ folder have been renamed for better legibility:
  internal.R to SotkanetCollect.R and sotkanet.R to SotkanetRegions.R
- New alias for downloading indicator metadata:
  [`SotkanetIndicatorMetadata()`](https://ropengov.github.io/sotkanet/reference/SotkanetIndicatorMetadata.md)
  (usesSotkanetIndicator(id))
- To help save bandwidth, when provided with a predefined list of
  indicators,
  [`SotkanetIndicators()`](https://ropengov.github.io/sotkanet/reference/SotkanetIndicators.md)
  now downloads metadata individually instead of fetching and subsetting
  the whole indicator dataset.
- Vignette will no longer fetch external resources on CRAN.
- Package license clarified: BSD 2-clause instead of FreeBSD

## sotkanet 0.9.76 (2021-04-29)

CRAN release: 2021-05-03

- Adding rmarkdown to Suggests
- Minor fixes before CRAN submission (broken URLs etc.)
- NEWS.md template updated to pkgdown-specifications

## sotkanet 0.9.72 (2021-04-12)

- Getting rid of RCurl dependencies
- Updated roxygen documentation

## sotkanet 0.9.48 (2017-05-16)

CRAN release: 2017-05-16

- CRAN release version

## sotkanet 0.9.13 (2015-06-23)

- base url change into https
- reorganized R file structure

## sotkanet 0.9.12 (2015-06-06)

- tutorial updates

## sotkanet 0.9.11 (2015-06-04)

- Updated README
- Cosmetic changes to vignette
- Renamed tutorial

## sotkanet 0.9.09 (2015-05-20)

- Improved documentation
- Polished package structure
- Stabilized erroneous URL handling

## sotkanet 0.9.01 (2013-12-16)

- Package separated from sorvi
