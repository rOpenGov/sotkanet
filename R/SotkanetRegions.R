#' @title Sotkanet Regions (old version)
#' @description Retrieves sotkanet regions data. (This is an older version of the function. 
#'  It is advised to use the new [sotkanet_regions()] function instead.)
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

  message("This is an old version of the function.\nIt is advised to use the new sotkanet_regions function instead.")
  
  sotkanet_url <- "https://sotkanet.fi/rest"
  sotkanet_uri <- "/1.1/regions"

  # Construct URL
  url_object <- httr2::url_parse(sotkanet_url)
  path <- paste(url_object$path, sotkanet_uri, sep = "")
  url_object$path <- path

  final_url <- httr2::url_build(url_object)

  res <- sotkanet.json_query(final_url, simplifyVector = TRUE)

  if (type == "table") {
    res <- SotkanetCollect(res, "region")
  }

  res
}


