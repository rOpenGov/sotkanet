\name{SotkanetData}
\alias{SotkanetData}
\title{Description:
SotkanetData retrieves Sotkanet data from
http://www.sotkanet.fi/rest/1.0/data/csv?
according to the query arguments.}
\usage{
SotkanetData(indicator, years, genders)
}
\arguments{
  \item{indicator}{Dataset identifier}

  \item{years}{vector of years c(2010, 2012, ... )}

  \item{genders}{vector of genders ('male' | 'female' |
  'total')

  Returns:}
}
\value{
sotkanet json query
}
\description{
Arguments:
}
\examples{
#
}
\author{
Einari Happonen / Opasnet / Louhos. Maintainer:
Louhos/Opasnet \email{louhos@googlegroups.com}
}
\references{
See citation("sotkanet")
}
\keyword{utilities}

