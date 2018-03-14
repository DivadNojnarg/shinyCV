#' Feed a shinyCV with data.
#' This function passes all the data provided by the user to the cv viewer.
#' Launch view_shinyCV() to see the results.
#'
#'
#' @param profile The profile list containing the name, current position
#' age, interests (a vector of "Computer Sciences", "Biology", "Physiology", "Mathematics",
#' "Neurosciences", "Web-development"), website url, teaser and image of the user. None of this field
#' is mandatory. If provided, the image field should contain the path
#' to access the user profile image.
#' @param about The about dataframe containing the phone number (a string "+44 650 36 47"),
#' mail adress (a string "testatgmail.com"),
#' location as well as social network profiles, namely, linkedin, twitter,
#' facebook and github. None of this field is mandatory.
#' @param skills The skills dataframe containing the skill name and its value
#' (from 0 to 100). Each field is mandatory.
#' @param languages The language dataframe containing the language name and value
#' (from 0 to 100). Each field is mandatory.
#' @param network The network dataframe containing title, sex ("male" or "female"),
#' name, mail and phone of the network member.
#' @param formations The formations dataframe gathering the users diploma. Fields
#' are title, topic ("industry", "balance-scale", "database", "eyedropper", "heartbeat",
#' "music", "money", "paw", "paint-brush", "gamepad"), from (for instance "1900-01-01"),
#' to (for instance "1900-01-01"),
#' summary, place, supervisor, grade (number between 0 and 5) and extra
#' (web link for instance).
#' @param projects The projects dataframe containg all projects done by the user.
#' Fields are title, position, overview, supervisors and place.
#' @param tasks The tasks associated to each project (if any). It is a list of dataframes
#' each containing the following fields: name and status ("wip" or "completed"). The idea
#' is that for each project, there could be some tasks associated.
#' @param publications The publications dataframe containing the reference
#' (Your name et al., Journal Title, year), abstract and a pubmed_link.
#' @param publications_screenshots A list containing the screenshots of all
#' publications (should be the path to the image).
#' @param talks The conferences dataframe containing the title,
#' from (for instance "1900-01-01"),
#' to (for instance "1900-01-01"), summary, place, price ("yes" or "no")
#' as well as website.
#' @param courses The courses dataframe containing title, topic, nb_students (numeric),
#' nb_hours (numeric), from (for instance "1900-01-01"), to (for instance "1900-01-01"),
#' place, supervisor and syllabus (web link if any).
#' @param internships The internships dataframe containing title, topic,
#' from (for instance "1900-01-01"),
#' to (for instance "1900-01-01"), place, supervisor,
#' student_level ("bachelor", "master", "PhD" or "PostDoc") and advert (web link)
#'
#' @export
#' @examples
#'
#' # load an example dataset
#' generate_datas_shinyCV()
#'
#' feed_shinyCV(temp_profile, temp_about, temp_skills, temp_languages, temp_network, temp_formations,
#'              temp_projects, temp_tasks, temp_publications, publications_screenshots = list(),
#'              temp_talks, temp_courses, temp_internships)

feed_shinyCV <- function(profile, about, skills, languages, network,
                         formations, projects, tasks, publications,
                         publications_screenshots,
                         talks, courses, internships) {
 # some checks
 if (!is.list(profile) | is.data.frame(profile)) {
   stop(paste0("The profile object is a "), class(profile), " and should be a list.")
 }
 if (!is.list(tasks) | is.data.frame(tasks)) {
   stop(paste0("The tasks object is a "), class(tasks), " and should be a list.")
 }
 if (!is.list(publications_screenshots) | is.data.frame(publications_screenshots)) {
   stop(paste0("The publications_screenshots object is a "),
        class(publications_screenshots), " and should be a list.")
 }
 if (!is.data.frame(about)) {
   stop(paste0("The about object is a "), class(about), " and should be a dataframe.")
 }
 if (!is.data.frame(skills)) {
   stop(paste0("The skills object is a "), class(skills), " and should be a dataframe.")
 }
 if (!is.data.frame(languages)) {
   stop(paste0("The languages object is a "), class(languaes), " and should be a dataframe.")
 }
 if (!is.data.frame(network)) {
   stop(paste0("The network object is a "), class(network), " and should be a dataframe.")
 }
 if (!is.data.frame(formations)) {
   stop(paste0("The formations object is a "), class(formations), " and should be a dataframe.")
 }
 if (!is.data.frame(projects)) {
   stop(paste0("The projects object is a "), class(projects), " and should be a dataframe.")
 }
 if (!is.data.frame(publications)) {
   stop(paste0("The publications object is a "), class(publications), " and should be a dataframe.")
 }
 if (!is.data.frame(talks)) {
   stop(paste0("The talks object is a "), class(talks), " and should be a dataframe.")
 }
 if (!is.data.frame(courses)) {
   stop(paste0("The courses object is a "), class(courses), " and should be a dataframe.")
 }
 if (!is.data.frame(internships)) {
   stop(paste0("The internships object is a "), class(internships), " and should be a dataframe.")
 }

  # merge everything in a list
  datas <- list(
    my_profile = profile,
    about = about,
    skills = skills,
    languages = languages,
    network = network,
    formations = formations,
    tasks = tasks,
    projects = projects,
    publications = publications,
    publications_screenshots = publications_screenshots,
    talks = talks,
    courses = courses,
    internships = internships
  )
  return(datas)
}
