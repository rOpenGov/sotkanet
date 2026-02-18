# Sotkanet Regions

Retrieves sotkanet regions data.

## Usage

``` r
sotkanet_regions(
  type = "table",
  lang = "fi",
  user.agent = NULL,
  cache = TRUE,
  cache_dir = NULL
)
```

## Arguments

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

  a path to the cache directory.

## Value

data.frame

## Details

Data is fetched from <https://sotkanet.fi/rest/1.1/regions>.

## References

See citation("sotkanet")

## Author

Maintainer: Leo Lahti <leo.lahti@iki.fi>

## Examples

``` r
if (FALSE) { # \dontrun{
sotkanet.regions <- sotkanet_regions(type = "table", lang = "fi")
} # }
```
