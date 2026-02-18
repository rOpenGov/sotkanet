# Retrieve Sotkanet Data

Retrieve selected data and combine into a single table.

## Usage

``` r
get_sotkanet(
  indicators = NULL,
  years = NULL,
  genders = c("male", "female", "total"),
  regions = NULL,
  region.category = NULL,
  lang = "fi",
  user.agent = NULL,
  cache = TRUE,
  cache_dir = NULL,
  frictionless = FALSE
)
```

## Arguments

- indicators:

  Dataset identifier(s)

- years:

  vector of years, for example \`2015:2018\` or \`c(2010, 2012, ...)\`.
  Default value is \`NULL\`, which gives the data from all the available
  years. You can give indicators their own year range by giving the
  years in a list. See examples for demonstration.

- genders:

  vector of genders ('male' \| 'female' \| 'total'). Some datasets do
  not work with only the gender value 'total' and return an empty
  data.frame. In these situations it is advised to check out some other
  alternative.

- regions:

  filter by selected regions only (default: all regions). The region
  filter has to be given in the language used for the language variable.

- region.category:

  filter by one or more of the following 15 valid regions categories
  (default: all categories)

  - "ALUEHALLINTOVIRASTO"

  - "ELY-KESKUS"

  - "ERVA"

  - "EURALUEET" (Eurozone)

  - "EUROOPPA" (Europe)

  - "HYVINVOINTIALUE" (welfare country)

  - "KUNTA" (municipality)

  - "MAA" (country)

  - "MAAKUNTA" (region)

  - "NUTS1"

  - "POHJOISMAAT" (Nordic countries)

  - "SAIRAANHOITOPIIRI (hospital district)

  - "SEUTUKUNTA"

  - "SUURALUE"

  - "YTA"

- lang:

  Language of the data variables: indicator.title, region.title and
  indicator.organization.title. Default is Finnish ("fi"), the other
  options being English ("en") and Swedish ("sv").

- user.agent:

  "User agent" defined by the user. Default is NULL which will then use
  the package identifier "rOpenGov/sotkanet"

- cache:

  a logical whether to do caching. Defaults is \`TRUE\`.

- cache_dir:

  a path to cache directory. \`Null\` (default) uses and creates
  "sotkanet" directory in the temporary directory defined by base R
  \[tempdir()\] function. The user can set the cache directory to an
  existing directory with this argument.

- frictionless:

  a logical whether to return a datapackage, with metadata inside,
  instead of a data.frame.

## Value

Returns a data.frame when frictionless is \`FALSE\` and a datapackage
when frictionless is \`TRUE\`.

## Details

THL's open data license and limitation of liability

**License**

The open data provided by National Institute for Health and Welfare is
licensed under CC BY 4.0. This license defines how open data can be
utilized. The licensing is based on a decision made by the Director
General.

**Limitation of Liability**

National Institute for Health and Welfare shall not be liable for any
loss, legal proceedings, claims, proceedings, demands, costs or damages
regardless of their cause or form, which can be directly or indirectly
connected to open data or use of open data published by National
Institute for Health and Welfare.

## References

See citation("sotkanet")

## See also

For more information about dataset structure, see THL webpage at
<https://yhteistyotilat.fi/wiki08/pages/viewpage.action?pageId=27557907>

THL open data license website:
<https://yhteistyotilat.fi/wiki08/x/AAadAg>

## Author

Maintainer: Leo Lahti <leo.lahti@iki.fi>, Pyry Kantanen

## Examples

``` r
if (FALSE) { # \dontrun{
dat <- get_sotkanet(indicators = 165)
dat <- get_sotkanet(indicators = c(4,5), genders = c("male", "female"))
dat <- get_sotkanet(indicators = 10012, regions = c("Suomi", "Ruotsi"))
dat <- get_sotkanet(indicators = 10012, region.category = c("POHJOISMAAT"))
dat <- get_sotkanet(indicators = 6, lang = "en")
dat <- get_sotkanet(indicators = 10027, frictionless = TRUE)
dat <- get_sotkanet(indicators = c(4,5,6), years = list("4" = 2000:2010,
                                                        "5" = 2010:2015, "6" = 2015:2020))
} # }
```
