# sotkanet: Sotkanet Open Data Access and Analysis

The \`sotkanet\` R package aims to make retrieval of sotkanet indicator
data easy using R. Sotkanet.fi Statistics and Indicator Bank is
maintained by The Finnish Institute for Health and Welfare and it
contains data on population welfare and health from 1990 onwards.

## sotkanet functions

The main ways to interact with Sotkanet REST API are with the following
functions:
[`GetDataSotkanet`](https://ropengov.github.io/sotkanet/reference/GetDataSotkanet.md)
for downloading data from specific indicator(s),
[`SotkanetIndicators`](https://ropengov.github.io/sotkanet/reference/SotkanetIndicators.md)
for retrieving metadata on all or user specified indicators as a well
defined list and
[`SotkanetIndicatorMetadata`](https://ropengov.github.io/sotkanet/reference/SotkanetIndicatorMetadata.md)
as a specialized case returning an untruncated ("raw") output as
default.

## Attribution and licensing

For citing this package, see `citation("sotkanet")`

For terms of use of Sotkanet data, see THL [Sotkanet REST API
documentation](https://yhteistyotilat.fi/wiki08/x/E4CkAQ) (in Finnish).

A short and unofficial English summary of the Finnish Terms of use is as
follows: The end user of this package should note that

- metadata related to regional classifications and indicators is
  released under a [Creative Commons Attribution 4.0 license (CC BY
  4.0)](https://creativecommons.org/licenses/by/4.0/),

- statistical data and indicators **produced by THL** are likewise
  released under a CC BY 4.0 license,

- statistical data and indicators produced by **other parties than THL**
  should be only used in accordance with a separate agreement.

CC BY 4.0 terms state that when using data accessed through the sotkanet
API you should always give appropriate credit to Sotkanet as a data
source and include a link to sotkanet website: *https://sotkanet.fi*. In
the case of individual indicators, the producer of the indicator should
also be attributed separately.

This information is subject to change and the developers of this package
cannot guarantee that information stated here is correct. This
unofficial English translation related to data terms of use is provided
solely as a convenience to the end user. The user of this package should
always check the full text of Sotkanet terms of use from the original
source (see the link above to Sotkanet REST API documentation).

## Basic information about the package

|           |                                       |
|-----------|---------------------------------------|
| Package:  | sotkanet                              |
| Type:     | Package                               |
| Version:  | See sessionInfo() or DESCRIPTION file |
| Date:     | 2013-2024                             |
| License:  | BSD 2-clause License                  |
| LazyLoad: | yes                                   |

## References

See citation("sotkanet")

## See also

Useful links:

- <https://ropengov.github.io/sotkanet/>

- Report bugs at <https://github.com/ropengov/sotkanet/issues>

## Author

Leo Lahti (<leo.lahti@iki.fi>), Einari Happonen, Juuso Parkkinen Joona
Lehtomaki, Vesa Saaristo, Pyry Kantanen and Aleksi Lahtinen

## Examples

``` r
library(sotkanet)
```
