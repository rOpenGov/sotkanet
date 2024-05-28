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
#' @importFrom httr2 request req_user_agent req_perform resp_body_json
#' @keywords internal
#' @export
sotkanet.json_query <- function(url, user.agent = NULL, flatten = TRUE, ...){

  if (is.null(user.agent)){

    useragent <- "rOpenGov/sotkanet"

  } else {

    useragent <- user.agent

  }

  if (is.null(test_connection(url, ...))){

    return(invisible(NULL))

  }

  response <- httr2::request(url) %>% httr2::req_user_agent(useragent) %>%
    httr2::req_perform() %>% httr2::resp_body_json(simplifyVector = TRUE)

  response

}
