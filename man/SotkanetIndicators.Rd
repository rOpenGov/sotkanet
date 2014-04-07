\name{SotkanetIndicators}
\alias{SotkanetIndicators}
\title{Description:
SotkanetIndicators retrieves Sotkanet data corresponding to a
specified data identifier from
http://www.sotkanet.fi/rest/1.1/indicators}
\usage{
SotkanetIndicators(id = NULL, type = "table")
}
\arguments{
  \item{id}{Dataset identifier}

  \item{type}{output format ("table" or "raw")

  Returns:}
}
\value{
sotkanet json query in selected output format
}
\description{
Arguments:
}
\examples{
# sotkanet.indicators <- SotkanetIndicators(type = "table")
}
\author{
Einari Happonen / Opasnet / Louhos. Maintainer:
Louhos/Opasnet \email{louhos@googlegroups.com}
}
\references{
See citation("sotkanet")
}
\keyword{utilities}

