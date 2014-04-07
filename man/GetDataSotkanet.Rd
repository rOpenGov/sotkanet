\name{GetDataSotkanet}
\alias{GetDataSotkanet}
\title{Description:
GetDataSotkanet retrieves Sotkanet data
according to the query arguments and combines
indicator, region, and overall data into one table}
\usage{
GetDataSotkanet(indicators, years = 1990:2013, genders = c("total"),
  regions = NULL, region.category = NULL, verbose = TRUE)
}
\arguments{
  \item{indicators}{Dataset identifier}

  \item{years}{vector of years c(2010, 2012, ... )}

  \item{genders}{vector of genders ('male' | 'female' |
  'total')}

  \item{regions}{pick selected regions only (default: all
  regions)}

  \item{region.category}{return selected regions category
  (for options, see: unique(SotkanetRegions(type =
  "table")$region.category)); "ALUEHALLINTOVIRASTO, "ERVA",
  "EURALUEET", "EUROOPPA", "KUNTA", "MAA", "MAAKUNTA",
  "NUTS1", "POHJOISMAAT", "SAIRAANHOITOPIIRI",
  "SEUTUKUNTA", "SUURALUE"}

  \item{verbose}{verbose

  Returns:}
}
\value{
sotkanet data table
}
\description{
Arguments:
}
\examples{
# dat <- GetDataSotkanet(indicators = 10013, years = 1990:2012,
          #	       genders = c('total'), region.category = "EUROOPPA",
	     #	       region = "Suomi")
}
\author{
Einari Happonen / Opasnet / Louhos. Maintainer:
Louhos/Opasnet \email{louhos@googlegroups.com}
}
\references{
See citation("sotkanet")
}
\keyword{utilities}

