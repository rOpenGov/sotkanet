#' @title Sotkanet Indicator Metadata
#' @description Retrieves sotkanet indicator metadata.
#' @details Data is fetched from \preformatted{https://sotkanet.fi/rest/1.1/indicators/<id>}
#' @param id Indicator id
#' @param type Parameter passed onto \code{\link{SotkanetIndicators}}. Default
#'    is 'raw' for the whole output but 'table' is also supported
#' @param user.agent "User agent" defined by the user. Default is NULL which
#'    will use the default package identifier "rOpenGov/sotkanet"
#' @return sotkanet indicator metadata as a list object
#' @references See citation("sotkanet") 
#' @author Maintainer: Pyry Kantanen
#' @examples 
#' \dontrun{
#' x <- SotkanetIndicatorMetadata(10013)
#' }
#' @keywords utilities
#' @export
SotkanetIndicatorMetadata <- function(id = NULL, type = "raw", user.agent = NULL)
{
  if (is.null(id)){
    message("Please input a valid indicator id number")
    return(invisible(NULL))
  }
  SotkanetIndicators(id, type)
}


