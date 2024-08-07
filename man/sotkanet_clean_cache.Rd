% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sotkanet_clean_cache.R
\name{sotkanet_clean_cache}
\alias{sotkanet_clean_cache}
\title{Clean sotkanet Cache}
\usage{
sotkanet_clean_cache(cache_dir = NULL)
}
\arguments{
\item{cache_dir}{A path to the cache directory. If `NULL` (default) tries to clean default
temporary cache directory.}
}
\description{
Delete all .rds files from the sotkanet cache directory.
}
\examples{
\dontrun{
SotkanetCleanCache()
}
}
