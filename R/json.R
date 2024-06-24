#' @title Retrieve Sotkanet Data (json)
#' @description Retrieve data in json format from given url.
#' @param url Sotkanet JSON url
#' @param user.agent "User agent" defined by the user. Default is
#'    "rOpenGov/sotkanet"
#' @param simplifyVector When ´TRUE´ returns a data.frame object and
#'  when ´False´ returns a list instead.
#' @param ... additional parameters to be passed to test_connection, mainly
#'    timeout (in seconds, default is 10)
#'
#' @return a data.frame (simplifyVector = TRUE) or a list (simplifyVector = FALSE)
#' @references See citation("sotkanet")
#' @author Maintainer: Leo Lahti \email{leo.lahti@@iki.fi}, Pyry Kantanen
#' @importFrom httr2 request req_user_agent req_perform resp_body_json
#' @keywords internal
#' @export
sotkanet.json_query <- function(url, user.agent = NULL, simplifyVector = TRUE, ...){

  if (is.null(user.agent)){

    useragent <- "rOpenGov/sotkanet"

  } else {

    useragent <- user.agent

  }

  if (is.null(test_connection(url, ...))){

    return(invisible(NULL))

  }

  response <- httr2::request(url) %>% 
    httr2::req_user_agent(useragent) %>%
    httr2::req_perform() %>% 
    httr2::resp_body_json(simplifyVector = simplifyVector)

  response

}
