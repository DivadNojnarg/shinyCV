#' @title Dataset for shinyCV demo.
#' @description Create an example dataset. If the function \code{\link{view_shinyCV}} is called
#' with the argument datas equal to NULL and data_source set to manual, this dataset
#' will be used to show an example.
#'
#' @param cv_path The directory where your CV is stored
#'
#' @export
#' @examples
#' generate_data_shinyCV()

generate_datas_shinyCV <- function(cv_path) {

  if (is.null(cv_path)) {
    stop("need to give the location of your cv files")
  }

  # datas for the profile example
  temp_profile <<- list(
    my_name = "Jean Bob",
    my_position = "Looking for a Job",
    my_age = 35,
    my_interests = c("Mathematics", "Physics"),
    my_website = "http://google.com",
    my_teaser = "Lorem ipsum dolor sit amet, consectetur
    adipiscing elit, sed do eiusmod tempor
    incididunt ut labore et dolore magna aliqua.
    Ut enim ad minim veniam, quis nostrud exercitation
    ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in
    voluptate velit esse cillum dolore eu fugiat nulla pariatur.
    Excepteur sint occaecat cupidatat non proident, sunt in
    culpa qui officia deserunt mollit anim id est laborum.",
    my_image = list(
      src = paste0(cv_path, "/www/man.png"),
      # very important to keep the adminLTE image border
      class = "profile-user-img img-responsive img-circle",
      alt = "User profile picture"
    )
  )

  # datas for about example
  temp_about <<- data.frame(
    my_phone = "+44 650 36 47",
    my_mail = "bobatgmail.com",
    my_location = "Los Angeles",
    my_linkedin = "linkedin",
    my_twitter = "twitter",
    my_facebook = "facebook",
    my_github = "github"
  )

  # datas for skills example
  temp_skills <<- data.frame(
    variable = c("R", "Javascript", "HTML"),
    value = c(80, 50, 60)
  )

  # datas for language example
  temp_languages <<- data.frame(
    variable = c("french", "english"),
    value = c(10, 90)
  )

  # datas for network example
  temp_network <<- data.frame(
    title = c("Dr.", "Pr.", ""),
    sex = c("male", "female", "female"),
    name = c("Janine", "Huguette", "Jean Raymond"),
    mail = c("janineatgmail.com", "huguetteatgmail.com",
             "raymondatgmail.com"),
    phone = c("+44 650 36 47", "+44 650 36 47", "+44 650 36 47")
  )

  # datas for formation example
  temp_formations <<- data.frame(
    title = c("Bachelor Degree", "Master Degree", "PhD in Biostatistics"),
    topic = rep("database", 3),
    from = rep("1900-01-01", 3),
    to = rep("1900-01-01", 3),
    summary = c("My bachelor degree", "My master degree", "My PhD"),
    place = rep("Somewhere", 3),
    supervisor = rep("Somebody", 3),
    grade = c(3, 4, 5),
    extra = rep("", 3)
  )

  # datas for task example
  temp_tasks <<- list(
    # one task dataframe per project
    project1 = data.frame(
      name = c("task 1", "task 2"),
      status = rep("wip", 2)
    ),
    project2 = data.frame(
      name = c("task 1", "task 2"),
      status = rep("completed", 2)
    ),
    project3 = data.frame(
      name = c("task 1", "task 2"),
      status = rep("wip", 2)
    ),
    project4 = data.frame(
      name = c("task 1", "task 2"),
      status = rep("completed", 2)
    )
  )

  # datas for project example
  temp_projects <<- data.frame(
    title = c("My project 1", "My_project 2",
              "My project 3", "My project 4"),
    position = c("Big Boss", "Slave", "Big Boss", "Slave"),
    overview = rep("an amazing project", 4),
    supervisors = rep("Jean Eude", 4),
    place = rep("Somewhere", 4)
  )

  # datas for publications screenshots
  demo_list <- list(
    class = "img-responsive pad",
    src = paste0(cv_path, "/www/text-lines.svg"),
    style = "height: 100px; display: block;
    margin-left: auto; margin-right: auto;"
  )
  temp_publications_screenshots <<- list(demo_list, demo_list, demo_list)

 # data for publication example
  temp_publications <<- data.frame(
    reference = rep("Your name et al., Journal Title, 2018", 3),
    abstract = rep("Lorem ipsum dolor sit amet, consectetur
                   adipiscing elit, sed do eiusmod tempor
                   incididunt ut labore et dolore magna aliqua.
                   Ut enim ad minim veniam, quis nostrud exercitation
                   ullamco laboris nisi ut aliquip ex ea commodo
                   consequat. Duis aute irure dolor in reprehenderit in
                   voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                   Excepteur sint occaecat cupidatat non proident, sunt in
                   culpa qui officia deserunt mollit anim id est laborum.", 3),
    pubmed_link = rep("https://www.ncbi.nlm.nih.gov/pubmed", 3)
  )


  # datas for talk example
  temp_talks <<- data.frame(
    title = rep("My Talk", 5),
    from = rep("1900-01-01", 5),
    to = rep("1900-01-01", 5),
    summary = rep("Lorem ipsum dolor sit amet, consectetur
                  adipiscing elit, sed do eiusmod tempor
                  incididunt ut labore et dolore magna aliqua.
                  Ut enim ad minim veniam, quis nostrud exercitation
                  ullamco laboris nisi ut aliquip ex ea commodo
                  consequat. Duis aute irure dolor in reprehenderit in
                  voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                  Excepteur sint occaecat cupidatat non proident, sunt in
                  culpa qui officia deserunt mollit anim id est laborum.", 5),
    place = rep("Somewhere", 5),
    price = c(rep("yes", 3), rep("no", 2)),
    website = rep("http://google.com", 5)
  )

  # datas for course example
  temp_courses <<- data.frame(
    title = rep("My course", 4),
    topic = rep("my topic", 4),
    nb_students = c(10, 100, 4, 250),
    nb_hours = c(5, 45, 8, 45),
    from = rep("1900-01-01", 4),
    to = rep("1900-01-01", 4),
    place = rep("Somewhere", 4),
    supervisor = rep("Somebody", 4),
    syllabus = rep("http://google.com", 4)
  )

  # datas for internship example
  temp_internships <<- data.frame(
    title = c("My Internship 1", "My Internship 2",
              "My Internship 3", "My Internship 4"),
    topic = rep("some topic", 4),
    from = rep("1900-01-01", 4),
    to = rep("1900-01-01", 4),
    place = rep("Somewhere", 4),
    supervisor = rep("Somebody", 4),
    level = c("bachelor", "master", "PhD", "PostDoc"),
    advert = rep("http://google.com", 4)
  )
}
