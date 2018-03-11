#' Launch the shinyCV web application to view your beautiful CV.
#' It means that you need to use the build_shinyCV function before.
#'
#' @export
#' @examples
#' view_shinyCV()

view_shinyCV <- function() {
  # copy the new version of the CV before launching the viewer
  from <- system.file("App/cv_builder/www/data_cv.rds", package = "shinyCV")
  to <- system.file("App/cv_viewer/www/", package = "shinyCV")
  file.copy(from = from, to = to)

  # launch the viewer
  shiny::runApp(appDir = system.file("App", "cv_viewer", package = "shinyCV"),
                display.mode = "normal")
}
