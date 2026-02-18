# Test for internet connection, timeout and status

Constructs a function for trying an URL

## Usage

``` r
test_connection(url = NULL, timeout = 10)
```

## Source

Gracefully failing HTTP request code (slightly adapted by Pyry Kantanen)
from RStudio community member kvasilopoulos. Many thanks!

Source of the original RStudio community discussion:
<https://forum.posit.co/t/internet-resources-should-fail-gracefully/49199>

## Arguments

- url:

  URL to query

- timeout:

  Timeout time in seconds.

## Value

HTTP response or a conditionMessage

## Author

Pyry Kantanen (maintainer), Kostas Vasilopoulos
