#' @title Crate a Data Bibliography
#'
#' @description
#' Crates a bibliography from selected Sotkanet data file.
#'
#'
#' @param id Indicator id.
#' @param lang Language for the citation. Options are English (en), Finnish (fi) and Swedish (sv).
#' @param format Default is "Biblatex", alternatives are "bibentry" or "Bibtex".
#'
#' @return a Biblatex, bibentry or Bibtex object.
#'
#' @seealso [utils::bibentry()] [RefManageR::toBiblatex()]
#'
#' @references See citation("sotkanet")
#'
#' @importFrom RefManageR toBiblatex
#' @importFrom utils toBibtex person
#' @importFrom lubridate ymd year
#' @examples
#' \dontrun{
#' SotkanetCite(10013, lang = "en", format = "Biblatex")
#' SotkanetCite(10012, lang = "fi", format = "Biblatex")
#' SotkanetCIte(10011, lang = "sv", format = "Biblatex")
#' SotkanetCite(10013, lang = "en", format = "bibentry")
#' SotkanetCite(10013, lang = "en", format = "Bibtex")
#' }
#' @export
sotkanet_cite <- function(id,
                         lang = "fi",
                         format = "Biblatex"){

  format <- tolower(as.character(format))

  info <- sotkanet_indicator_metadata(id)

  if(is.null(info)){
    stop("The id does not match with any of the datasets")
  }

  if(!any(lang %in% c("en", "fi", "sv"))){
    stop("The supported languages are English (en), Finnish (fi) and Swedish (sv).")
  }

  if(!format %in% c("bibentry", "bibtex", "biblatex")){
    warning("The ", format, " is not recognized, will return Biblatex as default.")
    format <- "biblatex"
  }



  urldate <- as.character(Sys.Date())

  last_update_date <- lubridate::ymd(info$`data-updated`)
  last_update_year <- lubridate::year(last_update_date)

  ref <- RefManageR::BibEntry(
    bibtype = "Misc",
    title = info$title[[lang]],
    url = paste0("https://sotkanet.fi/sotkanet/", lang, "/metadata/indicators/",
                 id),
    organization = info$organization[[2]][lang],
    year = last_update_year,
    author = utils::person(given = ""),
    urldate = urldate,
    type = "Dataset",
    note = paste0("Accessed ", as.Date(urldate),
            ", dataset last updated ", as.Date(last_update_date))
    )

  if(format == "bibtex"){
    ref <- utils::toBibtex(ref)
  } else if (format == "biblatex"){
    ref <- RefManageR::toBiblatex(ref)
  }
  ref
}
