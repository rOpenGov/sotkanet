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

  if (length(x$id) == 1) {
    x <- list(x)
  }

  if (name == "region") {
    out <- data.frame(list(
      region = sapply(x, function (xi) {xi$id}),
      region.title.fi = sapply(x, function (xi) {xi$title[["fi"]]}),
      region.code = sapply(x, function (xi) {xi$code}),
      region.category = sapply(x, function (xi) {xi$category}),
      region.uri = gsub("NULL", "", sapply(x, function (xi) {xi$uri}))))
  } else if (name == "indicator") {
    out <- data.frame(list(
      indicator = sapply(x, function (xi) {xi$id}),
      indicator.title.fi = sapply(x, function (xi) {xi$title[["fi"]]}),
      indicator.organization = sapply(x, function (xi) {xi$organization$id}),
      indicator.organization.title.fi = sapply(x, function (xi) {xi$organization$title[["fi"]]})
    ))
  }

  out
}

