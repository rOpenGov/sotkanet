# Sotkanet Indicator Metadata

Retrieves sotkanet indicator metadata.

## Usage

``` r
sotkanet_indicator_metadata(
  id = NULL,
  type = "raw",
  user.agent = NULL,
  cache = TRUE,
  cache_dir = NULL
)
```

## Arguments

- id:

  Indicator id

- type:

  Parameter passed onto
  [`sotkanet_indicators`](https://ropengov.github.io/sotkanet/reference/sotkanet_indicators.md).
  Default is 'raw' for the whole output but 'table' is also supported

- user.agent:

  "User agent" defined by the user. Default is NULL which will use the
  default package identifier "rOpenGov/sotkanet"

- cache:

  A logical whether to do caching.

- cache_dir:

  A path to the cache dir.

## Value

sotkanet indicator metadata as a list object

## Details

Data is fetched from

    https://sotkanet.fi/rest/1.1/indicators/<id>

## References

See citation("sotkanet")

## Author

Maintainer: Pyry Kantanen

## Examples

``` r
if (FALSE) { # \dontrun{
x <- sotkanet_indicator_metadata(10012)
} # }
```
