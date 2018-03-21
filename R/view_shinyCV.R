#' @title shinyCV viewer.
#' @description Launch a shinyCV web application to display your beautiful CV.
#'
#' @param cv_path The directory where your CV is stored:
#' @param cv_mode The content to display in the CV. There are currently 5
#' flavors:
#' \itemize{
#'  \item \code{"basic"}, which will display only formation and projects
#'  \item \code{"academic_light"}, which will display formation, projects, and teaching
#'  \item \code{"academic"}, which will display formation, projects, teaching and talks
#'  \item \code{"research"}, which will display formations, projects, publications and talks
#'  \item \code{"full"}, which will display the 5 tabPanels, namely formation,
#'  projects, teaching, publications and talks
#' }
#'
#' @param data_source There are 2 flavors:
#'  \itemize{
#'  \item \code{"manual"} : it means that datas need to be generated as in the example
#'   of \code{\link{feed_shinyCV}}
#'  \item \code{"from_cvbuilder"} : If you previously filled your CV
#'  with \code{\link{build_shinyCV}}
#' }
#'
#' @param datas 2 flavors:
#' \itemize{
#'  \item \code{NULL} (default) : If data_source is "manual" and if datas are NULL, an
#'  example is generated
#'  using \code{\link{generate_datas_shinyCV}}, so that you can still see how
#'  a full CV looks like
#'  \item \code{your_datas} : if datas are not NULL and data_source is "manual",
#'  datas should have the same structure as
#'  that in the list of datas returned by the \code{\link{feed_shinyCV}}
#'  function (see examples below)
#' }
#'
#' @export
#' @examples
#'
#' # datas for the profile example
#' temp_profile <<- list(
#'   my_name = "Jean Bob",
#'   my_position = "Looking for a Job",
#'   my_age = 35,
#'   my_interests = c("Mathematics", "Physics"),
#'   my_website = "http://google.com",
#'   my_teaser = "Lorem ipsum dolor sit amet, consectetur
#'   adipiscing elit, sed do eiusmod tempor
#'   incididunt ut labore et dolore magna aliqua.
#'   Ut enim ad minim veniam, quis nostrud exercitation
#'   ullamco laboris nisi ut aliquip ex ea commodo
#'   consequat. Duis aute irure dolor in reprehenderit in
#'   voluptate velit esse cillum dolore eu fugiat nulla pariatur.
#'   Excepteur sint occaecat cupidatat non proident, sunt in
#'   culpa qui officia deserunt mollit anim id est laborum.",
#'   my_image = list(
#'     src = system.file("App/cv_viewer/www/man.png", package = "shinyCV"),
#'     # very important to keep the adminLTE image border
#'     class = "profile-user-img img-responsive img-circle",
#'     alt = "User profile picture"
#'   )
#' )
#'
#' # datas for about example
#' temp_about <<- data.frame(
#'   my_phone = "+44 650 36 47",
#'   my_mail = "bobatgmail.com",
#'   my_location = "Los Angeles",
#'   my_linkedin = "linkedin",
#'   my_twitter = "twitter",
#'   my_facebook = "facebook",
#'   my_github = "github"
#' )
#'
#' # datas for skills example
#' temp_skills <<- data.frame(
#'   variable = c("R", "Javascript", "HTML"),
#'   value = c(80, 50, 60)
#' )
#'
#' # datas for language example
#' temp_languages <<- data.frame(
#'   variable = c("french", "english"),
#'   value = c(10, 90)
#' )
#'
#' # datas for network example
#' temp_network <<- data.frame(
#'   title = c("Dr.", "Pr.", ""),
#'   sex = c("male", "female", "female"),
#'   name = c("Janine", "Huguette", "Jean Raymond"),
#'   mail = c("janineatgmail.com", "huguetteatgmail.com",
#'            "raymondatgmail.com"),
#'   phone = c("+44 650 36 47", "+44 650 36 47", "+44 650 36 47")
#' )
#'
#' # datas for formation example
#' temp_formations <<- data.frame(
#'   title = c("Bachelor Degree", "Master Degree", "PhD in Biostatistics"),
#'   topic = rep("database", 3),
#'   from = rep("1900-01-01", 3),
#'   to = rep("1900-01-01", 3),
#'   summary = c("My bachelor degree", "My master degree", "My PhD"),
#'   place = rep("Somewhere", 3),
#'   supervisor = rep("Somebody", 3),
#'   grade = c(3, 4, 5),
#'   extra = rep("", 3)
#' )
#'
#' # datas for task example
#' temp_tasks <<- list(
#'   # one task dataframe per project
#'   project1 = data.frame(
#'     name = c("task 1", "task 2"),
#'     status = rep("wip", 2)
#'   ),
#'   project2 = data.frame(
#'     name = c("task 1", "task 2"),
#'     status = rep("completed", 2)
#'   ),
#'   project3 = data.frame(
#'     name = c("task 1", "task 2"),
#'     status = rep("wip", 2)
#'   ),
#'   project4 = data.frame(
#'     name = c("task 1", "task 2"),
#'     status = rep("completed", 2)
#'   )
#' )
#'
#' # datas for project example
#' temp_projects <<- data.frame(
#'   title = c("My project 1", "My_project 2",
#'             "My project 3", "My project 4"),
#'   position = c("Big Boss", "Slave", "Big Boss", "Slave"),
#'   overview = rep("an amazing project", 4),
#'   supervisors = rep("Jean Eude", 4),
#'   place = rep("Somewhere", 4)
#' )
#'
#' # datas for publications screenshots
#' demo_list <- list(
#'   class = "img-responsive pad",
#'   src = system.file("App/cv_viewer/www/text-lines.svg", package = "shinyCV"),
#'   style = "height: 100px; display: block;
#'   margin-left: auto; margin-right: auto;"
#' )
#' temp_publications_screenshots <<- list(demo_list, demo_list, demo_list)
#'
#' # data for publication example
#' temp_publications <<- data.frame(
#'   reference = rep("Your name et al., Journal Title, 2018", 3),
#'   abstract = rep("Lorem ipsum dolor sit amet, consectetur
#'                  adipiscing elit, sed do eiusmod tempor
#'                  incididunt ut labore et dolore magna aliqua.
#'                  Ut enim ad minim veniam, quis nostrud exercitation
#'                  ullamco laboris nisi ut aliquip ex ea commodo
#'                  consequat. Duis aute irure dolor in reprehenderit in
#'                  voluptate velit esse cillum dolore eu fugiat nulla pariatur.
#'                  Excepteur sint occaecat cupidatat non proident, sunt in
#'                  culpa qui officia deserunt mollit anim id est laborum.", 3),
#'   pubmed_link = rep("https://www.ncbi.nlm.nih.gov/pubmed", 3)
#'   )
#'
#'
#' # datas for talk example
#' temp_talks <<- data.frame(
#'   title = rep("My Talk", 5),
#'   from = rep("1900-01-01", 5),
#'   to = rep("1900-01-01", 5),
#'   summary = rep("Lorem ipsum dolor sit amet, consectetur
#'                 adipiscing elit, sed do eiusmod tempor
#'                 incididunt ut labore et dolore magna aliqua.
#'                 Ut enim ad minim veniam, quis nostrud exercitation
#'                 ullamco laboris nisi ut aliquip ex ea commodo
#'                 consequat. Duis aute irure dolor in reprehenderit in
#'                 voluptate velit esse cillum dolore eu fugiat nulla pariatur.
#'                 Excepteur sint occaecat cupidatat non proident, sunt in
#'                 culpa qui officia deserunt mollit anim id est laborum.", 5),
#'   place = rep("Somewhere", 5),
#'   price = c(rep("yes", 3), rep("no", 2)),
#'   website = rep("http://ggogle.com", 5)
#'   )
#'
#' # datas for course example
#' temp_courses <<- data.frame(
#'   title = rep("My course", 4),
#'   topic = rep("my topic", 4),
#'   nb_students = c(10, 100, 4, 250),
#'   nb_hours = c(5, 45, 8, 45),
#'   from = rep("1900-01-01", 4),
#'   to = rep("1900-01-01", 4),
#'   place = rep("Somewhere", 4),
#'   supervisor = rep("Somebody", 4),
#'   syllabus = rep("http://google.com", 4)
#' )
#'
#' # datas for internship example
#' temp_internships <<- data.frame(
#'   title = c("My Internship 1", "My Internship 2",
#'             "My Internship 3", "My Internship 4"),
#'   topic = rep("some topic", 4),
#'   from = rep("1900-01-01", 4),
#'   to = rep("1900-01-01", 4),
#'   place = rep("Somewhere", 4),
#'   supervisor = rep("Somebody", 4),
#'   level = c("bachelor", "master", "PhD", "PostDoc"),
#'   advert = rep("http://google.com", 4)
#' )
#'
#'
#'
#'
#' # basic shiny CV with an example dataset
#' view_shinyCV(cv_mode = "basic", data_source = "manual", datas = NULL)
#'
#' # academic shiny CV with a dataset provided by the user
#' # See the feed_shinyCV help section to build a correct dataset
#' # or use the data template above
#' feed_datas <- feed_shinyCV(profile, about, skills, languages, network,
#'                      formations, projects, tasks, publications,
#'                      publications_screenshots,
#'                      talks, courses, internships)
#' view_shinyCV(cv_mode = "academic", data_source = "manual", datas = feed_datas)
#'
#'
#' # full shiny CV with datas taken from the shiny interface build_shinyCV()
#' # in this case, the datas argument will be ignored.
#' view_shinyCV(cv_mode = "basic", data_source = "from_cvbuilder", datas = NULL)

