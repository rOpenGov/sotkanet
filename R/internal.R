# This file is a part of rOpenGOv (http://ropengov.github.com/sotkanet/)

# Contributed by Einari Happonen and Opasnet:
# http://fi.opasnet.org/fi/Etusivu
# Copyright (C) 2013-2014 Einari Happonen and Leo Lahti 
# <ropengov.github.com>. All rights reserved.

# This program is open source software; you can redistribute it and/or modify 
# it under the terms of the FreeBSD License (keep this notice): 
# http://en.wikipedia.org/wiki/BSD_licenses

# This program is distributed in the hope that it will be useful, 
# but WITHOUT ANY WARRANTY; without even the implied warranty of 
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

#' @import ggplot2
#' @import rjson
NULL

#' Description:
#' SotkanetData retrieves Sotkanet data from
#' http://www.sotkanet.fi/rest/1.0/data/csv?
#' according to the query arguments.
#'
#' Arguments:
#'   @param indicator Dataset identifier
#'   @param years vector of years c(2010, 2012, ... )
#'   @param genders vector of genders ('male' | 'female' | 'total')
#'
#' Returns:
#'   @return sotkanet json query
#'
#' @references
#' See citation("sotkanet") 
#' @author Einari Happonen / Opasnet / Louhos. Maintainer: Louhos/Opasnet \email{louhos@@googlegroups.com}
#' @examples # 
#' @keywords utilities

SotkanetData <- function(indicator, years, genders)
{
  url <- 'http://www.sotkanet.fi/rest/1.0/data/csv?'
  url <- paste(url, 'indicator=',indicator, '&years=', paste(years, collapse='&years='), '&genders=', paste(genders, collapse='&genders='), sep='')
  return(sotkanet.csv_query(url))
}

#' Description:
#' GetDataSotkanetSingleIndicator retrieves Sotkanet data 
#' for given indicator according to the query arguments and combines
#' indicator, region, and overall data into one table
#'
#' Arguments:
#'   @param indicator Dataset identifier
#'   @param years vector of years c(2010, 2012, ... )
#'   @param genders vector of genders ('male' | 'female' | 'total')
#'   @param regions return selected regions only
#'   @param region.category return selected regions category (for options, see: unique(SotkanetRegions(type = "table")$region.category)); "ALUEHALLINTOVIRASTO, "ERVA", "EURALUEET", "EUROOPPA", "KUNTA", "MAA", "MAAKUNTA", "NUTS1", "POHJOISMAAT", "SAIRAANHOITOPIIRI", "SEUTUKUNTA", "SUURALUE"   
#'
#' Returns:
#'   @return sotkanet data table
#'
#' @references
#' See citation("sotkanet") 
#' @author Einari Happonen / Opasnet / Louhos. Maintainer: Louhos/Opasnet \email{louhos@@googlegroups.com}
#' @examples # 
#' @keywords utilities

GetDataSotkanetSingleIndicator <- function (indicator, years = 1990:2013, genders = "total", regions = NULL, region.category = NULL) {

  # FIXME: is it possible to specify already in query which regions we select

  #message(paste("Retrieving data for indicator", indicator))
  dat <- SotkanetData(indicator = indicator, years = years, genders = genders)

  # Pick corresponding indicator 
  #message(paste("Picking indicator"))
  indicator.data <- SotkanetIndicators(indicator)[, c("indicator", "indicator.title.fi")]
  dat <- merge(indicator.data, dat)

  # Pick corresponding region
  #message(paste("Picking region"))
  region.data <- SotkanetRegions()[, c("region", "region.title.fi", "region.code", "region.category")]
  dat <- merge(region.data, dat)

  # Replace comma by point as decimal separator
  #message(paste("Polishing"))
  dat$primary.value <- as.numeric(gsub("\\,", "\\.", as.character(dat$primary.value)))
  dat$absolute.value <- as.numeric(gsub("\\,", "\\.", as.character(dat$absolute.value)))

  # Remove unnecessary column
  #if (all(is.na(dat$absolute.value))) {dat$absolute.value <- NULL}

  # Pick only the selected regions
  if (!is.null(region.category)) {
    dat <- dat[dat$region.category %in% region.category, ]
  }

  if (!is.null(regions)) {
    dat <- dat[dat$region.title.fi %in% regions, ]
  }

  dat

}

#' Description:
#' retrieves Sotkanet data from the query url
#'
#' Arguments:
#'   @param url Sotkanet JSON url
#'
#' Returns:
#'   @return sotkanet json query
#'
#' @references
#' See citation("sotkanet") 
#' @author Einari Happonen / Opasnet. Maintainer: Louhos/Opasnet \email{louhos@@googlegroups.com}
#' @keywords utilities

sotkanet.json_query <- function(url)
{
        response <- rjson::fromJSON(
                        paste(
                                        readLines(url),
                                        collapse = ""
                        )
        )

        if (is.null(response)) stop("Sotkanet server is not responding! Unable to query!")

        return(response)
}


#' Description:
#' retrieves Sotkanet data from the query url
#'
#' Arguments:
#'   @param url Sotkanet CSV url
#'
#' Returns:
#'   @return sotkanet CSV query
#'
#' @references
#' See citation("sotkanet") 
#' @author Einari Happonen / Opasnet. Maintainer: Louhos/Opasnet \email{louhos@@googlegroups.com}
#' @keywords utilities

sotkanet.csv_query <- function(url)
{
        csv <- readLines(url)

        if (is.null(csv)) {
	  stop("Sotkanet server is not responding! Unable to query!")
	}

        return(read.table(file = textConnection(csv), header = TRUE, sep=';'))
}



#' Description:
#' SotkanetCollect converts the list object from Sotkanet to a data.frame
#'
#' Arguments:
#'   @param x input data (from SotkanetIndicators or SotkanetRegions etc.)
#'   @param name name for the column ("indicator", "region", etc.)
#'
#' Returns:
#'   @return sotkanet data table
#'
#' @references
#' See citation("sotkanet") 
#' @author Einari Happonen / Opasnet. Maintainer: Louhos \email{louhos@@googlegroups.com}
#' @keywords utilities

SotkanetCollect <- function(x, name) {

  if (length(x$id) == 1) {
    x <- list(x)
  }

  if (name == "region") {
    out <- data.frame(list(
      region = sapply(x, function (xi) {xi$id}),
      region.title.fi = sapply(x, function (xi) {xi$title[["fi"]]}),
      region.code = sapply(x, function (xi) {xi$code}),
      region.category = sapply(x, function (xi) {xi$category}),
      region.uri = gsub("NULL", "", sapply(x, function (xi) {xi$uri}))))
  } else if (name == "indicator") {
    out <- data.frame(list(
      indicator = sapply(x, function (xi) {xi$id}),
      indicator.title.fi = sapply(x, function (xi) {xi$title[["fi"]]}),
      indicator.organization = sapply(x, function (xi) {xi$organization$id}),
      indicator.organization.title.fi = sapply(x, function (xi) {xi$organization$title[["fi"]]})
      #indicator.last.update = gsub("NULL", "", sapply(x, function (xi) {xi[["data-update"]]}))
    ))
  }

  return(out)
}