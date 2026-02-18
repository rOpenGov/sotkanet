# Sotkanet Regions (old version)

Retrieves sotkanet regions data. (This is an older version of the
function. It is advised to use the new \[sotkanet_regions()\] function
instead.)

## Usage

``` r
SotkanetRegions(type = "table", user.agent = NULL)
```

## Arguments

- type:

  type output format, either 'table' (default) or 'raw'. Default
  produces a truncated table with strictly defined columns that are
  useful in other functions. 'Raw' produces the full output which might
  be useful for exploratory purposes.

- user.agent:

  "User agent" defined by the user. Default is NULL which will then use
  the package identifier "rOpenGov/sotkanet"

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
sotkanet.regions <- SotkanetRegions(type = "table")
} # }
```
