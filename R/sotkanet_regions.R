#' @title Sotkanet Regions
#' @description Retrieves sotkanet regions data.
#' @details Data is fetched from \url{https://sotkanet.fi/rest/1.1/regions}.
#' @param type type output format, either 'table' (default) or 'raw'.
#'    Default produces a truncated table with strictly defined columns that
#'    are useful in other functions. 'Raw' produces the full output which might
#'    be useful for exploratory purposes.
#' @param lang Language of the output.
#' @param user.agent "User agent" defined by the user. Default is NULL which
#'    will then use the package identifier "rOpenGov/sotkanet"
#' @param cache a logical whether to do caching.
#' @param cache_dir a path to the cache directory.
#' @return data.frame
#' @export
#' @references See citation("sotkanet")
#' @author Maintainer: Leo Lahti \email{leo.lahti@@iki.fi}
#' @examples
#' \dontrun{
#' sotkanet.regions <- sotkanet_regions(type = "table", lang = "fi")
#' }
#' @importFrom digest digest
#' @keywords utilities
sotkanet_regions <- function(type = "table", lang = "fi",  user.agent = NULL,
                             cache = TRUE, cache_dir = NULL)
{

  region_query <- list(type = type, lang = lang)
  region_hash <- digest::digest(region_query, algo = "md5")

  region_cache <- sotkanet_read_cache(cache = cache, cache_dir = cache_dir, region_hash)

  if (!is.null(region_cache)){
    return(region_cache)
  }

  sotkanet_url <- "https://sotkanet.fi/rest"
  sotkanet_uri <- "/1.1/regions"

  # Construct URL
  url_object <- httr2::url_parse(sotkanet_url)
  path <- paste(url_object$path, sotkanet_uri, sep = "")
  url_object$path <- path

  final_url <- httr2::url_build(url_object)

  res <- sotkanet.json_query(final_url, simplifyVector = TRUE)

  if (type == "table") {
    res <- sotkanet_collect(res, "region", lang = lang)
  }

  sotkanet_write_cache(cache = cache, cache_dir = cache_dir, region_hash, res)

  res
}


