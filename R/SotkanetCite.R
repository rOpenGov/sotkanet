#' @title Crate a Data Bibliography
#'
#' @param id Indicator id
#'
#' @return Biblatex object
#'
#' @examples
#' SotkanetCite(10013)
#' @export
SotkanetCite <- function(id){
  info <- SotkanetIndicatorMetadata(id)


  urldate <- as.character(Sys.Date())

  last_update_date <- lubridate::ymd(info$`data-updated`)
  last_update_year <- lubridate::year(last_update_date)

  ref <- RefManageR::BibEntry(
    bibtype = "Misc",
    title = info$title[[1]],
    url = paste0("https://sotkanet.fi/sotkanet/fi/metadata/indicators/",
                 id),
    organization = info$organization[[2]][1],
    year = last_update_year,
    author = utils::person(given = ""),
    urldate = urldate,
    type = "Dataset",
    note = stringr::str_glue(
      paste("Accessed {as.Date(urldate)},",
            "dataset last updated {as.Date(last_update_date)}")
    )
  )
  RefManageR::toBiblatex(ref)
}
