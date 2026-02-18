# Retrieve Sotkanet Data (json)

Retrieve data in json format from given url.

## Usage

``` r
sotkanet.json_query(url, user.agent = NULL, simplifyVector = TRUE, ...)
```

## Arguments

- url:

  Sotkanet JSON url

- user.agent:

  "User agent" defined by the user. Default is "rOpenGov/sotkanet"

- simplifyVector:

  When ´TRUE´ returns a data.frame object and when ´False´ returns a
  list instead.

- ...:

  additional parameters to be passed to test_connection, mainly timeout
  (in seconds, default is 10)

## Value

a data.frame (simplifyVector = TRUE) or a list (simplifyVector = FALSE)

## References

See citation("sotkanet")

## Author

Maintainer: Leo Lahti <leo.lahti@iki.fi>, Pyry Kantanen
