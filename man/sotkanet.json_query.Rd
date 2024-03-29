% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/json.R
\name{sotkanet.json_query}
\alias{sotkanet.json_query}
\title{Retrieve Sotkanet Data (json)}
\usage{
sotkanet.json_query(url, user.agent = NULL, flatten = TRUE, ...)
}
\arguments{
\item{url}{Sotkanet JSON url}

\item{user.agent}{"User agent" defined by the user. Default is 
"rOpenGov/sotkanet"}

\item{flatten}{parameter to be passed to jsonlite::fromJSON. Default is TRUE}

\item{...}{additional parameters to be passed to test_connection, mainly 
timeout (in seconds, default is 10)}
}
\value{
a data.frame (flatten = TRUE) or a list (flatten = FALSE)
}
\description{
Retrieve data in json format from given url.
}
\references{
See citation("sotkanet")
}
\author{
Maintainer: Leo Lahti \email{leo.lahti@iki.fi}, Pyry Kantanen
}
\keyword{internal}
