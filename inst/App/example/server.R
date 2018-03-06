# define server function
shinyServer(function(input, output, session) {

  # initialization skills, languages and users dataframe reactiveValues
  df <- reactiveValues(skills = data.frame(),
                       language = data.frame(),
                       users = data.frame(),
                       formations = data.frame())

  # take random adminLTE colors (I remove black)
  col <- sample(
    c("light-blue", "aqua", "green", "orange",
      "purple", "maroon", "gray", "teal",
      "navy", "red", "yellow")
  )

  #-------------------------------------------------------------------------
  #
  #  Profil section ...
  #
  #-------------------------------------------------------------------------

  output$image <- renderImage({
    req(input$my_picture)
    inFile <- input$my_picture
    path <- inFile$datapath
    list(src = path,
         # very important to keep the adminLTE image border
         class = "profile-user-img img-responsive img-circle",
         alt = "User profile picture")
  }, deleteFile = FALSE)

  output$name <- renderText({
    req(input$name)
    input$name
  })

  output$position <- renderText({
    req(input$position)
    input$position
  })

  output$website <- renderUI({
    req(input$website_url)
    website_url <- input$website_url
    tagList(
      a(href = website_url, class = "btn btn-primary btn-block",
        target = "_blank", "website")
    )
  })

  output$age <- renderText({
    req(input$age)
    input$age
  })

  output$interests <- renderUI({
    req(input$interests)
    tagList(
      lapply(seq_along(input$interests), FUN = function(i) {
        interest <- input$interests[[i]]
        tags$span(class = paste0("bg-", col[i], "-active color-palette"), interest)
      })
    )
  })

  # add a description to tease yourself
  output$teaser <- renderText({
    req(input$teaser)
    input$teaser
  })


  #-------------------------------------------------------------------------
  #
  #  About section ...
  #
  #-------------------------------------------------------------------------

  output$cellphone <- renderText({
    req(input$phone_number)
    input$phone_number
  })

  output$mailadress <- renderUI({
    req(input$mail)
    tagList(
      a(href = paste0("mailto:", input$mail), target = "_top", "Contact me!")
    )
  })

  output$location <- renderText({
    req(input$location)
    input$location
  })


  output$linkedinprofile <- renderUI({
    req(input$twitterlink)
    tagList(
      a(href = input$linkedinlink, target = "_blank",
        tags$span(class = "label label-info",
                  HTML(paste(icon("linkedin"),"Linkedin"))
        )
      )
    )
  })

  output$twitterprofile <- renderUI({
    req(input$twitterlink)
    tagList(
      a(href = input$twitterlink, target = "_blank",
        tags$span(class = "label label-info",
                  HTML(paste(icon("twitter-square"),"Twitter"))
        )
      )
    )
  })

  output$facebookprofile <- renderUI({
    req(input$facebooklink)
    tagList(
      a(href = input$facebooklink, target = "_blank",
        tags$span(class = "label label-primary",
                  HTML(paste(icon("facebook-square"),"Facebook"))
        )
      )
    )
  })

  output$githubprofile <- renderUI({
    req(input$githublink)
    tagList(
      a(href = input$githublink, target = "_blank",
        tags$span(class = "label label-success",
                  HTML(paste(icon("github-square"),"Github"))
        )
      )
    )
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
    if (input$add_skill == TRUE) {
      tagList(
        textInput(inputId = "skill_name", label = "Competence:"),
        knobInput(inputId = "skill_value",
                  label = tags$span("Value:", style = "color: #FFF;"),
                  min = 0,
                  max = 100,
                  value = 50,
                  width = 75,
                  fgColor = "#ffec03",
                  inputColor = "#ffec03",
                  skin = "tron"),
        actionBttn(inputId = "submit_skill", "Add Skill")
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

  # generate the radar plot of skills
  # Secure if skill dataframe is empty
  output$skillsradar <- renderPlot({
    req(input$skill_name, input$skill_value)

    data <- df$skills

    if (!is_empty(data)) {
      ggplot(data = data, aes(x = variable, y = value, fill = value)) +
        geom_bar(stat = "identity") +
        coord_polar() +
        scale_fill_viridis_c() + xlab("") + ylab("") + theme_bw()
    }
  })


  # Generate the language UI
  output$languagesUI <- renderUI({
    if (input$add_language == TRUE) {
      tagList(
        textInput(inputId = "language_name", label = "Language:"),
        knobInput(inputId = "language_value",
                  label = tags$span("Level:", style = "color: #FFF;"),
                  min = 0,
                  max = 100,
                  value = 50,
                  width = 75,
                  fgColor = "#ffec03",
                  inputColor = "#ffec03",
                  skin = "tron"),
        actionBttn(inputId = "submit_language", "Add Language")
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
    df$language <- rbind(df$language, temp_language)
  })

  # language progress bars are dynamically generated
  output$languagelevel <- renderUI({
    data <- df$language
    if (!is_empty(data)) {
      tagList(
        lapply(seq_along(data$value), FUN = function(i) {
          val <- data$value[i]
          name <- data$variable[i]
          id <- paste0("language", i)
          progressBar(
            id = id, value = val,
            # set a status color code
            status = if (val >= 0 & val < 25) {
              "danger"
            } else if (val >= 25 & val < 75) {
              "warning"
            } else if (val >= 75 & val <= 100) {
              "success"
            },
            title = name,
            striped = TRUE,
            size = "xs")
        })
      )
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

  # Show the github calendar only if the user wants to do it!
  output$calendar_githubUI <- renderUI({
    if (!is.null(input$github_name) & input$allow_github_calendar == TRUE) {
      tagList(
        tags$hr(),
        tags$p(class = "text-center", tags$strong("Github Contribution")),
        tags$div(class = "calendar", "Loading the data just for you")
      )
    }
  })


  # experimental
  output$plt1 <- renderGvis({
    gvisGauge(as.data.frame(CityPopularity[1,]),
              options=list(min=0, max=800, greenFrom=500,
                           greenTo=800, yellowFrom=300, yellowTo=500,
                           redFrom=0, redTo=300, width=75, height=75))

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
    if (input$add_user == TRUE) {
      tagList(
        selectInput("user_title", label = "Title:", choices = c("", "Dr.", "Pr.")),
        selectInput(inputId = "user_sex",
                    label = "Sex:", choices = c("male", "female")),
        textInput(inputId = "user_name", label = "Name:"),
        textInput(inputId = "user_mail", label = "Mail:"),
        textInput(inputId = "user_phone", label = "Phone Number:"),
        actionBttn(inputId = "submit_user", "Add User")
      )
    }
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

  # generate the user list
  output$userlist <- renderUI({
    data <- df$users
    if (!is_empty(data)) {
      tagList(
        lapply(seq_along(data$title), FUN = function(i) {
          title <- data$title[i]
          name <- data$name[i]
          mail <- data$mail[i]
          phone <- data$phone[i]
          image <- ifelse(data$sex[i] == "male", "man.png", "girl-2.png")
          column(4, align = "center",
                 tags$li(
                   tags$img(src = image, alt = "User Image"),
                   tags$br(),
                   tags$a(class = "users-list-name", href = "#", paste(title, name)),
                   tags$span(
                     class = "users-list-date",
                     a(href = paste0("mailto:", mail), target = "_top", mail)),
                   tags$span(class = "users-list-date", phone)
                 ))
        })
      )
    }
  })

  # generate the number of user in the network_box header
  output$usernumber <- renderUI({
    nb_users <- nrow(df$users)
    if (!is_empty(nb_users)) {
      tagList(
        tags$span(class = "label label-danger", HTML(paste(icon("users"), nb_users, "members"))),
        tags$button(type = "button", class = "btn btn-box-tool",
                    `data-widget` = "collapse", tags$i(class = "fa fa-minus")),
        tags$button(type = "button", class = "btn btn-box-tool",
                    `data-widget` = "remove", tags$i(class = "fa fa-times"))
      )
    }
  })


  #-------------------------------------------------------------------------
  #
  #  formation section ...
  #
  #-------------------------------------------------------------------------

  # Generate the formation UI
  # if and only if the editor
  # switchInput is on TRUE
  output$formationUI <- renderUI({
    if (input$add_formation == TRUE) {
      tagList(
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

  observe({
    print(df$formations)
  })


  # remove a formation
  observeEvent(input$remove_formation,{
    req(input$formation_id)
    idx <- input$formation_id
    if (nrow(df$formations) > 0) {
      df$formations <- df$formations[-idx, ]
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
            to <- ifelse(is.na(formations$to[i]), "Now", formations$to[i])
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

  output$experience <- renderUI({
    project_box()
  })


  #-------------------------------------------------------------------------
  #
  #  Useful tasks such as save, reset, load ...
  #
  #-------------------------------------------------------------------------

  # Custom footer
  output$dynamicFooter <- renderFooter({
    dashboardFooter(
      mainText = h5(
        "2017, David Granjon, Zurich.",
        br(),
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
