#' @title HTTP function: try_GET
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
#' @importFrom httr GET timeout
#'
#' @keywords internal
#' @export
try_GET <- function(url = NULL, timeout = 10) {
  if (is.null(url)){
    url <- "https://github.com/rOpenGov/sotkanet"
  }
  
  tryCatch(
    httr::GET(url = url, httr::timeout(timeout)),
    error = function(e) conditionMessage(e),
    warning = function(w) conditionMessage(w)
  )
}

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
#' @importFrom httr GET http_error message_for_status
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
  
  resp <- try_GET(url, timeout)
  if (class(resp) != "response") {
    message(resp)
    return(invisible(NULL))
  }
  
  if (httr::http_error(resp)) { 
    httr::message_for_status(resp)
    return(invisible(NULL))
  }
  
  # test_connection is supposed to return null if something is wrong
  # If everything is alright, it returns this (invisible) object
  x <- "Everything ok!"
  invisible(x)
}
