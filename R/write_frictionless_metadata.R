#' @title Writes the sotkanet data.frame in datapackage form
#'
#' @description
#' A function that turns the data.frame into a datapackage with the metadata added in.
#'
#' @param indicators Dataset identifier
#' @param data The sotkanet data.frame object
#'
#' @return datapackage
#'
#' @references See citation("sotkanet")
#' @importFrom frictionless create_package add_resource
#' @keywords internal
#' @export
write_frictionless_metadata <- function(indicators, data){

  combined_data_package <- create_package()

  combined_data_package <- add_resource(combined_data_package,
                                        resource_name = paste0("sotkanet"),
                                        data = data)

  for (i in 1:length(indicators)){

    meta <- sotkanet_indicator_metadata(indicators[i])

    sources <- list(meta$organization[2],
                    path = paste0("https://sotkanet.fi/sotkanet/en/metadata/indicators/", meta$id))

    sources <- as.list(unlist(sources))

    meta_list <- list(

      title = meta$title,

      id = meta$id,

      description = meta$description,

      homepage = "sotkanet.fi",

      sources = sources,

      updated = meta$`data-updated`
    )

    temp_list <- list()
    temp_list[[paste0("sotkanet-", meta$id)]] <- meta_list

    combined_data_package <- append(combined_data_package, temp_list)

  }

  combined_data_package <- create_package(combined_data_package)

  return(combined_data_package)

}
