#' @title Test for internet connection, timeout and status
#' @description Constructs a function for trying an URL
#' @param url URL to query
#' @param timeout Timeout time in seconds.
#' @return HTTP response or a conditionMessage
#'
#' @source Gracefully failing HTTP request code (slightly adapted by Pyry
#'    Kantanen) from RStudio community member kvasilopoulos. Many thanks!
#'
#'    Source of the original RStudio community discussion:
#'    \url{https://community.rstudio.com/t/internet-resources-should-fail-gracefully/49199}
#'
#' @author Pyry Kantanen (maintainer), Kostas Vasilopoulos
#'
#' @importFrom httr2 request req_timeout req_perform
#' @importFrom curl has_internet
#'
#' @keywords internal
#' @export
test_connection <- function(url = NULL, timeout = 10) {

  if (is.null(url)) {
    url <- "https://github.com/rOpenGov/sotkanet"
  }

  if (!curl::has_internet()) {
    message("No internet connection.")
    return(invisible(NULL))
  }


  resp <- tryCatch(
    httr2::request(url) %>% httr2::req_timeout(timeout) %>% httr2::req_perform(),
    error = function(e) errorCondition(e),
    warning = function(w) warningCondition(w)
  )

  if ("error" %in% class(resp)) {
    message(resp)
    return(invisible(NULL))
  }

  # test_connection is supposed to return null if something is wrong
  # If everything is alright, it returns this (invisible) object
  x <- "Everything ok!"
  invisible(x)
}
