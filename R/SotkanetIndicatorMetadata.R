#' @title Sotkanet Indicator Metadata
#' @description Retrieves sotkanet indicator metadata.
#' @details Data is fetched from \preformatted{https://sotkanet.fi/rest/1.1/indicators/<id>}
#' @param id Indicator id
#' @param flatten Parameter passed to function handling json files, default 
#'    is TRUE
#' @return sotkanet indicator metadata as a list object
#' @references See citation("sotkanet") 
#' @author Maintainer: Pyry Kantanen
#' @examples 
#' \dontrun{
#' x <- SotkanetIndicatorMetadata(10013)
#' }
#' @keywords utilities
#' @export
SotkanetIndicatorMetadata <- function(id = NULL, flatten = TRUE)
{
  if (is.null(id)){
    message("Please input a valid indicator id number")
    return(invisible(NULL))
  }
  SotkanetIndicators(id, flatten)
}