view_shinyCV <- function(cv_path, cv_mode = "basic", data_source = "manual", datas = NULL) {
  if (is.null(cv_mode)) {
    stop("cv_mode cannot be NULL")
  }
  if (is.null(data_source)) {
    stop("data_source cannot be NULL")
  }
  if (is.null(cv_path)) {
    stop("need to give the location of your cv files")
  }

  # recover cv mode from the function argument and set
  # it as an object accessible for the view_shinyCV function
  # set it as global variable
  cv_path <<- cv_path

  cv_mode <<- match.arg(
    arg = cv_mode,
    choices = c(
      "basic",
      "full",
      "academic",
      "academic_light",
      "research"
    )
  )

  data_source <<- match.arg(
    arg = data_source,
    choices = c(
      "manual",
      "from_cvbuilder"
    )
  )

  # load datas
  if (data_source == "manual") {
    if (is.null(datas)) {
      generate_datas_shinyCV(cv_path)
      datas <<- feed_shinyCV(temp_profile, temp_about, temp_skills, temp_languages,
                             temp_network, temp_formations, temp_projects, temp_tasks,
                             temp_publications, temp_publications_screenshots,
                             temp_talks, temp_courses, temp_internships)
    } else {
      datas <<- datas
    }
  } else if (data_source == "from_cvbuilder") {

    # copy the new version of the CV before launching the viewer
    from <- system.file("App/cv_builder/www/data_cv.rds", package = "shinyCV")
    to <- cv_path
    file.copy(from = from, to = to)

    # copy the profile image to your local CV folder
    from <- system.file("App/cv_builder/www/Profile_img_saved/0.png", package = "shinyCV")
    to <- cv_path
    file.copy(from = from, to = to)

    # copy the publications screenshots from builder to your local CV folder
    from <- system.file("App/cv_builder/www/Publications_img_saved/", package = "shinyCV")
    to <- cv_path
    file_list <- list.files(from)
    lapply(seq_along(file_list), FUN = function(i) {
      from <- paste0(from, "/", file_list[i])
      file.copy(from, to)
    })
  }

  # launch the viewer
  shiny::runApp(appDir = cv_path, display.mode = "normal")
}
