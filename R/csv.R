#' @title Retrieve Sotkanet Data (csv)
#' @description Retrieve data in csv format from given url.
#' @param url Sotkanet CSV url
#' @param user.agent User agent defined by the user. Default is 
#'    "rOpenGov/sotkanet"
#' @param ... additional parameters to be passed to test_connection, mainly 
#'    timeout (in seconds, default is 10)
#'
#' @return data.frame
#' @references See citation("sotkanet") 
#' @author Maintainer: Leo Lahti \email{leo.lahti@@iki.fi}, Pyry Kantanen
#' @importFrom utils read.csv2
#' @importFrom httr GET user_agent content
#' @keywords internal
#' @export
sotkanet.csv_query <- function(url, user.agent = NULL, ...)
{
  
  if (is.null(user.agent)) {
    useragent <- "rOpenGov/sotkanet"
  } else {
    # user.agent is defined by the user
    useragent <- user.agent
  }

  # Check that URL fulfills requirements
  # If not, test_connection returns a message and NULL
  if (is.null(test_connection(url, ...))) {
    return(invisible(NULL))
  }

  httr_get <- httr::GET(url, httr::user_agent(useragent))
  csv_file <- httr::content(httr_get, as = "text")

  tab <- read.csv2(text = csv_file, 
                   header = TRUE, 
                   sep = ";", 
                   dec = ".",
                   encoding = "UTF-8")

  tab
}
