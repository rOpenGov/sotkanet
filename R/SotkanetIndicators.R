#' @title Sotkanet Indicators
#' @description Retrieve Sotkanet indicator metadata
#' @details Data is fetched from \url{https://sotkanet.fi/rest/1.1/indicators}.
#' @param id Dataset identifier. Default is NULL returning all 
#' @param flatten Parameter passed to function handling json files, default is TRUE
#' @return json query in data.frame
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
SotkanetIndicators <- function(id = NULL, flatten = TRUE)
{

  # Gather URL parts
  sotkanet_url <- "https://sotkanet.fi/rest"
  sotkanet_uri <- "/1.1/indicators"
  
  if (!is.null(id)){
    sotkanet_uri <- paste(sotkanet_uri, id, sep = "/")
  }
  
  # Construct URL
  url_object <- httr::parse_url(sotkanet_url)
  path <- paste(url_object$path, sotkanet_uri, sep = "")
  url_object$path <- path
  final_url <- httr::build_url(url_object)
  
  res <- sotkanet.json_query(final_url, flatten)

  res
}
