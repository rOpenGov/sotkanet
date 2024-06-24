#' @title Clean sotkanet Cache
#'
#' @description
#' Delete all .rds files from the sotkanet cache directory.
#'
#' @param cache_dir
#' A path to the cache directory. If `NULL` (default) tries to clean default
#' temporary cache directory.
#'
#' @examples
#' \dontrun{
#' SotkanetCleanCache()
#' }
#' @export
sotkanet_clean_cache <- function(cache_dir = NULL){

  if (is.null(cache_dir)){

    cache_dir <- file.path(tempdir(), "sotkanet")

    cache_dir <- path.expand(cache_dir)
  }

  if (!dir.exists(cache_dir)){
    message("The cache directory does not exist.")
  } else if (dir.exists(cache_dir)){
    files <- list.files(cache_dir,
                        pattern = "rds",
                        full.names = TRUE
    )
  }

  if (length(files) == 0) {
    message("The cache folder ", cache_dir, " is empty.")
  } else {
    unlink(files)
    message("Deleted .rds files from ", cache_dir)
  }

  invisible(TRUE)
}
