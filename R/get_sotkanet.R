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
#'
#' @param indicators Dataset identifier(s)
#' @param years vector of years, for example `2015:2018` or `c(2010, 2012, ...)`
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
#' @param lang Language of the data variables: indicator.title, region.title
#' and indicator.organization.title. Default is Finnish ("fi"), the other options being
#' English ("en") and Swedish ("sv").
#' @param user.agent "User agent" defined by the user. Default is NULL which
#' @param cache a logical whether to do caching. Defaults is `TRUE`.
#' @param cache_dir a path to cache directory. `Null` (default) uses and creates
#'  "sotkanet" directory in the temporary directory defined by base R [tempdir()]
#'  function. The user can set the cache directory to an existing directory with this
#'  argument.
#'    will then use the package identifier "rOpenGov/sotkanet"
#' @param frictionless a logical whether to return a datapackage, with metadata inside,
#' instead of a data.frame.
#' @return Returns a data.frame when frictionless is `FALSE` and a datapackage
#' when frictionless is `TRUE`.
#' @references See citation("sotkanet")
#' @author Maintainer: Leo Lahti \email{leo.lahti@@iki.fi}, Pyry Kantanen
#' @examples \dontrun{dat <- get_sotkanet(indicators = 165)}
#' @seealso
#' For more information about dataset structure, see THL webpage at
#' \url{https://yhteistyotilat.fi/wiki08/pages/viewpage.action?pageId=27557907}
#'
#' THL open data license website: \url{https://yhteistyotilat.fi/wiki08/x/AAadAg}
#'
#'
#' @importFrom digest digest
#'
#' @keywords utilities
#' @export
get_sotkanet <- function(indicators = NULL,
                            years = 1991:2015,
                            genders = c("total"),
                            regions = NULL,
                            region.category = NULL,
                            lang = "fi",
                            user.agent = NULL,
                            cache = TRUE,
                            cache_dir = NULL,
                            frictionless = FALSE) {

  if (is.null(indicators)){
    message("Parameter 'indicators' is NULL. Please provide at least one indicator.")
    return(invisible(NULL))
  }

  #Query for caching

  query <- list(
    id = indicators,
    years = years,
    genders = genders,
    regions = regions,
    region.category = region.category,
    download_date = Sys.Date(),
    language = lang
  )

  query_hash <- digest::digest(query, algo = "md5")

  #Check if the data is in cache

  check_cache <- sotkanet_read_cache(cache = cache, cache_dir, query_hash)

  if (!is.null(check_cache)){

    if (dim(check_cache)[1] == 0){

      warning("The data.frame is empty")

    }

    if (frictionless){

      write_frictionless_metadata(indicators, check_cache)

    } else{

    return(check_cache)

    }
  }

  # List all indicators in Sotkanet database
  sotkanet_indicators <- sotkanet_indicators(id = indicators,
                                            type = "table", lang = lang)
  sotkanet_regions <- sotkanet_regions(type = "table", lang = lang)

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
  combined_data$indicator.title <- sotkanet_indicators[match(combined_data$indicator,
                                                                sotkanet_indicators$indicator), "indicator.title"]
  combined_data$region.title <- sotkanet_regions[match(combined_data$region,
                                                          sotkanet_regions$region), "region.title"]
  combined_data$region.code <- sotkanet_regions[match(combined_data$region,
                                                      sotkanet_regions$region), "region.code"]
  combined_data$region.category <- sotkanet_regions[match(combined_data$region,
                                                          sotkanet_regions$region), "region.category"]
  combined_data$indicator.organization.title <- sotkanet_indicators[match(combined_data$indicator,
                                                                             sotkanet_indicators$indicator), "indicator.organization.title"]

  if (!is.null(regions)){
    if (regions %in% unique(combined_data$region.title)){
      combined_data <- combined_data[which(combined_data$region.title == regions),]
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

  #Write the data into cache

  sotkanet_write_cache(cache, cache_dir, query_hash, combined_data)

  #Return the data in asked format

  if (dim(combined_data)[1] == 0){

    warning("The data.frame is empty")

  }

  if (frictionless){

    write_frictionless_metadata(indicators, combined_data)

  } else {

  return(combined_data)

  }
}



