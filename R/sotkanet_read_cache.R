#' @title Read cache for sotkanet data.frame
#'
#' @description
#' Helper function that reads the cache for saved sotkanet data.frame.
#'
#'
#' @param cache a logical whether to do caching.
#' @param cache_dir a path to cache directory.
#' @param query_hash a character used to identify the data.frame.
#'
#' @references See citation("sotkanet")
#' @keywords internal
#' @export
sotkanet_read_cache <- function(cache, cache_dir, query_hash){

  if (cache){

    if (is.null(cache_dir)){

      cache_dir <- file.path(tempdir(), "sotkanet")

      cache_dir <- path.expand(cache_dir)

    }

    if (dir.exists(cache_dir)){

        cache_file <- file.path(cache_dir, paste0(query_hash, ".rds"))

        if (file.exists(cache_file)){

          combined_data <- readRDS(cache_file)

          return(combined_data)

        } else {

          return(NULL)
        }
      }
    }
  }
