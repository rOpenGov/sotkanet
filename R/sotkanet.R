#' @title Sotkanet Regions
#' @description Retrieves sotkanet regions data.
#' @details Data is fetched from \url{http://www.sotkanet.fi/rest/1.1/regions}.
#' @param type Return format ("table" or "raw")
#' @return sotkanet json query in selected format
#' @export
#' @references See citation("sotkanet") 
#' @author Maintainer: Leo Lahti \email{leo.lahti@@iki.fi}
#' @examples \dontrun{sotkanet.regions <- SotkanetRegions(type = "table")}
#' @keywords utilities
SotkanetRegions <- function(type = "table")
{

  base.url <- base_url()	
  url <- paste(base.url, 'regions', sep = "")

  res <- sotkanet.json_query(url)

  if (type == "table") {
    res <- SotkanetCollect(res, "region")
  }

  res
}


