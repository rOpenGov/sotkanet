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
#' @param years vector of years, for example `2015:2018` or `c(2010, 2012, ...)`. Default
#' value is `NULL`, which gives the data from all the available years. You can give indicators
#' their own year range by giving the years in a list. See examples for demonstration.
#' @param genders vector of genders ('male' | 'female' | 'total'). Some datasets do not
#' work with only the gender value 'total' and return an empty data.frame. In these situations
#' it is advised to check out some other alternative.
#' @param regions filter by selected regions only (default: all regions). The
#' region filter has to be given in the language used for the language variable.
#' @param region.category filter by one or more of the following 15 valid
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
#'      \item "YTA"
#'    }
#' @param lang Language of the data variables: indicator.title, region.title
#' and indicator.organization.title. Default is Finnish ("fi"), the other options being
#' English ("en") and Swedish ("sv").
#' @param user.agent "User agent" defined by the user. Default is NULL which
#' will then use the package identifier "rOpenGov/sotkanet"
#' @param cache a logical whether to do caching. Defaults is `TRUE`.
#' @param cache_dir a path to cache directory. `Null` (default) uses and creates
#'  "sotkanet" directory in the temporary directory defined by base R [tempdir()]
#'  function. The user can set the cache directory to an existing directory with this
#'  argument.
#' @param frictionless a logical whether to return a datapackage, with metadata inside,
#' instead of a data.frame.
#' @return Returns a data.frame when frictionless is `FALSE` and a datapackage
#' when frictionless is `TRUE`.
#' @references See citation("sotkanet")
#' @author Maintainer: Leo Lahti \email{leo.lahti@@iki.fi}, Pyry Kantanen
#' @examples \dontrun{
#' dat <- get_sotkanet(indicators = 165)
#' dat <- get_sotkanet(indicators = c(4,5), genders = c("male", "female"))
#' dat <- get_sotkanet(indicators = 10012, regions = c("Suomi", "Ruotsi"))
#' dat <- get_sotkanet(indicators = 10012, region.category = c("POHJOISMAAT"))
#' dat <- get_sotkanet(indicators = 6, lang = "en")
#' dat <- get_sotkanet(indicators = 10027, frictionless = TRUE)
#' dat <- get_sotkanet(indicators = c(4,5,6), years = list("4" = 2000:2010,
#'                                                         "5" = 2010:2015, "6" = 2015:2020))
#' }
#' @seealso
#' For more information about dataset structure, see THL webpage at
#' \url{https://yhteistyotilat.fi/wiki08/pages/viewpage.action?pageId=27557907}
#'
#' THL open data license website: \url{https://yhteistyotilat.fi/wiki08/x/AAadAg}
#'
#'
#' @importFrom digest digest
#' @importFrom httr2 url_parse url_build
#'
#' @keywords utilities
#' @export
get_sotkanet <- function(indicators = NULL,
                            years = NULL,
                            genders = c("male", "female","total"),
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

  # Check if years is NULL

  if (is.null(years)){

    years <-list()

    for (i in 1:length(indicators)){

      ym <- sotkanet_indicator_metadata(indicators[i])
      
      if (is.null(ym)){
        message(paste(" There was a problem retrieving indicator from", indicators[i]," "))
        return(invisible(NULL))
      }

      years[[as.character(ym$id)]] <- ym$range[[1]]:ym$range[[2]]

    }

  }


  # Query for caching

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

  # Check if the data is in cache

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
                                            type = "table", lang = lang,
                                            cache = cache, cache_dir = cache_dir)
  sotkanet_regions <- sotkanet_regions(type = "table", lang = lang, cache = cache,
                                       cache_dir = cache_dir)

  dats <- list()

  for (indicator in indicators) {

    if (is.list(years)){

      years2 <- years[[as.character(indicator)]]

    } else {

      years2 <- years

    }


    # Gather URL parts
    # parsing the csv file is more straightforward in this context
    sotkanet_url <- "https://sotkanet.fi/rest"
    sotkanet_uri <- "/1.1/csv"
    all_params <- c(indicator, years2, genders)
    names(all_params) <- c("indicator",
                           rep("years", length(years2)),
                           rep("genders", length(genders)))
    all_params <- as.list(all_params)

    # Construct URL
    url_object <- httr2::url_parse(sotkanet_url)
    path <- paste(url_object$path, sotkanet_uri, sep = "")
    url_object$path <- path
    url_object$query <- all_params
    final_url <- httr2::url_build(url_object)

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
    region_check <- regions %in% unique(combined_data$region.title)
    if (all(region_check)){
      combined_data <- combined_data[which(combined_data$region.title %in% regions),]
    } else {
      message(paste("Input for regions not found from dataset:",
                    paste0(
                      ifelse(region_check, "", regions)[!region_check], collapse = ", "
                    ), "\n",
                    "Please check your parameter input for validity and correctness."))
      return(invisible(NULL))
    }
  }

  if (!is.null(region.category)){
    region.category_check <- region.category %in% unique(combined_data$region.category)
    if (all(region.category_check)){
      combined_data <- combined_data[which(combined_data$region.category %in% region.category),]
    } else {
      message(paste("Input for region.categories not found from dataset:",
                    paste0(
                      ifelse(region.category_check, "", region.category)[!region.category_check],
                      collapse = ", "), "\n",
                    "Please check your parameter input for validity and correctness."))
      return(invisible(NULL))
    }
  }

  # Remove rownames
  
  rownames(combined_data) <- NULL
  
  # Check that region.code is right length
  
  width1 <- c("ALLUEHALLINTOVIRRSTO", "ERVA", "NUTS1", "SUURALUE", "YTA")
  
  width2 <- c("HYVINVOINTIALUE", "SAIRAANHOITOPIIRI", "MAAKUNTA", "ELY-KESKUS", "EURALUEET")
  
  width3 <- c("KUNTA", "SEUTUKUNTA", "MAA", "POHJOISMAAT")
  
  width_not_ok <- c()
  
  if (!all(nchar(y[y$region.category %in% width1,]$region.code) == 1)){
    width_not_ok <- c(width_not_ok, TRUE)
  } 
  
  if (!all(nchar(y[y$region.category %in% width2,]$region.code) == 2)){
    width_not_ok <- c(width_not_ok, TRUE)
  } 
  
  if (!all(nchar(y[y$region.category %in% width3,]$region.code) == 3)){
    width_not_ok <- c(width_not_ok, TRUE)
  } 
  
  if (!all(nchar(y[y$region.category %in% "EUROOPPA",]$region.code) %in% c(1,2,3))){
    width_not_ok <- c(width_not_ok, TRUE)
  }
  
  if(any(width_not_ok)){
    message("There seems to be a problem with region codes.\nSome of them are not the right length.")
  }
  
  # Write the data into cache

  sotkanet_write_cache(cache, cache_dir, query_hash, combined_data)

  # Return the data in asked format

  if (dim(combined_data)[1] == 0){

    warning("The data.frame is empty")

  }

  if (frictionless){

    write_frictionless_metadata(indicators, combined_data)

  } else {

  return(combined_data)

  }
}

