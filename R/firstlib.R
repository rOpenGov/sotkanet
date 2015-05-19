#' @import ggplot2
#' @import rjson
NULL

.onAttach <- function(lib, pkg)
{

  # This may help with encodings in Mac/Linux
  # Sys.setlocale(locale = "UTF-8")
  # Sys.setlocale(locale = "WINDOWS-1252")

  packageStartupMessage("Sotkanet R tools. Copyright (C) 2013-2015 Leo Lahti, Einari Happonen, Juuso Parkkinen and Joona Lehtomaki.\n For more information, see https://github.com/ropengov/sotkanet")

}
