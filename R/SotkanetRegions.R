#' @title Sotkanet Regions
#' @description Retrieves sotkanet regions data.
#' @details Data is fetched from \url{https://sotkanet.fi/rest/1.1/regions}.
#' @param type type output format, either 'table' (default) or 'raw'. 
#'    Default produces a truncated table with strictly defined columns that
#'    are useful in other functions. 'Raw' produces the full output which might
#'    be useful for exploratory purposes.
#' @param user.agent "User agent" defined by the user. Default is NULL which
#'    will then use the package identifier "rOpenGov/sotkanet"
#' @return data.frame
#' @export
#' @references See citation("sotkanet") 
#' @author Maintainer: Leo Lahti \email{leo.lahti@@iki.fi}
#' @examples 
#' \dontrun{
#' sotkanet.regions <- SotkanetRegions(type = "table")
#' }
#' @keywords utilities
SotkanetRegions <- function(type = "table", user.agent = NULL)
{

  sotkanet_url <- "https://sotkanet.fi/rest"
  sotkanet_uri <- "/1.1/regions"
  
  # Construct URL
  url_object <- httr::parse_url(sotkanet_url)
  path <- paste(url_object$path, sotkanet_uri, sep = "")
  url_object$path <- path

  final_url <- httr::build_url(url_object)

  res <- sotkanet.json_query(final_url, flatten = TRUE)

  if (type == "table") {
    res <- SotkanetCollect(res, "region")
  }

  res
}


