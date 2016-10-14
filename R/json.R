#' @title Retrieves Sotkanet Data
#' @description Retrieves Sotkanet data from the query URL.
#' @param url Sotkanet JSON url
#' @return sotkanet json query
#' @importFrom RCurl url.exists
#' @importFrom rjson fromJSON
#' @references See citation("sotkanet") 
#' @author Einari Happonen. Maintainer: \email{leo.lahti@@iki.fi}
#' @keywords utilities
sotkanet.json_query <- function(url)
{

  # Check that the URL exists
  if (!url.exists(url)) {
    warning(paste("Sotkanet URL", url, "does not exist - returning NULL!"))
    return(NULL)
  }

  # Retrieve the data
  con <- url(url, method = "libcurl")
  txt <- suppressWarnings(readLines(con, warn = FALSE))
  close(con)
  
  response <- fromJSON(paste(txt, collapse = ""))
  
  if (is.null(response)) 
    stop("Sotkanet server is not responding! Unable to query!")

  return(response)
}
