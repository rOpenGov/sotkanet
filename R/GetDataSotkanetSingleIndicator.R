#' @title Get Sotkanet Data for Single Indicator 
#' @description: GetDataSotkanetSingleIndicator retrieves Sotkanet data 
#' for given indicator according to the query arguments and combines
#' indicator, region, and overall data into one table
#' @param indicator Dataset identifier
#' @param years vector of years c(2010, 2012, ... )
#' @param genders vector of genders ('male' | 'female' | 'total')
#' @param regions return selected regions only
#' @param region.category return selected regions category (for options, see:
#'          unique(SotkanetRegions(type = "table")$region.category)); 
#'	    "ALUEHALLINTOVIRASTO, "ERVA", "EURALUEET", "EUROOPPA", "KUNTA", 
#'	    "MAA", "MAAKUNTA", "NUTS1", "POHJOISMAAT", "SAIRAANHOITOPIIRI", 
#'	    "SEUTUKUNTA", "SUURALUE"   
#' @return sotkanet data table
#' @references
#' See citation("sotkanet") 
#' @author Einari Happonen. Maintainer: Louhos/Opasnet \email{louhos@@googlegroups.com}
#' @examples # 
#' @keywords utilities
GetDataSotkanetSingleIndicator <- function (indicator, years = 1990:2000, genders = "total", regions = NULL, region.category = NULL) {

  # FIXME: is it possible to specify already in query which regions we select
  dat <- SotkanetData(indicator = indicator, years = years, genders = genders)

  # Pick corresponding indicator 
  indicator.data <- SotkanetIndicators(indicator)[, c("indicator", "indicator.title.fi")]
  dat <- merge(indicator.data, dat)

  # Pick corresponding region
  #message(paste("Picking region"))
  region.data <- SotkanetRegions()[, c("region", "region.title.fi", "region.code", "region.category")]
  dat <- merge(region.data, dat)

  # Replace comma by point as decimal separator
  dat$primary.value <- as.numeric(gsub("\\,", "\\.", as.character(dat$primary.value)))
  dat$absolute.value <- as.numeric(gsub("\\,", "\\.", as.character(dat$absolute.value)))

  # Pick only the selected regions
  if (!is.null(region.category)) {
    dat <- dat[dat$region.category %in% region.category, ]
  }

  if (!is.null(regions)) {
    dat <- dat[dat$region.title.fi %in% regions, ]
  }

  dat

}
