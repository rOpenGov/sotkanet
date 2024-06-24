#' @noRd
#' @title Sotkanet from list to data frame
#' @description Convert sotkanet list to data frame.
#' @param x input data (from sotkanet_indicators or sotkanet_regions etc.)
#' @param name name for the column ("indicator", "region", etc.)
#' @param lang language of the variables
#' @return sotkanet data table
#' @references See citation("sotkanet")
#' @author Maintainer: Leo Lahti \email{leo.lahti@@iki.fi}
#' @keywords utilities
sotkanet_collect <- function(x, name, lang) {

  # if (length(x$id) == 1) {
  #   x <- list(x)
  # }

  if (name == "region") {
    out <- data.frame(list(
      region = x$id,
      region.title = x$title[[lang]],
      region.code = x$code,
      region.category = x$category,
      region.uri = x$uri))
  } else if (name == "indicator") {
    out <- data.frame(list(
      indicator = x$id,
      indicator.title = x$title[[lang]],
      indicator.organization = x$organization$id,
      indicator.organization.title = x$organization$title[[lang]]))
  }

  out
}

