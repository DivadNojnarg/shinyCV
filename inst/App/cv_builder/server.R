# define server function
shinyServer(function(input, output, session) {

  # initialization of data cv.
  # If the cv has been saved previously,
  # load the last saved state instead
  data_cv <- "www/data_cv.rds"
  if (file.exists(data_cv) == TRUE) {
    # old df is not reactive
    old_df <- readRDS(data_cv)
    # create a new reactive df based on old values
    df <- reactiveValues(
      my_profile = old_df$my_profile,
      about = old_df$about,
      skills = old_df$skills,
      languages = old_df$languages,
      users = old_df$users,
      formations = old_df$formations,
      tasks = old_df$tasks,
      projects = old_df$projects,
      publications = old_df$publications,
      publications_screenshots = old_df$publications_screenshots,
      talks = old_df$talks,
      courses = old_df$courses,
      internships = old_df$internships
    )
  } else {
    df <- reactiveValues(
      my_profile = list(),
      about = data.frame(),
      skills = data.frame(),
      languages = data.frame(),
      users = data.frame(),
      formations = data.frame(),
      tasks = list(),
      projects = data.frame(),
      publications = data.frame(),
      publications_screenshots = list(),
      talks = data.frame(),
      courses = data.frame(),
      internships = data.frame()
    )
  }

  # useful for temporary storage
  temp <- reactiveValues(tasks = data.frame())

  #-------------------------------------------------------------------------
  #
  #  Profil section ...
  #
  #-------------------------------------------------------------------------

  # generate the user image if any
  output$image <- renderImage({
    my_image <- df$my_profile$my_image
    if (!is_empty(my_image)) {
      path <- my_image$datapath
      list(src = path,
           # very important to keep the adminLTE image border
           class = "profile-user-img img-responsive img-circle",
           alt = "User profile picture"
      )
    }
  }, deleteFile = FALSE)

  # each time submit profile is pressed
  # replace the profile data frame with the
  # current new one
  observeEvent(input$submit_profile,{
    temp_profile <- list(
      my_name = input$name,
      my_position = input$position,
      my_age = input$age,
      my_interests = input$interests,
      my_website = input$website_url,
      my_teaser = input$teaser,
      my_image = input$my_picture
    )
    df$my_profile <- temp_profile
  })

  # generate the profile box
  output$profilebox <- renderUI({
    input$submit_profile
    my_profile <- df$my_profile
    my_name <- my_profile$my_name
    my_position <- my_profile$my_position
    my_age <- my_profile$my_age
    my_interests <- my_profile$my_interests
    my_website <- my_profile$my_website_url
    my_teaser <- my_profile$my_teaser
    my_image <- my_profile$my_image

    profile_box(name = my_name, position = my_position, age = my_age,
                interests = my_interests, website_url = my_website,
                teaser = my_teaser, image = my_image, color = col)

  })


  #-------------------------------------------------------------------------
  #
  #  About section ...
  #
  #-------------------------------------------------------------------------

  # each time submit about is pressed
  # replace the about data frame with the
  # current new one
  observeEvent(input$submit_about,{
    temp_about <- data.frame(
      my_phone = input$phone_number,
      my_mail = input$mail,
      my_location = input$location,
      my_linkedin = input$linkedinlink,
      my_twitter = input$twitterlink,
      my_facebook = input$facebooklink,
      my_github = input$githublink
    )
    df$about <- temp_about
  })

  # generate the about box
  output$aboutbox <- renderUI({
    my_phone <- input$phone_number
    my_mail <- input$mail
    my_location <- input$location
    my_linkedin <- input$linkedinlink
    my_twitter <- input$twitterlink
    my_facebook <- input$facebooklink
    my_github <- input$githublink

    # call the about_box function
    about_box(phone = my_phone, mail = my_mail, location = my_location,
              linkedin_link = my_linkedin, twitter_link = my_twitter,
              facebook_link = my_facebook, github_link = my_github)
  })


  #-------------------------------------------------------------------------
  #
  #  skills section ...
  #
  #-------------------------------------------------------------------------

  # Generate the skills UI
  # if and only if the editor
  # switchInput is on TRUE
  output$skillsUI <- renderUI({
    if (input$skills == "skills") {
      tagList(
        textInput(inputId = "skill_name", label = "Competence:"),
        knobInput(inputId = "skill_value",
                  label = tags$span("Value:", style = "color: #FFF;"),
                  min = 0,
                  max = 100,
                  value = 50,
                  width = "75px",
                  height = "75px",
                  fgColor = "#ffec03",
                  inputColor = "#ffec03",
                  skin = "tron"),
        fluidRow(
          column(6,
                 actionBttn(inputId = "submit_skill", "Add Skill",
                            color = "success", style = "fill", size = "md")
          ),
          column(6,
                 actionBttn(inputId = "remove_skill", "Remove Skill",
                            color = "danger", style = "fill", size = "md")
          )
        ),
        textInput("skill_id", "Skill to remove")
      )
    }
  })

  # each time submit skill is pressed
  # add the new skill name and its value
  # to the skills dataframe
  observeEvent(input$submit_skill,{
    req(input$skill_name, input$skill_value)
    temp_skills <- data.frame(
      variable = input$skill_name,
      value = input$skill_value
    )
    df$skills <- rbind(df$skills, temp_skills)
  })


  # remove a skills
  observeEvent(input$remove_skill,{
    req(input$skill_id)
    name <- input$skill_id
    skills <- df$skills
    idx <- match(name, skills$variable)
    if (!is.na(idx)) {
      df$skills <- df$skills[-idx, ]
    } else {
      if (nrow(skills) > 0) {
        sendSweetAlert(session, title = "", text = "Please select a
                       skill in the list!", type = "error")
      } else {
        sendSweetAlert(session, title = "",
                       text = "No more skill to remove!", type = "error")
      }
    }
  })

  # generate the radar plot of skills
  # Secure if skill dataframe is empty
  output$skillsradar <- renderPlot({
    req(input$skill_name, input$skill_value)

    skills <- df$skills

    if (!is_empty(skills)) {
      ggplot(data = skills, aes(x = variable, y = value, fill = value)) +
        geom_bar(stat = "identity") +
        coord_polar() +
        scale_fill_viridis_c() + xlab("") + ylab("") + theme_bw()
    }
  })


  # Generate the language UI
  output$languagesUI <- renderUI({
    if (input$skills == "languages") {
      tagList(
        textInput(inputId = "language_name", label = "Language:"),
        knobInput(inputId = "language_value",
                  label = tags$span("Level:", style = "color: #FFF;"),
                  min = 0,
                  max = 100,
                  value = 50,
                  width = "75px",
                  height = "75px",
                  fgColor = "#ffec03",
                  inputColor = "#ffec03",
                  skin = "tron"),
        fluidRow(
          column(6,
                 actionBttn(inputId = "submit_language", "Add Language",
                            color = "success", style = "fill", size = "md")
          ),
          column(6,
                 actionBttn(inputId = "remove_language", "Remove Language",
                            color = "danger", style = "fill", size = "md")
          )
        ),
        textInput("language_id", "Language to remove")
      )
    }
  })

  # each time submit language is pressed
  # add the new language name and its value
  # to the language dataframe
  observeEvent(input$submit_language,{
    req(input$language_name, input$language_value)
    temp_language <- data.frame(
      variable = input$language_name,
      value = input$language_value
    )
    df$languages <- rbind(df$languages, temp_language)
  })


  # remove a language
  observeEvent(input$remove_language,{
    req(input$language_id)
    name <- input$language_id
    languages <- df$languages
    idx <- match(name, languages$variable)
    if (!is.na(idx)) {
      df$languages <- df$languages[-idx, ]
    } else {
      if (nrow(languages) > 0) {
        sendSweetAlert(session, title = "", text = "Please select a
                       language in the list!", type = "error")
      } else {
        sendSweetAlert(session, title = "",
                       text = "No more language to remove!", type = "error")
      }
    }
  })


  # Github part
  output$github_username <- renderUI({
    if (input$allow_github_calendar == TRUE) {
      tagList(
        textInput("github_name", "Your Github username", "")
      )
    }
  })

  # send github_name to javascript
  # using sendCustomMessage
  # Shiny will need Shiny.addCustomMessageHandler("myCallbackHandler"
  # in the UI part to receive this value in javascript
  observeEvent(input$github_name,{
    github_name <- input$github_name
    session$sendCustomMessage(type = "myCallbackHandler", github_name)
  })


  # generate the skills box
  output$skillsbox <- renderUI({
    input$submit_project
    input$submit_publication
    input$submit_talk
    input$submit_course
    input$submit_internship
    input$submit_user

    # skills and languages to pass to the box function
    my_skills <- df$skills
    my_languages <- df$languages

    my_github_name <- input$github_name
    github_calendar_state <- input$allow_github_calendar

    # global statistics
    total_projects <- nrow(df$projects)
    total_publications <- nrow(df$publications)
    total_conferences <- nrow(df$talks)
    total_courses <- sum(nrow(df$courses), nrow(df$internships))
    total_users <- nrow(df$users)

    # call the skill_box function
    skills_box(languages = my_languages,
               github_name = my_github_name, allow_github_calendar = github_calendar_state,
               nb_projects = total_projects, nb_publications = total_publications,
               nb_conferences = total_conferences, nb_courses = total_courses,
               nb_users = total_users)

  })

  #-------------------------------------------------------------------------
  #
  #  network section ...
  #
  #-------------------------------------------------------------------------


  # Generate the skills UI
  # if and only if the editor
  # switchInput is on TRUE
  output$networkUI <- renderUI({
    tagList(
      selectInput("user_title", label = "Title:", choices = c("", "Dr.", "Pr.")),
      selectInput(inputId = "user_sex",
                  label = "Sex:", choices = c("male", "female")),
      textInput(inputId = "user_name", label = "Name:"),
      textInput(inputId = "user_mail", label = "Mail:"),
      textInput(inputId = "user_phone", label = "Phone Number:"),

      fluidRow(
        column(6,
               actionBttn(inputId = "submit_user", "Add User",
                          color = "success", style = "fill", size = "md")
        ),
        column(6,
               actionBttn(inputId = "remove_user", "Remove User",
                          color = "danger", style = "fill", size = "md")
        )
      ),
      textInput("user_id", "User to remove")
    )
  })

  # each time submit user is pressed
  # add the new user name as well as
  # other informations
  observeEvent(input$submit_user,{
    req(input$user_name)
    temp_user <- data.frame(
      title = input$user_title,
      sex = input$user_sex,
      name = input$user_name,
      mail = input$user_mail,
      phone = input$user_phone
    )
    df$users <- rbind(df$users, temp_user)
  })


  # remove a user
  observeEvent(input$remove_user,{
    req(input$user_id)
    name <- input$user_id
    users <- df$users
    idx <- match(name, users$name)
    if (!is.na(idx)) {
      df$users <- df$users[-idx, ]
    } else {
      if (nrow(users) > 0) {
        sendSweetAlert(session, title = "", text = "Please select a
                       user in the list!", type = "error")
      } else {
        sendSweetAlert(session, title = "",
                       text = "No more user to remove!", type = "error")
      }
    }
  })

  # generate the user box
  output$networkbox <- renderUI({
    users <- df$users
    if (input$enable_network_box == TRUE) {
      # call the network_box function
      network_box(input, data = users, nb_users = nrow(users))
    }
  })


  #-------------------------------------------------------------------------
  #
  #  formation section ...
  #
  #-------------------------------------------------------------------------

  # Generate the formation UI
  # if and only if the formation part is selected
  output$formationUI <- renderUI({
    if (input$section == "formation") {
      tagList(
        tags$h3("Formation Section"),
        textInput("formation_title", label = "Title:"),
        pickerInput(
          inputId = "formation_topic",
          label = "Main Topic:",
          choices = c(
            "Industry" = "industry",
            "Law" = "balance-scale",
            "Computer Sciences" = "database",
            "Lab work" = "eyedropper",
            "health Sciences" = "heartbeat",
            "Singing" = "music",
            "Economy" = "money",
            "Veterinarian" = "paw",
            "Art" = "paint-brush",
            "Game development" = "gamepad"),
          choicesOpt = list(
            icon = c(
              "fa fa-industry",
              "fa fa-balance-scale",
              "fa fa-database",
              "fa fa-eyedropper",
              "fa fa-heartbeat",
              "fa fa-music",
              "fa fa-money",
              "fa fa-paw",
              "fa fa-paint-brush",
              "fa fa-gamepad")
          ),
          options = list(`icon-base` = "font-awesome")
        ),
        dateRangeInput("formation_date", "Date range:",
                       min    = "1900-01-01",
                       max    = Sys.Date(),
                       format = "mm/dd/yy",
                       separator = " - "),
        textAreaInput("formation_summary", "Formation descirption",
                      "Describe your formation here", width = "200px"),
        textInput("formation_location", "Place/Lab"),
        textInput("formation_supervisors", "Supervisor(s):"),
        textInput("formation_extra", label = "More details here", "Put a web link"),
        sliderInput("formation_grade", label = "Add a grade", min = 0, max = 5, value = 1),
        actionBttn(inputId = "submit_formation", "Add Formation",
                   color = "success", style = "fill", size = "md"),
        br(),
        br(),
        actionBttn(inputId = "remove_formation", "Remove Formation",
                   color = "danger", style = "fill", size = "md"),
        numericInput("formation_id", "Formation to remove", value = 1)
      )
    }
  })

  # each time submit formation is pressed
  # add the new formation name and its value
  # to the formations dataframe
  observeEvent(input$submit_formation,{
    req(input$formation_date, input$formation_topic, input$formation_title,
        input$formation_summary, input$formation_location)
    temp_formation <- data.frame(
      title = input$formation_title,
      topic = input$formation_topic,
      from = input$formation_date[1],
      to = input$formation_date[2],
      summary = input$formation_summary,
      place = input$formation_location,
      supervisor = input$formation_supervisors,
      grade = input$formation_grade,
      extra = input$formation_extra
    )
    df$formations <- rbind(df$formations, temp_formation)
  })

  # remove a formation
  observeEvent(input$remove_formation,{
    req(input$formation_id)
    idx <- input$formation_id
    if (nrow(df$formations) > 0) {
      if (idx > nrow(df$formations)) {
        sendSweetAlert(session, title = "", text = "Please select a
                       formation in the list!", type = "error")
      } else {
        df$formations <- df$formations[-idx, ]
      }
    } else {
      sendSweetAlert(session, title = "", text = "There is no formation to
                     delete", type = "error")
    }
  })

  # Render the formation timeLine
  output$formation_timeline <- renderUI({
    formations <- df$formations
    if (!is_empty(formations)) {
      tagList(
        timelineBox(
          lapply(seq_along(formations$title), FUN = function(i) {
            title <- formations$title[i]
            topic <- formations$topic[i]
            from <- formations$from[i]
            to <- if (is.na(formations$to[i])) "Now" else formations$to[i]
            summary <- formations$summary[i]
            place <- formations$place[i]
            supervisor <- formations$supervisor[i]
            grade <- formations$grade[i]
            extra <- formations$extra[i]
            list(
              timelineLabel(
                text = HTML(paste0("<b>", from, "//", "<br/>", to, "</b>")), color = col[i]
              ),
              timelineItem(
                icon = icon(name = topic, class = paste0("bg-", col[i])),
                header = if (length(grade) > 0) {
                  HTML(
                    paste0(
                      title,
                      tags$td(class = "mailbox-star",
                              tags$a(href = "#",
                                     if (grade < 5) {
                                       empty_star <- lapply(1:(5 - grade), FUN = function(i) {
                                         tags$i(class = "fa fa-star-o text-yellow pull-right")
                                       })
                                     },
                                     if (grade > 0) {
                                       full_star <- lapply(1:grade, FUN = function(i) {
                                         tags$i(class = "fa fa-star text-yellow pull-right")
                                       })
                                     }
                              )
                      )
                    )
                  )
                } else {
                  title
                },
                body = if (length(supervisor) > 0) {
                  HTML(paste0(summary, tags$br(), tags$br(), "<u>", "Advisors: ",
                              "</u>", "<b>", supervisor, "</b>"))
                } else {
                  summary
                },
                itemIcon = shiny::icon("street-view"),
                footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>'),
                itemText = place
              )
            )
          })
        )
      )
    }
  })

  #-------------------------------------------------------------------------
  #
  #  experience section ...
  #
  #-------------------------------------------------------------------------

  # Generate the projects UI
  # if and only if the experience
  # section is selected
  output$projectsUI <- renderUI({
    if (input$section == "experience") {
      tagList(
        tags$h3("Experience Section"),
        textInput(inputId = "project_title", label = "Project Title:"),
        textInput(inputId = "project_position", label = "Position in the project:"),
        textAreaInput(inputId = "project_overview", label = "Overview"),
        textInput(inputId = "project_supervisors", label = "Advisors:"),
        textInput(inputId = "project_place", label = "Place/Lab:"),
        br(),
        br(),
        h5(class = "text-center", "Task submenu"),
        textInput(inputId = "task_name", label = "Task Name:"),
        selectInput(inputId = "task_status", label = "Task Status:",
                    choices = c("Work in progress" = "wip",
                                "Completed" = "completed")),
        actionBttn(inputId = "submit_task", "Add Task",
                   color = "success", style = "fill", size = "md"),
        br(),
        br(),
        h5(class = "text-center", "Project submenu"),
        actionBttn(inputId = "submit_project", "Add Project",
                   color = "success", style = "fill", size = "md"),
        br(),
        br(),
        actionBttn(inputId = "remove_project", "Remove project",
                   color = "danger", style = "fill", size = "md"),
        br(),
        br(),
        numericInput("project_id", "Project to remove", value = 1)
      )
    }
  })

  #each time submit task is pressed
  # add the new task name as well as
  # other informations
  observeEvent(input$submit_task,{
    req(input$task_name, input$task_status)
    current_task <- data.frame(
      name = input$task_name,
      status = input$task_status
    )
    temp$tasks <- rbind(temp$tasks, current_task)
  })

  # each time submit project is pressed
  # add the new project name as well as
  # other informations
  observeEvent(input$submit_project,{
    req(input$project_title, input$project_position, input$project_overview,
        input$project_supervisors, input$project_place)
    temp_project <- data.frame(
      title = input$project_title,
      position = input$project_position,
      overview = input$project_overview,
      supervisors = input$project_supervisors,
      place = input$project_place
    )
    df$projects <- rbind(df$projects, temp_project)
    df$tasks[[length(df$tasks) + 1]] <- temp$tasks
    temp$tasks <- data.frame()
  })

  # remove a project
  observeEvent(input$remove_project,{
    req(input$project_id)
    idx <- input$project_id
    if (nrow(df$projects) > 0) {
      if (idx > nrow(df$projects)) {
        sendSweetAlert(session, title = "", text = "Please select a
                       project in the list!", type = "error")
      } else {
        df$projects <- df$projects[-idx, ]
        # remove the tasks element(s) related to
        # the deleted project
        df$tasks[[idx]] <- NULL
      }
    } else {
      sendSweetAlert(session, title = "", text = "There is no project to
                     delete", type = "error")
    }
  })

  # render the project section
  output$experience <- renderUI({
    projects <- df$projects
    if (!is_empty(projects)) {
      tagList(
        lapply(seq_along(projects$title), FUN = function(i) {
          title <- projects$title[i]
          position <- projects$position[i]
          overview <- projects$overview[i]
          supervisors <- projects$supervisors[i]
          place <- projects$place[i]
          # call the project_box function and pass it all
          # the previous arguments
          project_box(input, images = project_images, background_color = col[i],
                      title = title, position = position, overview = overview,
                      supervisors = supervisors, place = place, tasks = df$tasks[[i]],
                      box_index = i)
        })
      )
    }
  })


  #-------------------------------------------------------------------------
  #
  #  publications section ...
  #
  #-------------------------------------------------------------------------

  # Generate the publications UI
  # if and only if the publications
  # section is selected
  output$publicationsUI <- renderUI({
    if (input$section == "publications") {
      tagList(
        tags$h3("Publications Section"),
        textInput(inputId = "publication_reference", label = "Short Reference:"),
        fileInput(inputId = "publication_screenshot", label = "Screenshot:"),
        textAreaInput(inputId = "publication_abstract", label = "Abstract",
                      "Write your abstract here"),
        textInput(inputId = "publication_pubmed", label = "Link to pubmed:"),
        actionBttn(inputId = "submit_publication", "Add Publication",
                   color = "success", style = "fill", size = "md"),
        br(),
        br(),
        actionBttn(inputId = "remove_publication", "Remove publication",
                   color = "danger", style = "fill", size = "md"),
        br(),
        br(),
        numericInput("publication_id", "Publication to remove", value = 1)
      )
    }
  })

  # render the uploaded images (works but not really nice)
  observe({
    screenshots <- df$publications_screenshots
    lapply(seq_along(screenshots), FUN = function(i) {
      output[[paste0("screenshot", i)]] <- renderImage({
        path <- screenshots[[i]]$src
        list(
          src = path,
          class = "img-responsive pad"
        )
      }, deleteFile = FALSE)
    })
  })





  # each time submit publication is pressed
  # add the new publication name as well as
  # other informations
  observeEvent(input$submit_publication,{
    req(input$publication_reference, input$publication_pubmed,
        input$publication_screenshot)
    temp_publication <- data.frame(
      reference = input$publication_reference,
      abstract = input$publication_abstract,
      pubmed_link = input$publication_pubmed
    )

    df$publications <- rbind(df$publications, temp_publication)

    # add the new publication screenshot if any
    temp_inFile <- input$publication_screenshot
    if (!is.null(temp_inFile)) {
      temp_path <- temp_inFile$datapath
      temp_screenshot <- list(
        src = temp_path,
        class = "img-responsive pad"
      )
    } else {
      temp_screenshot <- list(
        src = NULL,
        class = NULL
      )
    }
    len <- length(df$publications_screenshots)
    df$publications_screenshots[[len + 1]] <- temp_screenshot
  })


  # remove a publication
  observeEvent(input$remove_publication,{
    req(input$publication_id)
    idx <- input$publication_id
    if (nrow(df$publications) > 0) {
      if (idx > nrow(df$publications)) {
        sendSweetAlert(session, title = "", text = "Please select a
                       publication in the list!", type = "error")
      } else {
        df$publications <- df$publications[-idx, ]
        df$publications_screenshots[[idx]] <- NULL
      }
    } else {
      sendSweetAlert(session, title = "", text = "There is no publication to
                     delete", type = "error")
    }
    })

  # render the project section
  output$publications <- renderUI({
    publications <- df$publications
    screenshots <- df$publications_screenshots
    if (!is_empty(publications)) {
      tagList(
        lapply(seq_along(publications$reference), FUN = function(i) {
          reference <- publications$reference[i]
          abstract <- publications$abstract[i]
          pubmed_link <- publications$pubmed_link[i]
          screenshot <- if (!is.null(screenshots[[i]]$src)) screenshots[[i]]$src else NULL

          # call the publication_box function and pass it all
          # the previous arguments
          publication_box(input, reference, abstract, pubmed_link, screenshot,
                          box_index = i)
        })
      )
    }
  })



  #-------------------------------------------------------------------------
  #
  #  talks section ...
  #
  #-------------------------------------------------------------------------

  # Generate the talks UI
  # if and only if the talk
  # section is selected
  output$talksUI <- renderUI({
    if (input$section == "conferences") {
      tagList(
        tags$h3("Conferences Section"),
        textInput("talk_title", label = "Title:"),
        prettyRadioButtons(inputId = "talk_price", label = "Award:",
                            choices = c("yes", "no"), animation = "pulse",
                            thick = TRUE, bigger = TRUE, inline = TRUE),
        dateRangeInput("talk_date", "Date range:",
                       min    = "1900-01-01",
                       max    = Sys.Date(),
                       format = "mm/dd/yy",
                       separator = " - "),
        textAreaInput("talk_summary", "Talks description",
                      "Describe your conference here", width = "200px"),
        textInput("talk_location", "Place"),
        textInput("talk_website", "Conference Website"),
        actionBttn(inputId = "submit_talk", "Add Talk",
                   color = "success", style = "fill", size = "md"),
        br(),
        br(),
        actionBttn(inputId = "remove_talk", "Remove Talk",
                   color = "danger", style = "fill", size = "md"),
        numericInput("talk_id", "Talk to remove", value = 1)
      )
    }
  })

  # each time submit talk is pressed
  # add the new talk name and its value
  # to the talks dataframe
  observeEvent(input$submit_talk,{
    req(input$talk_title, input$talk_summary, input$talk_date, input$talk_location)
    temp_talk <- data.frame(
      title = input$talk_title,
      from = input$talk_date[1],
      to = input$talk_date[2],
      summary = input$talk_summary,
      place = input$talk_location,
      price = input$talk_price,
      website = input$talk_website
    )
    df$talks <- rbind(df$talks, temp_talk)
  })

  # remove a talk
  observeEvent(input$remove_talk,{
    req(input$talk_id)
    idx <- input$talk_id
    if (nrow(df$talks) > 0) {
      if (idx > nrow(df$talks)) {
        sendSweetAlert(session, title = "", text = "Please select a
                       talk in the list!", type = "error")
      } else {
        df$talks <- df$talks[-idx, ]
      }
    } else {
      sendSweetAlert(session, title = "", text = "There is no talk to
                     delete", type = "error")
    }
    })

  # Render the conference timeLine
  output$talk_timeline <- renderUI({
    talks <- df$talks
    if (!is_empty(talks)) {
      tagList(
        timelineBox(
          lapply(seq_along(talks$title), FUN = function(i) {
            title <- talks$title[i]
            from <- talks$from[i]
            to <- if (is.na(talks$to[i])) "Now" else talks$to[i]
            summary <- talks$summary[i]
            place <- talks$place[i]
            price <- talks$price[i]
            website <- talks$website[i]
            list(
              timelineLabel(
                text = HTML(paste0("<b>", from, "//", "<br/>", to, "</b>")), color = "light-blue"
              ),
              timelineItem(
                icon = icon(name = "microphone", class = paste0("bg-", "light-blue")),
                header = if (length(price) > 0) {
                  HTML(paste0(title, tags$p(class = "pull-right", icon("trophy"))))
                } else {
                  title
                },
                body = summary,
                itemIcon = shiny::icon("street-view"),
                footer = tags$a(class = "btn btn-primary btn-xs",
                                href = website, target = "_blank", "Read more"),

                itemText = place
              )
            )
          })
        )
      )
    }
  })


  #-------------------------------------------------------------------------
  #
  #  Teaching section ...
  #
  #-------------------------------------------------------------------------

  # Generate the teaching UI
  # if and only if the teaching
  # section is selected
  output$teachingUI <- renderUI({
    if (input$section == "teaching") {
      if (input$teaching_type == "course") {
        tagList(
          textInput(inputId = "course_title", label = "Title:"),
          textInput(inputId = "course_topic", label = "Topic:"),
          textInput(inputId = "course_location", label = "Location:"),
          numericInput(inputId = "course_nbstudents", label = "Students number:", value = 1),
          numericInput(inputId = "course_nbhours", label = "Hours number:", value = 1),
          dateRangeInput("course_date", "Date range:",
                         min    = "1900-01-01",
                         max    = Sys.Date(),
                         format = "mm/dd/yy",
                         separator = " - "),
          textInput(inputId = "course_supervisor", label = "Main Advisor:"),
          textInput(inputId = "course_syllabus", label = "Syllabus:"),
          actionBttn(inputId = "submit_course", "Add course",
                     color = "success", style = "fill", size = "md"),
          br(),
          br(),
          actionBttn(inputId = "remove_course", "Remove course",
                     color = "danger", style = "fill", size = "md"),
          br(),
          br(),
          numericInput("course_id", "Course to remove", value = 1)
        )
      } else {
        tagList(
          textInput(inputId = "internship_title", label = "Title:"),
          textInput(inputId = "internship_topic", label = "Topic:"),
          textInput(inputId = "internship_location", label = "Location:"),
          dateRangeInput("internship_date", "Date range:",
                         min    = "1900-01-01",
                         max    = Sys.Date(),
                         format = "mm/dd/yy",
                         separator = " - "),
          textInput(inputId = "internship_supervisor", label = "Main Advisor:"),
          selectInput(inputId = "internship_level", label = "Internship Level:",
                      choices = c("bachelor", "master", "PhD", "PostDoc")),
          textInput(inputId = "internship_advert", label = "Advert:"),
          actionBttn(inputId = "submit_internship", "Add internship",
                     color = "success", style = "fill", size = "md"),
          br(),
          br(),
          actionBttn(inputId = "remove_internship", "Remove internship",
                     color = "danger", style = "fill", size = "md"),
          br(),
          br(),
          numericInput("internship_id", "internship to remove", value = 1)
        )
      }
    }
  })

  # each time submit course is pressed
  # add the new course name and its value
  # to the courses dataframe
  observeEvent(input$submit_course,{
    req(input$course_title, input$course_topic, input$course_location,
        input$course_nbstudents, input$course_nbhours,
        input$course_date, input$course_supervisor)
    temp_course <- data.frame(
      title = input$course_title,
      topic = input$course_topic,
      nb_students = input$course_nbstudents,
      nb_hours = input$course_nbhours,
      from = input$course_date[1],
      to = input$course_date[2],
      place = input$course_location,
      supervisor = input$course_supervisor,
      syllabus = input$course_syllabus
    )
    df$courses <- rbind(df$courses, temp_course)
    print(df$courses)
  })

  # remove a course
  observeEvent(input$remove_course,{
    req(input$course_id)
    idx <- input$course_id
    if (nrow(df$courses) > 0) {
      if (idx > nrow(df$courses)) {
        sendSweetAlert(session, title = "", text = "Please select a
                       course in the list!", type = "error")
      } else {
        df$courses <- df$courses[-idx, ]
      }
    } else {
      sendSweetAlert(session, title = "", text = "There is no course to
                     delete", type = "error")
    }
  })

  # each time submit internship is pressed
  # add the new course name and its value
  # to the internships dataframe
  observeEvent(input$submit_internship,{
    req(input$internship_title, input$internship_topic, input$internship_location,
        input$internship_date, input$internship_supervisor, input$internship_level)
    temp_internship <- data.frame(
      title = input$internship_title,
      topic = input$internship_topic,
      from = input$internship_date[1],
      to = input$internship_date[2],
      place = input$internship_location,
      supervisor = input$internship_supervisor,
      level = input$internship_level,
      advert = input$internship_advert
    )
    df$internships <- rbind(df$internships, temp_internship)
    print(df$internships)
  })

  # remove a course
  observeEvent(input$remove_internship,{
    req(input$internship_id)
    idx <- input$internship_id
    if (nrow(df$internships) > 0) {
      if (idx > nrow(df$internships)) {
        sendSweetAlert(session, title = "", text = "Please select an
                       internship in the list!", type = "error")
      } else {
        df$internships <- df$internships[-idx, ]
      }
    } else {
      sendSweetAlert(session, title = "", text = "There is no internship to
                     delete", type = "error")
    }
    })

  # render the teaching boxes
  output$teaching <- renderUI({
    if (input$teaching_type == "course") {
      courses <- df$courses
      if (!is_empty(courses)) {
        tagList(
          lapply(seq_along(courses$title), FUN = function(i) {
            title <- courses$title[i]
            topic <- courses$topic[i]
            nb_students <- courses$nb_students[i]
            nb_hours <- courses$nb_hours[i]
            from <- courses$from[i]
            to <- if (is.na(courses$to[i])) "Now" else courses$to[i]
            place <- courses$place[i]
            supervisor <- courses$supervisor[i]
            syllabus <- if (is.na(courses$syllabus[i])) NULL else courses$syllabus[i]

            # call the course_box function and pass it all
            # the previous arguments
            course_box(input, title, topic, nb_students, nb_hours, from, to,
                       place, supervisor, syllabus, box_index = i)
          })
        )
      }

    } else {
      internships <- df$internships
      if (!is_empty(internships)) {
        tagList(
          lapply(seq_along(internships$title), FUN = function(i) {
            title <- internships$title[i]
            topic <- internships$topic[i]
            from <- internships$from[i]
            to <- if (is.na(internships$to[i])) "Now" else internships$to[i]
            place <- internships$place[i]
            supervisor <- internships$supervisor[i]
            level <- internships$level[i]
            advert <- if (is.na(internships$advert[i])) NULL else internships$advert[i]

            # call the internship_box function and pass it all
            # the previous arguments
            internship_box(input, title, topic, from , to, place,
                           supervisor, level, advert, box_index = i)
          })
        )
      }

    }
  })

  #-------------------------------------------------------------------------
  #
  #  main_box section ...
  #
  #-------------------------------------------------------------------------

  # need to enable/disable several tabPanels
  # Some users probably do not need
  # awards, talks and publications panels
  output$main_box <- renderUI({
    main_box(input)
  })

  #-------------------------------------------------------------------------
  #
  #  Useful tasks such as save, reset, load ...
  #
  #-------------------------------------------------------------------------

  # save the cv
  observeEvent(input$save,{
    saveRDS(object = reactiveValuesToList(df), file = "www/data_cv.rds")
  })

  # erase the whole cv
  observeEvent(input$reset,{
    file.remove("www/data_cv.rds")
  })

  # Custom footer
  output$dynamicFooter <- renderFooter({
    dashboardFooter(
      mainText = h5(
        "2017, David Granjon, Zurich.",
        "Built with",
        img(src = "https://www.rstudio.com/wp-content/uploads/2014/04/shiny.png", height = "30"),
        "by",
        img(src = "https://www.rstudio.com/wp-content/uploads/2014/07/RStudio-Logo-Blue-Gray.png", height = "30"),
        "and with", img(src = "love.png", height = "30")),
      subText = HTML("<b>Version</b> 0.5")
    )
  })

  # Set this to "force" instead of TRUE for testing locally (without Shiny Server)
  # Only works with shiny server > 1.4.7
  session$allowReconnect(TRUE)

})
