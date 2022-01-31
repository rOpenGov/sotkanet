#' @noRd
#' @title Retrieve Sotkanet Data
#' @description Retrieve data from the query url.
#' @param url Sotkanet JSON url
#' @return sotkanet json query
#' @references See citation("sotkanet") 
#' @author Maintainer: Leo Lahti \email{leo.lahti@@iki.fi}
#' @importFrom jsonlite fromJSON
#' @keywords utilities
sotkanet.json_query <- function(url, flatten = TRUE, ...)
{

  # Check that URL fulfills requirements
  # If not, test_connection returns a message and NULL
  if (is.null(test_connection(url, ...))) {
    return(invisible(NULL))
  }

  response <- jsonlite::fromJSON(url, flatten)
  response
}
