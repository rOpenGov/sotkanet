#' @title Retrieve Sotkanet Data
#' @description Retrieve selected data and combine into a single table.
#' @param indicators Dataset identifier(s)
#' @param years vector of years c(2010, 2012, ... )
#' @param genders vector of genders ('male' | 'female' | 'total')
#' @param regions pick selected regions only (default: all regions)
#' @param region.category return selected regions category (for options, see:
#'          unique(SotkanetRegions(type = "table")$region.category)); 
#'	    "ALUEHALLINTOVIRASTO, "ELY-KESKUS", "ERVA", "EURALUEET", "EUROOPPA", 
#'	    "HYVINVOINTIALUE", "KUNTA", "MAA", "MAAKUNTA", "NUTS1", "POHJOISMAAT", 
#'	    "SAIRAANHOITOPIIRI", "SEUTUKUNTA", "SUURALUE"    
#' @param verbose verbose
#' @return data.frame
#' @export
#' @references See citation("sotkanet") 
#' @author Maintainer: Leo Lahti \email{leo.lahti@@iki.fi}
#' @examples \dontrun{dat <- GetDataSotkanet(indicators = 165)}
#' @keywords utilities
GetDataSotkanet <- function (indicators, years = 1991:2015, genders = c("total"), regions = NULL, region.category = NULL, verbose = TRUE) {

  # List all indicators in Sotkanet database
  sotkanet.indicators <- SotkanetIndicators(type = "table")

  dats <- list()
  for (indicator in indicators) { 
    if (verbose) {message(paste("Retrieving indicator", indicator))}
    dats[[as.character(indicator)]] <- GetDataSotkanetSingleIndicator(indicator, years = years, 
    genders = genders, regions = regions, region.category = region.category) 
  }

  # Merge all data from the different indicators in a single table
  combined.data <- do.call("rbind", dats)

  # Add indicator information
  combined.data$indicator.organization.title.fi <- sotkanet.indicators[match(combined.data$indicator, 
  	sotkanet.indicators$indicator), "indicator.organization.title.fi"]
  
  combined.data

}



