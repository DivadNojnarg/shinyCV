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
