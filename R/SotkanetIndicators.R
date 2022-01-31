#' @title Sotkanet Indicators
#' @description Retrieve Sotkanet indicator metadata
#' @details Data is fetched from \url{https://sotkanet.fi/rest/1.1/indicators}.
#' @param id Dataset identifier. Default is NULL returning all 
#' @param type type output format, either 'table' (default) or 'raw'. 
#'    Default produces a truncated table with strictly defined columns that
#'    are useful in other functions. 'Raw' produces the full output which might
#'    be useful for exploratory purposes.
#' @return data.frame or a list
#' 
#' @references See citation("sotkanet") 
#' 
#' @author Leo Lahti \email{leo.lahti@@iki.fi}, Pyry Kantanen
#' @examples 
#' \dontrun{
#' sotkanet.indicators <- SotkanetIndicators(type = "table")
#' }
#' @importFrom httr parse_url build_url
#' @keywords utilities
#' @export
SotkanetIndicators <- function(id = NULL, type = "table")
{
  
  if (!(type %in% c("table", "raw"))){
    message("Please use valid type input: 'table' or 'raw'")
    return(invisible(NULL))
  }

  # Gather URL parts
  sotkanet_url <- "https://sotkanet.fi/rest"
  sotkanet_uri <- "/1.1/indicators"
  
  if (!is.null(id)){
    if (type == "raw"){
      sotkanet_uri <- paste(sotkanet_uri, id, sep = "/")
      
      url_object <- httr::parse_url(sotkanet_url)
      path <- paste(url_object$path, sotkanet_uri, sep = "")
      url_object$path <- path
      final_url <- httr::build_url(url_object)
      
      res <- sotkanet.json_query(final_url, flatten = TRUE)
      
      return(res)
      
    } else if (type == "table"){
      url_object <- httr::parse_url(sotkanet_url)
      path <- paste(url_object$path, sotkanet_uri, sep = "")
      url_object$path <- path
      final_url <- httr::build_url(url_object)
      
      res <- sotkanet.json_query(final_url, flatten = TRUE)
      
      res <- res[which(res$id == id),]
      
      res <- SotkanetCollect(res, "indicator")
      
      return(res)
    }
  }
  
  # Construct URL
  url_object <- httr::parse_url(sotkanet_url)
  path <- paste(url_object$path, sotkanet_uri, sep = "")
  url_object$path <- path
  final_url <- httr::build_url(url_object)
  
  res <- sotkanet.json_query(final_url, flatten = TRUE)
  
  if (type == "table") {
    res <- SotkanetCollect(res, "indicator")
  }

  res
}
