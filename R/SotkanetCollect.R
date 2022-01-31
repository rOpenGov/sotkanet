#' @noRd
#' @title Sotkanet from list to data frame
#' @description Convert sotkanet list to data frame.
#' @param x input data (from SotkanetIndicators or SotkanetRegions etc.)
#' @param name name for the column ("indicator", "region", etc.)
#' @return sotkanet data table
#' @references See citation("sotkanet") 
#' @author Maintainer: Leo Lahti \email{leo.lahti@@iki.fi}
#' @keywords utilities
SotkanetCollect <- function(x, name) {

  # if (length(x$id) == 1) {
  #   x <- list(x)
  # }

  if (name == "region") {
    out <- data.frame(list(
      region = x$id,
      region.title.fi = x$title$fi,
      region.code = x$code,
      region.category = x$category,
      region.uri = x$uri))
  } else if (name == "indicator") {
    out <- data.frame(list(
      indicator = x$id,
      indicator.title.fi = x$title$fi,
      indicator.organization = x$organization$id,
      indicator.organization.title.fi = x$organization$title$fi))
  }

  out
}

