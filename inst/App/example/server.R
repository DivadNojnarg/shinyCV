# define server function
shinyServer(function(input, output, session) {


  #-------------------------------------------------------------------------
  #
  #  Useful reactive expressions ...
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
