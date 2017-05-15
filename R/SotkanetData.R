#' @noRd
#' @title Retrieve Sotkanet Data
#' @description Retrieve data according to the query arguments.
#' @param indicator Dataset identifier
#' @param years vector of years c(2010, 2012, ... )
#' @param genders vector of genders ('male' | 'female' | 'total')
#' @return sotkanet json query
#' @references See citation("sotkanet") 
#' @author Maintainer: Leo Lahti \email{leo.lahti@@iki.fi}
#' @examples \dontrun{d <- SotkanetData(indicator, years, genders)}
#' @keywords utilities
SotkanetData <- function(indicator, years, genders)
{

  # Here the older url is in use for some reason:
  url <- 'http://www.sotkanet.fi/rest/1.0/data/csv?'
  url <- paste(url, 'indicator=',indicator, '&years=', 
      	 	    paste(years, collapse='&years='), 
		    '&genders=', paste(genders, 
		    collapse='&genders='), sep='')

  res <- sotkanet.csv_query(url)

  return(res)

}

