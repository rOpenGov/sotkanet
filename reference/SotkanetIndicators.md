# Sotkanet Indicators (old version)

Retrieve Sotkanet indicator metadata. (This is an older version of the
function. It is advised to use the new \[sotkanet_indicators()\]
function instead.)

## Usage

``` r
SotkanetIndicators(id = NULL, type = "table", user.agent = NULL)
```

## Arguments

- id:

  Dataset identifier. Default is NULL returning all

- type:

  type output format, either 'table' (default) or 'raw'. Default
  produces a truncated table with strictly defined columns that are
  useful in other functions. 'Raw' produces the full output which might
  be useful for exploratory purposes.

- user.agent:

  "User agent" defined by the user. Default is NULL which will then use
  the package identifier "rOpenGov/sotkanet"

## Value

data.frame (type = "table) or a list (type = "raw")

## Details

Data is fetched from <https://sotkanet.fi/rest/1.1/indicators>.

## References

See citation("sotkanet")

## Author

Leo Lahti <leo.lahti@iki.fi>, Pyry Kantanen

## Examples

``` r
if (FALSE) { # \dontrun{
sotkanet.indicators <- SotkanetIndicators(type = "table")
} # }
```
