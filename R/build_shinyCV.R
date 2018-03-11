#' Launch the shinyCV web application to build your beautiful CV.
#'
#' @export
#' @examples
#' build_shinyCV()

build_shinyCV <- function() {
  shiny::runApp(appDir = system.file("App", "cv_builder", package = "shinyCV"),
                display.mode = "normal")
}
