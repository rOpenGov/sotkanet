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
#' @importFrom httr2 request req_user_agent req_perform resp_body_string
#' @keywords internal
#' @export
sotkanet.csv_query <- function(url, user.agent = NULL, ...){

  if (is.null(user.agent)){

    useragent <- "rOpenGov/sotkanet"

  } else {

    useragent <- user.agent

  }

  if (is.null(test_connection(url, ...))){

    return(invisible(NULL))

  }

  csv_file <- httr2::request(url) %>%
    httr2::req_user_agent(useragent) %>%
    httr2::req_perform() %>%
    httr2::resp_body_string(encoding = "UTF-8")

  tab <- utils::read.csv2(text = csv_file,
                   header = TRUE,
                   sep = ";",
                   dec = ".",
                   encoding = "UTF-8")

  tab

}

