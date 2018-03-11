#' Launch the shinyCV web application to view your beautiful CV.
#' It means that you need to use the build_shinyCV function before.
#'
#' @export
#' @examples
#' view_shinyCV()

view_shinyCV <- function() {
  shiny::runApp(appDir = system.file("App", "example", package = "shinyCV"),
                display.mode = "normal")
}
