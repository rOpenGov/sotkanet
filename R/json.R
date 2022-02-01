#' @title Retrieve Sotkanet Data (json)
#' @description Retrieve data in json format from given url.
#' @param url Sotkanet JSON url
#' @param user.agent "User agent" defined by the user. Default is 
#'    "rOpenGov/sotkanet"
#' @param flatten parameter to be passed to jsonlite::fromJSON. Default is TRUE
#' @param ... additional parameters to be passed to test_connection, mainly 
#'    timeout (in seconds, default is 10)
#' 
#' @return a data.frame (flatten = TRUE) or a list (flatten = FALSE)
#' @references See citation("sotkanet") 
#' @author Maintainer: Leo Lahti \email{leo.lahti@@iki.fi}, Pyry Kantanen
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET user_agent content
#' @keywords internal
#' @export
sotkanet.json_query <- function(url, user.agent = NULL, flatten = TRUE, ...)
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
  httr_content <- httr::content(httr_get, 
                                as = "text", 
                                encoding = "UTF-8")

  response <- jsonlite::fromJSON(txt = httr_content, flatten)
  response
}
