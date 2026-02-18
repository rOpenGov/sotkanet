# Retrieve Sotkanet Data (csv)

Retrieve data in csv format from given url.

## Usage

``` r
sotkanet.csv_query(url, user.agent = NULL, ...)
```

## Arguments

- url:

  Sotkanet CSV url

- user.agent:

  User agent defined by the user. Default is "rOpenGov/sotkanet"

- ...:

  additional parameters to be passed to test_connection, mainly timeout
  (in seconds, default is 10)

## Value

data.frame

## References

See citation("sotkanet")

## Author

Maintainer: Leo Lahti <leo.lahti@iki.fi>, Pyry Kantanen
