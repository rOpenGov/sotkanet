#' Description:
#' retrieves Sotkanet data from the query url
#'
#' Arguments:
#'   @param url Sotkanet CSV url
#'
#' Returns:
#'   @return sotkanet CSV query
#'
#' @references
#' See citation("sotkanet") 
#' @author Einari Happonen. Maintainer: Louhos/Opasnet \email{louhos@@googlegroups.com}
#' @keywords utilities

sotkanet.csv_query <- function(url)
{

  # Check that the URL exists
  if (!url.exists(url)) {
    warning(paste("Sotkanet URL", url, "does not exist - returning NULL!"))
    return(NULL)
  }

  con <- url(url, method = "libcurl")
  csv <- readLines(con, warn = FALSE)
  # txt <- suppressWarnings(readLines(con, warn = FALSE))
  close(con)

  if (is.null(csv)) {
    stop("Sotkanet server is not responding! Unable to query!")
  }

  tab <- read.table(file = textConnection(csv), header = TRUE, sep = ';')

  return(tab)

}


