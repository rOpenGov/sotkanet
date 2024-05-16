#' @title Crate a Data Bibliography
#'
#' @param id Indicator id.
#' @param lang Language for the citation. Options are English (en), Finnish (fi) and Swedish (sv).
#'
#' @return Biblatex object.
#'
#' @examples
#' SotkanetCite(10013, lang = "en")
#' SotkanetCite(10012, lang = "fi")
#' SotkanetCIte(10011, lang = "sv")
#' @export
SotkanetCite <- function(id,
                         lang = "en"){

  if(!any(lang %in% c("en", "fi", "sv"))){
    stop("The supported languages are English (en), Finnish (fi) and Swedish (sv).")
  }

  if(!any(id %in% SotkanetIndicators()$indicator)){
    stop("The id does not match with any of the datasets.")
  }

  info <- SotkanetIndicatorMetadata(id)

  urldate <- as.character(Sys.Date())

  last_update_date <- lubridate::ymd(info$`data-updated`)
  last_update_year <- lubridate::year(last_update_date)

  ref <- RefManageR::BibEntry(
    bibtype = "Misc",
    title = info$title[[lang]],
    url = paste0("https://sotkanet.fi/sotkanet/fi/metadata/indicators/",
                 id),
    organization = info$organization[[2]][lang],
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
