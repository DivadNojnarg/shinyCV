# define server function
shinyServer(function(input, output, session) {


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

  # initialization skills and languages dataframe reactiveValues
  df <- reactiveValues(skills = data.frame(), language = data.frame())

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

  output$plt1 <- renderGvis({
    gvisGauge(as.data.frame(CityPopularity[1,]),
              options=list(min=0, max=800, greenFrom=500,
                           greenTo=800, yellowFrom=300, yellowTo=500,
                           redFrom=0, redTo=300, width=100, height=100))

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
