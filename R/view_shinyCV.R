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
  # copy the profile image
  from <- system.file("App/cv_builder/www/Profile_img_saved/0.png", package = "shinyCV")
  to <- system.file("App/cv_viewer/www/Profile_img_saved/", package = "shinyCV")
  file.copy(from = from, to = to)
  # copy the publications screenshots from builder to viewer
  to <- system.file("App/cv_viewer/www/Publications_img_saved/", package = "shinyCV")
  file_list <- list.files(system.file("App/cv_builder/www/Publications_img_saved/", package = "shinyCV"))
  lapply(seq_along(file_list), FUN = function(i) {
    from <- system.file(paste0("App/cv_builder/www/Publications_img_saved/", file_list[i]),
                        package = "shinyCV")
    file.copy(from, to)
  })

  # launch the viewer
  shiny::runApp(appDir = system.file("App", "cv_viewer", package = "shinyCV"),
                display.mode = "normal")
}
