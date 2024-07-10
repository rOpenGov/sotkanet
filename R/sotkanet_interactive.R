#' Interactive function for get_sotkanet
#'
#' @description
#' A simple interactive function, that helps with downloading Sotkanet data
#'
#' @param code
#' A unique identifier for the dataset of interest.
#'
#' @seealso [get_sotkanet()]
#'
#' @importFrom utils capture.output
#' @importFrom utils menu
#' @export
sotkanet_interactive <- function(code = NULL){

  lang_selection <- switch(
    menu(c("Finnish", "English", "Swedish"),
         title = "Select language") + 1,
    return(invisible()),
    "fi",
    "en",
    "sv"
  )

  if(is.null(code)) {
    search_id <- readline(prompt = "Enter search id for the data: ")
    results <- sotkanet_indicator_metadata(search_id)


    if (!is.null(results)){

      choice <- switch(
        menu(choices = c(results$title[lang_selection], "No"),
             title = "Is this the right dataset?") + 1,
             return(invisible()),
             TRUE,
             FALSE
      )

      if (!choice){
        return(invisible())
      }

    } else {
      stop(paste0("\nNo data found with the given search id: "), search_id)
    }

  }

  download_selection <- switch(
    menu(choices = c("Yes", "No"),
         title = "Download the dataset?") + 1,
    return(invisible()),
    TRUE,
    FALSE
  )

  manual_selection <- FALSE

  if(download_selection){
    manual_selection <- switch(
      menu(choices = c("Default", "Manually selected"),
           title = "Would you like to use default arguments or manually select them?") +1,
      return(invisible()),
      FALSE,
      TRUE
    )

    if (manual_selection) {
      years_selection_begin <- readline(prompt = "Enter the beginning year for the data: ")
      years_selection_end <- readline(prompt = "Enter the ending year for the data: ")

      years_selection_begin <- as.integer(years_selection_begin)
      years_selection_end <- as.integer(years_selection_end)

      years <- years_selection_begin:years_selection_end

      gender_selection <- switch(
        menu(choices = c("Male", "Female", "Male & Female", "Total", "All"),
             title = "Which genders do you want for the data?") + 1,
        return(invisible()),
        c("male"),
        c("female"),
        c("male", "female"),
        c("total"),
        c("male", "female", "total")
      )

      # region_selection <- readline(prompt = "Enter the regions (empty for default): ")
      #
      # region.category_selection <- readline(prompt = "Enter the region.category (empty for default): ")
      #
      # if (region_selection == ""){
      #   region_selection <- NULL
      # }
      #
      # if (region.category_selection == ""){
      #   region.category_selection <- NULL
      # }


      sotkanet_data <- get_sotkanet(indicators = search_id,
                                       years = years,
                                       genders = gender_selection,
                                       lang = lang_selection)



    } else if (!manual_selection){
      sotkanet_data <- get_sotkanet(indicators = search_id,
                                    lang = lang_selection)

    }

  }

  tempfile_for_sink <- tempfile()

  print_citation <- switch(
    menu(choices = c("Yes", "No"),
         title = "Print dataset citation?") + 1,
    return(invisible()),
    TRUE,
    FALSE
  )

  if (print_citation){
    citation <- sotkanet_cite(id = search_id,
                             lang = lang_selection)
    capture.output(cat("#### DATASET CITATION: \n\n"),
                   file = tempfile_for_sink, append = TRUE)
    capture.output(print(citation),
                   file = tempfile_for_sink, append = TRUE)
    capture.output(cat("\n"),
                   file = tempfile_for_sink, append = TRUE)
  }

  print_code <- switch(
    menu(choices = c("Yes", "No"),
         title = "Print the code for downloading dataset?") + 1,
    return(invisible()),
    TRUE,
    FALSE
  )

  if (print_code == TRUE && manual_selection == TRUE){
    capture.output(cat("#### DOWNLOAD PARAMETERS: \n\n"),
                   file = tempfile_for_sink, append = TRUE)

    capture.output(print(
      paste0("get_sotkanet(indicators = ", search_id,
             ", years = ", years[1], ":", years[length(years)],
             ", genders = ", paste0("c(", "'",
                                    paste0(gender_selection, collapse = "', '"), "')"),
             ", regions = NULL, region.category = NULL",
             ", lang = ", "'", lang_selection, "'", ")")
      ), file = tempfile_for_sink, append = TRUE)
    capture.output(cat("\n"), file = tempfile_for_sink, append = TRUE)

  } else if (print_code == TRUE && manual_selection == FALSE){
    capture.output(cat("#### DOWNLOAD PARAMETERS: \n\n"),
                   file = tempfile_for_sink, append = TRUE)
    capture.output(print(
      paste0("get_sotkanet(indicators = ", search_id,
             ", lang = ", "'", lang_selection, "'", ")")
    ), file = tempfile_for_sink, append = TRUE)
    capture.output(cat("\n"), file = tempfile_for_sink, append = TRUE)
  }

  if (exists("sotkanet_data")){
    print_fixity <- switch(
      menu(choices = c("Yes", "No"),
           title = "Print dataset fixity checksum?") + 1,
      return(invisible()),
      TRUE,
      FALSE
    )

    if (print_fixity){
      fixity <- sotkanet_fixity(sotkanet_data, algorithm = "md5")
      capture.output(cat("#### FIXITY CHECKSUM: \n\n"),
                     file = tempfile_for_sink, append = TRUE)
      capture.output(print(
        paste0("Fixity checksum (md5) for dataset ", search_id, ": ",
               fixity)
      ), file = tempfile_for_sink, append = TRUE)
      capture.output(cat("\n"), file = tempfile_for_sink, append = TRUE)
    }
  }

  if (exists("sotkanet_data")){
    if (print_code || print_citation || print_fixity) {
      cat(readLines(tempfile_for_sink), sep = "\n")
    }
    return(sotkanet_data)
  }

}
