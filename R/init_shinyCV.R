#' @title create a folder for your own CV.
#' @description Copy the shinyCV viewer application to set it up in your desktop folder.
#' Using publish_shinyCV will allow you to push your CV on shinyapps.io. If you
#' want to use shiny server instead, copy the files manually.
#'
#' @param cv_path The directory where your to create your CV folder
#'
#' @export
#' @examples
#' init_shinyCV()


init_shinyCV <- function(cv_path = getwd()) {

  # create the shinyCV folder in the user desktop or update it
  main_path <- paste0(cv_path, "/MyShinyCV")
  if (!dir.exists(main_path)) {
    dir.create(path = main_path)
    dir.create(path = paste0(main_path, "/www"))
    dir.create(path = paste0(main_path, "/www/Profile_img_saved"))
    dir.create(path = paste0(main_path, "/www/Publications_img_saved"))
  }

  # copy the application skeleton
  from <- system.file("App/cv_viewer", package = "shinyCV")
  to <- main_path
  file_list <- list.files(from)
  lapply(seq_along(file_list), FUN = function(i) {
    temp_from <- paste0(from , "/", file_list[i])
    file.copy(temp_from, to)
  })

  # copy files from the www folder
  from <- system.file("App/cv_viewer/www", package = "shinyCV")
  to <- paste0(main_path, "/www")
  file_list <- list.files(from)
  lapply(seq_along(file_list), FUN = function(i) {
    temp_from <- paste0(from , "/", file_list[i])
    file.copy(temp_from, to)
  })

  # copy the profile image
  from <- system.file("App/cv_viewer/www/Profile_img_saved/0.png", package = "shinyCV")
  to <- paste0(main_path, "/www/Profile_img_saved")
  file.copy(from = from, to = to)

  # copy the publications screenshots
  from <- system.file("App/cv_viewer/www/Publications_img_saved/", package = "shinyCV")
  to <- paste0(main_path, "/www/Publications_img_saved")
  file_list <- list.files(from)
  lapply(seq_along(file_list), FUN = function(i) {
    temp_from <- paste0(from , "/", file_list[i])
    file.copy(from, to)
  })
}
