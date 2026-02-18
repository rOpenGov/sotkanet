# Sotkanet Indicator Metadata. (old version)

Retrieves sotkanet indicator metadata. (This is an older version of the
function. It is advised to use the new \[sotkanet_indicator_metadata()\]
function instead.)

## Usage

``` r
SotkanetIndicatorMetadata(id = NULL, type = "raw", user.agent = NULL)
```

## Arguments

- id:

  Indicator id

- type:

  Parameter passed onto
  [`SotkanetIndicators`](https://ropengov.github.io/sotkanet/reference/SotkanetIndicators.md).
  Default is 'raw' for the whole output but 'table' is also supported

- user.agent:

  "User agent" defined by the user. Default is NULL which will use the
  default package identifier "rOpenGov/sotkanet"

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
x <- SotkanetIndicatorMetadata(10013)
} # }
```
