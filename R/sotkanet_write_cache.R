#' @title Write sotkanet data.frame into cache
#'
#' @description
#' Helper function that writes the sotkanet data.frame into cache.
#'
#' @param cache a logical whether to do caching.
#' @param cache_dir a path to cache directory.
#' @param query_hash a character used to identify the data.frame.
#' @param data sotkanet data.frame.
#'
#'
#' @references See citation("sotkanet")
#' @keywords internal
#' @export
sotkanet_write_cache <- function(cache, cache_dir, query_hash, data){

  if (cache){

    if (is.null(cache_dir)){

      cache_dir <- file.path(tempdir(), "sotkanet")

      cache_dir <- path.expand(cache_dir)

    }

    if(!dir.exists(cache_dir)){

      dir.create(cache_dir, recursive = TRUE)
    }

    cache_file <- file.path(cache_dir, paste0(query_hash, ".rds"))

    saveRDS(data, file = cache_file, compress = TRUE)

  }
}
