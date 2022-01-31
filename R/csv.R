#' @noRd
#' @title Sotkanet CSV Query
#' @description Retrieve data from the query url.
#' @param url Sotkanet CSV url
#' @return sotkanet CSV query
#' @references See citation("sotkanet") 
#' @author Maintainer: Leo Lahti \email{leo.lahti@@iki.fi}
#' @importFrom utils read.csv2
#' @keywords utilities
sotkanet.csv_query <- function(url, ...)
{

  # Check that URL fulfills requirements
  # If not, test_connection returns a message and NULL
  if (is.null(test_connection(url, ...))) {
    return(invisible(NULL))
  }

  tab <- read.csv2(file = url, header = TRUE, sep = ";", dec = ".")

  tab
}
