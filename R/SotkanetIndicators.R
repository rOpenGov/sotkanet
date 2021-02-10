#' @title Sotkanet Indicators
#' @description Retrieve data for a specific data id.
#  @details Data is fetched from 
#'   \url{https://sotkanet.fi/rest/1.1/indicators}.
#' @param id Dataset identifier
#' @param type output format ("table" or "raw")
#' @return json query in selected output format
#' @export
#' @references See citation("sotkanet") 
#' @author Leo Lahti \email{leo.lahti@@iki.fi}
#' @examples \dontrun{sotkanet.indicators <- SotkanetIndicators(type = "table")}
#' @keywords utilities
SotkanetIndicators <- function(id = NULL, type = "table")
{

  base.url <- base_url()	
  url <- paste(base.url, 'indicators', sep = "")

  if (!is.null(id))
    url <- paste(url, id, sep='/')

  tmp <- try(res <- sotkanet.json_query(url))
  if (is.null(tmp)) {warning("The URL may be temporarily unavailable. Try later.")}

  if (type == "table") {
    res <- SotkanetCollect(res, "indicator")
  }

  res
}


