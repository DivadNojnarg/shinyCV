#' @title publish your CV to shinyapps.io.
#' @description Send your CV to shinyapps.io. You need to have an account before,
#' and everything properly set up
#' (see \href{https://shiny.rstudio.com/articles/shinyapps.html}{How to configureshinyapps.io}).
#'
#' @param cv_path The directory where your CV is stored
#' @export
#' @examples
#' publish_shinyCV()

publish_shinyCV <- function(cv_path) {
  setwd(cv_path)
  view_mode <- "online"
  saveRDS(view_mode, file = paste0(cv_path, "/www/view_mode.rds"))
  deployApp()
}
