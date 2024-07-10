#' Calculate fixity checksum for an object
#'
#' @description
#' Uses a hash function (md5) on a sotkanet dataset and calculates a digest of the dataset
#' as a character string.
#'
#' @details
#'
#' Fixity can be used to make sure that the file has not changed. This is done by calculating
#' a checksum for the dataset that will change if the dataset changes. The default algorithm
#' used to calculate the checksum is md5 hash, but all the algorithms supported by imported
#' digest function are applicable. See the digest function documentation for more details.
#'
#' This function takes the whole dataset as an input. This means that everything to do with
#' the data is used when calculating the fixity checksum, so for example, if you change
#' the language of the output the checksum will also change.
#'
#'
#'
#' @param data A sotkanet dataset.
#' @param algorithm Algorithm used for calculating the checksum. Default is `md5`, but
#' supports all the algorithms in digest function.
#'
#' @return A character string
#'
#' @seealso [digest::digest()]
#'
#' For more info on fixity checksum see:
#' \url{https://www.dpconline.org/handbook/technical-solutions-and-tools/fixity-and-checksums}
#'
#' @importFrom digest digest
#'
#' @keywords internal
sotkanet_fixity <- function(data, algorithm = "md5"){
  if (!(algorithm %in% c("md5", "sha1", "crc32", "sha265", "sha512", "xxhash32",
                         "xxhash64", "murmur32", "spookyhash", "blake3", "crc32c"))){

    stop("Use a valid algorithm. See digest:digest function documentation.")

  }

  fixity <- digest::digest(data, algo = algorithm)

  fixity

}
