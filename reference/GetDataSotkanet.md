# Retrieve Sotkanet Data (old version)

Retrieve selected data and combine into a single table. (This is an
older version of the function. It is advised to use the new
\[get_sotkanet()\] function instead.)

## Usage

``` r
GetDataSotkanet(
  indicators = NULL,
  years = 1991:2015,
  genders = c("total"),
  regions = NULL,
  region.category = NULL,
  user.agent = NULL
)
```

## Arguments

- indicators:

  Dataset identifier(s)

- years:

  vector of years c(2010, 2012, ... )

- genders:

  vector of genders ('male' \| 'female' \| 'total')

- regions:

  filter by selected regions only (default: all regions)

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

- user.agent:

  "User agent" defined by the user. Default is NULL which will then use
  the package identifier "rOpenGov/sotkanet"

## Value

data.frame

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
if (FALSE) dat <- GetDataSotkanet(indicators = 165) # \dontrun{}
```
