% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sotkanet_indicator_metadata.R
\name{sotkanet_indicator_metadata}
\alias{sotkanet_indicator_metadata}
\title{Sotkanet Indicator Metadata}
\usage{
sotkanet_indicator_metadata(
  id = NULL,
  type = "raw",
  user.agent = NULL,
  cache = TRUE,
  cache_dir = NULL
)
}
\arguments{
\item{id}{Indicator id}

\item{type}{Parameter passed onto \code{\link{sotkanet_indicators}}. Default
is 'raw' for the whole output but 'table' is also supported}

\item{user.agent}{"User agent" defined by the user. Default is NULL which
will use the default package identifier "rOpenGov/sotkanet"}

\item{cache}{A logical whether to do caching.}

\item{cache_dir}{A path to the cache dir.}
}
\value{
sotkanet indicator metadata as a list object
}
\description{
Retrieves sotkanet indicator metadata.
}
\details{
Data is fetched from \preformatted{https://sotkanet.fi/rest/1.1/indicators/<id>}
}
\examples{
\dontrun{
x <- sotkanet_indicator_metadata(10012)
}
}
\references{
See citation("sotkanet")
}
\author{
Maintainer: Pyry Kantanen
}
\keyword{utilities}
