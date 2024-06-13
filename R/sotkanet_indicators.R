#' @title Sotkanet Indicators
#' @description Retrieve Sotkanet indicator metadata
#' @details Data is fetched from \url{https://sotkanet.fi/rest/1.1/indicators}.
#' @param id Dataset identifier. Default is NULL returning all
#' @param type type output format, either 'table' (default) or 'raw'.
#'    Default produces a truncated table with strictly defined columns that
#'    are useful in other functions. 'Raw' produces the full output which might
#'    be useful for exploratory purposes.
#' @param lang Language of the output.
#' @param user.agent "User agent" defined by the user. Default is NULL which
#'    will then use the package identifier "rOpenGov/sotkanet"
#' @param cache a logical whether to do caching.
#' @param cache_dir a path to the cache dir.
#' @return data.frame (type = "table) or a list (type = "raw")
#'
#' @references See citation("sotkanet")
#'
#' @author Leo Lahti \email{leo.lahti@@iki.fi}, Pyry Kantanen
#' @examples
#' \dontrun{
#' sotkanet.indicators <- sotkanet_indicators(type = "table", lang = "fi")
#' }
#' @importFrom httr2 url_parse url_build
#' @importFrom digest digest
#' @keywords utilities
#' @export
sotkanet_indicators <- function(id = NULL, type = "table", lang = "fi", user.agent = NULL,
                                cache = TRUE, cache_dir = NULL)
{

  if (!(type %in% c("table", "raw"))){
    message("Please use valid type input: 'table' or 'raw'")
    return(invisible(NULL))
  }

  indicator_query <- list(id = id, type = type, lang = lang)
  indicator_hash <- digest::digest(indicator_query, algo = "md5")

  indicator_cache <- sotkanet_read_cache(cache = cache, cache_dir = cache_dir, indicator_hash)

  if (!is.null(indicator_cache)){
    return(indicator_cache)
  }

  # Gather URL parts
  sotkanet_url <- "https://sotkanet.fi/rest"
  sotkanet_uri <- "/1.1/indicators"

  if (!is.null(id)){

    if (length(id) > 1){
      res <- lapply(id, FUN=sotkanet_indicators, type = type, lang = lang, user.agent = user.agent)
      res <- res[!is.na(res)]
      if (type == "table"){
        res <- do.call(rbind.data.frame, res)
      }
      return(res)
    }

    if (type == "raw"){
      sotkanet_uri <- paste(sotkanet_uri, id, sep = "/")

      url_object <- httr2::url_parse(sotkanet_url)
      path <- paste(url_object$path, sotkanet_uri, sep = "")
      url_object$path <- path
      final_url <- httr2::url_build(url_object)

      res <- sotkanet.json_query(final_url,
                                 simplifyVector = TRUE,
                                 user.agent = user.agent)

      sotkanet_write_cache(cache = cache, cache_dir = cache_dir, indicator_hash, res)

      return(res)

    } else if (type == "table"){
      sotkanet_uri <- paste(sotkanet_uri, id, sep = "/")
      url_object <- httr2::url_parse(sotkanet_url)
      path <- paste(url_object$path, sotkanet_uri, sep = "")
      url_object$path <- path
      final_url <- httr2::url_build(url_object)

      res <- sotkanet.json_query(final_url,
                                 simplifyVector = TRUE,
                                 user.agent = user.agent)

      # res <- res[which(res$id == id),]

      res <- sotkanet_collect(res, "indicator", lang = lang)

      sotkanet_write_cache(cache = cache, cache_dir = cache_dir, indicator_hash, res)

      return(res)
    }
  }

  # Construct URL
  url_object <- httr2::url_parse(sotkanet_url)
  path <- paste(url_object$path, sotkanet_uri, sep = "")
  url_object$path <- path
  final_url <- httr2::url_build(url_object)

  res <- sotkanet.json_query(final_url,
                             simplifyVector = TRUE,
                             user.agent = user.agent)

  if (type == "table") {
    res <- sotkanet_collect(res, "indicator", lang = lang)
  }

  sotkanet_write_cache(cache = cache, cache_dir = cache_dir, indicator_hash, res)

  res
}
