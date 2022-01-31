#' @title Sotkanet Regions
#' @description Retrieves sotkanet regions data.
#' @details Data is fetched from \url{https://sotkanet.fi/rest/1.1/regions}.
#' @param type Return format ("table" or "raw")
#' @return sotkanet json query in selected format
#' @export
#' @references See citation("sotkanet") 
#' @author Maintainer: Leo Lahti \email{leo.lahti@@iki.fi}
#' @examples 
#' \dontrun{
#' sotkanet.regions <- SotkanetRegions(type = "table")
#' }
#' @keywords utilities
SotkanetRegions <- function(type = "table")
{

  sotkanet_url <- "https://sotkanet.fi/rest"
  sotkanet_uri <- "/1.1/regions"
  
  # Construct URL
  url_object <- httr::parse_url(sotkanet_url)
  path <- paste(url_object$path, sotkanet_uri, sep = "")
  url_object$path <- path

  final_url <- httr::build_url(url_object)

  res <- sotkanet.json_query(final_url)

  if (type == "table") {
    res <- SotkanetCollect(res, "region")
  }

  res
}


