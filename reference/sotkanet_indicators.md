# Sotkanet Indicators

Retrieve Sotkanet indicator metadata

## Usage

``` r
sotkanet_indicators(
  id = NULL,
  type = "table",
  lang = "fi",
  user.agent = NULL,
  cache = TRUE,
  cache_dir = NULL
)
```

## Arguments

- id:

  Dataset identifier. Default is NULL returning all

- type:

  type output format, either 'table' (default) or 'raw'. Default
  produces a truncated table with strictly defined columns that are
  useful in other functions. 'Raw' produces the full output which might
  be useful for exploratory purposes.

- lang:

  Language of the output.

- user.agent:

  "User agent" defined by the user. Default is NULL which will then use
  the package identifier "rOpenGov/sotkanet"

- cache:

  a logical whether to do caching.

- cache_dir:

  a path to the cache dir.

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
sotkanet.indicators <- sotkanet_indicators(type = "table", lang = "fi")
} # }
```
