#' @title Sotkanet Indicator Metadata
#' @description Retrieves sotkanet indicator metadata.
#' @details Data is fetched from \preformatted{https://sotkanet.fi/rest/1.1/indicators/<id>}
#' @param id Indicator id
#' @param type Parameter passed onto \code{\link{sotkanet_indicators}}. Default
#'    is 'raw' for the whole output but 'table' is also supported
#' @param user.agent "User agent" defined by the user. Default is NULL which
#'    will use the default package identifier "rOpenGov/sotkanet"
#' @param cache A logical whether to do caching.
#' @param cache_dir A path to the cache dir.
#' @return sotkanet indicator metadata as a list object
#' @references See citation("sotkanet")
#' @author Maintainer: Pyry Kantanen
#' @examples
#' \dontrun{
#' x <- sotkanet_indicator_metadata(10012)
#' }
#' @keywords utilities
#' @export
sotkanet_indicator_metadata <- function(id = NULL, type = "raw", user.agent = NULL,
                                        cache = TRUE, cache_dir = NULL) {
  if (is.null(id)){

    message("Please input a valid indicator id number.")

    return(invisible(NULL))
  }
  sotkanet_indicators(id = id, type = type, user.agent = user.agent,
                      cache = cache, cache_dir = cache_dir)
}
