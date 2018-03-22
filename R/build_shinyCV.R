#' @title shinyCV builder.
#' @description Launch the shinyCV web application to build your beautiful CV.
#'
#' @param import_datas \code{NULL} by default. If not, provide the path where
#' your CV files are located (see \code{\link{init_shinyCV}}). It should be
#' yourCV_path/www (do not forget www).
#' @export
#' @examples
#' build_shinyCV()

build_shinyCV <- function(import_datas = NULL) {
  # import a local CV if any since
  # each time shinyCV is reinstalled, all datas
  # are removed. With import_datas you can import
  # a CV folder stored on your computer and work on a new CV
  if (!is.null(import_datas)) {
    if (!is.character(import_datas)) stop("import_data should be a datapath")

    # import the main files
    builder_path <- system.file("App/cv_builder/www/", package = "shinyCV")
    from <- import_datas
    to <- builder_path
    file_list <- list.files(from)
    lapply(seq_along(file_list), FUN = function(i) {
      from <- paste0(from, "/", file_list[i])
      file.copy(from, to, overwrite = TRUE)
    })

    # import profile image
    from <- paste0(import_datas, "/Profile_img_saved/0.png")
    to <- paste0(builder_path, "Profile_img_saved/0.png")
    file.copy(from, to, overwrite = TRUE)

    # import publication images
    from <- paste0(import_datas, "/Publications_img_saved")
    to <- paste0(builder_path, "Publications_img_saved/")
    file_list <- list.files(from)
    lapply(seq_along(file_list), FUN = function(i) {
      from <- paste0(from, "/", file_list[i])
      file.copy(from, to, overwrite = TRUE)
    })

  }
  shiny::runApp(appDir = system.file("App", "cv_builder", package = "shinyCV"),
                display.mode = "normal")
}
