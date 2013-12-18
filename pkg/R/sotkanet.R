# This file is a part of rOpenGOv (http://ropengov.github.com/sotkanet/)

# Contributed by Einari Happonen and Opasnet:
# http://fi.opasnet.org/fi/Etusivu
# Copyright (C) 2013 Einari Happonen and Leo Lahti 
# <ropengov.github.com>. All rights reserved.

# This program is open source software; you can redistribute it and/or modify 
# it under the terms of the FreeBSD License (keep this notice): 
# http://en.wikipedia.org/wiki/BSD_licenses

# This program is distributed in the hope that it will be useful, 
# but WITHOUT ANY WARRANTY; without even the implied warranty of 
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

#' Description:
#' SotkanetIndicators retrieves Sotkanet data corresponding to a
#' specified data identifier from
#' http://www.sotkanet.fi/rest/1.1/indicators
#'
#' Arguments:
#'   @param id Dataset identifier
#'   @param type output format ("table" or "raw")
#'
#' Returns:
#'   @return sotkanet json query in selected output format
#'
#' @export
#' @references
#' See citation("sotkanet") 
#' @author Einari Happonen / Opasnet / Louhos. Maintainer: Louhos/Opasnet \email{louhos@@googlegroups.com}
#' @examples # sotkanet.indicators <- SotkanetIndicators(type = "table")
#' @keywords utilities

SotkanetIndicators <- function(id = NULL, type = "table")
{

  url <- 'http://www.sotkanet.fi/rest/1.1/indicators'

  if (! is.null(id))
    url <- paste(url, id, sep='/')

  res <- sotkanet.json_query(url)

  if (type == "table") {
    res <- SotkanetCollect(res, "indicator")
  }

  res
}


#' Description:
#' SotkanetRegions retrieves Sotkanet regions data from
#' http://www.sotkanet.fi/rest/1.1/regions
#'
#' Arguments:
#'   @param type Return format ("table" or "raw")
#'
#' Returns:
#'   @return sotkanet json query in selected format
#'
#' @export
#' @references
#' See citation("sotkanet") 
#' @author Einari Happonen / Opasnet / Louhos. Maintainer: Louhos/Opasnet \email{louhos@@googlegroups.com}
#' @examples # sotkanet.regions <- SotkanetRegions(type = "table")
#' @keywords utilities

SotkanetRegions <- function(type = "table")
{
  url <- 'http://www.sotkanet.fi/rest/1.1/regions'

  res <- sotkanet.json_query(url)

  if (type == "table") {
    res <- SotkanetCollect(res, "region")
  }

  res
}


#' Description:
#' GetDataSotkanet retrieves Sotkanet data 
#' according to the query arguments and combines
#' indicator, region, and overall data into one table
#'
#' Arguments:
#'   @param indicators Dataset identifier
#'   @param years vector of years c(2010, 2012, ... )
#'   @param genders vector of genders ('male' | 'female' | 'total')
#'   @param regions pick selected regions only (default: all regions)
#'   @param region.category return selected regions category (for options, see: unique(SotkanetRegions(type = "table")$region.category)); "ALUEHALLINTOVIRASTO, "ERVA", "EURALUEET", "EUROOPPA", "KUNTA", "MAA", "MAAKUNTA", "NUTS1", "POHJOISMAAT", "SAIRAANHOITOPIIRI", "SEUTUKUNTA", "SUURALUE"   
#'   @param verbose verbose
#'
#' Returns:
#'   @return sotkanet data table
#'
#' @export
#' @references
#' See citation("sotkanet") 
#' @author Einari Happonen / Opasnet / Louhos. Maintainer: Louhos/Opasnet \email{louhos@@googlegroups.com}
#' @examples # dat <- GetDataSotkanet(indicators = 10013, years = 1990:2012, 
#'           #	       genders = c('total'), region.category = "EUROOPPA", 
#'	     #	       region = "Suomi")
#' @keywords utilities

GetDataSotkanet <- function (indicators, years = 1990:2013, genders = c("total"), regions = NULL, region.category = NULL, verbose = TRUE) {

  # List all indicators in Sotkanet database
  sotkanet.indicators <- SotkanetIndicators(type = "table")

  dats <- list()
  for (indicator in indicators) { 
    if (verbose) {message(paste("Retrieving indicator", indicator))}
    dats[[as.character(indicator)]] <- GetDataSotkanetSingleIndicator(indicator, years = years, genders = genders, regions = regions, region.category = region.category) 
  }

  # Merge all data from the different indicators in a single table
  combined.data <- do.call("rbind", dats)

  # Add indicator information
  combined.data$indicator.organization.title.fi <- sotkanet.indicators[match(combined.data$indicator, sotkanet.indicators$indicator),"indicator.organization.title.fi"]
  
  combined.data

}


