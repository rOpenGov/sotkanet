#' @title Retrieve Sotkanet Data
#' @description 
#' Retrieve selected data and combine into a single table.
#' @details 
#' THL's open data license and limitation of liability 
#'
#' \strong{License}
#' 
#' The open data provided by National Institute for Health and Welfare is 
#' licensed under CC BY 4.0. This license defines how open data can be utilized. 
#' The licensing is based on a decision made by the Director General.
#' 
#' \strong{Limitation of Liability}
#' 
#' National Institute for Health and Welfare shall not be liable for any loss, 
#' legal proceedings, claims, proceedings, demands, costs or damages regardless 
#' of their cause or form, which can be directly or indirectly connected to 
#' open data or use of open data published by National Institute for Health and 
#' Welfare.
#' @param indicators Dataset identifier(s)
#' @param years vector of years c(2010, 2012, ... )
#' @param genders vector of genders ('male' | 'female' | 'total')
#' @param regions filter by selected regions only (default: all regions)
#' @param region.category filter by one or more of the following 14 valid 
#' regions categories (default: all categories)
#'    \itemize{
#'      \item "ALUEHALLINTOVIRASTO"
#'      \item "ELY-KESKUS"
#'      \item "ERVA"
#'      \item "EURALUEET" (Eurozone)
#'      \item "EUROOPPA" (Europe)
#'      \item "HYVINVOINTIALUE" (welfare country)
#'      \item "KUNTA" (municipality)
#'      \item "MAA" (country)
#'      \item "MAAKUNTA" (region)
#'      \item "NUTS1"
#'      \item "POHJOISMAAT" (Nordic countries)
#'      \item "SAIRAANHOITOPIIRI (hospital district)
#'      \item "SEUTUKUNTA"
#'      \item "SUURALUE"
#'    }
#' @param user.agent "User agent" defined by the user. Default is NULL which
#'    will then use the package identifier "rOpenGov/sotkanet"
#' @return data.frame
#' @references See citation("sotkanet") 
#' @author Maintainer: Leo Lahti \email{leo.lahti@@iki.fi}, Pyry Kantanen
#' @examples \dontrun{dat <- GetDataSotkanet(indicators = 165)}
#' @seealso 
#' For more information about dataset structure, see THL webpage at
#' \url{https://yhteistyotilat.fi/wiki08/pages/viewpage.action?pageId=27557907}
#' 
#' THL open data license website: \url{https://yhteistyotilat.fi/wiki08/x/AAadAg}
#' 
#' @keywords utilities
#' @export
GetDataSotkanet <- function(indicators = NULL, 
                            years = 1991:2015, 
                            genders = c("total"), 
                            regions = NULL, 
                            region.category = NULL,
                            user.agent = NULL) {
  
  if (is.null(indicators)){
    message("Parameter 'indicators' is NULL. Please provide at least one indicator.")
    return(invisible(NULL))
  }

  # List all indicators in Sotkanet database
  sotkanet_indicators <- SotkanetIndicators(id = indicators, 
                                            type = "table")
  sotkanet_regions <- SotkanetRegions(type = "table")
  
  dats <- list()
  
  for (indicator in indicators) {
    # Gather URL parts
    # parsing the csv file is more straightforward in this context
    sotkanet_url <- "https://sotkanet.fi/rest"
    sotkanet_uri <- "/1.1/csv"
    all_params <- c(indicator, years, genders)
    names(all_params) <- c("indicator",
                           rep("years", length(years)), 
                           rep("genders", length(genders)))
    all_params <- as.list(all_params)
    
    # Construct URL
    url_object <- httr::parse_url(sotkanet_url)
    path <- paste(url_object$path, sotkanet_uri, sep = "")
    url_object$path <- path
    url_object$query <- all_params
    final_url <- httr::build_url(url_object)
    
    y <- sotkanet.csv_query(final_url, user.agent = user.agent)
    
    if (is.null(y)){
      message(paste(" There was a problem retrieving indicator from", indicator," "))
      return(invisible(NULL))
    }
    
    dats[[as.character(indicator)]] <- y
    
  }
  
  # Merge all data from the different indicators in a single table
  combined_data <- do.call("rbind", dats)

  # Add region and indicator information
  combined_data$indicator.title.fi <- sotkanet_indicators[match(combined_data$indicator, 
                                                                sotkanet_indicators$indicator), "indicator.title.fi"]
  combined_data$region.title.fi <- sotkanet_regions[match(combined_data$region, 
                                                          sotkanet_regions$region), "region.title.fi"]
  combined_data$region.code <- sotkanet_regions[match(combined_data$region, 
                                                         sotkanet_regions$region), "region.code"]
  combined_data$region.category <- sotkanet_regions[match(combined_data$region, 
                                                             sotkanet_regions$region), "region.category"]
  combined_data$indicator.organization.title.fi <- sotkanet_indicators[match(combined_data$indicator, 
                                                                             sotkanet_indicators$indicator), "indicator.organization.title.fi"]
  
  if (!is.null(regions)){
    if (regions %in% unique(combined_data$region.title.fi)){
      combined_data <- combined_data[which(combined_data$region.title.fi == regions),]
    } else {
      message(paste("Input for regions not found from dataset:", regions, "\n",
                    "Please check your parameter input for validity and correctness."))
      return(invisible(NULL))
    }
  }
  
  if (!is.null(region.category)){
    if (region.category %in% unique(combined_data$region.category)){
    combined_data <- combined_data[which(combined_data$region.category == region.category),]
    } else {
      message(paste("Input for region.categories not found from dataset:", region.category, "\n", 
                    "Please check your parameter input for validity and correctness."))
      return(invisible(NULL))
    }
  }
  
  combined_data

}



