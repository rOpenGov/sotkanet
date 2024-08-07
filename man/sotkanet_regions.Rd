% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sotkanet_regions.R
\name{sotkanet_regions}
\alias{sotkanet_regions}
\title{Sotkanet Regions}
\usage{
sotkanet_regions(
  type = "table",
  lang = "fi",
  user.agent = NULL,
  cache = TRUE,
  cache_dir = NULL
)
}
\arguments{
\item{type}{type output format, either 'table' (default) or 'raw'.
Default produces a truncated table with strictly defined columns that
are useful in other functions. 'Raw' produces the full output which might
be useful for exploratory purposes.}

\item{lang}{Language of the output.}

\item{user.agent}{"User agent" defined by the user. Default is NULL which
will then use the package identifier "rOpenGov/sotkanet"}

\item{cache}{a logical whether to do caching.}

\item{cache_dir}{a path to the cache directory.}
}
\value{
data.frame
}
\description{
Retrieves sotkanet regions data.
}
\details{
Data is fetched from \url{https://sotkanet.fi/rest/1.1/regions}.
}
\examples{
\dontrun{
sotkanet.regions <- sotkanet_regions(type = "table", lang = "fi")
}
}
\references{
See citation("sotkanet")
}
\author{
Maintainer: Leo Lahti \email{leo.lahti@iki.fi}
}
\keyword{utilities}
